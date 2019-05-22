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
  abstract void giveSun();
  abstract void attack();
}
class peaShooter extends Plants {
  PImage green;
  int time; 
  peaShooter(int x, int y, int damage, int health) {
    super(x, y, damage, health);
    green = loadImage("peaShooter.png");
    green.resize(80, 80);
    time = (int)random(80);
  }
  void display() {
    image(green, x, y);
    //rect(x,y,10,10);
  }
  void giveSun() {
  }
  void attack(){
    if (time == 100){
   greenPea b = new greenPea(x + 60,y + 20,10);
   ammo.add(b);
   time = 0;
    }
    else{
      time +=1;
    }
  }
}
class sunFlower extends Plants {
  PImage sun;
  PImage sunlight;
  sunFlower(int x, int y, int damage, int health) {
    super(x, y, damage, health);
    sun = loadImage("sunflower.png");
    sun.resize(80, 80);
  }
  void display() {
    image(sun, x, y);
  }
  void giveSun() {
    Sunlight s = new Sunlight(x + 20 + (int)random(50), y - (int)random(50));
    light.add(s);
  }
  void attack(){
  }
}
