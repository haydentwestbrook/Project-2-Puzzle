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
	public var currentFruit:String;


	public function new(size:Int) {
		super();
		numCherries = 0;
		numOranges = 0;
		numBananas = 0;
		numGrapes = 0;
		numWatermelons = 0;
		this.size = size;
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
		currentFruit = board[0][0].value;
	}
	
	public function flip(newFruit:String, row:Int, column:Int){
		var newPiece = new Piece();
		newPiece.changeValue(newFruit);
		var oldPiece = new Piece();
		oldPiece.changeValue(board[row][column].value);
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
		if(row+1 < board.length){
			if (board[row+1][column].value == oldPiece.value){
				flip(newFruit, row+1, column);
			}
		}
		if(row > 0){
			if (board[row-1][column].value == oldPiece.value){
				flip(newFruit, row-1, column);
			}
		}
		if(column+1 < board.length) {
			if(board[row][column+1].value == oldPiece.value){
				flip(newFruit, row, column+1);
			}
		}
		if(column > 0){
			if(board[row][column-1].value == oldPiece.value){
				flip(newFruit, row, column-1);
			}
		}
	}
}