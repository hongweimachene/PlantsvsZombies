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
  peaShooter(int x, int y, int damage, int health) {
    super(x, y, damage, health);
    green = loadImage("peaShooter.png");
    green.resize(80, 80);
  }
  void display() {
    image(green, x, y);
    //rect(x,y,10,10);
  }
  void giveSun() {
  }
  void attack(){
   greenPea b = new greenPea(x + 30,y + 20,10);
   ammo.add(b);
  }
}
class sunFlower extends Plants {
  PImage sun;
  PImage sunlight;
  sunFlower(int x, int y, int damage, int health) {
    super(x, y, damage, health);
    sun = loadImage("sunflower.png");
    sun.resize(80, 80);
    sunlight = loadImage("sunlight.png");
    sunlight.resize(50, 50);
  }
  void display() {
    image(sun, x, y);
  }
  void giveSun() {
    image(sunlight, x + random(50) + 20, y - random(50));
  }
  void attack(){
  }
}
