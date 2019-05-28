class Lawnmower{
  float x, y, speed;
  boolean touch;
  Lawnmower(float x, float y, float speed){
    this.x=x;
    this.y=y;
    this.speed=speed;
    touch = false;
  }
  
  void display(){
    image(mower,x,y);
  }
  
  void runOver(){
    move();
    for (int i = 0; i < zombie.size(); i++){
      if (dist(x,y,zombie.get(i).x+30, zombie.get(i).y+60) < 25){
        zombie.remove(i);
      }
    }
  }
  
  void move(){
    x+=speed;
  }
  
  void trigger(){
    for (int i = 0; i < zombie.size(); i++){
      if (dist(x,y,zombie.get(i).x+30, zombie.get(i).y+60) < 25){
        touch = true;
      }
    }
  }
}