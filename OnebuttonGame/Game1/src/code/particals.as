package code 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class particals extends Sprite 
	{
		private var $x:Number;
		private var $y:Number;
		private var $width:Number;
		private var $height:Number;
		private var $speed:Number;
		private var $duration:Number;
		private var $colour:uint;
		private var clock:Timer;
		private var alphachange:Timer;
		private var remove:Boolean = false;
		private var $alpha:Number;
		
		public function particals($x:Number, $y:Number, $width:Number, $height:Number, $speed:Number, $duration:Number, $colour:uint, direction:Number, $alpha:Number = 1) 
		{
			this.$x = $x;
			this.$y = $y;
			this.$width = $width;
			
			this.$height = $height;
			this.$speed = $speed;
			this.$duration = $duration;
			this.$colour = $colour;
			this.$alpha = $alpha;
			
			this.graphics.lineStyle(0, 0, 0);
			this.graphics.beginFill($colour)
			this.graphics.drawEllipse($x, $y, $width, $height);
			this.graphics.endFill();
			
			
			trace("paritcel drawed")
			clock = new Timer($duration, 1)
			clock.start()
			addEventListener(TimerEvent.TIMER, Clock);
			
			alphachange = new Timer($duration / 100, 100);
			alphachange.start();
			addEventListener(TimerEvent.TIMER, Alphachange);
			
			addEventListener(Event.ENTER_FRAME, step);
		}
		private function Clock(e:Event):void
		{
			remove = true;
		}
		private function Alphachange(e:Event):void
		{
			$alpha -= 1 / $duration;
			trace($alpha);
		}
		
		private function step (e:Event):void
		{
			move($speed);
			if (this.x < stage.width || this.x < 0 || this.y < 0 || this.y < stage.width)
			{
				remove = true;
			}
		}
		private function move( $speed:Number ):void
		{
		var speed:Point = new Point();
		speed.x = Math.cos(this.rotation / 180 * Math.PI) * $speed;
		speed.y = Math.sin(this.rotation / 180 * Math.PI) * $speed;
		
		this.x += speed.x;
		this.y += speed.y;
		}
	}

}