float[] x = new float[5];
float[] y = new float[5];
float[] speedX = new float[5];
float[] speedY = new float[5];
float diam = 20;
float rectSize = 100; // increase the rectSize by 50 or more if you want to play easy game
float gravity = 9.8;
float score = 0.0;
int GAMEOVER = 0;

void setup() {
  
  size(640,460);
  fill(0);  
  reset();
}

void reset() {
  GAMEOVER = 0;
  for(int i=0; i<5; i++)
  {
    x[i] = 0;
    y[i] = 0;
    speedX[i] = random(1.15, 2);
    speedY[i] = random(0.2, 1.2);
  }
  
}

void draw() { 
  if(GAMEOVER==1)
  {
    background(255, 0, 0);
  }
  
  else{
        background(0, 0, 255);
        
        // draw 5 balls
        fill(0);
        text("$"+ score, width-80, 40);
        for(int i=0; i<5; i++)
        {
          ellipse(x[i], y[i], diam, diam);
        }
        
        // grass
        fill(0, 128, 0);
        rect(0, height-20, width, 20);
        
        // hat
        fill(0);
        rect( mouseX-rectSize/2, height-80, rectSize, 10);
        rect( mouseX-rectSize/4, height-80, rectSize/2, 60);
        rect( mouseX-rectSize/4, height-80, 20, 70);
        rect( mouseX+rectSize/4 -20, height-80, 20, 70);
        
        fill(255,255,255);
        rect( mouseX-rectSize/4, height-60, 20, 5);
        rect( mouseX+rectSize/4 -20, height-60, 20, 5);
        
        // brown box
        fill(139, 69, 19);
        rect(width-80, height-80, width, height);
        
        for(int i=0; i<5; i++)
        {
          x[i] += speedX[i];
          speedY[i] = speedY[i] + gravity*0.01;
          y[i] += speedY[i];
        
        
          // if ball hits hat, change direction of Y   
          if ( y[i] > height-80 && y[i] < height-60  && x[i] >= mouseX-rectSize/2 && x[i] <= mouseX+rectSize/2 ) {
            y[i] = height-80;
            speedY[i] *= -0.8;
          }
          else if(x[i] >= width-80 && x[i] < width && y[i] > height-80)
          {
            x[i] = 0;
            y[i] = 0;
            score += 6;
          }
          else if ( y[i] >= height && x[i] < width-80){
            
            GAMEOVER = 1;
          }
        }    
  
    }
}

void mousePressed() {
  reset();
}
