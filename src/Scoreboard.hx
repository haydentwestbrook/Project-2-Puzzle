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
		scoreField.x = 40;
		scoreField.y = 40;
		movesField.x = 40;
		movesField.y = 60;
		addChild(scoreField);
		addChild(movesField);
	}

	public function useMove(){
		movesLeft--;
		movesField.text = "Moves Left: " + movesLeft;
	}

	public function updateScore(size){
		score += movesLeft * 10;
		movesLeft = Math.round((size*size)*.75);
		movesField.text = "Moves Left: " + movesLeft;
		scoreField.text = "Score: " + score;
	}
}