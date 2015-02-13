import flash.media.Sound;
import flash.media.SoundChannel;
import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Button;
import starling.animation.Transitions;
import starling.events.Event;
import starling.core.Starling;
import starling.display.Image;
import starling.display.DisplayObject;
import starling.events.KeyboardEvent;
import flash.ui.Keyboard;

class Root extends Sprite {

	public static var assets:AssetManager;
	public var game:Game;

	public function new() {
		super();
	}

	public function start(startup:Startup) {

		assets = new AssetManager();
		assets.enqueue("assets/startbutton.png");
		assets.enqueue("assets/continueButton.png");
		assets.enqueue("assets/tutorialbutton.png");
		assets.enqueue("assets/backbutton.png");
		assets.enqueue("assets/background1.png");
		assets.enqueue("assets/menu.png");
		assets.enqueue("assets/continue.png");
		assets.enqueue("assets/gameover.png");
		assets.enqueue("assets/assets.xml");
		assets.enqueue("assets/assets.png");
		assets.enqueue("assets/FruitSelect.mp3");
		assets.enqueue("assets/menuselect.mp3");
		assets.enqueue("assets/wintune.mp3");
		assets.enqueue("assets/LoseTune.mp3");

		assets.loadQueue(function onProgress(ratio:Float) {
			
            if (ratio == 1) {
				
				//var fruitSelect = Root.assets.playSound("FruitSelect.wav");
				//var winTune = Root.assets.playSound("wintune.mp3");
				//var loseTune = Root.assets.playSound("LoseTune.mp3");

				

                Starling.juggler.tween(startup.loadingBitmap, 2.0, {
                    transition: Transitions.EASE_OUT,
                        delay: 1.0,
                        alpha: 0,
                        onComplete: function() {
                        	startup.removeChild(startup.loadingBitmap);
                        	addMenu();
                        	addEventListener(Event.TRIGGERED, menuButtonClicked);
               			}

                });
            }

        });
	}

	public function addMenu() {
		var menu = new Menu();
		menu.alpha = 0;
		addChild(menu);
		//Tween in menu
		Starling.juggler.tween(menu, 0.25, {
                    transition: Transitions.EASE_IN,
                        delay: 0.0,
                        alpha: 1.0
        });
	}

	public function menuButtonClicked(event:Event) {
		var button = cast(event.target, Button);
		var menuSelect:SoundChannel = Root.assets.playSound("menuselect");
		menuSelect;
		if(button.name == "start") {
			startGame();
		} else if(button.name == "tutorial") {
			showTutorial();
		 } else if(button.name == "next") {
			game.nextLevel(5);
			removeChildAt(1);
		} else if(button.name == "back") {
			Starling.juggler.tween(getChildAt(0), .25, {
                    transition: Transitions.EASE_OUT,
                        delay: 0.0,
                        alpha: 0.0,
                        onComplete: function() {
                        	removeChildAt(0);
                        }
        	});
			addMenu();
		}
	}

	public function startGame() {
		//Tween out menu
		Starling.juggler.tween(getChildAt(0), 0.25, {
                    transition: Transitions.EASE_OUT,
                        delay: 0.0,
                        alpha: 0.0,
                        onComplete: function() {
                        	removeChildAt(0);
                        }
        });
		removeEventListeners();
		game = new Game(5);
		addChild(game);
		Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, flip);
	}

	public function flip(event:KeyboardEvent) {
		var fruitSelect:SoundChannel = Root.assets.playSound("FruitSelect");
		fruitSelect;
	    if (event.keyCode == 49) {
	    	game.flip('cherry');
	    }
	    else if(event.keyCode == 50) {
	    	game.flip('orange');
	    }
	    else if(event.keyCode == 51) {
	    	game.flip('banana');
	    }
	    else if(event.keyCode == 52) {
	    	game.flip('grapes');
	    }
	    else if(event.keyCode == 53) {
	    	game.flip('watermelon');
	    }
	    if(game.checkWin()){
	    	//TODO: CONTINUE SCREEN
	    	continueScreen();
	    }
	    else if(game.getMoves() == 0){
	    	//TODO: GAME OVER SCREEN
	    	var end = new GameOver();
	    	addChild(end); 
	    }
	}

	public function continueScreen() {
		removeEventListeners();
		var continueScreen = new ContinueScreen();
		continueScreen.alpha = 0;
		addChild(continueScreen);
		//Tween in continue screen
		Starling.juggler.tween(continueScreen, 0.25, {
                    transition: Transitions.EASE_IN,
                        delay: .25,
                        alpha: 1.0
        });
        addEventListener(Event.TRIGGERED, menuButtonClicked);
	}


	public function showTutorial() {
		//Tween out the menu
		Starling.juggler.tween(getChildAt(0), 0.25, {
                    transition: Transitions.EASE_OUT,
                        delay: 0.0,
                        alpha: 0.0,
                        onComplete: function() {
                        	removeChildAt(0);
                        }
        });
		var tutorial = new Tutorial();
		tutorial.alpha = 0;
		addChild(tutorial);
		//Tween in tutorial screen
		Starling.juggler.tween(tutorial, 0.25, {
                    transition: Transitions.EASE_IN,
                        delay: .25,
                        alpha: 1.0
        });
	}
}

class Menu extends Sprite {

	public var background:Image;
	public var startButton:Button;
	public var tutorialButton:Button;

	public function new() {
		super();

		var menu = new Image(Root.assets.getTexture("menu"));
		addChild(menu);

		startButton = new Button(Root.assets.getTexture("startbutton"));
		startButton.name = "start";
		startButton.x = 250;
		startButton.y = 200;
		this.addChild(startButton);

		tutorialButton = new Button(Root.assets.getTexture("tutorialbutton"));
		tutorialButton.x = 250;
		tutorialButton.y = 300;
		tutorialButton.name = "tutorial";
		this.addChild(tutorialButton);
	}
}

class ContinueScreen extends Sprite {
	public var background:Image;
	public var nextButton: Button;

	public function  new() {
		super();

		background = new Image(Root.assets.getTexture("continue"));
		addChild(background);

		nextButton = new Button(Root.assets.getTexture("continueButton"));
		nextButton.name = "next";
		nextButton.x = 288;
		nextButton.y = 450;
		this.addChild(nextButton);
	}
}

class Tutorial extends Sprite {

	public var background:Image;
	public var backButton:Button;

	public function new() {
		super();

		backButton = new Button(Root.assets.getTexture("backbutton"));
		backButton.name = "back";
		this.addChild(backButton);
	}
}

class GameOver extends Sprite {
	public var background:Image;
	public var returnButton:Button;

	public function new() {
		super();
		background = new Image(Root.assets.getTexture("gameover"));
		addChild(background);
	}
}