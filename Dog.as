/*Dog.as
*To create dog randomly on stage and make the dog, throw an object
*/
class Dog extends MovieClip {
	//Property to ensure every dog & object created has a unique instance name
	private static var totalDogs:Number=0;
	private static var lastWeaponID:Number=1;
	
	/*getTotalDogs() function
	*Returns totalDogs property
	*/
	public function getTotalDogs():Number {
		return totalDogs;

	}
	
	/*showDog() function
	*Variable to indicate if dog should be shown or not
	*Displays dog randomly on stage 
	*/
	public function showDog() {
		
		if (_root.pauseDog == false) {

			var newDog_mc:MovieClip = _root.attachMovie("throwBall_id", "throwBall"+totalDogs+"_mc", _root.getNextHighestDepth());
			
			totalDogs++;


			newDog_mc._xscale = 50;
			newDog_mc._yscale = 50;
	
			//---------------Sets x coordinate------------------------------
			var xCoord:Number = Math.round((Math.random()*Stage.width));
			
			if (xCoord>=0 && xCoord<=_root.runningBoy_mc._width+10) {
				xCoord = _root.runningBoy_mc._width+10;
				
			}
			if (xCoord+_root.runningBoy_mc._width+10>Stage.width) {
				xCoord = Stage.width-(_root.runningBoy_mc._width-10);
				
			}
			
			newDog_mc._x = xCoord;

			//----------------------------------------------------------




			//---------------------------Sets y Coordinate---------------------------

			var yCoord:Number = (Math.random()*(Stage.height-(_root.standingBoy_mc._height+_root.background_mc._height)));

			if (yCoord>newDog_mc._height+5) {
				newDog_mc._y = yCoord;
			} else {
				newDog_mc._y = newDog_mc._height+5;
			}


			//-----------------------------------------------------------------------------

		}
		 
	}


	/*throwWeapon()
	*Variable to indicate if object should be shown or not
	*Makes dog throw an object, after it is displayed on stage
	*/
	private function throwWeapon() {

		if (_root.pauseDog == false) {
			
			//Randomly generated weapon id, to ensure different objects are thrown
			var weaponID:Number = 1;
			
			if (_root.game.getGameLevel() == 1) {

				weaponID =Math.round(Math.random()*2);
				trace(weaponID);
				

			} else if (_root.game.getGameLevel() == 2 ) {
				weaponID = Math.round(Math.random()*3);
				



			}
			
			
			
			if(lastWeaponID==2 && weaponID==2)
				{
					weaponID=1;
					lastWeaponID=1;
				}
				
			else if (weaponID == 0) {
				weaponID = 1;
			}
			
			lastWeaponID=weaponID;
			
			trace("WEP ID: "+weaponID);

			switch (weaponID) {

				
				case 2 :
					{
						var newWeapon_mc:MovieClip = _root.attachMovie("lifeHead_id", "extraLife"+totalDogs+"_mc", _root.getNextHighestDepth());
						newWeapon_mc.setID(2);
						newWeapon_mc._xscale = 10;
						newWeapon_mc._yscale = 10;
						
						break;
					};

				case 3 :
					{
						var newWeapon_mc:MovieClip = _root.attachMovie("missile_id", "newMissile"+totalDogs+"_mc", _root.getNextHighestDepth());

						newWeapon_mc.setID(3);

						_root.lens_mc.swapDepths(newWeapon_mc);

						break;
				}
				
				default:
					{


						var newWeapon_mc:MovieClip = _root.attachMovie("basketBall_id", "newBall"+totalDogs+"_mc", _root.getNextHighestDepth());
						newWeapon_mc.setID(weaponID);
						newWeapon_mc._xscale = newWeapon_mc._yscale=10;
						break;
					};



			};

			newWeapon_mc._x = _x;
			newWeapon_mc._y = _y;
			totalDogs++;

		}


	}

	/*setPauseDog() function
	*Sets the pauseDog variable to true, so that dog and object are no longer displayed on stage
	*/
	public function setPauseDog(pauseValue:Boolean) {

		_root.pauseDog = pauseValue;

	}
	
	
	/*removeDog() function
	*Remnoves dog from the stage
	*/
	public function removeDog() {


		
		this.removeMovieClip();
		totalDogs--;



	}
}