package  
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Aseem Keyal
	 */
	public class GameWorld extends World 
	{
		//protected var player:Player;
		
		public function GameWorld() 
		{
			super();
		}
		
		override public function begin():void
		{
			// TODO: tidy up initial values
			GC.player = new Player(FP.width/2-6, FP.height-50);
			this.add(GC.player);
		}
		
		override public function update():void
		{
			if (this.classCount(Enemy) == 0 || FP.random > GC.ENEMY_SPAWN_CHANCE)
			{
				add(new Enemy());
			}
			super.update();
		}
	}

}