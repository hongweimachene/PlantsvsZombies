PImage image;
PImage shine;
PImage SunSeed;
PImage PeaShooterSeed;
ArrayList<Plants> plant;
ArrayList<Bullet> ammo;
ArrayList<Sunlight> light;
ArrayList<Zombies> zombie;
boolean[][] tiles;
int sunMoney;
int mode; // 0  = not holding seed // 1 = holding sunFlower
void setup() {
  tiles = new boolean[5][9];
  mode = 0;
  shine = loadImage("sunlight.png");
  shine.resize(70, 70);
  PeaShooterSeed = loadImage("peaShooterSeed.png");
  PeaShooterSeed.resize(100,70);
  SunSeed = loadImage("sunSeed.png");
  SunSeed.resize(100, 70);
  sunMoney = 0;
  plant = new ArrayList<Plants>();
  ammo = new ArrayList<Bullet>();
  light = new ArrayList<Sunlight>();
  zombie = new ArrayList<Zombies>();
  size(1000, 600);
  background(255);
  image = loadImage("back.png");
  image.resize(1380, 600);
  image(image, -180, 0);
  fill(155, 89, 182);
  line(0, 80, 1380, 80); // y = 80
  line(0, 178, 1380, 178); // y = 175
  line(0, 278, 1380, 278); // y = 278
  line(0, 378, 1380, 378); // y = 378
  line(0, 476, 1380, 476); // y = 476
  line(0, 578, 1380, 578); // y = 578

  line(30, 0, 30, 600); // x = 30
  line(140, 0, 140, 600); // x = 140
  line(240, 0, 240, 600); // x = 240
  line(350, 0, 350, 600); // x = 350
  line(450, 0, 450, 600); // x = 450
  line(555, 0, 555, 600); // x = 555
  line(660, 0, 660, 600); // x = 660
  line(760, 0, 760, 600); // x = 760
  line(865, 0, 865, 600); // x = 865
  line(975, 0, 975, 600); // x = 975
  //peaShooter t = new peaShooter(50, 90, 50, 100);
  //peaShooter p = new peaShooter(50, 290, 50, 100);
  //sunFlower s = new sunFlower(50, 190, 0, 100);

  //plant.add(t);
  //plant.add(s);
  //plant.add(p);
  spawn();
} 

void draw() {
  image(image, -180, 0);
  fill(135, 54, 0);
  rect(0, 0, 555, 80);
  image(SunSeed, 140, 0);
  image(PeaShooterSeed,240,0);
  for (Plants p : plant) {
    p.display();
    double second = (double) millis();
    if (second % 5000.0 > 0.0 && second % 5000 < 15.0) {
      p.giveSun();
    }
    p.attack();
  }
  for (int index = 0; index < light.size(); index ++) {
    light.get(index).display();
    if (light.get(index).isMouseNear(mouseX, mouseY)) {
      light.remove(index);
      sunMoney += 50;
      index --;
    }
  }
  for (Bullet b : ammo) {
    b.display();
    b.move();
  }
  textSize(50);
  fill(214, 234, 248);
  text(sunMoney, 10, 60);
  double sec = (double) millis();
  if (sec % 4500.0 > 0.0 && sec % 4500 < 15.0) {
    spawn();
  }
  for (int i = 0; i < zombie.size(); i++) {
    if (zombie.get(i).health <= 0) {
      zombie.remove(i);
    } else {
      zombie.get(i).display();
      zombie.get(i).move();
      zombie.get(i).takeDamage();
    }
  }
  if (mode == 1) {
    fill(255);
    rect(135, 0, 100, 70);
  }
}
void mouseClicked() {
  if (dist(mouseX, mouseY, 195, 30) < 40 && mode == 0) {
    mode = 1;
    return;
  }
  if (dist(mouseX, mouseY, 195, 30) < 40 && mode == 1) {
    mode = 0;
    return;
  }
  if (mouseY > 80 && mouseY < 578 && mouseX > 30 && mouseX < 975) { //is the mouse cursor on the map
    if (mouseX < 140) { // is the mouse cursor in colulm 1 
      if (mouseY > 80 && mouseY < 175 && tiles[0][0] == false) { // [0][0]
        if (mode == 1) {
          sunFlower p = new sunFlower(50, 90, 0, 100);
          plant.add(p);
          mode = 0;
          tiles[0][0] = true;
          return;
        }
      }
      if (mouseY > 175 && mouseY < 278 && tiles[1][0] == false) { // [1][0]
        if (mode == 1) {
          sunFlower p = new sunFlower(50, 190, 0, 100);
          plant.add(p);
          mode = 0;
          tiles[1][0] = true;
          return;
        }
      }
      if (mouseY > 287 && mouseY < 387 && tiles[2][0] == false) { // [2][0]
        if (mode == 1) {
          sunFlower p = new sunFlower(50, 290, 0, 100);
          plant.add(p);
          mode = 0;
          tiles[2][0] = true;
          return;
        }
      }
      if (mouseY < 476 && mouseY > 378 && tiles[3][0] == false) {// [3][0]
        //rect(0,0,100,100);
        if (mode == 1) {
          //rect(0,0,100,100);
          sunFlower p = new sunFlower(50, 390, 0, 100);
          plant.add(p);
          mode = 0;
          tiles[3][0] = true;
          return;
        }
      }
        if (mouseY < 578 && mouseY > 476 && tiles[4][0] == false) {// [4][0]
          //rect(0,0,100,100);
          if (mode == 1) {
            //rect(0,0,100,100);
            sunFlower p = new sunFlower(50, 490, 0, 100);
            plant.add(p);
            mode = 0;
            tiles[4][0] = true;
            return;
          }
        }
      }
      if (mouseX > 140 && mouseX < 240) { // is the mouse cursor in colulm 2 
      if (mouseY > 80 && mouseY < 175 && tiles[0][1] == false) { // [0][1]
        if (mode == 1) {
          sunFlower p = new sunFlower(150, 90, 0, 100);
          plant.add(p);
          mode = 0;
          tiles[0][1] = true;
          return;
        }
      }
      if (mouseY > 175 && mouseY < 278 && tiles[1][1] == false) { // [1][1]
        if (mode == 1) {
          sunFlower p = new sunFlower(150, 190, 0, 100);
          plant.add(p);
          mode = 0;
          tiles[1][1] = true;
          return;
        }
      }
      if (mouseY > 287 && mouseY < 387 && tiles[2][1] == false) { // [2][1]
        if (mode == 1) {
          sunFlower p = new sunFlower(150, 290, 0, 100);
          plant.add(p);
          mode = 0;
          tiles[2][1] = true;
          return;
        }
      }
      if (mouseY < 476 && mouseY > 378 && tiles[3][1] == false) {// [3][1]
        //rect(0,0,100,100);
        if (mode == 1) {
          //rect(0,0,100,100);
          sunFlower p = new sunFlower(150, 390, 0, 100);
          plant.add(p);
          mode = 0;
          tiles[3][1] = true;
          return;
        }
      }
        if (mouseY < 578 && mouseY > 476 && tiles[4][1] == false) {// [4][1]
          //rect(0,0,100,100);
          if (mode == 1) {
            //rect(0,0,100,100);
            sunFlower p = new sunFlower(150, 490, 0, 100);
            plant.add(p);
            mode = 0;
            tiles[4][1] = true;
            return;
          }
        }
      }
    }
  }

void spawn() {
  for (int i = 0; i < 5; i++) {
    int r = (int)random(5);
    if (r == 0) {
      Zombies z = new Zombies(950, 50, 50, 10, 1);
      zombie.add(z);
    } else if (r == 1) {
      Zombies z = new Zombies(950, 155, 50, 10, 1);
      zombie.add(z);
    } else if (r== 2) {
      Zombies z = new Zombies(950, 255, 50, 10, 1);
      zombie.add(z);
    } else if (r==3) {
      Zombies z = new Zombies(950, 353, 50, 10, 1);
      zombie.add(z);
    } else if (r==4) {
      Zombies z = new Zombies(950, 455, 50, 10, 1);
      zombie.add(z);
    }
  }
}
