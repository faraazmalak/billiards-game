/*Boy.as
*Represents the boy shown on the stage. Contains various functions to manuplate the boy
*/

class Boy extends MovieClip {
	//Boy lives
	private static var boyLives:Number = 4;
	
	//Number of balls collected in current level
	private var ballsCollected:Number = 0;
	
	//Sound fx
	private var fx:Sound;

	//Constructor
	function Boy() {

		fx = new Sound();
	}

	/*getBallsCollected() function
	*Returns total number of balls collected for this level
	*/
	public function getBallsCollected():Number {

		return ballsCollected;
	}


	public function resetBoyLife()
	{
		
		boyLives=4;
		
	}

	/*getBoyLives() function
	*Returns boy lives
	*/
	public function getBoyLives():Number {

		return boyLives;
	}
	
	/*moveRight() function
	*Show boy running to right
	*/
	public function moveRight() {
		if (_root.runningBoy_mc._x+10+(_root.runningBoy_mc._width/2)<Stage.width) {
			_root.runningBoy_mc._x += 10;
			_root.runningShadow_mc._x += 10;
		}

	}

	/*moveLeft() function
	*Show boy running to left
	*/
	public function moveLeft() {

		if ((_root.runningBoy_mc._x-10)-(_root.runningBoy_mc._width/2)>0) {
			_root.runningBoy_mc._x -= 10;
			_root.runningShadow_mc._x -= 10;
		}

	}

	/*flipLeft() function
	*Flips the boy to left
	*/
	public function flipLeft() {

		if (_root.runningBoy_mc._xscale>0 || _root.standingBoy_mc._xscale>0) {
			_root.runningBoy_mc._xscale *= -1;
			_root.runningShadow_mc._xscale *= -1;

			_root.standingBoy_mc._xscale *= -1;
			_root.standingShadow_mc._xscale *= -1;
		}

	}


	/*flipRight() function
	*Flips boy to right
	*/
	public function flipRight() {

		if (_root.runningBoy_mc._xscale<0 || _root.standingBoy_mc<0) {
			_root.runningBoy_mc._xscale *= -1;
			_root.runningShadow_mc._xscale *= -1;

			_root.standingShadow_mc._xscale *= -1;
			_root.standingBoy_mc._xscale *= -1;
		}

	}

	/*showStandingBoy() function
	*Show boy as standing
	*/
	public function showStandingBoy() {
		trace(_root.boyLifeGain_mc._visible);
		if (_root.boyLifeGain_mc._visible == false) {
			_root.standingBoy_mc._x = _root.runningBoy_mc._x;
			_root.standingShadow_mc._x = _root.runningBoy_mc._x;
			_root.standingBoy_mc._visible = true;
			_root.standingShadow_mc._visible = true;

			_root.runningBoy_mc._visible = false;
			_root.runningShadow_mc._visible = false;

		}


	}


	/*showRunningBoy() function
	*Shows boy as running
	*/
	public function showRunningBoy() {

		if (_root.boyLifeGain_mc._visible == false) {
			if (_root.runningBoy_mc._visible == false) {
				_root.runningBoy_mc._visible = true;
				_root.runningBoy_mc._x = _root.boyStanding_mc._x;

				_root.runningShadow_mc._visible = true;
				_root.runningShadow_mc._x = _root.boyStanding_mc._x;
				//runningBoy_mc._y=boyStanding_mc._y;
				_root.standingBoy_mc._visible = false;
				_root.standingShadow_mc._visible = false;
			}
		}

	}

	/*printLives()
	*Updates dynamic text box on stage with boy's life
	*/
	public function printLives() {

		_root.life_txt.text = "X "+boyLives;
	}
	
	/*increaseLife()
	*Increases boy's life. 
	*/
	public function increaseLife() {

		boyLives++;
		printLives();
		if (_root.runningBoy_mc._visible == true) {
			_root.boyLifeGain_mc._x = _root.runningBoy_mc._x;
			

			_root.runningBoy_mc._visible = false;
			_root.runningShadow_mc._visible = false;
		} else if (_root.standingBoy_mc._visible == true) {
			_root.boyLifeGain_mc._x = _root.standingBoy_mc._x;

			

			_root.standingBoy_mc._visible = false;
			_root.standingShadow_mc._visible = false;
		}

		_root.myDog.setPauseDog(true);
		_root.boyLifeGain_mc._visible = true;



		fx.attachSound("lifeGain_id");

		fx.start();
		fx.onSoundComplete = function() {

			_root.standingBoy_mc._visible = true;
			_root.standingShadow_mc._visible = true;
			_root.boyLifeGain_mc._visible = false;
			_root.myDog.setPauseDog(false);

		};

	}
	
	/*decreaseLife() function
	*Decreases boy's life
	*/
	public function decreaseLife() {
		
		if (boyLives>0) {
			boyLives -= 1;
		}
		printLives();

	}

	/*updateBalls()
	*Calls after a ball is collected in the basket. If ballsCollected==required balls to complete the level, then, takes user to instructions page for
	*next level
	*/
	public function updateBalls() {
		ballsCollected++;
		_root.balls_txt.text = ballsCollected;

		if (_root.game.getGameLevel() == 1 && ballsCollected == 5) {
			ballsCollected = 0;
			_root.game.cleanUpStage();
			_root.gotoAndStop("instructions");



		} else if (_root.game.getGameLevel() == 2 && ballsCollected == 10) {
			ballsCollected = 0;
			_root.game.cleanUpStage();
			_root.gotoAndStop("instructions");





		}

	}

	/*showInjury function()
	*Called after an object (not extra life), hits the boy. Shows stars over boy's head and plays fx sound
	*/
	function showInjury() {
		
		if (_root.runningBoy_mc._visible == true) {
			_root.runningBoy_mc.injury_mc.play();

		} else {
			_root.standingBoy_mc.injury_mc.play();



		}
		fx.attachSound("ouch_id");
		fx.start();


	}




}