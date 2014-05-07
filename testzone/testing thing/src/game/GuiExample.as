package game 
{
	import AS3Engine.gui.GuiScreen;
	import AS3Engine.gui.GuiText;
	import AS3Engine.input.Keyboard;
	
	public class GuiExample extends GuiScreen
	{
		public var exampletext1:GuiText;
		public var exampletext2:GuiText;

		public function GuiExample() 
		{
		}
		
		override public function init():void 
		{
			exampletext1 = new GuiText("AS3 Engine", 310, 250, 400, 30, 0x000000);
			exampletext2 = new GuiText("by ted80", 380, 300, 400, 28, 0x000000);
			
			addChild(exampletext1);
			addChild(exampletext2);
		}
		
		override public function tick():void
		{
		}
		
		override public function onFocus():void 
		{
		}
		
		override public function onUnFocus():void 
		{
		}
	}
}