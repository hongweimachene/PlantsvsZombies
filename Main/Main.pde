PImage image;
PImage shine;
//peaShooter t;
//greenPea f;
//sunFlower s; 
ArrayList<Plants> plant;
ArrayList<Bullet> ammo;
ArrayList<Sunlight> light;
void setup() {
  shine = loadImage("sunlight.png");
  shine.resize(50, 50);
  plant = new ArrayList<Plants>();
  ammo = new ArrayList<Bullet>();
  light = new ArrayList<Sunlight>();
  size(1000, 600);
  background(255);
  image = loadImage("back.png");
  image.resize(1380, 600);
  image(image, -180, 0);
  fill(135, 54, 0);
  rect(30, 0, 555, 80);
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
  peaShooter t = new peaShooter(50, 90, 50, 100);
  sunFlower s = new sunFlower(50, 190, 0, 100);
  plant.add(t);
  plant.add(s);
  //s.giveSun();
} 

void draw() {
  //background(0);
  image(image,-180,0);
  //f.move();
  //t.move();
  for (Bullet b : ammo) {
    b.display();
    b.move();
  }
  for (Sunlight b : light) {
    b.display();
  }
  for (Plants p : plant) {
    p.display();
    double second = (double) millis();
    if (second % 5000.0 > 0.0 && second % 5000 < 15.0) {
      p.giveSun();
    }
    if (second % 1000.0 > 0.0 && second % 1000 < 15.0) {
      p.attack();
    }
  }
}
