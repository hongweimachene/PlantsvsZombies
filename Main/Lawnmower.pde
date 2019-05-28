class Lawnmower{
  float x, y, speed;
  Lawnmower(float x, float y, float speed){
    this.x=x;
    this.y=y;
    this.speed=speed;
  }
  
  void display(){
  }
  
  void runOver(){
    for (int i = 0; i < zombie.size(); i++){
      if (dist(x,y,zombie.get(i).x+30, zombie.get(i).y+60) < 25){
        zombie.remove(i);
      }
    }
  }
}
