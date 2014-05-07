package  code
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Rooster extends Sprite
	{
		
		public function Rooster()
		{
			this.graphics.lineStyle(2);
			for (var i:int=0; i <= 800;i+=20){
					if (i % 100 == 0) {
						this.graphics.lineStyle(5);
						//this.graphics.line
					}
					else
					{
						this.graphics.lineStyle(2);
					}
					this.graphics.moveTo(0,i);
					this.graphics.lineTo(1300, i);
					trace(i)
				}
				for (var j:int = 0; j <= 1300; j += 20) {
					if (j % 100 == 0) {
						this.graphics.lineStyle(5);
					}
						else
						{
						this.graphics.lineStyle(2);
						}
						this.graphics.moveTo(j, 0);
						this.graphics.lineTo(j, 800);
						trace(j)
					
				}
			}	
		}
		
	}


