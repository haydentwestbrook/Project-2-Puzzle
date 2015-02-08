import flash.display.Sprite;
import starling.display.Image;

/*board =[00, 01, 02, 03,
		10, 11, 12, 13,
		20, 21, 22, 23,
		30, 31, 32, 33]
currentpiece = [00]*/

public var TextureAtlas:TextureAtlas = new TextureAtlas (assets.png, assets.xml);  //  check spelling of assets.png/xml files
public var fruitNames = new Array();

fruitNames = ['banana', 'cherry', 'grapes', 'orange', 'watermelon'];
public function randomImage() {
	public var ranNum:Int;
	ranNum = Math.round(Math.random() * 4);
	return fruitNames[ranNum];
}

class Piece extends Sprite {
	public var fruitImage:Image;
	public var value:String;
	
	function new() {
		super();
		value = randomImage();
		fruitImage = TextureAtlas.getTexture(value);	
	}
	
	function changeValue(newValue:String) {
		value = newValue;
		fruitImage = TextureAtlas.getTexture(newValue);
		
	}
	
}	
