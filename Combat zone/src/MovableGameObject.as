package src 
{
	import flash.display.MovieClip;
	import flash.geom.Point
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class MovableGameObject extends MovieClip 
	{
		
		public function MovableGameObject() 
		{
			
		}
		public function move( $speed:Number )
		{
		var speed:Point = new Point();
		speed.x = Math.cos(this.rotation / 180 * Math.PI) * $speed;
		speed.y = Math.sin(this.rotation / 180 * Math.PI) * $speed;
		
		this.x += speed.x;
		this.y += speed.y;
		
		}
		
	}

}