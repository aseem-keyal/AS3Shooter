package  
{
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	/**
	 * ...
	 * @author Aseem Keyal
	 */
	public class GC 
	{
		[Embed(source = '/assets/player.png')]
		public static const GFX_PLAYER:Class;
		public static var player:Player;

		[Embed(source = '/assets/enemy.png')]
		public static const GFX_ENEMY:Class;
		
		public static const GFX_BULLET:BitmapData = new BitmapData(2, 2, false, 0xffffffff);
		public static const BULLET_SPEED:Number = 120;
		public static const ENEMY_SPEED:Number = 40;
		public static const ENEMY_SPAWN_CHANCE:Number = 1 - 1/60;
	}

}