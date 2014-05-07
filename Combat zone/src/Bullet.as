package src 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Bullet extends MovableGameObject
	{
		private var art:MovieClip
		public function Bullet() 
		{
			art = new Bullet1art();
			addChild(art);
		}
		
	}

}