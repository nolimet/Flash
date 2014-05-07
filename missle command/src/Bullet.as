package  
{
	import flash.geom.Point;
	import utils.draw.Squar;
	import flash.display.Sprite;
	import utils.callulate.MathExstend;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Bullet extends Sprite 
	{
		private var art:Squar;
		public var tag:String = "Bullet";
		public var move:Point;
		
		public function Bullet(Angle:Number) 
		{
			art = new Squar(0, 0, 2, 2, 0x0000ff);
			addChild(art);
			move = MathExstend.callMove(5, Angle);
		}
		
		//public function move()
		//{
		//	this.x += move.x;
		//	this.y += move.y;
		//}
	}

}