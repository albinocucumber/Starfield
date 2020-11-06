class Particle{
  float myX, myY;
  double speed, myAngle, distance;
  int myColor, mySize;
  Particle(){
    myX = (float)((Math.random() * 50) + 375);
    myY = (float)((Math.random() * 50) + 375);
    mySize = (int)(Math.random() * 4 + 1);
    distance = dist(250, 250, myX, myY);
    myAngle = Math.random() * TWO_PI;
    myColor = color((int)(Math.random()* 255 + 150),(int)(Math.random()* 255 + 150), (int)(Math.random()* 255 + 150));
  }
  void move(){
    if((myX > 800 || myX < 0) || (myY > 800 || myY < 0)){
      myX = (float)((Math.random() * 50) + 375);
      myY = (float)((Math.random() * 50) + 375);
    }
    if(mousePressed && mouseButton == LEFT){
      speed = distance/10;
    } else if(mousePressed && mouseButton == RIGHT){
      speed = distance/50;
    } else {
      speed = distance/20;
    }
    myX += speed * Math.cos(myAngle);
    myY += speed * Math.sin(myAngle);
  }
  void show(){
    stroke(myColor);
    fill(myColor);
    ellipse(myX, myY, mySize, mySize);
  }
}

class OddballParticle extends Particle{
  void OddBallParticle(){
  }
  void move(){
    if((myX > 800 || myX < 0) || (myY > 800 || myY < 0)){
      myX = (float)((Math.random() * 50) + 375);
      myY = (float)((Math.random() * 50) + 375);
    }
    speed = distance/50;
    myX += speed * Math.cos(myAngle);
    myY += speed * Math.sin(myAngle);
  }
  void show(){
    mySize = (int)(Math.random() * 25 + 25);
    myColor = color((int)(Math.random()* 100 + 50),(int)(Math.random()* 100 + 50), (int)(Math.random()* 100 + 50));;
    stroke(myColor);
    fill(myColor);
    ellipse(myX, myY, mySize, mySize);
  }
}

Particle [] quantum = new Particle[5000];
void setup(){
  size(800, 800);
  background(0);
  for(int i = 0; i < quantum.length; i++){
    quantum[i] = new Particle();
  }
  for(int i = 0; i < 8; i++){
    quantum[i] = new OddballParticle();
  }
}
void draw(){
  background(0);
  for(int i = 0; i < quantum.length; i++){
    quantum[i].move();
    quantum[i].show();
  }
}
void keyPressed(){
  if(keyPressed && key == 'p'){
    noLoop();
  }
  if(keyPressed && key == 'r'){
    loop();
  }
  if(keyPressed && key == 'c'){
    setup();
  } 
}
