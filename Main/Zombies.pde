class Zombies{
  int health,damage;
  PImage pic;
  float x, y, speed;
  
  Zombies(float x, float y, int health, int damage, float speed) {
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
      text("box",x+20,y+60);
  }
  
  void move(){
    x-=speed;
  }
 
  
  void takeDamage(){
    for (int i = 0; i < ammo.size(); i++){
      Bullet check = ammo.get(i);
      if (dist(check.x,check.y,x+30,y+60) < 25){
        ammo.remove(i);
        health-=10;
      }
    }
  }
  
  boolean onTopOfPlant(){
    for (Plants i: plant){
      if (dist(i.x,i.y,x,y+40) < 20){
        return true;
      }
    }
    return false;
  }
  
  boolean isNextToPlant(Plants i){
    if (dist(i.x,i.y,this.x,this.y+40) < 20){
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