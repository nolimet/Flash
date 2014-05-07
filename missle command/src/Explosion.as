package  
{
	import draw.Circle;
	import draw.Squar;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Explosion 
	{
		public var size:Number
		private var scale:Number
		public var art:Circle
		public var tag:String = Explosion;
		
		public function Explosion($x:Number,$y:Number,scale:Number) 
		{
			this.scale = scale;
			this.size = size;
			
			art = new Circle($x, $y, 1 * scale, 0xfff000, 0);
			addchild(art);
		}
		
		public function step()
		{
			size=
			art.radius = size;
		}
	}

}