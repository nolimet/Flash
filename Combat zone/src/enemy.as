package src 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class enemy extends Unit
	{
		public var enemy1art:MovieClip;
		public var life:int;
		private var shootTimer:Timer;
		public function enemy() 
		{
			life = 10;
			enemy1art = new Enemy1art();
			addChild(enemy1art);
			
			shootTimer = new Timer(1000 + Math.random() * 2000, 0)
			shootTimer.start();
			shootTimer.addEventListener(TimerEvent.TIMER, shoot);
		}
		
		private function shoot(e:TimerEvent) 
		{
			dispatchEvent(new Event("fired"));
		}
		
	}

}