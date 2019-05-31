abstract class Plants {
  int x, y, damage, health, fakeX, fakeY;
  PImage pic;
  Plants(int x, int y, int damage, int health, int fakeX, int fakeY) {
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
    super(x, y, damage, health, fakeX, fakeY);
    green = loadImage("peaShooter.png");
    green.resize(80, 80);
    time = (int)random(80);
  }
  void display() {
    //textSize(40);
    fill(255);
    //text(fakeX,x + 20,y - 30);
    image(green, x, y);
    
    //rect(x,y,10,10);
  }
  void attack() {
    if (time > 100 && isZombie(fakeX)){
      greenPea b = new greenPea(x + 60, y + 20, 10);
      ammo.add(b);
      time = 0;
    } //else if (time == 100 && isZombie(fakeY) == false){
    //}
    else {
      time += 1;
    }
  }
  boolean isZombie(int y) {
    for (int index = 0; index < zombie.size(); index ++) {
      if (y == 0 && zombie.get(index).y == 50.0) {
        return true;
      }
      if (y == 1 && zombie.get(index).y == 155.0) {
        return true;
      }
      if (y == 2 && zombie.get(index).y == 255.0) {
        return true;
      }
      if (y == 3 && zombie.get(index).y == 353.0) {
        return true;
      }
      if (y == 4 && zombie.get(index).y == 455.0) {
        return true;
      }
    }
    return false;
  }
  void giveSun() {
  }
}
class sunFlower extends Plants {
  PImage sun;
  PImage sunlight;
  int time; 
  sunFlower(int x, int y, int damage, int health, int fakeX, int fakeY) {
    super(x, y, damage, health, fakeX, fakeY);
    sun = loadImage("sunflower.png");
    sun.resize(80, 80);
    time = 0;
  }
  void display() {
    textSize(20);
    fill(255);
    text(health, x+ 10, y-10 );
    image(sun, x, y);
  }
  void giveSun() {
    if (time == 500) {
      Sunlight s = new Sunlight(x + 40 + (int)random(30), y - (int)random(50) - 10, false);
      light.add(s);
      time = 0;
    }
    time ++;
  }
  void attack() {
  }
}
class wallNut extends Plants {
  PImage nut;
  wallNut(int x, int y, int damage, int health, int fakeX, int fakeY) {
    super (x, y, damage, health, fakeX, fakeY);
    nut = loadImage("wallNut.png");
    nut.resize(80, 80);
  }
  void display() {
    image(nut, x, y);
  }
  void giveSun() {
    return;
  }
  void attack() {
    return;
  }
}
