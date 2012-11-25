package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Player extends Entity
	{
		public function Player(x:Number = 0, y:Number = 0)
		{
			type = "player";
			super(x, y);
			graphic = new Image(GC.GFX_PLAYER);
			this.setHitbox(12, 8);
			Input.define("up", Key.UP, Key.W);
			Input.define("left", Key.LEFT, Key.A);
			Input.define("down", Key.DOWN, Key.S);
			Input.define("right", Key.RIGHT, Key.D);
		}
		
		override public function update():void
		{
			if (collide("enemy", x, y)) {
				this.world.remove(this);
				FP.world = new GameWorld();
			}
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
				this.world.add(new Bullet(x + 5, y - 2));
			else if (Input.pressed(Key.Z))
				this.world.add(new Missile(x + 5, y - 2));
			super.update();
		}
	}

}