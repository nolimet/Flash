package  code
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import code.WVector;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class SquarMove extends Sprite
	{
		public var kleur:uint;
		public var $height:Number;
		public var $width:Number;
		public var sleepbaar:Boolean;
		public var pos:WVector = new WVector;
		public var speed:WVector = new WVector;
		public var speedup:WVector = new WVector;
		public var linewidth:Number;
		
		
		public function SquarMove(linewidth:Number, $X:Number, $Y:Number,$height:Number, $width:Number, kleur:uint, speedX:Number, speedY:Number, speedupX:Number, speedupY:Number, sleepbaar:Boolean = false)
		{
		this.sleepbaar = sleepbaar;
		this.$height = $height;
		this.$width = $width;
		this.kleur = kleur;
		this.pos.$X = $X;
		this.pos.$Y = $Y;
		this.speed.$X = speedX;
		this.speed.$Y = speedY;
		this.speedup.$Y = speedupY;
		this.speedup.$X = speedupX;
		this.linewidth = linewidth;
		
		
		this.graphics.lineStyle(this.linewidth);
		this.graphics.beginFill(this.kleur);
		this.graphics.drawRect(0, 0, this.$width, this.$height);
		
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
			if (sleepbaar == false)
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