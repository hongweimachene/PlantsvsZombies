PImage image;
PImage shine;
ArrayList<Plants> plant;
ArrayList<Bullet> ammo;
ArrayList<Sunlight> light;
Zombies z;
int sunMoney;
void setup() {
  shine = loadImage("sunlight.png");
  shine.resize(50, 50);
  sunMoney = 0;
  plant = new ArrayList<Plants>();
  ammo = new ArrayList<Bullet>();
  light = new ArrayList<Sunlight>();
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
  peaShooter t = new peaShooter(50, 90, 50, 100);
  peaShooter p = new peaShooter(50, 290, 50, 100);
  sunFlower s = new sunFlower(50, 190, 0, 100);

  plant.add(t);
  plant.add(s);
  plant.add(p);
  z = new Zombies(950, 50, 50, 10, 1);
} 

void draw() {
  image(image, -180, 0);
  fill(135, 54, 0);
  rect(0, 0, 555, 80);
  for (Bullet b : ammo) {
    b.display();
    b.move();
  }
  for (int index = 0; index < light.size(); index ++) {
    light.get(index).display();
    if (light.get(index).isMouseNear(mouseX, mouseY)) {
      light.remove(index);
      sunMoney += 50;
      index --;
    }
  }
  for (Plants p : plant) {
    p.display();
    double second = (double) millis();
    if (second % 5000.0 > 0.0 && second % 5000 < 15.0) {
      p.giveSun();
    }
    p.attack();
  }
  textSize(50);
  fill(214,234,248);
  text(sunMoney, 10,60);
  z.display();
  z.move();
}
