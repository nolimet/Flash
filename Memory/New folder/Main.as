package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
    public class Main extends MovieClip {
		private var first_tile:Cards;
		private var second_tile:Cards;
		private var pause_timer:Timer;
		var carddeck:Array = new Array (1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10)
		trace("STARTING")
		public function Main() {
			for (x=0; x < 5; x++) {
				for (y = 0; y < 4; y++) {
					//trace(x);
					//trace(y);
					var ran_card:int = Math.floor(Math.random()*carddeck.length);
					var tile:Cards = new Cards();
					//trace(ran_card);
					tile.col = carddeck[ran_card];
					trace(carddeck);
					carddeck.splice(ran_card,1);
					tile.gotoAndStop(11);
					tile.x = (x*138)+50;
					tile.y = (y*138)+70;
					tile.addEventListener(MouseEvent.CLICK,tile_clicked);
					addChild(tile);
				}
			}		  
		}	
		
				public function tile_clicked(event:MouseEvent) {
			var clicked:colors = (event.currentTarget as colors);
			if (first_tile == null) {
				first_tile = clicked;
				first_tile.gotoAndStop(clicked.col);
			}
		}
	}
}
