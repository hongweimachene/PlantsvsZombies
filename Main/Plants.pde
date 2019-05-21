abstract class Plants {
  int x, y, damage, health;
  PImage pic;
  Plants(int x, int y, int damage, int health) {
    this.x=x;
    this.y=y;
    this.damage=damage;
    this.health=health;
  }
  int takeDamage(int hurt) {
    health -= hurt;
    return health;
  }
  abstract void display();
}
class peaShooter extends Plants{
   PImage green;
  peaShooter(int x, int y, int damage, int health){
    super(x,y,damage,health);
    green = loadImage("peaShooter.png");
    green.resize(100,100);
  }
  void display(){
    image(green,x,y);
  } 
}
