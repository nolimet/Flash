package AS3Engine.input 
{
	public class Keyboard 
	{
		public static var keyList:Array = new Array();
		
		public static function addKey(key:int):int
		{
			keyList.push(new Array(key, false));
			return keyList.length - 1;
		}
		
		public static function setKey(id:int, key:int):void
		{
			keyList[id] = new Array(key, false);
		}
		
		public static function isKeyDown(id:int):Boolean
		{
			return keyList[id][1];
		}
	}
}