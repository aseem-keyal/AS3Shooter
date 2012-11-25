package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Aseem Keyal
	 */
	public class Main extends Engine 
	{
		
		public function Main()
		{
			super(240, 320);
			FP.screen.scale = 2;
			FP.console.enable();
		}
		
		override public function init():void
		{
			FP.world = new GameWorld();
		}
		
	}
	
}