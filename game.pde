float Xb, Yb, r, speedX, speedY;    //ball location, size, and speed
float Xp, Yp, w, h; //paddle location, wdith and height 
int speedP = 3;

boolean isGameOver = false;         // when true, just draw the GameOver message and stop the animation loop to end the game  
int score = 0;

void setup() {
  size(400, 400);

  // initialize ball attributes
  Xb = random(r, width-r);      
  Yb = 30;                         
  r = 15;
  speedX = int(random(2, 4));   
  speedY = int(random(2, 4));

  // initialize paddle attributes
  w = 30; 
  h = 8;
  Xp = width/2;  
  Yp = height - h;
  
  // hide mouse cursor
  noCursor();
}

void draw() {  
background(0);

if (!isGameOver) {         //play as long as it is not game over

// DRAW game elements
    // draw Ball
    fill(255);   noStroke();
    ellipse(Xb, Yb, 2*r, 2*r);
    
    // draw paddle
    stroke(0, 255, 0);  strokeCap(ROUND);  strokeWeight(h);
    line(Xp-w, Yp, Xp+w, Yp);
    
    // draw score
    fill(255, 0, 0); textAlign(LEFT);  textSize(16);
    text("Score: " + score, 5, 15);

// MOVE game elements

    // move Paddle
    
    Xp = mouseX;
    if(Xp < w){
      Xp = w;
    }
    if(Xp > width-w){
      Xp = width-w;
    }
    
    // move ball 
    Xb += speedX;
    Yb += speedY;

// CHECK for collisions
    //bounce off side walls
    if(Xb > width - r || Xb < r){
      speedX = -speedX;
    }
    
    if(Yb < r){
      speedY = -speedY;
    }
 
    //check if ball hits paddle
    if(Yb >= height-h-r){
      if(dist(Xb, Yb, Xp, Yp) <= w){
        score++;
        speedY = -speedY;
        abs(speedX * 1.10);
        abs(speedY * 1.10);
      }else{
        isGameOver = true;
        println("game over");
      }
    }
    
} else { // if game over
    //gameover message with scores
    fill(255, 0, 0);
    noStroke();
    rectMode(CENTER);
    rect(width/2, height/2, 300, 150);
    
    fill(255, 255, 0);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("Game over!\n Your score is "+ score, width/2, height/2);
  
  }
}
