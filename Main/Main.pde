PImage image;
PImage shine;
PImage SunSeed;
PImage nutSeed;
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
  //nutSeed = loadImage("wallNut Seed.png");
  //nutSeed.resize(100,70);
  shine = loadImage("sunlight.png");
  shine.resize(70, 70);
  PeaShooterSeed = loadImage("peaShooterSeed.png");
  PeaShooterSeed.resize(100, 70);
  SunSeed = loadImage("sunSeed.png");
  SunSeed.resize(100, 70);
  sunMoney = 200;
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
  //image(nutSeed,340,0);
  for (int i = 0; i < plant.size(); i++){
    if (plant.get(i).health <= 0){
      tiles[plant.get(i).fakeX][plant.get(i).fakeY] = false;
      plant.remove(i);
    }
  }
  for (Plants p : plant) {
    p.display();
    //double second = (double) millis();
    //if (second % 5000.0 > 0.0 && second % 5000 < 15.0) {
      p.giveSun();
    //}
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
  for (int i = 0; i < ammo.size(); i++){
    if (ammo.get(i).x > 1000){
      ammo.remove(i);
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
      if (!zombie.get(i).onTopOfPlant()) zombie.get(i).move();
      if (frameCount % 30 == 0) zombie.get(i).dealDamage();
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
  if (mode == 3) {
    fill(255);
    rect(335, 0, 100, 70);
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
  if (dist(mouseX, mouseY, 390, 30) < 40 && mode == 0) {
    mode = 3;
    return;
  }
  if (dist(mouseX, mouseY, 390, 30) < 40 && mode != 0) {
    mode = 0;
    return;
  }

  if (mouseY > 80 && mouseY < 578 && mouseX > 30 && mouseX < 975) { //is the mouse cursor on the map
    if (sunMoney >= 50) {
    if (mouseX < 140) { // is the mouse cursor in colulm 1 
      if (mouseY > 80 && mouseY < 175 && tiles[0][0] == false) { // [0][0]
        if (mode != 0) {
          createPlant(50, 90, 0, 100, mode,0,0);
          tiles[0][0] = true;
          return;
        }
      }
      if (mouseY > 175 && mouseY < 278 && tiles[1][0] == false) { // [1][0]
        if (mode != 0) {
          createPlant(50, 190, 0, 100, mode,1,0);
          tiles[1][0] = true;
          return;
        }
      }
      if (mouseY > 287 && mouseY < 387 && tiles[2][0] == false) { // [2][0]
        if (mode != 0) {
          createPlant(50, 290, 0, 100, mode,2,0);
          tiles[2][0] = true;
          return;
        }
      }
      if (mouseY < 476 && mouseY > 378 && tiles[3][0] == false) {// [3][0]
        //rect(0,0,100,100);
        if (mode != 0) {
          createPlant(50, 390, 0, 100, mode,3,0);
          tiles[3][0] = true;
          return;
        }
      }
      if (mouseY < 578 && mouseY > 476 && tiles[4][0] == false) {// [4][0]
        //rect(0,0,100,100);
        if (mode != 0) {
          createPlant(50, 490, 0, 100, mode,4,0);
          tiles[4][0] = true;
          return;
        }
      }
    }
    if (mouseX > 140 && mouseX < 240) { // is the mouse cursor in colulm 2 
      if (mouseY > 80 && mouseY < 175 && tiles[0][1] == false) { // [0][1]
        if (mode != 0) {
          createPlant(150, 90, 0, 100, mode,0,1);
          tiles[0][1] = true;
          return;
        }
      }
      if (mouseY > 175 && mouseY < 278 && tiles[1][1] == false) { // [1][1]
        if (mode != 0) {
          createPlant(150, 190, 0, 100, mode,1,1);
          tiles[1][1] = true;
          return;
        }
      }
      if (mouseY > 287 && mouseY < 387 && tiles[2][1] == false) { // [2][1]
        if (mode != 0) {
          createPlant(150, 290, 0, 100, mode,2,1);
          tiles[2][1] = true;
          return;
        }
      }
      if (mouseY < 476 && mouseY > 378 && tiles[3][1] == false) {// [3][1]
        //rect(0,0,00,100);
        if (mode != 0) {
          createPlant(150, 390, 0, 100, mode,3,1);
          tiles[3][1] = true;
          return;
        }
      }
      if (mouseY < 578 && mouseY > 476 && tiles[4][1] == false) {// [4][1]
        //rect(0,0,100,100);
        if (mode != 0) {
          createPlant(150, 490, 0, 100, mode,4,1);
          tiles[4][1] = true;
          return;
        }
      }
    }
    if (mouseX > 240 && mouseX < 350) { // is the mouse cursor in colulm 3 
      if (mouseY > 80 && mouseY < 175 && tiles[0][2] == false) { // [0][2]
        if (mode != 0) {
          createPlant(260, 90, 0, 100, mode,0,2);
          tiles[0][2] = true;
          return;
        }
      }
      if (mouseY > 175 && mouseY < 278 && tiles[1][2] == false) { // [1][2]
        if (mode != 0) {
          createPlant(260, 190, 0, 100, mode,1,2);
          tiles[1][2] = true;
          return;
        }
      }
      if (mouseY > 287 && mouseY < 387 && tiles[2][2] == false) { // [2][2]
        if (mode != 0) {
          createPlant(260, 290, 0, 100, mode,2,2);
          tiles[2][2] = true;
          return;
        }
      }
      if (mouseY < 476 && mouseY > 378 && tiles[3][2] == false) {// [3][2]
        //rect(0,0,00,100);
        if (mode != 0) {
          createPlant(260, 390, 0, 100, mode,3,2);
          tiles[3][2] = true;
          return;
        }
      }
      if (mouseY < 578 && mouseY > 476 && tiles[4][2] == false) {// [4][2]
        //rect(0,0,100,100);
        if (mode != 0) {
          createPlant(260, 490, 0, 100, mode,4,2);
          tiles[4][2] = true;
          return;
        }
      }
    }
    if (mouseX > 350 && mouseX < 450) { // is the mouse cursor in colulm 4 
      if (mouseY > 80 && mouseY < 175 && tiles[0][3] == false) { // [0][3]
        if (mode != 0) {
          createPlant(370, 90, 0, 100, mode,0,3);
          tiles[0][3] = true;
          return;
        }
      }
      if (mouseY > 175 && mouseY < 278 && tiles[1][3] == false) { // [1][3]
        if (mode != 0) {
          createPlant(370, 190, 0, 100, mode,1,3);
          tiles[1][3] = true;
          return;
        }
      }
      if (mouseY > 287 && mouseY < 387 && tiles[2][3] == false) { // [2][3]
        if (mode != 0) {
          createPlant(370, 290, 0, 100, mode,2,3);
          tiles[2][3] = true;
          return;
        }
      }
      if (mouseY < 476 && mouseY > 378 && tiles[3][3] == false) {// [3][3]
        //rect(0,0,00,100);
        if (mode != 0) {
          createPlant(370, 390, 0, 100, mode,3,3);
          tiles[3][3] = true;
          return;
        }
      }
      if (mouseY < 578 && mouseY > 476 && tiles[4][3] == false) {// [4][3]
        //rect(0,0,100,100);
        if (mode != 0) {
          createPlant(370, 490, 0, 100, mode,4,3);
          tiles[4][3] = true;
          return;
        }
      }
    }
    if (mouseX > 450 && mouseX < 555) { // is the mouse cursor in colulm 5 
      if (mouseY > 80 && mouseY < 175 && tiles[0][4] == false) { // [0][4]
        if (mode != 0) {
          createPlant(470, 90, 0, 100, mode,0,4);
          tiles[0][4] = true;
          return;
        }
      }
      if (mouseY > 175 && mouseY < 278 && tiles[1][4] == false) { // [1][4]
        if (mode != 0) {
          createPlant(470, 190, 0, 100, mode,1,4);
          tiles[1][4] = true;
          return;
        }
      }
      if (mouseY > 287 && mouseY < 387 && tiles[2][4] == false) { // [2][4]
        if (mode != 0) {
          createPlant(470, 290, 0, 100, mode,2,4);
          tiles[2][4] = true;
          return;
        }
      }
      if (mouseY < 476 && mouseY > 378 && tiles[3][4] == false) {// [3][4]
        //rect(0,0,00,100);
        if (mode != 0) {
          createPlant(470, 390, 0, 100, mode,3,4);
          tiles[3][4] = true;
          return;
        }
      }
      if (mouseY < 578 && mouseY > 476 && tiles[4][4] == false) {// [4][4]
        //rect(0,0,100,100);
        if (mode != 0) {
          createPlant(470, 490, 0, 100, mode,4,4);
          tiles[4][4] = true;
          return;
        }
      }
    }
    if (mouseX > 555 && mouseX < 660) { // is the mouse cursor in colulm 6 
      if (mouseY > 80 && mouseY < 175 && tiles[0][5] == false) { // [0][5]
        if (mode != 0) {
          createPlant(570, 90, 0, 100, mode,0,5);
          tiles[0][5] = true;
          return;
        }
      }
      if (mouseY > 175 && mouseY < 278 && tiles[1][5] == false) { // [1][5]
        if (mode != 0) {
          createPlant(570, 190, 0, 100, mode,1,5);
          tiles[1][5] = true;
          return;
        }
      }
      if (mouseY > 287 && mouseY < 387 && tiles[2][5] == false) { // [2][5]
        if (mode != 0) {
          createPlant(570, 290, 0, 100, mode,2,5);
          tiles[2][5] = true;
          return;
        }
      }
      if (mouseY < 476 && mouseY > 378 && tiles[3][5] == false) {// [3][5]
        //rect(0,0,00,100);
        if (mode != 0) {
          createPlant(570, 390, 0, 100, mode,3,5);
          tiles[3][5] = true;
          return;
        }
      }
      if (mouseY < 578 && mouseY > 476 && tiles[4][5] == false) {// [4][5]
        //rect(0,0,100,100);
        if (mode != 0) {
          createPlant(570, 490, 0, 100, mode,4,5);
          tiles[4][5] = true;
          return;
        }
      }
    }
    if (mouseX > 660 && mouseX < 760) { // is the mouse cursor in colulm 7 
      if (mouseY > 80 && mouseY < 175 && tiles[0][6] == false) { // [0][6]
        if (mode != 0) {
          createPlant(670, 90, 0, 100, mode,0,6);
          tiles[0][6] = true;
          return;
        }
      }
      if (mouseY > 175 && mouseY < 278 && tiles[1][6] == false) { // [1][6]
        if (mode != 0) {
          createPlant(670, 190, 0, 100, mode,1,6);
          tiles[1][6] = true;
          return;
        }
      }
      if (mouseY > 287 && mouseY < 387 && tiles[2][6] == false) { // [2][6]
        if (mode != 0) {
          createPlant(670, 290, 0, 100, mode,2,6);
          tiles[2][6] = true;
          return;
        }
      }
      if (mouseY < 476 && mouseY > 378 && tiles[3][6] == false) {// [3][6]
        //rect(0,0,00,100);
        if (mode != 0) {
          createPlant(670, 390, 0, 100, mode,3,6);
          tiles[3][6] = true;
          return;
        }
      }
      if (mouseY < 578 && mouseY > 476 && tiles[4][6] == false) {// [4][6]
        //rect(0,0,100,100);
        if (mode != 0) {
          createPlant(670, 490, 0, 100, mode,4,6);
          tiles[4][6] = true;
          return;
        }
      }
    }
    if (mouseX > 760 && mouseX < 865) { // is the mouse cursor in colulm 8 
      if (mouseY > 80 && mouseY < 175 && tiles[0][7] == false) { // [0][7]
        if (mode != 0) {
          createPlant(770, 90, 0, 100, mode,0,7);
          tiles[0][7] = true;
          return;
        }
      }
      if (mouseY > 175 && mouseY < 278 && tiles[1][7] == false) { // [1][7]
        if (mode != 0) {
          createPlant(770, 190, 0, 100, mode,1,7);
          tiles[1][7] = true;
          return;
        }
      }
      if (mouseY > 287 && mouseY < 387 && tiles[2][7] == false) { // [2][7]
        if (mode != 0) {
          createPlant(770, 290, 0, 100, mode,2,7);
          tiles[2][7] = true;
          return;
        }
      }
      if (mouseY < 476 && mouseY > 378 && tiles[3][7] == false) {// [3][7]
        //rect(0,0,00,100);
        if (mode != 0) {
          createPlant(770, 390, 0, 100, mode,3,7);
          tiles[3][7] = true;
          return;
        }
      }
      if (mouseY < 578 && mouseY > 476 && tiles[4][7] == false) {// [4][7]
        //rect(0,0,100,100);
        if (mode != 0) {
          createPlant(770, 490, 0, 100, mode,4,7);
          tiles[4][7] = true;
          return;
        }
      }
    }
    if (mouseX > 865 && mouseX < 975) { // is the mouse cursor in colulm 9 
      if (mouseY > 80 && mouseY < 175 && tiles[0][8] == false) { // [0][8]
        if (mode != 0) {
          createPlant(885, 90, 0, 100, mode,0,8);
          tiles[0][8] = true;
          return;
        }
      }
      if (mouseY > 175 && mouseY < 278 && tiles[1][8] == false) { // [1][8]
        if (mode != 0) {
          createPlant(885, 190, 0, 100, mode,1,8);
          tiles[1][8] = true;
          return;
        }
      }
      if (mouseY > 287 && mouseY < 387 && tiles[2][8] == false) { // [2][8]
        if (mode != 0) {
          createPlant(885, 290, 0, 100, mode,2,8);
          tiles[2][8] = true;
          return;
        }
      }
      if (mouseY < 476 && mouseY > 378 && tiles[3][8] == false) {// [3][8]
        //rect(0,0,00,100);
        if (mode != 0) {
          createPlant(885, 390, 0, 100, mode,3,8);
          tiles[3][8] = true;
          return;
        }
      }
      if (mouseY < 578 && mouseY > 476 && tiles[4][8] == false) {// [4][8]
        //rect(0,0,100,100);
        if (mode != 0) {
          createPlant(885, 490, 0, 100, mode,4,8);
          tiles[4][8] = true;
          return;
        }
      }
    }
  }
  }
}
void createPlant(int x, int y, int damage, int health, int type, int fakeX, int fakeY) { // 1: sunflower 2: peashooter
  if (type == 1 && sunMoney >= 50) {
    sunMoney -= 50;
    sunFlower b = new sunFlower (x, y, damage, health,fakeX,fakeY);
    plant.add(b);
    mode = 0;
    return;
  }
  if (type == 2 && sunMoney >= 100) {
    sunMoney -= 100;
    peaShooter b = new peaShooter (x, y, damage, health,fakeX, fakeY);
    plant.add(b);
    mode = 0;
    return;
  }
  //if (type == 3){ //&& sunMoney >= 50) {
  //  sunMoney -= 50;
  //  wallNut b = new wallNut (x, y, damage, 1000,fakeX, fakeY);
  //  plant.add(b);
  //  mode = 0;
  //  return;
  //}
}
 void spawn1(){
   int s = millis();
   if (s % (int)random(800,2001) == 0){
     Zombies z = new Zombies(950, 50, 50, 10, 1);
     zombie.add(z);
   }
 }
 void spawn2(){
   int s = millis();
   if (s % (int)random(1000, 2001) == 0){
     Zombies z = new Zombies(950, 155, 50, 10, 1);
     zombie.add(z);
   }
 }
 void spawn3(){
   int s = millis();
   if (s % (int)random(1000,2001) == 0){
     Zombies z = new Zombies(950, 255, 50, 10, 1);
     zombie.add(z);
   }
 }
 void spawn4(){
   int s = millis();
   if (s % (int)random(1000,2001) == 0){
     Zombies z = new Zombies(950, 353, 50, 10, 1);
     zombie.add(z);
   }
 }
 void spawn5(){
   int s = millis();
   if (s % (int)random(1000,2001) == 0){
     Zombies z = new Zombies(950, 455, 50, 10, 1);
     zombie.add(z);
   }
 }
