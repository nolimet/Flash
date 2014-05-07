package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Player extends Unit
	{
	private var playerArt:MovieClip;
	
	public function Player()  
	{
		
		playerArt = new PlayerArt;
		addChild(playerArt);
	}
	}

}