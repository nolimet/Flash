package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	
	public class Main extends Sprite 
	{

		
		public function Main():void 
		{
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,KeyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyRelease);
			stage.addEventListener(MouseEvent.CLICK, MouseClick);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function loop(e:Event):void
		{
			
		}
		
		private function KeyPressed(e:KeyboardEvent):void
		{
			
		}
		
		private function KeyRelease(e:KeyboardEvent):void
		{
			
		}
		
		private function MouseClick(e:MouseEvent):void
		{
			
		}
	}
	
}