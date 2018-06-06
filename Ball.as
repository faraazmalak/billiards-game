/**
 * The Ball class extends the dynamic MovieClip class and is therefore also
 * dynamic. The Ball class assumes a MovieClip in the library is associated with
 * this class. 
 */
 dynamic class Ball extends MovieClip {
	// Travel limits for the movie clip's registration point.
	var xMin:Number, yMin:Number, xMax:Number, yMax:Number;
	// Velocity in x and y for the movie clip.
	var xVel:Number=0;
	 var yVel:Number=0;
	 var changeDir:Boolean=false;
	// Variable set in attachMovie and used by the text field.
	
	
	

	/** 
	    * The Ball constructor function calculates the bounding rectangle
	    * within which this clip's registration point is allowed to travel.
	    * The clip's registration point is assumed to be in the center of the 
	    * clip but the height and width of the clip do not have to be the same.
	    * Therefore the bounding rectangle is calculated for each clip when
	    * each clip's constructor is called. 
	    * The Stage object provides Stage.width and Stage.height.
	    * A random starting position and random velocity are also determined.
	    */
	function Ball() {
		// Calculate the limits of travel for this clip's registration point.
		xMin = _width/2;
		yMin = _height/2;
		xMax = Stage.width-xMin;
		yMax = Stage.height-yMin;
		

		// Determine the random starting position within the Stage for this clip.    
		_x = Math.floor(Math.random()*(Stage.width-_width))+xMin;
		_y = Math.floor(Math.random()*(Stage.height-_height))+yMin;

		// Generate random x and y velocities for each instance of this clip.
		xVel = Math.floor(Math.random()*25)-10;
		yVel = Math.floor(Math.random()*25)-10;
	}
	/**
	    * The onEnterFrame method calculates the next position for the movie clip
	    * and then checks to make sure it is within the movie clip's travel limits.
	    * If it is not the position of registration point is recalculated as though
	    * it has just bounced off the edge of the stage. The x and y position of the
	    * registration point are calculated separately.
	    */
		
	function onEnterFrame() {
		/// Get the x and y positions for the next frame.
		var nextX = xVel+_x;
		var nextY = yVel+_y;
		
		trace("BALLALA");

// Make sure the registration point is within limits.
		
		
		// Make sure the registration point is within limits.
		if (nextX>xMax || changeDir==true ) {
			// Change direction by changing the sign of xVel.
			xVel = xVel*-1;
			
			// Bring clip back by the amount it has overshot its limit.
			nextX = xMax-(nextX-xMax);
		} else if (nextX<xMin ) {
			xVel = xVel*-1;
			nextX = xMin+(xMin-nextX);
			
		}
		if (nextY>yMax || changeDir==true) {
			yVel = yVel*-1;
			nextY = yMax-(nextY-yMax);
			changeDir=false;
		} else if (nextY<yMin) {
			yVel = yVel*-1;
			nextY = yMin+(yMin-nextY);
			
		}
		// Now that we are sure the position in nextX and nextY are correct,  
		// set the position for the next frame.
		
		
		this._x = nextX;
		this._y = nextY;
		
		
		
		
		
		
			
			
		}
		
		
		
		
	};