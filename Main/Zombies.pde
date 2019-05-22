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
   pic.resize(80,120);
  }
  
  void display(){
    if (health > 0) {
      image(pic,x,y);
    }
  }
  
  void move(){
    x-=speed;
  }
  
  void spawn(){
  }
  
  void takeDamage(){
    for (int i = 0; i < ammo.size(); i++){
      Bullet check = ammo.get(i);
      if (dist(check.x,check.y,x,y) < 20){
        health-=10;
      }
    }
  }
}