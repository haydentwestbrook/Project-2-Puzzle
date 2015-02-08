import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Button;
import starling.animation.Transitions;
import starling.events.Event;
import starling.core.Starling;
import starling.display.Image;

class Root extends Sprite {

	public static var assets:AssetManager;
	public var menu:Menu;

	public function new() {
		super();
	}

	public function start(startup:Startup) {

		assets = new AssetManager();
		assets.enqueue("assets/startbutton.png");
		assets.enqueue("assets/tutorialbutton.png");
		assets.enqueue("assets/backbutton.png");
		assets.enqueue("assets/menu.png");

		assets.loadQueue(function onProgress(ratio:Float) {

            if (ratio == 1) {

                Starling.juggler.tween(startup.loadingBitmap, 2.0, {
                    transition: Transitions.EASE_OUT,
                        delay: 1.0,
                        alpha: 0,
                        onComplete: function() {
                        	startup.removeChild(startup.loadingBitmap);
                        	menu = new Menu();
							this.addChild(menu);
                        	addEventListener(Event.TRIGGERED, menuButtonClicked);
               			}

                });
            }

        });
	}

	public function menuButtonClicked(event:Event) {
		var button = cast(event.target, Button);
		if(button.name == "start") {
			startGame();
		} else if(button.name == "tutorial") {
			showTutorial();
		} else if(button.name == "back") {
			this.removeChildren();
			this.addChild(menu);
		}
	}

	public function startGame() {
		this.removeChildren();
		removeEventListeners();
		var game = new Game();
		this.addChild(game);
	}

	public function showTutorial() {
		this.removeChild(menu);
		var tutorial = new Tutorial();
		this.addChild(tutorial);
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