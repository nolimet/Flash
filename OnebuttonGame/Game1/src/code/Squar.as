package code 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Squar extends Sprite
	{
		public var kleur:uint;
		public var $height:Number;
		public var $width:Number;
		public var sleepbaar:Boolean;
		public var linewidth:Number;
		
		public function Squar($x:Number, $y:Number, $height:Number, $width:Number, kleur:uint,linewidth:Number, sleepbaar:Boolean = false):void
		{
		this.sleepbaar = sleepbaar;
		this.$height = $height;
		this.$width = $width;
		this.kleur = kleur;
		this.x = $x;
		this.y = $y;
		this.linewidth = linewidth;
		
		this.graphics.lineStyle(this.linewidth);
		this.graphics.beginFill(this.kleur);
		this.graphics.drawRect(0, 0, this.$width, this.$height);
		
		if (sleepbaar) {
			this.addEventListener(MouseEvent.MOUSE_DOWN, sleep)
			this.addEventListener(MouseEvent.MOUSE_UP,MouseUp)
			//this.startDrag();
		}
		}
		private function MouseUp(e:MouseEvent):void
		{
			this.stopDrag();
		}
		private function sleep(e:MouseEvent):void 
		{
			this.startDrag();
		}
		
	}

}