package debug;

import debug.AltasSprite.AtlasSprite;
import flixel.FlxG;
import flxanimate.FlxAnimate;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;

using StringTools;

class AtlasDebug extends FlxState
{

	var character:AtlasSprite;

	public function new() {
		super();
	}

	override function create() {

		var gridBG:FlxSprite = FlxGridOverlay.create(10, 10, 1280*4, 720*4);
		gridBG.scrollFactor.set(0.5, 0.5);
		gridBG.screenCenter(XY);
		add(gridBG);

		character = new AtlasSprite(0, 0, Paths.getTextureAtlas("week3/pico_atlas"));
		character.addAnimationByLabel("idle", "Idle", 24, true);
		character.addAnimationByLabel("singUP", "Sing Up", 24);
		character.addAnimationByLabel("singDOWN", "Sing Down", 24);
		character.addAnimationByLabel("singLEFT", "Sing Left", 24);
		character.addAnimationByLabel("singRIGHT", "Sing Right", 24);
		character.addAnimationByLabel("idleWeird", "Idle", 24, true, 5);
		character.antialiasing = true;
		character.screenCenter();
		character.playAnim("idle");

		add(character);

		super.create();
	}

	override function update(elapsed:Float) {

		if (FlxG.keys.anyJustPressed([ONE])) {
			character.playAnim("idle");
		}
		else if (FlxG.keys.anyJustPressed([TWO])) {
			character.playAnim("singUP");
		}
		else if (FlxG.keys.anyJustPressed([THREE])) {
			character.playAnim("singDOWN");
		}
		else if (FlxG.keys.anyJustPressed([FOUR])) {
			character.playAnim("singLEFT");
		}
		else if (FlxG.keys.anyJustPressed([FIVE])) {
			character.playAnim("singRIGHT");
		}
		else if (FlxG.keys.anyJustPressed([ZERO])) {
			character.playAnim("idleWeird");
		}

		if (FlxG.keys.anyJustPressed([Q])) {
			character.flipX = !character.flipX;
			trace(character.flipX);
		}

		super.update(elapsed);
	}
}
