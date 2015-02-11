import starling.display.Sprite;
import starling.display.Image;
import starling.display.DisplayObject;
import starling.textures.TextureAtlas;
import Root;



class Piece extends Sprite {
	public var fruitImage:Image;
	public var value:String;
	public var fruitNames = ['banana', 'cherry', 'grapes', 'orange', 'watermelon'];
	public function randomImage() {
		var ranNum:Int;
		ranNum = Math.round(Math.random() * 4);
		return fruitNames[ranNum];
	}
	
	function new() {
		super();
		value = randomImage();
		fruitImage = new Image(Root.assets.getTexture(value + '.png')); //needs to be changed to access fruits
		addChild(fruitImage);
	}
	
	public function changeValue(newValue:String) {
		value = newValue;
		var fruitImage = new Image(Root.assets.getTexture(newValue + '.png'));
		removeChildren();
		addChild(fruitImage);

		
	}
	
}	
