PImage image;
PImage shine;
PImage SunSeed;
PImage nutSeed;
PImage PeaShooterSeed;
PImage picZomb;
PImage shovel;
PImage mower;
PImage end;
PImage buckethead;
ArrayList<Plants> plant;
ArrayList<Bullet> ammo;
ArrayList<Sunlight> light;
ArrayList<Zombies> zombie;
ArrayList<Lawnmower> lawnmow; 
boolean[][] tiles;
boolean divis;
int screen; // 0 = game // 1 = end screen 
int zombiesKilled;
int wave;
int sunMoney; // currency 
int sunTime; // time between sunflower light 
int sunFall; // time for sunlight from the sky 
int mode; // -1 = shovel / 0  = not holding seed / 1 = holding sunFlower / 2 = holding peaShooter / 3 = holding walnut 
void setup() {
  screen = 0;
  tiles = new boolean[5][9];
  divis = false; 
  mode = 0;
  sunTime = 0;
  sunFall = 50;
  end = loadImage("endScreen.png");
  end.resize(1000,600);
  shovel = loadImage("dig.png");
  shovel.resize(70, 70);
  nutSeed = loadImage("wallNutSeed.png");
  nutSeed.resize(100, 70);
  buckethead = loadImage("bucket.png");
  buckethead.resize(100,160);
  zombiesKilled = 0; 
  wave = 0;
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
  lawnmow = new ArrayList<Lawnmower>(); 
  size(1000, 600);
  background(255);
  picZomb = loadImage("zombie.png");
  picZomb.resize(80, 120);
  image = loadImage("back.png");
  image.resize(1380, 600);
  mower = loadImage("lawnmower.png");
  mower.resize(120, 120); 
  image(image, -180, 0);
  fill(155, 89, 182);
  //line(0, 80, 1380, 80); // y = 80
  //line(0, 178, 1380, 178); // y = 175
  //line(0, 278, 1380, 278); // y = 278
  //line(0, 378, 1380, 378); // y = 378
  //line(0, 476, 1380, 476); // y = 476
  //line(0, 578, 1380, 578); // y = 578

  //line(30, 0, 30, 600); // x = 30
  //line(140, 0, 140, 600); // x = 140
  //line(240, 0, 240, 600); // x = 240
  //line(350, 0, 350, 600); // x = 350
  //line(450, 0, 450, 600); // x = 450
  //line(555, 0, 555, 600); // x = 555
  //line(660, 0, 660, 600); // x = 660
  //line(760, 0, 760, 600); // x = 760
  //line(865, 0, 865, 600); // x = 865
  //line(975, 0, 975, 600); // x = 975
  spawnMower();
  //peaShooter t = new peaShooter(50, 90, 50, 100);
  //peaShooter p = new peaShooter(50, 290, 50, 100);
  //sunFlower s = new sunFlower(50, 190, 0, 100);

  //plant.add(t);
  //plant.add(s);
  //plant.add(p);
} 

void draw() {
  if (screen == 0){
  sunTime += 1;
  sunFall += 1;
  if (sunFall == 500){
    Sunlight s = new Sunlight((int)random(900),0,true);
    light.add(s);
    sunFall = 0;
  }
  image(image, -180, 0);
  fill(135, 54, 0);
  rect(0, 0, 555, 80);
  image(SunSeed, 140, 0);
  image(PeaShooterSeed, 240, 0);
  //if (zombiesKilled > 0 && zombiesKilled % 20 == 0){
  //  wave++;
  //}
  image(nutSeed, 340, 0);
  image(shovel, 440, 0);
  for (int i = 0; i < plant.size(); i++) {
    if (plant.get(i).health <= 0) {
      tiles[plant.get(i).fakeX][plant.get(i).fakeY] = false;
      plant.remove(i);
    }
  }
  for (int i = 0; i < lawnmow.size(); i++) {
    if (lawnmow.get(i).x > 1000) {
      lawnmow.remove(i);
      i--;
    } else {
      lawnmow.get(i).display();
      if (lawnmow.get(i).touch == true) {
        lawnmow.get(i).runOver();
      }
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
    if (light.get(index).sky){
      light.get(index).y += 1;
    }
    if (light.get(index).y > light.get(index).floor){
      light.get(index).sky = false;
      //light.remove(index);
      //index --;
    }
    if (light.get(index).isMouseNear(mouseX, mouseY)) {
      light.remove(index);
      sunMoney += 50;
      index --;
    }
  }
  for (int i = 0; i < ammo.size(); i++) {
    if (ammo.get(i).x > 1000) {
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
    if (zombie.get(i).x + 45 < 0) {
      //screen = 1;
    } else if (zombie.get(i).health <= 0) {
      zombie.remove(i);
      i --;
      zombiesKilled++;
    } else {
      zombie.get(i).display();
      if (frameCount % 30 == 0) zombie.get(i).speed = random(.5,2.1); 
      if (!zombie.get(i).onTopOfPlant()) zombie.get(i).move();
      if (frameCount % 50 == 0) zombie.get(i).dealDamage();
      zombie.get(i).takeDamage();
      zombie.get(i).trigger(); 
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
  if (mode == -1) {
    fill(255);
    rect(435, 0, 70, 70);
  }
  fill(214, 234, 248);
  rect(700, 0, 300, 50);
  fill(0);
  textSize(20); 
  text("Zombies Killed: " + zombiesKilled, 710, 20);
  text("Wave: " + wave, 710, 45);
  }
  if (screen == 1){
    image(end,0,0);
    //fill (255);
    //rect(350, 378, 300, 100);
    textSize(50);
    fill (255,0,0);
    text("Click to try again", 300, 450);
    if (mousePressed && dist(550,500,mouseX,mouseY) < 100){
      screen = 0;
      setup();
    }
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
  if (dist(mouseX, mouseY, 490, 30) < 40 && mode == 0) {
    mode = -1;
    return;
  }
  if (dist(mouseX, mouseY, 490, 30) < 40 && mode != 0) {
    mode = 0;
    return;
  }

  if (mouseY > 80 && mouseY < 578 && mouseX > 30 && mouseX < 975) { //is the mouse cursor on the map
    if (mouseX < 140) { // is the mouse cursor in colulm 1 
      if (mouseY > 80 && mouseY < 175) { // [0][0]
        if (mode == -1) {
          digUp(50, 90);
          mode = 0;
          return;
        } else if (mode != 0 && tiles[0][0] == false) {
          if (createPlant(50, 90, 0, 100, mode, 0, 0)) {
            tiles[0][0] = true;
            return;
          }
        }
      }
      if (mouseY > 175 && mouseY < 278) { // [1][0]
        if (mode == -1) {
          digUp(50, 190);
          mode = 0;
          return;
        } else if (mode != 0 && tiles[1][0] == false) {
          if (createPlant(50, 190, 0, 100, mode, 1, 0)) {
            tiles[1][0] = true;
            return;
          }
        }
      }
      if (mouseY > 287 && mouseY < 387) { // [2][0]
        if (mode == -1) {
          digUp(50, 290);
          mode = 0;
          return;
        } else if (mode != 0 && tiles[2][0] == false) {
          if (createPlant(50, 290, 0, 100, mode, 2, 0)) {
            tiles[2][0] = true;
            return;
          }
        }
      }
      if (mouseY < 476 && mouseY > 378) {// [3][0]
        if (mode == -1) {
          digUp(50, 390);
          mode = 0;
          return;
        } else if (mode != 0 && tiles[3][0] == false) {
          if (createPlant(50, 390, 0, 100, mode, 3, 0)) {
            ;
            tiles[3][0] = true;
            return;
          }
        }
      }
      if (mouseY < 578 && mouseY > 476) {// [4][0]
        if (mode == -1) {
          digUp(50, 490);
          mode = 0;
          return;
        } else if (mode != 0 && tiles[4][0] == false) {
          if (createPlant(50, 490, 0, 100, mode, 4, 0)) {
            tiles[4][0] = true;
            return;
          }
        }
      }
    }
    if (mouseX > 140 && mouseX < 240) { // is the mouse cursor in colulm 2 
      if (mouseY > 80 && mouseY < 175) { // [0][1]
        if (mode == -1) {
          digUp(150, 90);
          mode = 0;
          return;
        } else if (mode != 0 && tiles[0][1] == false) {
          if (createPlant(150, 90, 0, 100, mode, 0, 1)) {
            tiles[0][1] = true;
            return;
          }
        }
      }
      if (mouseY > 175 && mouseY < 278) { // [1][1]
        if (mode == -1) {
          digUp(150, 190);
          mode = 0;
          return;
        } else if (mode != 0 && tiles[1][1] == false) {
          if (createPlant(150, 190, 0, 100, mode, 1, 1)) {
            tiles[1][1] = true;
            return;
          }
        }
      }
      if (mouseY > 287 && mouseY < 387) { // [2][1]
        if (mode == -1) {
          digUp(150, 290);
          mode = 0;
          return;
        } else if (mode != 0 && tiles[2][1] == false) {
          if (createPlant(150, 290, 0, 100, mode, 2, 1)) {
            tiles[2][1] = true;
            return;
          }
        }
      }
      if (mouseY < 476 && mouseY > 378) {// [3][1]
        if (mode == -1) {
          digUp(150, 390);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[3][1] == false) {
          if (createPlant(150, 390, 0, 100, mode, 3, 1)) {
            tiles[3][1] = true;
            return;
          }
        }
      }
      if (mouseY < 578 && mouseY > 476) {// [4][1]
        if (mode == -1) {
          digUp(150, 490);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[4][1] == false) {
          createPlant(150, 490, 0, 100, mode, 4, 1);
          tiles[4][1] = true;
          return;
        }
      }
    }
    if (mouseX > 240 && mouseX < 350) { // is the mouse cursor in colulm 3 
      if (mouseY > 80 && mouseY < 175) { // [0][2]
        if (mode == -1) {
          digUp(260, 90);
          mode = 0;
          return;
        }
        else if (mode != 0  && tiles[0][2] == false) {
          if (createPlant(260, 90, 0, 100, mode, 0, 2)) {
            tiles[0][2] = true;
            return;
          }
        }
      }
      if (mouseY > 175 && mouseY < 278) { // [1][2]
        if (mode == -1) {
          digUp(260, 190);
          mode = 0;
          return;
        }
        else if (mode != 0  && tiles[1][2] == false) {
          if (createPlant(260, 190, 0, 100, mode, 1, 2)) {
            tiles[1][2] = true;
            return;
          }
        }
      }
      if (mouseY > 287 && mouseY < 387) { // [2][2]
        if (mode == -1) {
          digUp(260, 290);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[2][2] == false) {
          if (createPlant(260, 290, 0, 100, mode, 2, 2)) {
            tiles[2][2] = true;
            return;
          }
        }
      }
      if (mouseY < 476 && mouseY > 378) {// [3][2]
        if (mode == -1) {
          digUp(260, 390);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[3][2] == false) {
          if (createPlant(260, 390, 0, 100, mode, 3, 2)) {
            tiles[3][2] = true;
            return;
          }
        }
      }
      if (mouseY < 578 && mouseY > 476) {// [4][2]
        if (mode == -1) {
          digUp(260, 490);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[4][2] == false) {
          if (createPlant(260, 490, 0, 100, mode, 4, 2)) {
            tiles[4][2] = true;
            return;
          }
        }
      }
    }
    if (mouseX > 350 && mouseX < 450) { // is the mouse cursor in colulm 4 
      if (mouseY > 80 && mouseY < 175) { // [0][3]
        if (mode == -1) {
          digUp(370, 90);
          mode = 0;
          return;
        }
       else if (mode != 0 && tiles[0][3] == false) {
          if (createPlant(370, 90, 0, 100, mode, 0, 3)) {
            tiles[0][3] = true;
            return;
          }
        }
      }
      if (mouseY > 175 && mouseY < 278) { // [1][3]
        if (mode == -1) {
          digUp(370, 190);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[1][3] == false) {
          if (createPlant(370, 190, 0, 100, mode, 1, 3)) {
            tiles[1][3] = true;
            return;
          }
        }
      }
      if (mouseY > 287 && mouseY < 387) { // [2][3]
        if (mode == -1) {
          digUp(370, 290);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[2][3] == false) {
          if (createPlant(370, 290, 0, 100, mode, 2, 3)) {
            tiles[2][3] = true;
            return;
          }
        }
      }
      if (mouseY < 476 && mouseY > 378) {// [3][3]
        if (mode == -1) {
          digUp(370, 390);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[3][3] == false) {
          if (createPlant(370, 390, 0, 100, mode, 3, 3)) {
            tiles[3][3] = true;
            return;
          }
        }
      }
      if (mouseY < 578 && mouseY > 476) {// [4][3]
        if (mode == -1) {
          digUp(370, 490);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[4][3] == false) {
          if (createPlant(370, 490, 0, 100, mode, 4, 3)) {
            tiles[4][3] = true;
            return;
          }
        }
      }
    }
    if (mouseX > 450 && mouseX < 555) { // is the mouse cursor in colulm 5 
      if (mouseY > 80 && mouseY < 175) { // [0][4]
        if (mode == -1) {
          digUp(470, 90);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[0][4] == false) {
          if (createPlant(470, 90, 0, 100, mode, 0, 4)) {
            tiles[0][4] = true;
            return;
          }
        }
      }
      if (mouseY > 175 && mouseY < 278) { // [1][4]
        if (mode == -1) {
          digUp(470, 190);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[1][4] == false) {
          if (createPlant(470, 190, 0, 100, mode, 1, 4)) {
            tiles[1][4] = true;
            return;
          }
        }
      }
      if (mouseY > 287 && mouseY < 387) { // [2][4]
        if (mode == -1) {
          digUp(470, 290);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[2][4] == false) {
          if (createPlant(470, 290, 0, 100, mode, 2, 4)) {
            tiles[2][4] = true;
            return;
          }
        }
      }
      if (mouseY < 476 && mouseY > 378) {// [3][4]
       if (mode == -1) {
          digUp(470, 390);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[3][4] == false) {
          if (createPlant(470, 390, 0, 100, mode, 3, 4)) {
            tiles[3][4] = true;
            return;
          }
        }
      }
      if (mouseY < 578 && mouseY > 476) {// [4][4]
        if (mode == -1) {
          digUp(470, 490);
          mode = 0;
          return;
        }       
        else if (mode != 0 && tiles[4][4] == false) {
          if (createPlant(470, 490, 0, 100, mode, 4, 4)) {
            tiles[4][4] = true;
            return;
          }
        }
      }
    }
    if (mouseX > 555 && mouseX < 660) { // is the mouse cursor in colulm 6 
      if (mouseY > 80 && mouseY < 175) { // [0][5]
        if (mode == -1) {
          digUp(570, 90);
          mode = 0;
          return;
        }  
        else if (mode != 0 && tiles[0][5] == false) {
          if (createPlant(570, 90, 0, 100, mode, 0, 5)) {
            tiles[0][5] = true;
            return;
          }
        }
      }
      if (mouseY > 175 && mouseY < 278) { // [1][5]
        if (mode == -1) {
          digUp(570, 190);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[1][5] == false) {
          if (createPlant(570, 190, 0, 100, mode, 1, 5)) {
            tiles[1][5] = true;
            return;
          }
        }
      }
      if (mouseY > 287 && mouseY < 387) { // [2][5]
        if (mode == -1) {
          digUp(570, 290);
          mode = 0;
          return;
        }
        else if (mode != 0  && tiles[2][5] == false) {
          if (createPlant(570, 290, 0, 100, mode, 2, 5)) {
            tiles[2][5] = true;
            return;
          }
        }
      }
      if (mouseY < 476 && mouseY > 378) {// [3][5]
        if (mode == -1) {
          digUp(570, 390);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[3][5] == false) {
          if (createPlant(570, 390, 0, 100, mode, 3, 5)) {
            tiles[3][5] = true;
            return;
          }
        }
      }
      if (mouseY < 578 && mouseY > 476) {// [4][5]
        if (mode == -1) {
          digUp(570, 490);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[4][5] == false) {
          if (createPlant(570, 490, 0, 100, mode, 4, 5)) {
            tiles[4][5] = true;
            return;
          }
        }
      }
    }
    if (mouseX > 660 && mouseX < 760) { // is the mouse cursor in colulm 7 
      if (mouseY > 80 && mouseY < 175) { // [0][6]
        if (mode == -1) {
          digUp(670, 90);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[0][6] == false) {
          if (createPlant(670, 90, 0, 100, mode, 0, 6)) {
            tiles[0][6] = true;
            return;
          }
        }
      }
      if (mouseY > 175 && mouseY < 278) { // [1][6]
        if (mode == -1) {
          digUp(670, 190);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[1][6] == false) {
          if (createPlant(670, 190, 0, 100, mode, 1, 6)) {
            tiles[1][6] = true;
            return;
          }
        }
      }
      if (mouseY > 287 && mouseY < 387) { // [2][6]
        if (mode == -1) {
          digUp(670, 290);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[2][6] == false) {
          if (createPlant(670, 290, 0, 100, mode, 2, 6)) {
            tiles[2][6] = true;
            return;
          }
        }
      }
      if (mouseY < 476 && mouseY > 378) {// [3][6]
        if (mode == -1) {
          digUp(670, 390);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[3][6] == false) {
          if (createPlant(670, 390, 0, 100, mode, 3, 6)) {
            tiles[3][6] = true;
            return;
          }
        }
      }
      if (mouseY < 578 && mouseY > 476) {// [4][6]
        if (mode == -1) {
          digUp(670, 490);
          mode = 0;
          return;
        }
        if (mode != 0 && tiles[4][6] == false) {
          if (createPlant(670, 490, 0, 100, mode, 4, 6)) {
            tiles[4][6] = true;
            return;
          }
        }
      }
    }
    if (mouseX > 760 && mouseX < 865) { // is the mouse cursor in colulm 8 
      if (mouseY > 80 && mouseY < 175) { // [0][7]
        if (mode == -1) {
          digUp(770, 90);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[0][7] == false) {
          if (createPlant(770, 90, 0, 100, mode, 0, 7)) {
            tiles[0][7] = true;
            return;
          }
        }
      }
      if (mouseY > 175 && mouseY < 278) { // [1][7]
        if (mode == -1) {
          digUp(770, 190);
          mode = 0;
          return;
        }
        else if (mode != 0  && tiles[1][7] == false) {
          if (createPlant(770, 190, 0, 100, mode, 1, 7)) {
            tiles[1][7] = true;
            return;
          }
        }
      }
      if (mouseY > 287 && mouseY < 387 ) { // [2][7]
        if (mode == -1) {
          digUp(770, 290);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[2][7] == false) {
          if (createPlant(770, 290, 0, 100, mode, 2, 7)) {
            tiles[2][7] = true;
            return;
          }
        }
      }
      if (mouseY < 476 && mouseY > 378) {// [3][7]
        if (mode == -1) {
          digUp(770, 390);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[3][7] == false) {
          if (createPlant(770, 390, 0, 100, mode, 3, 7)) {
            tiles[3][7] = true;
            return;
          }
        }
      }
      if (mouseY < 578 && mouseY > 476) {// [4][7]
        if (mode == -1) {
          digUp(770, 490);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[4][7] == false) {
          if (createPlant(770, 490, 0, 100, mode, 4, 7)) {
            tiles[4][7] = true;
            return;
          }
        }
      }
    }
    if (mouseX > 865 && mouseX < 975) { // is the mouse cursor in colulm 9 
      if (mouseY > 80 && mouseY < 175) { // [0][8]
        if (mode == -1) {
          digUp(885, 90);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[0][8] == false) {
          if (createPlant(885, 90, 0, 100, mode, 0, 8)) {
            tiles[0][8] = true;
            return;
          }
        }
      }
      if (mouseY > 175 && mouseY < 278) { // [1][8]
         if (mode == -1) {
          digUp(885, 190);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[1][8] == false) {
          if (createPlant(885, 190, 0, 100, mode, 1, 8)) {
            tiles[1][8] = true;
            return;
          }
        }
      }
      if (mouseY > 287 && mouseY < 387) { // [2][8]
        if (mode == -1) {
          digUp(885, 290);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[2][8] == false) {
          if (createPlant(885, 290, 0, 100, mode, 2, 8)) {
            tiles[2][8] = true;
            return;
          }
        }
      }
      if (mouseY < 476 && mouseY > 378) {// [3][8]
        if (mode == -1) {
          digUp(885, 390);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[3][8] == false) {
          if (createPlant(885, 390, 0, 100, mode, 3, 8)) {
            tiles[3][8] = true;
            return;
          }
        }
      }
      if (mouseY < 578 && mouseY > 476) {// [4][8]
        if (mode == -1) {
          digUp(885, 490);
          mode = 0;
          return;
        }
        else if (mode != 0 && tiles[4][8] == false) {
          if (createPlant(885, 490, 0, 100, mode, 4, 8)) {
            tiles[4][8] = true;
            return;
          }
        }
      }
    }
  }
}
boolean createPlant(int x, int y, int damage, int health, int type, int fakeX, int fakeY) { // 1: sunflower 2: peashooter
  if (type == 1){ //&& sunMoney >= 50) {
    //sunMoney -= 50;
    sunFlower b = new sunFlower (x, y, damage, health, fakeX, fakeY);
    plant.add(b);
    mode = 0;
    return true;
  }
  if (type == 2){ //&& sunMoney >= 100) {
    //sunMoney -= 100;
    peaShooter b = new peaShooter (x, y, damage, health, fakeX, fakeY);
    plant.add(b);
    mode = 0;
    return true;
  }
  if (type == 3){ //&& sunMoney >= 50) {
    //sunMoney -= 50;
    wallNut b = new wallNut (x, y, damage, 1000, fakeX, fakeY);
    plant.add(b);
    mode = 0;
    return true;
  }
  return false;
}
void digUp(int x, int y) {
  for (int i = 0; i < plant.size(); i ++) {
    if (plant.get(i).x  == x && plant.get(i).y == y) {
      tiles[plant.get(i).fakeX][plant.get(i).fakeY] = false; 
      plant.remove(i);
      i --;
      //rect (100, 100, 1000, 1000);
    }
  }
}


void spawn1() {
  int s = millis();
  int r = (int) random(1,11);
  if (s % (int)random(800, 2001) == 0) {
    if (r > 3){
      Zombies z = new Zombies(950, 50, 50, 10, random(.5, 2.1));
      zombie.add(z);
    } else {
      bucketZomb z = new bucketZomb(950, 20, 100, 10, random(.5, 2.1));
      zombie.add(z);
    }
  }
}
void spawn2() {
  int s = millis();
  int r = (int) random(1,11);
  if (s % (int)random(1000, 2001) == 0) {
    if (r > 3){
      Zombies z = new Zombies(950, 155, 50, 10, random(.5, 2.1));
      zombie.add(z);
    } else {
      bucketZomb z = new bucketZomb(950, 125, 100, 10, random(.5, 2.1));
      zombie.add(z);
    }
  }
}
void spawn3() {
  int s = millis();
  int r = (int) random(1,11);
  if (s % (int)random(1000, 2001) == 0) {
    if (r > 3){
    Zombies z = new Zombies(950, 255, 50, 10, random(.5, 2.1));
    zombie.add(z);
    } else {
      bucketZomb z = new bucketZomb(950, 225, 100, 10, random(.5, 2.1));
      zombie.add(z);
    }
  }
}
void spawn4() {
  int s = millis();
  int r = (int) random(1,11);
  if (s % (int)random(1000, 2001) == 0) {
    if (r > 3){
    Zombies z = new Zombies(950, 353, 50, 10, random(.5, 2.1));
    zombie.add(z);
    } else {
      bucketZomb z = new bucketZomb(950, 323, 100, 10, random(.5, 2.1));
      zombie.add(z);
    }
  }
}
void spawn5() {
  int s = millis();
  int r = (int) random(1,11);
  if (s % (int)random(1000, 2001) == 0) {
    if (r > 3){
    Zombies z = new Zombies(950, 455, 50, 10, random(.5, 2.1));
    zombie.add(z);
    } else {
      bucketZomb z = new bucketZomb(950, 425, 100, 10, random(.5, 2.1));
      zombie.add(z);
    }
  }
}
 void spawnMower(){
   for (int i = 0; i < 5; i++){
     Lawnmower f = new Lawnmower(-30, i*100+50, 6);
     lawnmow.add(f);
   }
 }
