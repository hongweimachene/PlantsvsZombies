class Zombies{
  int x,y,health,damage,speed;
  PImage pic;
  
  Zombies(int x, int y, int health, int damage, int speed) {
   this.x = x;
   this.y = y;
   this.health = health;
   this.damage = damage;
   this.speed = speed; 
  }
  
  void display(){
    rect(x,y,50,100);
  }
  
  void move(){
    x+=speed;
  }
}
