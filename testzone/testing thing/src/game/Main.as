package game
{
	import AS3Engine.Engine;
	import flash.display.Sprite;
	import flash.events.Event;

	public class Main extends Sprite 
	{
		public function Main():void 
		{
			var engine:Engine = new Engine(new GuiExample(), stage);
			addChild(engine);
		}
	}
}