/*Game.as
*Class to control the entire game play
*/
class Game extends MovieClip {

	//Current game level
	private var gameLevel:Number = 0;
	
	//Interval ID for showDog() function (from Dog.as)
	private var dogIntID:Number = 0;
	
		
	
	
	/*setLevel()
	*Initialize gameLevel private property
	*/
	public function setLevel(level:Number) {

		gameLevel = level;

	}
	
	/*getGameLevel()
	*return value of gameLevel private property
	*/
	public function getGameLevel():Number {

		return gameLevel;

	}
	
	/*initLevel()
	*Initialize current level (based on gameLevel property)
	*/
	public function initLevel() {
		
		_root.runningBoy_mc._visible = false;
		_root.myDog.showDog();
		_root.runningShadow_mc._visible = false;

		_root.musicBoy.printLives();
		
		switch (gameLevel) {
			case 1 :
				{

					_root.boyLifeGain_mc._visible = false;

					
					dogIntID = setInterval(_root.myDog.showDog, 2500);

					//Set the time level to complete level 1
					


					break;

				};
			case 2 :


				{
					_root.boyLifeGain_mc._visible = false;

					dogIntID = setInterval(_root.myDog.showDog, 2500);

					
					



					break;


			}
		}




	};

	/*cleanUpStage()
	*Removes all objects dynamically attached to stage.
	*Also, clears all intervals, set above
	*/
	public function cleanUpStage() {



		for (var i:Number = 0; i<_root.myDog.getTotalDogs(); i++) {
			eval("throwBall"+[i]+"_mc").removeMovieClip();


		}
		
		for (var i:Number = 0; i<_root.myDog.getTotalDogs(); i++) {
			eval("newBall"+[i]+"_mc").removeMovieClip();


		}
		
		for (var i:Number = 0; i<_root.myDog.getTotalDogs(); i++) {
			eval("extraLife"+[i]+"_mc").removeMovieClip();


		}
		
		for (var i:Number = 0; i<_root.myDog.getTotalDogs(); i++) {
			eval("newMissile"+[i]+"_mc").removeMovieClip();


		}
		
		


		
		clearInterval(dogIntID);

		break;


	}



	/*gameOver()
	*Called after game is over
	*/
	public function gameOver() {
		
		cleanUpStage();
		_root.levelBuffer="loose";
		_root.gotoAndStop("instructions");

	}

}