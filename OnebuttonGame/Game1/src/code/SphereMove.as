package  code
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class SphereMove extends Sprite
	{
		public var kleur:uint;
		public var straal:Number;
		public var sleepbaar:Boolean;
		public var pos:WVector = new WVector;
		public var speed:WVector = new WVector;
		public var speedup:WVector = new WVector;
		
		
		public function SphereMove($x:Number, $y:Number, straal:Number, kleur:uint, speedX:Number, speedY:Number, speedupX:Number, speedupY:Number, sleepbaar:Boolean = false)
		{
		this.sleepbaar = sleepbaar;
		this.straal = straal;
		this.kleur = kleur;
		this.pos.$X = $x;
		this.pos.$Y = $y;
		this.speed.$X = speedX;
		this.speed.$Y = speedY;
		this.speedup.$Y = speedupY;
		this.speedup.$X = speedupX;
		
		this.graphics.lineStyle(5);
		this.graphics.beginFill(this.kleur);
		this.graphics.drawCircle(0, 0, this.straal);
		
		if (sleepbaar) {
			this.addEventListener(MouseEvent.MOUSE_DOWN, sleep)
			this.addEventListener(MouseEvent.MOUSE_UP, MouseUp)
			
			//this.startDrag();
		}
			this.addEventListener(Event.ENTER_FRAME, loop)
		}
		private function MouseUp(e:MouseEvent):void
		{
			this.stopDrag();
		}
		private function sleep(e:MouseEvent):void 
		{
			this.startDrag();
		}
		private function loop(e:Event):void
		{
			if (sleepbaar === false)
			{
				speed.$X += speedup.$X
				speed.$Y += speedup.$Y
			
				pos.$X += speed.$X;
				pos.$Y += speed.$Y;
			
				this.x = pos.$X;
				this.y = pos.$Y;
			}
		}
	}
}