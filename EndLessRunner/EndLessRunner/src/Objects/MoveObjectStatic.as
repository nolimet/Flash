package Objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class MoveObjectStatic extends Sprite
	{
		
		public function MoveObjectStatic() 
		{
			addEventListener(Event.ENTER_FRAME, step);
		}
		
		private function step (e:Event):void
		{
			
		}
		
	}

}