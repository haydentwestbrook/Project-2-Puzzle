import flash.display.Sprite;
import starling.display.Image;
import Piece;

class Board extends Sprite {
	public var board:Array<Array<Piece>;

	function new() {
		super();
		board = [[null, null, null, null], 
				[null, null, null, null],
				[null, null, null, null], 
				[null, null, null, null]];
		for (i in board){
			for (j in board[i]){
				board[i][j] = new Piece();
			}
		}

	}

	function display(){
		var startX = 0;
		var startY = 0;
		for (i in board){
			for(j in board[i]){
				board[i][j].x = startX + 64*i;
				board[i][j].y = startY + 64*j;
				addChild(board[i][j]);
			}
		}
	}
}