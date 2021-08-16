package;
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * @author bbpanzu
 //thank u bbpanzu, bless -Artcarrot
 //thank you both for giving me the chance to stea- I mean, permanetly borrow the code -UBlankk
 */
class EndingState extends FlxState
{

	var _goodEnding:Bool = false;
	
	public function new(goodEnding:Bool = true) 
	{
		super();
		_goodEnding = goodEnding;
		
	}
	
	override public function create():Void 
	{
		super.create();
		var end:FlxSprite = new FlxSprite(0, 0);
		if (_goodEnding){
			end.loadGraphic(Paths.image('endingkon', 'shared'));
			FlxG.sound.playMusic(Paths.music('interrogation', 'shared'), 1, false);
		}else{
			//too lazy to remove this and test stuff so both endings are the same LOL
			//same ig- UBlankk
			//wait... why am I talking with myself... Am I maybe going mad? Nah. Prolly not. But am I? - UBlankk			
			end.loadGraphic(Paths.image('endingkon', 'shared'));
			FlxG.sound.playMusic(Paths.music('interrogation', 'shared'), 1, false);
		}
		add(end);
		FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
		
		
		new FlxTimer().start(30, endIt);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.pressed.ENTER){
			endIt();
		}
		
	}
	
	
	public function endIt(e:FlxTimer=null){
		trace("ENDING");
		FlxG.switchState(new StoryMenuState());
	}
}	