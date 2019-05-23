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
      image(pic,x,y);
      textSize(20);
      text(health,x-10,y-10);
      text("y",x,y);
  }
  
  void move(){
    x-=speed;
  }
  
  void spawn(){
    for (int i = 0; i < 8; i++){
      int r = (int)random(5);
      if (r == 0){
        Zombies z = new Zombies(950,50,50,10,1);
      } else if (r == 1){
        Zombies z = new Zombies(950,205,50,10,1);
      } else if (r== 2){
        Zombies z = new Zombies(950,305,50,10,1);
      } else if (r==3){
        Zombies z = new Zombies(950,403,50,10,1);
      } else if (r==4){
        Zombies z = new Zombies(950,505,50,10,1);
      }
      //zombie.add(z);
    }
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
