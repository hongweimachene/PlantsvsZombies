abstract class Plants {
  int x, y, damage, health,fakeX,fakeY;
  PImage pic;
  Plants(int x, int y, int damage, int health,int fakeX, int fakeY) {
    this.x=x;
    this.y=y;
    this.damage=damage;
    this.health=health;
    this.fakeX = fakeX;
    this.fakeY = fakeY;
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
  peaShooter(int x, int y, int damage, int health, int fakeX, int fakeY) {
    super(x, y, damage, health,fakeX,fakeY);
    green = loadImage("peaShooter.png");
    green.resize(80, 80);
    time = (int)random(80);
  }
  void display() {
    textSize(20);
    fill(255);
    text(health, x+ 10, y -10 );
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
  sunFlower(int x, int y, int damage, int health,int fakeX, int fakeY) {
    super(x, y, damage, health,fakeX,fakeY);
    sun = loadImage("sunflower.png");
    sun.resize(80, 80);
  }
  void display() {
    textSize(20);
    fill(255);
    text(health, x+ 10, y-10 );
    image(sun, x, y);
  }
  void giveSun() {
    Sunlight s = new Sunlight(x + 40 + (int)random(30), y - (int)random(50) - 10);
    light.add(s);
  }
  void attack(){
  }
}