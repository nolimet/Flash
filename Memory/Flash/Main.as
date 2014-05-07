package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	//libs for text drawing
	//Coder Jesse Stam
	//Artwork Jessica Sekreve
	import flash.display.Stage;
	import flash.text.TextField;
	import flash.events.Event;
    public class Main extends MovieClip {
		//if this.currentFrame=2{
		private var first_card:Cards;
		private var second_card:Cards;
		private var pause_timer:Timer;
		var carddeck:Array = new Array (1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10)
		trace("STARTING")
		var startscore:Number = 6
		var score:Number = startscore
		var CardSetsCleared:Number = 0
		var	Cleared:Number = 0
		var MostCleared:Number = 0

		

		public function Main() {
			//CreateCards();
		}
		
		//used to update the score and try's
		public function EditScore() {
			scoretext.text = String(score); //try's
			ClearedText.text = String(Cleared); //score
			MostClearedText.text = String(MostCleared); //topscore
		}
		//Used to reset the carddeck
		public function Reset() {
			carddeck = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10]
		}
		
		public function CreateCards() {
			for (x=0; x < 5; x++) {
				for (y = 0; y < 4; y++) {
					//trace(x);
					//trace(y);
					var ran_card:int = Math.floor(Math.random()*carddeck.length); //picks random card
					var card:Cards = new Cards();
					//trace(ran_card);
					card.img = carddeck[ran_card]; //assignes image to selected card
					trace(carddeck);
					carddeck.splice(ran_card, 1); //trows selected card out of the array
					card.gotoAndStop(11); //sets it to the frame that is the back of the card
					//card.gotoAndStop(ran_card);
					card.x = (x*138)+70;
					card.y = (y*138)+70;
					card.addEventListener(MouseEvent.CLICK,card_clicked); //used to be able to click it
					addChild(card);		//Creates the card
					scoretext.text = String(score); //makes sure the score is correct
					CardSetsCleared = 0;	//set Cleared Cards Sets to 0. Because each round containts 10 cards
					score = 6;
				}
			}	
			/*if (score <= 0) {
				score = startscore;
				EditScore();
			}*/
		}	
		
		public function card_clicked(event:MouseEvent) { //mouse click event on card
			var clicked:Cards = (event.currentTarget as Cards);
			if (first_card == null) {		// if no card is selected then run this
				first_card = clicked;		//Sets correct card frame number to first_card
				first_card.gotoAndStop(clicked.img); //Doe the thing it self 
			}
			else if (second_card == null && first_card != clicked) { //if card one has been selected and second_card if empty then do this
				second_card = clicked;
				second_card.gotoAndStop(clicked.img);
				if (first_card.img == second_card.img) {	// if cards are the the sme do this
					pause_timer = new Timer(1000,1);
					pause_timer.addEventListener(TimerEvent.TIMER_COMPLETE,remove_cards);	//KILL CARD!
					pause_timer.start();
					score += 2;
					Cleared ++;
					CardSetsCleared++;
					trace(score);
					scoretext.text = String(score); //edit score text
					ClearedText.text = String(Cleared);//updates cleared cards
							if (MostCleared <= Cleared) {
							MostCleared = Cleared
							MostClearedText.text = String(MostCleared);
							}

					
					//scoretext.text = String(score);
				}
				else { //Calls for reset_cards function after 1000ms
					pause_timer = new Timer(1000,1);
					pause_timer.addEventListener(TimerEvent.TIMER_COMPLETE,reset_cards);//creates timer
					pause_timer.start();
					
				}
				
			}
		}
			public function reset_cards(event:TimerEvent) {//Resets the cards and clears First and second card var
			var card:Cards = new Cards();
			first_card.gotoAndStop(11); //Flips the cards
			second_card.gotoAndStop(11);
			first_card = null;
			second_card = null;
			score --; //substracts a try
			pause_timer.removeEventListener(TimerEvent.TIMER_COMPLETE, reset_cards); //removers timer
			scoretext.text = String(score);
			//lose condition
			if (score <= 0) {
				while (card.numChildren > 0) {
						card.removeChildAt(0);
					}
					gotoAndPlay("lost")
				
			}
		}
		
		public function remove_cards(event:TimerEvent) {//removes the cards and clears Second and first card
			//var win_timer:Timer
			removeChild(first_card);
			removeChild(second_card);
			first_card = null;
			second_card = null;
			pause_timer.removeEventListener(TimerEvent.TIMER_COMPLETE, remove_cards);
			//win condition
			if (CardSetsCleared >= 10) {
				//win_timer.timer = new Timer (1000, 1);	
				gotoAndPlay(3);
				//win_timer.start();
			}
		}
	}	
}
