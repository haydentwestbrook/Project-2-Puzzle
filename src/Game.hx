import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Button;
import starling.animation.Transitions;
import starling.events.Event;
import starling.core.Starling;
import starling.display.Image;
import starling.display.DisplayObject;
import Board;

class Game extends Sprite {

	public var board:Board;

	public function new() {
		super();
		board = new Board(10);
		//board.display();
		board.x = 64;
		board.y = 64;
		addChild(board);
	}

	public function flip(newFruit:String){
		board.flip(newFruit, 0 ,0);
	}
}