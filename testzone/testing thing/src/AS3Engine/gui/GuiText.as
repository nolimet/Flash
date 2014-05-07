package AS3Engine.gui 
{
	import AS3Engine.Engine;
	import flash.display.MovieClip;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	
	public class GuiText extends MovieClip
	{	
		public var tf:TextFormat = new TextFormat();
		public var tx:TextField;		
		
		public function GuiText(t:String, px:Number, py:Number, w:Number, s:int, c:uint, e:Boolean = false)
		{
			tx = new TextField();
			
			tx.x = px;
			tx.y = py;
			tx.width = w;
			tx.antiAliasType = AntiAliasType.ADVANCED;
			tx.embedFonts = e;
			tx.selectable = false;
			addChild(tx);
			
			tx.text = t;
			setFormat(s, c);
		}

		public function setFormat(s:int, c:uint, a:String = "left", f:String = "Times New Roman", b:Boolean = false, i:Boolean = false, u:Boolean = false):void
		{
			tf.size = s;
			tf.color = c;
			tf.align = a;
			tf.font = f;
			tf.bold = b;
			tf.italic = i;
			tf.underline = u;
			
			fixAlignPos();
			tx.setTextFormat(tf);
		}
		
		public function fixAlignPos():void
		{
			if (tf.align == "center") 
			{ 
				tx.x = tx.x - (tx.width / 2); 
			}
			else 
			{
				tx.x = tx.x; 
			}
		}
	}
}