package Objects 
{
	import flash.display.Sprite;
	import code.$Vector;
	import code.Squar;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class player extends MoveObjectStatic
	{
		//art
		public var Player:Squar
		
		//movement
		public var speed:$Vector = new $Vector();
		public var speedup:$Vector = new $Vector(0,-1);
		public var g:Boolean;
		public var pos:$Vector = new $Vector()
		
		//controles
		public var Spacebar:Boolean = false;
		
		//others
		private var pulseSpacebar:Boolean = false;
		public var powerup:int = 0;
		
		public function player($y:Number,$x:Number) 
		{
			//sets the location
			this.x = $x;
			this.y = $y;
			this.pos.$X = $x;
			this.pos.$Y = $y;
			
			//places the player
			//addchild(Player);
			//placeholder
			Player = new Squar(this.x, this.y, 40, 20, 0xff0000, 0, false); 
			addChild(Player);
			
			//creats player controles and event check
			addEventListener(Event.ENTER_FRAME, step);
			
			//remove me
			speedup.$Y = 0.3
		}
		private function step(e:Event):void
		{
			if (this.y < 19) 
			{					
				speed.$Y = 0;
				this.y = 20;
			}
			if (powerup == 0) 
			{
				//Spacebar press
				if(Spacebar && this.y > 20)
				{
				speedup.$Y = 0 - 0.5;
				}
				//Spacebar release
				if (Spacebar == false && g)
				{
					g=false
				}
				if(this.y < 600  && Spacebar == false && g == false )
				{
					speedup.$Y = 0.5;
				}
				trace('g= ' +g+'\n spacebar = ' + Spacebar)
			}
			//powerup gravity flip(voor een of andere rede val je door de grond
			if (powerup == 1)
			{
				//Spacebarpulseed
				if (Spacebar == false && pulseSpacebar) 
				{
					if (this.y <= 600)
					{
						speedup.$Y = -1;
					}
					if (this.y >= 20)
					{
						speedup.$Y = 1;
					}
					trace("gravitflip")
					pulseSpacebar = false;			
				}
				if (Spacebar) 
				{
					pulseSpacebar = true;
					g = true;
				}
			}
			//stop movement
			if (this.y > 601 && g == false)
			{
				speedup.$Y = 0
				this.y = 600
				speed.$Y = 0
				g = true;
			}	
			//Movement
			speed.$X += speedup.$X;
			speed.$Y += speedup.$Y;
			
			this.x += speed.$X;
			this.y += speed.$Y;
			
		}
	}

}