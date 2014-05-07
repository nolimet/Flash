package AS3Engine.util 
{
	public class Coords 
	{
		public static function getNextX(x:Number, d:Number, s:Number):Number
		{
			return x + (s * Math.cos(d * Math.PI / 180.0));
		}

		public static function getNextY(y:Number, d:Number, s:Number):Number
		{
			return y + (s * Math.sin(d * Math.PI / 180.0));
		}
		
		public static function getDistance(x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			return Math.sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
		}
		
		public static function getDegreeFromPoint(x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			return Math.atan2((y2 - y1), (x2 - x1)) * 180 / Math.PI;
		}
	}
}