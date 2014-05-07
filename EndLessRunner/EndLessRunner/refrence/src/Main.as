package 
{
	
	import code.particals;
	import code.Squar;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.SharedObject;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import MovableGameObjects;
	import code.SquarMove;
	import code.WVector;

	
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Main extends Sprite 
	{
		//object storage
		public var coins : Array;
		public var ground : Squar;
		private var particel:Array = [];
		public var walls:Array;
		public var player : SquarMove;
		public var gameover:GameOver = new GameOver;
		
		//numbers
		public var score : int;
		public var key : int;
		public var highscore : int;
		public var room:int =1 ;
		public var timepressed:Number = 0;
		public var powerup:int = 0;
		
		//others
		public var clock : Timer;
		private var txtscore:TextField
		public var g:Boolean = false; //groundhit
		public var pulsekey:Boolean = true;
		
		

		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			addEventListener(Event.ENTER_FRAME, step);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, OnkeyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, OnkeyReleased);
		}
		
		private function OnkeyPressed(e:KeyboardEvent):void {
			if (e.keyCode == 32) { key = 1 }
			
		}
		private function OnkeyReleased(e:KeyboardEvent):void {
			if (e.keyCode == 32) { key = 0; g=false }
			
		}
		private function step(e:Event):void  {
			if (score > highscore) { highscore = score; Updatetext(); }
			
			//coins remove check
			if (coins.length>0) {
				for (var i:int = coins.length - 1; i >= 0; i--)
				{
					coins[i].x -= 3;
					if (room==1){
						if (coins[i].x < -50) 
						{
						RemoveCoin(i);
						}	
						if (coins.length > 2)
						{
							if (coins[i].hitTestObject(player)) 
							{
							RemoveCoin(i);
							score++;
							}
						}
					}
					if (room == 2 || room == 0)
					{
						RemoveCoin(i);
					}
				}
			}
			
			//walls removecheck
			for (var j:int = walls.length - 1; j >= 0; j--) 
			{
				if (room == 1) 
				{
					if (walls.length > 0)
					{
						if (walls[j].hitTestObject(player) ) 
						{
							RemoveWalls(j);
							clearscreen();
						}	
					}
				
					if (walls[j].x <= -50)
					{
						RemoveWalls(j);
					}
				}
				if (room == 2)
				{
					RemoveWalls(j);
				}
			}
			
			//player Movement
			if (room == 1) 
			{
				
				if (player.y < 19) 
				{
					player.speed.$Y = 0;
					player.pos.$Y = 20;
				}
				if (powerup == 0) 
				{
					//keypress
					if(key == 1 && player.y > 20)
					{
						player.speedup.$Y = 0 - 0.5;
					}
				//Key release
					if(player.y < 600  && key == 0 && g == false )
					{
						player.speedup.$Y = 0.5;
					}	
				}
				//powerup gravity flip(voor een of andere rede val je door de grond
				if (powerup == 1)
				{
					//keypulseed
					if (key == false && pulsekey) 
					{
						if (player.y <= 600)
							{
								player.speedup.$Y = -1;
							}
							if (player.y >= 20)
							{
								player.speedup.$Y = 1;
							}
							trace("gravitflip")
						pulsekey = false;
						
					}
					if (key == true) 
					{
						pulsekey = true;
						g = true;
					}
				}
				
				
				if(player.y >= 600 && g == false ) 
				{
					player.pos.$Y = 600;
					player.speed.$Y = 0;
					player.speedup.$Y = 0;
					g = true;
				}	
			}
			if (room == 2) 
			{
				if (key == 1) 
				{
					timepressed += 1;
				}	
				if (key == 0)
				{
					timepressed = 0;
				}
				if (timepressed == 120)
				{
				 StartGame();
				}
			}
			//door loopen van particels
			for each ( var p:particals in particel)
			{
				if (p.x < stage.width || p.x > 0 || p.y > 0 || p.y < stage.width) 
				{

				}
			}
		}
			private function init(e:Event = null):void 
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// entry point
			//klaarmaken level
			coins = new Array;
			PlacePlayer(0, 200,600,39,20,0xff00ff,0,0);
			ground = new Squar(0, 680, 120, 1300, 0x000000, 90, false);
			walls= new Array;
			addChild(ground);
			TextInit();
			addChild(gameover);
			gameover.x = -800;
			
			//startclock
			clock = new Timer(500, 0);
			clock.addEventListener(TimerEvent.TIMER, Tick);
			clock.start();			
			
			//test drawns
			createpartical()
			PlaceWalls();
		}
		
		private function Tick(e:Event):void
		{
			//placeing items at ranomd intervals
		if (room == 1)
		{
				PlaceCoin(1380, (140 + (Math.random() * 460)));
			if (1 > (Math.random() * 5)) 
			{
				PlaceWalls();
			}
		}
		if (room == 2)
		{
			PlaceCoin(1380, -50);
			if (1 > (Math.random() * 1000)) 
			{
				PlaceWalls(-40);
			}
		}
		Updatetext();
		}
		
		public function PlacePlayer(linewidth:Number, $x:Number, $y:Number,$height:Number, $width:Number, kleur:uint, speedX:Number, speedY:Number):void 
		{
			player = new SquarMove(linewidth, $x, $y, $height, $width, kleur, speedX, speedY, 0, 0.5, false);
			addChild(player);
		}	
		
		//place functions
		public function PlaceCoin($x:int, $y:int):void 
		{
			var $x:int;
			var $y:int;
			
			var c:Coin = new Coin;
			
			coins.push(c);
			
			c.scaleY = 0.5;
			c.scaleX = 0.5;
			c.x = $x;
			c.y = $y;
			addChild(c);
		}
		public function PlaceWalls(offset:Number = 0):void {
			var h:Number =offset+20 + Math.random() * 20
			var k:uint = 0xffffff * Math.random();
			var w:SquarMove = new SquarMove(0, 1300, 20 + Math.random() * 600 - h, h, 10, k, -3, 0 , 0, 0, false);
			
			walls.push(w);
			
			addChild(w);
		}
		public function createpartical():void
		{
			var p:particals = new particals(player.x,player.y, 20, 40,5,10,0x00ffff,0);
			particel.push(p);
			addChild(p);
			
		}
		
		//remove functions
		public function RemoveWalls($pos:Number):void {
			removeChild(walls[$pos]);
			walls.splice($pos, 1);
		}
		public function RemovePartical($pos:Number):void
		{
			removeChild(particel[$pos]);
			walls.splice($pos, 1);
			trace('removed particel')
		}
		
		public function RemoveCoin($pos:Number):void {
			removeChild(coins[$pos]);
			coins.splice($pos, 1);
		}
		
		//tekst stuff
		private function TextInit():void
		{
			txtscore = new TextField();
			
			txtscore.text = ( "score: " + score);
			txtscore.width = txtscore.textWidth + 50;
			//txtscore.x = stage.width - txtscore.textWidth; //disabled for not working
			//txtscore.y = txtscore.height;
			addChild(txtscore);
			trace('placed Textfields')
		}
		//clear out that screen
		public function clearscreen() :void
		{
			
			room = 2
			clock.stop();
			
			gameover.x = 200;
			gameover.y = 400;
			player.pos.$X = -300
			ground.y=-800
		}
		private function StartGame():void
		{
			player.pos.$X = 200
			player.pos.$Y = 600
			ground.y = 680;
			txtscore.x = 0;
			txtscore.y = 0;
			gameover.x = -800;
			powerup = 0;
			
			//startclock
			clock.start();			
			score = 0;
			room=1
		}
		
		private function Updatetext():void 
		{
			txtscore.width = txtscore.textWidth+20;
			txtscore.text = ("score: " + score + "\n HighScore: " + highscore);
			
		}
	}
}
	
