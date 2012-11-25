package 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	//
	/**
	 * ...
	 * @author Aseem Keyal
	 */
	public class Bullet extends Entity 
	{
		public function Bullet(x:int,y:int) 
		{
			type = "bullet";
			this.x = x;
			this.y = y;
			this.setHitbox(2, 2);
			this.graphic = new Image(GC.GFX_BULLET);
		}
		
		override public function update():void
		{
			y -= FP.elapsed * GC.BULLET_SPEED;
			if (y < -height) this.world.remove(this);
			super.update();
		}
	}

}