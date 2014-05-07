package AS3Engine.lang 
{
	public class Language 
	{
		public var name:String;
		public var screenName:String;
		public var langArray:Array;
		
		public function Language(n:String, s:String, a:Array) 
		{
			name = n;
			screenName = s;
			langArray = a;
		}
		
		public function getTranslation(n:String):String
		{
			for (var i:int = 0; i < langArray.length; i+=2 )
			{
				if (n == langArray[i])
				{
					return langArray[i + 1];
				}
			}
			return null;
		}
	}
}