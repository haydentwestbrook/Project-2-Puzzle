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

	public function new(size:Int) {
		super();
		scoreboard = new Scoreboard(size);
		board = new Board(size);
		//board.display();
		board.x = 64;
		board.y = 100;
		addChild(board);
		addChild(scoreboard);
	}

	public function flip(newFruit:String){
		board.flip(newFruit, 0 ,0);
		scoreboard.useMove();
	}

	public function checkWin():Bool{
		if(board.numOranges == 25){
			return true;
		}
		if(board.numCherries == 25){
			return true;
		}
		if(board.numBananas == 25){
			return true;
		}
		if(board.numGrapes == 25){
			return true;
		}
		if(board.numWatermelons == 25){
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
		addChild(scoreboard);
		board.x = 64;
		board.y = 100;
		addChild(board);
	}
}