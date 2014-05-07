package src
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	/**[Embed(source="../CombatZone.swf", symbol="Enemy1art")]
	 * ...
	 * @author Jesse Stam
	 */
	public class Main extends Sprite
	{
		private var player:Player;
		//private var horkey:int;
		//private var verkey:int;
		private var enemies:Array;
		private var bullets:Array;
		private	var keyh1:int;
		private	var keyh2:int;
		private	var keyv1:int;
		private	var keyv2:int;
		private var enemyBullet:Array;
		public function Main()
		{
			trace("EARTH!");
			player = new Player();
			addChild(player);
			player.x = 300;
			player.y = 400;
			bullets = new Array;
			enemyBullet = new Array;
			
			enemies = [];
			for (var i:int = 0; i < 8; i++)
			{
				//for {var j:int = 0; j < 5; j++)
			enemies.push(new enemy());
			addChild(enemies[i])
			enemies[i].x = 10 + i * 100;
			enemies[i].y = 10 + i * 100;
			enemies[i].addEventListener("fired", createBullet);
			}
			//trace(enemies);
			
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, OnKeyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, OnKeyReleased);
			stage.addEventListener(MouseEvent.CLICK, OnMouseClick);
			//stage.addEventListener(MouseEvent.MOUSE_MOVE, volgMuis);
		}
		private function createBullet(e:Event)
		{
			/*var en:enemy = e.target;
			var b:Bullet = new Bullet();
			enemyBullet.push[b];
			b.x = en.x;
			b.y = en.y;
			b.rotation = en.rotation;*/
		}
		private function OnMouseClick(e:MouseEvent) {
			trace("pew pew pew")
			var b:Bullet = new Bullet();
			bullets.push(b);
			addChildAt(b,this.getChildIndex(player));
			b.x = player.x;
			b.y = player.y;
			b.rotation = player.rotation;
			addChild(b);
		}

		private function OnKeyReleased(e:KeyboardEvent):void 
		{
			trace(e.keyCode);

   
			if (e.keyCode == 65)
			{
				keyh1 = 0;
			}
			if (e.keyCode == 68)
			{
				keyh2 = 0;
			}
			if (e.keyCode == 87)
			{
				keyv1 = 0;
			}
			if (e.keyCode == 83)
			{
				keyv2 = 0;
			}
		}
		
		private function loop(e:Event):void 
		{
			
			player.x += ((keyh2 - keyh1) * 5) //player movement x5 is speed
			player.y += ((keyv2 - keyv1) * 5) 
			player.face(new Point(mouseX, mouseY));
			var lengthenemies:int = enemies.length;
			for (var i:int = 0; i < lengthenemies; i++)
			{
				enemies[i].face(new Point(player.x, player.y));
			}
			for each (var eb:Bullet in enemyBullet) {
				/*eb.move(12);
				if (player.hitTestPoint(eb.x, eb.y, true))
				  {
     //verwijder kogel
     removeChild(eb);
     enemyBullets.splice(enemyBullets.indexOf(eb), 1);
     //leven van de speler af
     player.life--;
     //kijk of je dood bent
     if (player.life <= 0)
     {
      playerDood = true;
      //ben je dood      
      break;
     }
    }*/
			}
			for (var j:int = (bullets.length-1); j >= 0; j--)
			{
				var deletebullet:Boolean = false;
				bullets[j].move(14);
				for each (var Enemy:enemy in enemies){
					if (Enemy.hitTestPoint(bullets[j].x,bullets[j].y,true)) //als de kogel een enemie raakt
					{
					//kogel verwijderen en leven van enemy afhalen
					deletebullet = true;
					Enemy.life --;
					if (Enemy.life <= 0) {
						removeChild(Enemy)
						enemies.splice(enemies.indexOf(Enemy),1)
						
					}
				}
			
				if (bullets[j].x < -100 
				|| bullets[j].x > stage.stageWidth 
				|| bullets[j].y < -100 
				|| bullets[j].y > stage.height) 
				{
					deletebullet = true;
				}
			if (deletebullet){
					removeChild(bullets[j]);
					bullets.splice(j, 1);
				}
			}
		}
		}
		
		private function OnKeyPressed(e:KeyboardEvent)
		{
			trace(e.keyCode);
			//65 A
			//87 W
			//68 D	
			//83 S
				if (e.keyCode == 65)
				{
					keyh1 = 1;
				}
   
				if (e.keyCode == 68)
				{
					keyh2 = 1;
				}
				if (e.keyCode == 87)
				{
					keyv1 = 1;
				}
				if (e.keyCode == 83)
				{
					keyv2 = 1;
				}
		}
	}
}