package  
{
	import flash.net.SharedObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class TestSavingHighscore 
	{
		public var sharedobjects:SharedObject;
		private var testvar:Number = Math.random() * 30000;
		
		public function TestSavingHighscore() 
		{
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,KeyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyRelease);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
				
		private function KeyPressed(e:KeyboardEvent):void
		{
			
		}
		
		private function KeyRelease(e:KeyboardEvent):void
		{
			
		}
		
		private function read()
		{
			sharedObjects = SharedObject.getLocal("HighScore");
			
		}
		private function write( WriteVal:Number):void
		{
			
		}
	}

}