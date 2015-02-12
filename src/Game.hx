import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Button;
import starling.animation.Transitions;
import starling.events.Event;
import starling.core.Starling;
import starling.display.Image;
import starling.display.DisplayObject;
import Board;
import Scoreboard;

class Game extends Sprite {

	public var board:Board;
	public var scoreboard:Scoreboard;
	public var size:Int;
	public var background1:Image;

	public function new(size:Int) {
		super();
		scoreboard = new Scoreboard(size);
		background1 = new Image(Root.assets.getTexture("background1"));
		board = new Board(size);
		//board.display();
		board.x = 64;
		board.y = 100;
		addChild(background1);
		addChild(board);
		addChild(scoreboard);

	}

	public function flip(newFruit:String){
		board.flip(newFruit, 0 ,0);
		scoreboard.useMove();
	}

	public function checkWin():Bool{
		if(board.numOranges == Math.pow(board.size, 2)){
			return true;
		}
		if(board.numCherries == Math.pow(board.size, 2)){
			return true;
		}
		if(board.numBananas == Math.pow(board.size, 2)){
			return true;
		}
		if(board.numGrapes == Math.pow(board.size, 2)){
			return true;
		}
		if(board.numWatermelons == Math.pow(board.size, 2)){
			return true;
		}
		return false;
	}

	public function getMoves():Int{
		return scoreboard.movesLeft;
	}

	public function nextLevel(size:Int){
		removeChildren();
		scoreboard.updateScore(size);
		board = new Board(size);
		background1 = new Image(Root.assets.getTexture("background1"));
		addChild(background1);
		addChild(scoreboard);
		addChild(board);
		board.x = 64;
		board.y = 100;
	}
}