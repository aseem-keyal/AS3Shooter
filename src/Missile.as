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
	public class Missile extends Entity 
	{
		public static var e:Entity;
		public static var a:Number;
		public function Missile(x:int,y:int) 
		{
			type = "missile";
			this.x = x;
			this.y = y;
			a = FP.angle(this.x, this.y, 0, 0) * Math.PI /180;
			this.setHitbox(2, 2);
			this.graphic = new Image(GC.GFX_BULLET);
		}
		
		override public function update():void
		{
			e = FP.world.nearestToEntity("enemy", this);
			if (e != null) {a = FP.angle(this.x, this.y, e.x, e.y) * Math.PI / 180;}
			else {a = 90;}
			y -= FP.elapsed * GC.BULLET_SPEED * Math.sin(a);
			x += FP.elapsed * GC.BULLET_SPEED * Math.cos(a);
			if (y < -height) this.world.remove(this);
			super.update();
		}
	}

}