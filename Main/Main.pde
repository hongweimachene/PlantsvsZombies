PImage image;
PImage shine;
PImage SunSeed;
PImage PeaShooterSeed;
PImage picZomb;
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
  PeaShooterSeed.resize(100, 70);
  SunSeed = loadImage("sunSeed.png");
  SunSeed.resize(100, 70);
  sunMoney = 0;
  plant = new ArrayList<Plants>();
  ammo = new ArrayList<Bullet>();
  light = new ArrayList<Sunlight>();
  zombie = new ArrayList<Zombies>();
  size(1000, 600);
  background(255);
  picZomb = loadImage("zombie.png");
  picZomb.resize(80,120);
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
} 

void draw() {
  image(image, -180, 0);
  fill(135, 54, 0);
  rect(0, 0, 555, 80);
  image(SunSeed, 140, 0);
  image(PeaShooterSeed, 240, 0);
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
  spawn1();
  spawn2();
  spawn3();
  spawn4();
  spawn5();
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
  if (mode == 2) {
    fill(255);
    rect(235, 0, 100, 70);
  }
}
void mouseClicked() {
  if (dist(mouseX, mouseY, 195, 30) < 40 && mode == 0) {
    mode = 1;
    return;
  }
  if (dist(mouseX, mouseY, 195, 30) < 40 && mode != 0) {
    mode = 0;
    return;
  }
  if (dist(mouseX, mouseY, 290, 30) < 40 && mode == 0) {
    mode = 2;
    return;
  }
  if (dist(mouseX, mouseY, 290, 30) < 40 && mode != 0) {
    mode = 0;
    return;
  }

  if (mouseY > 80 && mouseY < 578 && mouseX > 30 && mouseX < 975) { //is the mouse cursor on the map
    if (mouseX < 140) { // is the mouse cursor in colulm 1 
      if (mouseY > 80 && mouseY < 175 && tiles[0][0] == false) { // [0][0]
        if (mode == 1) {
          createPlant(50, 90, 0, 100, 1);
          tiles[0][0] = true;
          return;
        }
        if (mode == 2) {
          createPlant(50, 90, 0, 100, 2);
          tiles[0][0] = true;
          return;
        }
      }
      if (mouseY > 175 && mouseY < 278 && tiles[1][0] == false) { // [1][0]
        if (mode == 1) {
          createPlant(50, 190, 0, 100, 1);
          tiles[1][0] = true;
          return;
        }
        if (mode == 2) {
          createPlant(50, 190, 0, 100, 2);
          tiles[1][0] = true;
          return;
        }
      }
      if (mouseY > 287 && mouseY < 387 && tiles[2][0] == false) { // [2][0]
        if (mode == 1) {
          createPlant(50, 290, 0, 100, 1);
          tiles[2][0] = true;
          return;
        }
        if (mode == 2) {
          createPlant(50, 290, 0, 100, 2);
          tiles[2][0] = true;
          return;
        }
      }
      if (mouseY < 476 && mouseY > 378 && tiles[3][0] == false) {// [3][0]
        //rect(0,0,100,100);
        if (mode == 1) {
          createPlant(50, 390, 0, 100, 1);
          tiles[3][0] = true;
          return;
        }
        if (mode == 2) {
          createPlant(50, 390, 0, 100, 2);
          tiles[3][0] = true;
          return;
        }
      }
      if (mouseY < 578 && mouseY > 476 && tiles[4][0] == false) {// [4][0]
        //rect(0,0,100,100);
        if (mode == 1) {
          createPlant(50, 490, 0, 100, 1);
          tiles[4][0] = true;
          return;
        }
        if (mode == 2) {
          createPlant(50, 490, 0, 100, 2);
          tiles[4][0] = true;
          return;
        }
      }
    }
    if (mouseX > 140 && mouseX < 240) { // is the mouse cursor in colulm 2 
      if (mouseY > 80 && mouseY < 175 && tiles[0][1] == false) { // [0][1]
        if (mode == 1) {
          createPlant(150, 90, 0, 100, 1);
          tiles[0][1] = true;
          return;
        }
        if (mode == 2) {
          createPlant(150, 90, 0, 100, 2);
          tiles[0][1] = true;
          return;
        }
      }
      if (mouseY > 175 && mouseY < 278 && tiles[1][1] == false) { // [1][1]
        if (mode == 1) {
          createPlant(150, 190, 0, 100, 1);
          tiles[1][1] = true;
          return;
        }
        if (mode == 2) {
          createPlant(150, 190, 0, 100, 2);
          tiles[1][1] = true;
          return;
        }
      }
      if (mouseY > 287 && mouseY < 387 && tiles[2][1] == false) { // [2][1]
        if (mode == 1) {
          createPlant(150, 290, 0, 100, 1);
          tiles[2][1] = true;
          return;
        }
        if (mode == 2) {
          createPlant(150, 290, 0, 100, 2);
          tiles[2][1] = true;
          return;
        }
      }
      if (mouseY < 476 && mouseY > 378 && tiles[3][1] == false) {// [3][1]
        //rect(0,0,00,100);
        if (mode == 1) {
          createPlant(150, 390, 0, 100, 1);
          tiles[3][1] = true;
          return;
        }
        if (mode == 2) {
          createPlant(150, 390, 0, 100, 2);
          tiles[3][1] = true;
          return;
        }
      }
      if (mouseY < 578 && mouseY > 476 && tiles[4][1] == false) {// [4][1]
        //rect(0,0,100,100);
        if (mode == 1) {
          createPlant(150, 490, 0, 100, 1);
          tiles[4][1] = true;
          return;
        }
        if (mode == 2) {
          createPlant(150, 490, 0, 100, 2);
          tiles[4][1] = true;
          return;
        }
      }
    }
    if (mouseX > 240 && mouseX < 350) { // is the mouse cursor in colulm 3 
      if (mouseY > 80 && mouseY < 175 && tiles[0][2] == false) { // [0][2]
        if (mode == 1) {
          createPlant(250, 90, 0, 100, 1);
          tiles[0][2] = true;
          return;
        }
        if (mode == 2) {
          createPlant(250, 90, 0, 100, 2);
          tiles[0][2] = true;
          return;
        }
      }
      if (mouseY > 175 && mouseY < 278 && tiles[1][2] == false) { // [1][2]
        if (mode == 1) {
          createPlant(250, 190, 0, 100, 1);
          tiles[1][2] = true;
          return;
        }
        if (mode == 2) {
          createPlant(250, 190, 0, 100, 2);
          tiles[1][2] = true;
          return;
        }
      }
      if (mouseY > 287 && mouseY < 387 && tiles[2][2] == false) { // [2][2]
        if (mode == 1) {
          createPlant(250, 290, 0, 100, 1);
          tiles[2][2] = true;
          return;
        }
        if (mode == 2) {
          createPlant(250, 290, 0, 100, 2);
          tiles[2][2] = true;
          return;
        }
      }
      if (mouseY < 476 && mouseY > 378 && tiles[3][1] == false) {// [3][2]
        //rect(0,0,00,100);
        if (mode == 1) {
          createPlant(250, 390, 0, 100, 1);
          tiles[3][2] = true;
          return;
        }
        if (mode == 2) {
          createPlant(250, 390, 0, 100, 2);
          tiles[3][2] = true;
          return;
        }
      }
      if (mouseY < 578 && mouseY > 476 && tiles[4][2] == false) {// [4][2]
        //rect(0,0,100,100);
        if (mode == 1) {
          createPlant(250, 490, 0, 100, 1);
          tiles[4][2] = true;
          return;
        }
        if (mode == 2) {
          createPlant(250, 490, 0, 100, 2);
          tiles[4][2] = true;
          return;
        }
      }
    }
    if (mouseX > 350 && mouseX < 450) { // is the mouse cursor in colulm 4 
      if (mouseY > 80 && mouseY < 175 && tiles[0][3] == false) { // [0][3]
        if (mode == 1) {
          createPlant(370, 90, 0, 100, 1);
          tiles[0][3] = true;
          return;
        }
        if (mode == 2) {
          createPlant(370, 90, 0, 100, 2);
          tiles[0][3] = true;
          return;
        }
      }
      if (mouseY > 175 && mouseY < 278 && tiles[1][3] == false) { // [1][3]
        if (mode == 1) {
          createPlant(370, 190, 0, 100, 1);
          tiles[1][3] = true;
          return;
        }
        if (mode == 2) {
          createPlant(370, 190, 0, 100, 2);
          tiles[1][3] = true;
          return;
        }
      }
      if (mouseY > 287 && mouseY < 387 && tiles[2][3] == false) { // [2][3]
        if (mode == 1) {
          createPlant(370, 290, 0, 100, 1);
          tiles[2][3] = true;
          return;
        }
        if (mode == 2) {
          createPlant(370, 290, 0, 100, 2);
          tiles[2][3] = true;
          return;
        }
      }
      if (mouseY < 476 && mouseY > 378 && tiles[3][3] == false) {// [3][3]
        //rect(0,0,00,100);
        if (mode == 1) {
          createPlant(370, 390, 0, 100, 1);
          tiles[3][3] = true;
          return;
        }
        if (mode == 2) {
          createPlant(370, 390, 0, 100, 2);
          tiles[3][3] = true;
          return;
        }
      }
      if (mouseY < 578 && mouseY > 476 && tiles[4][3] == false) {// [4][3]
        //rect(0,0,100,100);
        if (mode == 1) {
          createPlant(370, 490, 0, 100, 1);
          tiles[4][3] = true;
          return;
        }
        if (mode == 2) {
          createPlant(370, 490, 0, 100, 2);
          tiles[4][3] = true;
          return;
        }
      }
    }
  }
}
void createPlant(int x, int y, int damage, int health, int type) { // 1: sunflower 2: peashooter
  if (type == 1) {
    sunFlower b = new sunFlower (x, y, damage, health);
    plant.add(b);
    mode = 0;
    return;
  }
  if (type == 2) {
    peaShooter b = new peaShooter (x, y, damage, health);
    plant.add(b);
    mode = 0;
    return;
  }
}
 void spawn1(){
   int s = millis();
   if (s % (int)random(1000,2001) == 0){
     Zombies z = new Zombies(950, 50, 50, 10, 1);
     zombie.add(z);
   }
 }
 void spawn2(){
   int s = millis();
   if (s % (int)random(800, 1001) == 0){
     Zombies z = new Zombies(950, 155, 50, 10, 1);
     zombie.add(z);
   }
 }
 void spawn3(){
   int s = millis();
   if (s % (int)random(800,1001) == 0){
     Zombies z = new Zombies(950, 255, 50, 10, 1);
     zombie.add(z);
   }
 }
 void spawn4(){
   int s = millis();
   if (s % (int)random(8000,1001) == 0){
     Zombies z = new Zombies(950, 353, 50, 10, 1);
     zombie.add(z);
   }
 }
 void spawn5(){
   int s = millis();
   if (s % (int)random(800,1001) == 0){
     Zombies z = new Zombies(950, 455, 50, 10, 1);
     zombie.add(z);
   }
 }
