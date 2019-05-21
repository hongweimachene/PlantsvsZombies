class Zombies{
  int x,y,health,damage,speed;
  PImage pic;
  
  Zombies(int x, int y, int health, int damage, int speed) {
   this.x = x;
   this.y = y;
   this.health = health;
   this.damage = damage;
   this.speed = speed; 
   pic = loadImage("zombie.png");
   pic.resize(80,80);
  }
  
  void display(){
    image(pic,x,y);
  }
  
  void move(){
    x+=speed;
  }
}