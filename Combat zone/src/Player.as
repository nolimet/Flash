package src
{
/**
 * ...
 * @author Jesse Stam
 */
 import flash.display.MovieClip;
 
class Player extends Unit
{
	private var player1art:MovieClip;
	
	public function Player()  
	{
		
		player1art = new Player1art;
		addChild(player1art);
	}
	
}
}