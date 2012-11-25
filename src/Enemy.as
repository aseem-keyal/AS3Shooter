package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Aseem Keyal
	 */
	public class Enemy extends Entity 
	{
		
		public function Enemy() 
		{
			super(FP.rand(FP.screen.width - 10), -10);
			type = "enemy";
			this.graphic = new Image(GC.GFX_ENEMY);
			this.setHitbox(10, 10);
		}
		
		override public function update():void
		{			
			var m:Missile = Missile(this.collide("missile", x, y));
			var b:Bullet = Bullet(this.collide("bullet", x, y));
			if (b != null) {
				b.world.remove(b);
				this.world.remove(this);
			}
			else if (m != null) {
				m.world.remove(m);
				this.world.remove(this);
			}
			this.y += FP.elapsed * GC.ENEMY_SPEED;
			if (this.y > FP.screen.height) this.world.remove(this);
			super.update();
		}
	}

}