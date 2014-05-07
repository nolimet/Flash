package 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Ground extends Unit 
	{
		private var artGround:MovieClip
		public function Ground() 
		{
			artGround = new ArtGround
			addChild(artGround)
		}
		
	}

}