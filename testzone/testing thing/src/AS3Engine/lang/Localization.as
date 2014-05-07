package AS3Engine.lang 
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	
	//Localization files need to be located in "bin/lang/NAME.lang"
	//First line: NAME#SCREENNAME#DEFAULTLANG# example: ENG#English#YES#
	//name=text
	
	public class Localization 
	{
		public static var languages:Array = new Array();
		public static var langselected:int = 0;
		public static var defaultlang:int = -1;
		
		public static function getTranslation(t:String):String
		{
			var translation:String;
			
			if (langselected < languages.length)
			{
				translation = languages[langselected].getTranslation(t);
			}
			
			if (translation == null && defaultlang > -1 && defaultlang < languages.length)
			{
				translation = languages[defaultlang].getTranslation(t);
			}
			
			if (translation == null)
			{
				return "NULL";
			}
			else
			{
				return translation;
			}
		}
		
		public static function getLanguageID(name:String):int
		{
			for (var l:int = 0; l < languages.length; l++ )
			{
				if (name == languages[l].name)
				{
					return l;
				}
			}
			return 0;
		}
		
		public static function loadLanguage(filename:String):void
		{
			var loader:URLLoader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.TEXT;  
			loader.addEventListener(Event.COMPLETE, addLanguage);
			loader.load(new URLRequest("lang/" + filename + ".lang"));
		}
		
		public static function addLanguage(e:Event):void 
		{
			var file:Array = e.target.data.split(/\n/);
			var properties:Array = file[0].split("#");
			file.shift();
			
			var langArray:Array = new Array();
			
			for (var i:int = 0; i < file.length; i++ )
			{
				var line:Array = file[i].split("=");
				langArray.push(line[0]);
				langArray.push(line[1]);
			}
			
			if (properties[2] == "YES") 
			{ 
				defaultlang = languages.length; 
			}
			
			languages.push(new Language(properties[0], properties[1], langArray));
		}
	}
}