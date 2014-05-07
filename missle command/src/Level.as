package  
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import Missle;
	import utils.draw.Squar;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Level extends Sprite 
	{
		private var world:Array = new Array();
		private var spawner:Timer = new Timer(300, 0);
		private var cannons:int
		
		public function Level() :void
		{
			placeCannons();
			newMissle(50);
			this.addEventListener(Event.ENTER_FRAME, step)
			spawner.addEventListener(TimerEvent.TIMER, eSpawner)
			spawner.start();
			addEventListener(MouseEvent.MOUSE_DOWN, mouseClick);
		}
		
		private function mouseClick(e:MouseEvent):void 
		{
			fireCannons();
		}
		
		private function eSpawner(e:TimerEvent):void 
		{
			newMissle(Math.floor(Math.random() * 10));
		}
		
		public function step(e:Event):void 
		{
			var l:int = world.length - 1
			for (var i:int = l; i >= 0; i--) 
			{
				//trace(world[i])
				//trace(i)
				
				if (world[i].tag == "Missle")
				{
					world[i].move();
					if (world[i].destroy==true)
					{
						removeChild(world[i]);
						world.splice(i,1)
					}
				}
				else if (world[i].tag == "Cannon")
				{
					world[i].rotation = poinToMouse(world[i]);
				}
				else if (world[i].tag == "Bullet")
				{
					world[i].move();
				}
				else if (world[i].tag == "Explosion")
				{
					world[i].step()
				}
			}
		}
		
		private function newMissle(amount:int=0) : void
		{
			if(amount<=0){amount=1}
			for (var i:int = 0; i < amount; i++) 
			{
				var m:Missle = new Missle();
				addChild(m)
				world.push(m);
			}
		}
		private function placeCannons():void
		{
			for (var i:int = 0; i < 6; i++) 
			{
				var c:Cannon = new Cannon(125 *i + 87.5 , Main.resolution[1], 1.5)
				//trace(c.x)
				addChild(c);
				world.push(c);
				cannons++
			}
			
		}
		private function poinToMouse(obj1:Object):Number 
		{
            var dX:Number = mouseX - obj1.x;
            var dY:Number = mouseY - obj1.y;
            var angleDeg:Number = Math.atan2(dY, dX) / Math.PI * 180;
			
            return angleDeg;
		}
		
		private function fireCannons():void
		{
			var b:Bullet;
			var c:Cannon;
			for (var i:int = 0; i < cannons-1; i++) 
			{
				c = world[i];
				b = new Bullet (c.rotation);
				addChild(b);
				world.push(b);
			}
			trace("pew pew");
		}
	}
}