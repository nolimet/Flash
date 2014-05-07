package AS3Engine 
{
	import AS3Engine.gui.GuiScreen;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import AS3Engine.input.PlayerInput;
	
	public class Engine extends MovieClip
	{
		public static var gui:GuiScreen;
		
		public function Engine(newGui:GuiScreen, st:Stage) 
		{
			st.addEventListener(Event.ENTER_FRAME, tick);
			st.addEventListener(Event.ACTIVATE, onFocus);
			st.addEventListener(Event.DEACTIVATE, onUnFocus);
			new PlayerInput(st);
			
			switchGui(newGui);
		}
		
		public function switchGui(newGui:GuiScreen):void
		{
			if (gui != null)
			{
				removeChild(gui);
			}
			gui = null;
			
			if(newGui != null)
			{
				gui = newGui;
				addChildAt(newGui, 0);
				gui.init();
			}
		}
		
		public function tick(e:Event):void
		{
			if (gui != null)
			{
				gui.tick();
			}
		}
		
		public function onFocus(e:Event):void 
		{
			if (gui != null)
			{
				gui.onFocus();
			}
		}
		
		public function onUnFocus(e:Event):void 
		{
			if (gui != null)
			{
				gui.onUnFocus();
			}
		}
	}
}