package src 
{
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Unit extends MovieClip
	{
		
		public function Unit() 
		{
			trace("Unit says 'hello!'");
		}
		public function face($target:Point) 
		{
			var diffx:Number = $target.x - this.x;
			var diffy:Number = $target.y - this.y;
			var radians:Number = Math.atan2(diffy, diffx);
			var degress:Number = radians * 180 / Math.PI;
			rotation = degress;
		}
		
	}

}