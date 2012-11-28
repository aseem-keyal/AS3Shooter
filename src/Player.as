package 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Player extends Entity
	{
		protected var g:Image;
		protected var explosionEmitter:Emitter;
		protected const EXPLOSION_SIZE:uint = 40;
		public function Player(x:Number = 0, y:Number = 0)
		{			
			super(x, y);
			type = "player";
			g = new Image(GC.GFX_PLAYER);
			explosionEmitter = new Emitter(new BitmapData(1, 1), 1, 1);
			explosionEmitter.newType("explode",[0]);
			explosionEmitter.setAlpha("explode", 1, 0);
			explosionEmitter.setMotion("explode", 0, 50, .5, 360, -40, -.5, Ease.quadOut);
			explosionEmitter.relative = false;
			graphic = new Graphiclist(g, explosionEmitter);
			Input.define("up", Key.UP, Key.W);
			Input.define("left", Key.LEFT, Key.A);
			Input.define("down", Key.DOWN, Key.S);
			Input.define("right", Key.RIGHT, Key.D);
			this.setHitbox(12, 8);
		}
		
		override public function update():void
		{
			FP.clampInRect(this, 0, 0, FP.width - width, FP.height - height, 5);
			if (Input.check("right"))
				x += 2;
			else if (Input.check("left"))
				x -= 2;
			else if (Input.check("up"))
				y -= 2;
			else if (Input.check("down"))
				y += 2;
			if (Input.pressed(Key.SPACE))
				this.world.add(new Bullet(x+5, y - 2));
			else if (Input.pressed(Key.Z))
				this.world.add(new Missile(x+5, y - 2));
			if (this.collide("enemy", x, y) && this.collidable== true) {
				this.collidable = false;
				g.visible = false;
				for (var i:uint = 0; i < EXPLOSION_SIZE; i++)
				{
					explosionEmitter.emit("explode", x + width/2, y + height/2);
				}
			}
			if (!collidable && explosionEmitter.particleCount == 0 && this.world !=null){
				this.world.remove(this);
				FP.world = new GameWorld();
			}
			super.update();
		}
	}

}