/*BasketBall.as
*Represents the object thrown by the dog
*/

class BasketBall extends MovieClip {

	//Acceleration on Y axis
	private var aY = 0.5;

	//Velocity on Y axis
	private var vY = 0;

	

	//Creates the object/weapon, based on weaponID (eg. missile, ball, extra life)
	private var weaponID:Number = 1;
	private var missileHitTest:Boolean=false;

	/*setID(id:Number)
	*Sets weaponID property. This function is called from Dog.as file
	*/
	public function setID(id:Number) {

		weaponID = id;

	}

	/*onEnterFrame()
	*Updates Y position of object, so that it appears falling vertically. Velocity accelerates as object fallse
	*Also, checks if the falling object has hit something or not. If it has hit something, then appropriate action is taken
	*/
	private function onEnterFrame() {

		
		vY += aY;
		this._y += vY;
		
		//Object/weapon hits the boy (doe not fall into the basket)
		if (this.hitTest(_root.runningBoy_mc.head_mc) == true || this.hitTest(_root.standingBoy_mc.head_mc == true )) {
			
			


			if (weaponID == 1) {


				_root.musicBoy.showInjury();
				_root.musicBoy.decreaseLife();
				
				this.removeMovieClip();
				
			} else if (weaponID == 3) {
		
				_root.musicBoy.resetBoyLife();
				_root.game.gameOver();
				this.removeMovieClip();
				
			} else if (weaponID == 2) {
				
				
				_root.musicBoy.increaseLife();
				this.removeMovieClip();

			}
		} 
		//object/weapon falls into the basket
		else if (this.hitTest(_root.runningBoy_mc.basket_mc.basketHole_mc) == true || this.hitTest(_root.standingBoy_mc.basket_mc.basketHole_mc) == true) {

			

			if (weaponID == 1) {
				_root.musicBoy.updateBalls();
				this.removeMovieClip();


			} else if (weaponID == 3) {

				_root.musicBoy.resetBoyLife();
				_root.game.gameOver();
				this.removeMovieClip();
				
			} else if (weaponID == 2) {
				_root.musicBoy.increaseLife();
				this.removeMovieClip();
			}



		}
		
		//Object/weapon does not hit anything
		if (this.hitTest(_root.floor_mc) == true && missileHitTest==false) {

			
			if (weaponID == 3) {
				
				missileHitTest=true;
				_root.musicBoy.decreaseLife();
				
				
			}
			this.removeMovieClip();


		}

		
		

	}







}