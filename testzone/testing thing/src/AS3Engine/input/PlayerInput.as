package AS3Engine.input 
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class PlayerInput 
	{
		public var stage:Stage;
		
		public function PlayerInput(st:Stage) 
		{
			stage = st;
			
			st.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			st.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		public function onKeyDown(e:KeyboardEvent):void
		{
			for (var k:int = 0; k < Keyboard.keyList.length; k++)
			{
				if (e.keyCode == Keyboard.keyList[k][0])
				{
					Keyboard.keyList[k][1] = true;
					break;
				}
			}
		}
		
		public function onKeyUp(e:KeyboardEvent):void
		{
			for (var k:int = 0; k < Keyboard.keyList.length; k++)
			{
				if (e.keyCode == Keyboard.keyList[k][0])
				{
					Keyboard.keyList[k][1] = false;
					break;
				}
			}
		}
	}
}