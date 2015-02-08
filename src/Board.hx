import flash.display.Sprite;
import starling.display.Image;
import Piece;

class Board extends Sprite {
	public var board:Array<Array<Piece>>;

	function new() {
		super();
		board = [[null, null, null, null], 
				[null, null, null, null],
				[null, null, null, null], 
				[null, null, null, null]];
		for (i in 0...board.length){
			for (j in 0...board[i].length){
				board[i][j] = new Piece();
			}
		}

	}
	
	function getAdjacent(x:Int, y:Int) {
		var adjacent:Array<Piece>;
		if (x == 0 && y == 0) { //top left corner
			adjacent.add(board[x][y + 1];
			adjacent.add(board[x + 1][y]);
		}
		
		else if (x == 0 && y == board[x].length) { //top right corner
			adjacent.add(board[x][y - 1];
			adjacent.add(board[x + 1][y];
		}
		else if (x == board.length && y == 0){//bottom left corner
			adjacent.add(board[x][y + 1];
			adjacent.add(board[x-1][y];	
		}
		else if (x == board.length && y == board[x].length) { // bottom right corner
			adjacent.add(board[x][y - 1];
			adjacent.add(board[x - 1][y];	
		}
		else if (x == 0 && y != board[x].length) {// top edge
			adjacent.add((board[x][y - 1]);
			adjacent.add(board[x][y + 1]);
			adjacent.add(board[x + 1][y];
		}
		else if ( x == board.length && y != board[x].length) { //bottom edge
			adjacent.add((board[x][y - 1]);
			adjacent.add(board[x][y + 1]);
			adjacent.add(board[x - 1][y];
		}
		else if (y == 0) { // left edge
			adjacent.add((board[x+1][y);
			adjacent.add(board[x-1][y]);
			adjacent.add(board[x][y+1];
		}
		else if (y == board[x].length) { // right edge
			adjacent.add((board[x+1][y);
			adjacent.add(board[x-1][y]);
			adjacent.add(board[x][y-1];
		}
		else { // middle
			adjacent.add((board[x+1][y);
			adjacent.add(board[x-1][y]);
			adjacent.add(board[x][y + 1];
			adjacent.add(board[x][y - 1];
			
		}
		return adjacent;
	}

	function display(){
		var startX = 0;
		var startY = 0;
		for (i in 0...board.length){
			for(j in 0...board[i].length){
				board[i][j].x = startX + 64*i;
				board[i][j].y = startY + 64*j;
				addChild(board[i][j]);
			}
		}
	}
}