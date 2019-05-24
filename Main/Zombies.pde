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
  
  boolean onTopOfPlant(){
    for (Plants i: plant){
      if (dist(i.x,i.y,x,y+4) < 10){
        return true;
      }
    }
    return false;
  }
  
  boolean isNextToPlant(Plants i){
    if (dist(i.x,i.y,this.x,this.y+40) < 10){
       return true;
    }
    return false;
  }
  
  void dealDamage(){
    for (int i = 0; i < plant.size(); i++){
      if (isNextToPlant(plant.get(i))){
        plant.get(i).takeDamage(10);
      }
    }
  }
}
