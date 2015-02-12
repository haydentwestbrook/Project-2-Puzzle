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
		scoreField = new TextField(350, 200, "Score: 0");
		scoreField.color = 0xFF4747;
		scoreField.fontSize = 48;
		scoreField.bold = true;
		scoreField.fontName = "Gabriola";
		scoreField.vAlign = VAlign.TOP;
		scoreField.hAlign = HAlign.LEFT;
		movesField = new TextField(350, 200, "Moves Left: " + movesLeft);
		movesField.color = 0xFF4747;
		movesField.fontSize = 48;
		movesField.bold = true;
		movesField.fontName = "Gabriola";
		movesField.vAlign = VAlign.TOP;
		movesField.hAlign = HAlign.LEFT;
		scoreField.x = 64;
		scoreField.y = 420;
		movesField.x = 64;
		movesField.y = 480;
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