import starling.display.Sprite;
import starling.display.DisplayObject;
import Piece;

class Board extends Sprite {

	public var board:Array <Array<Piece>>;
	public var size:Int;
	public var numCherries:Int;
	public var numOranges:Int;
	public var numBananas:Int;
	public var numGrapes:Int;
	public var numWatermelons:Int;


	public function new(size:Int) {
		super();
		numCherries = 0;
		numOranges = 0;
		numBananas = 0;
		numGrapes = 0;
		numWatermelons = 0;
		board = new Array<Array<Piece>>();
		for (i in 0...size){
			var newRow = new Array<Piece>();
			for (j in 0...size){
				var newPiece = new Piece();
				newRow.push(newPiece);
				newPiece.x = 64*i;
				newPiece.y = 64*j;
				addChild(newPiece);
				if(newPiece.value == "cherry"){
					numCherries++;
				}
				else if(newPiece.value == "orange"){
					numOranges++;
				}
				else if(newPiece.value == "banana"){
					numBananas++;
				}
				else if(newPiece.value == "grapes"){
					numGrapes++;
				}
				else if(newPiece.value == "watermelon"){
					numWatermelons++;
				}
			}
			board.push(newRow);
		}
	}
	
	function getAdjacent(x:Int, y:Int) {
		var currentPiece:Piece = new Piece();
		var adjacent:Array<Piece> = new Array<Piece>();
		if (x == 0 && y == 0) { //top left corner
			adjacent.push(board[x][y + 1]);
			adjacent.push(board[x + 1][y]);
		}
		
		else if (x == 0 && y == board[x].length) { //top right corner
			adjacent.push(board[x][y - 1]);
			adjacent.push(board[x + 1][y]);
		}
		else if (x == board.length && y == 0){//bottom left corner
			adjacent.push(board[x][y + 1]);
			adjacent.push(board[x-1][y]);	
		}
		else if (x == board.length && y == board[x].length) { // bottom right corner
			adjacent.push(board[x][y - 1]);
			adjacent.push(board[x - 1][y]);	
		}
		else if (x == 0 && y != board[x].length) {// top edge
			adjacent.push(board[x][y - 1]);
			adjacent.push(board[x][y + 1]);
			adjacent.push(board[x + 1][y]);
		}
		else if ( x == board.length && y != board[x].length) { //bottom edge
			adjacent.push(board[x][y - 1]);
			adjacent.push(board[x][y + 1]);
			adjacent.push(board[x - 1][y]);
		}
		else if (y == 0) { // left edge
			adjacent.push(board[x+1][y]);
			adjacent.push(board[x-1][y]);
			adjacent.push(board[x][y+1]);
		}
		else if (y == board[x].length) { // right edge
			adjacent.push(board[x+1][y]);
			adjacent.push(board[x-1][y]);
			adjacent.push(board[x][y-1]);
		}
		else { // middle
			adjacent.push(board[x+1][y]);
			adjacent.push(board[x-1][y]);
			adjacent.push(board[x][y + 1]);
			adjacent.push(board[x][y - 1]);
			
		}
		for (i in 0...adjacent.length) {
			if (adjacent[i] == currentPiece) {
					adjacent.remove(adjacent[i]);
				} 
		}
		return adjacent;
	}

	public function flip(newFruit:String, row:Int, column:Int){
		var newPiece = new Piece();
		newPiece.changeValue(newFruit);

		if(row+1 < board.length && board[row+1][column].value == board[row][column].value){
			flip(newFruit, row+1, column);
		}
		if(column+1 < board.length && board[row][column+1].value == board[row][column].value){
			flip(newFruit, row, column+1);
		}
		if(board[row][column].value == "cherry"){
			numCherries--;
		}
		else if(board[row][column].value == "orange"){
			numOranges--;
		}
		else if(board[row][column].value == "banana"){
			numBananas--;
		}
		else if(board[row][column].value == "grapes"){
			numGrapes--;
		}
		else if(board[row][column].value == "watermelon"){
			numWatermelons--;
		}
		board[row][column].changeValue(newFruit);
		if(newPiece.value == "cherry"){
			numCherries++;
		}
		else if(newPiece.value == "orange"){
			numOranges++;
		}
		else if(newPiece.value == "banana"){
			numBananas++;
		}
		else if(newPiece.value == "grapes"){
			numGrapes++;
		}
		else if(newPiece.value == "watermelon"){
			numWatermelons++;
		}
	}
}