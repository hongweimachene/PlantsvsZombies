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
      image(picZomb,x,y);
      textSize(20);
      text(health,x-10,y-10);
      text("y",x,y);
  }
  
  void move(){
    x-=speed;
  }
 
  
  void takeDamage(){
    for (int i = 0; i < ammo.size(); i++){
      Bullet check = ammo.get(i);
      if (dist(check.x,check.y,x,y+40) < 25){
        ammo.remove(i);
        health-=10;
      }
    }
  }
}