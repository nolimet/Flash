package 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import Objects.player;
	
	/**
	 * ...
	 * @author Jesse Stam && kerim
	 */
	
	public class Main extends Sprite 
	{
		private var Player:player = new player(60, 60)
		private var tick:Timer = new Timer();
		//public static var _stage:Stage = Stage;
		
		public function Main():void 
		{
			addChild(Player)
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			addEventListener(TimerEvent.TIMER, ticker);
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,KeyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyRelease);
			stage.addEventListener(MouseEvent.CLICK, MouseClick);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function gameplaystart():void
		{
			tick.start();
			Player = new player(600,60);
			addChild(Player);
		}
		
		private function loop(e:Event):void
		{
			
		}
		
		private function KeyPressed(e:KeyboardEvent):void
		{
			trace(e.keyCode)
			if (e.keyCode==32){Player.Spacebar=true}
		}
		
		private function KeyRelease(e:KeyboardEvent):void
		{
			if (e.keyCode==32){Player.Spacebar=false}
		}
		
		private function MouseClick(e:MouseEvent):void
		{
			
		}
	}
	
}