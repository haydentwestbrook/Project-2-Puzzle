import starling.display.Sprite;
import starling.display.DisplayObject;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

class Scoreboard extends Sprite{

	public var score: Int;
	public var movesLeft: Int;
	public var scoreField: TextField;
	public var movesField: TextField;

	public function new(size:Int){
		super();
		score = 0;
		movesLeft = Math.round((size*size)*.75);
		scoreField = new TextField(100, 20, "Score: 0");
		scoreField.vAlign = VAlign.TOP;
		scoreField.hAlign = HAlign.LEFT;
		movesField = new TextField(100, 20, "Moves Left: " + movesLeft);
		movesField.vAlign = VAlign.TOP;
		movesField.hAlign = HAlign.LEFT;
		scoreField.x = 0;
		scoreField.y = 0;
		movesField.x = 0;
		movesField.y = 20;
		addChild(scoreField);
		addChild(movesField);
	}

	public function useMove(){
		movesLeft--;
		movesField.text = "Moves Left: " + movesLeft;
	}
}