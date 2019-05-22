abstract class Bullet {
  int x, y, damage;
  Bullet(int x, int y, int damage) {
    this.x = x;
    this.y = y;
    this.damage = damage;
  }
  abstract void display();
  abstract void move();
}
class greenPea extends Bullet {
  greenPea(int x, int y, int damage) {
  super(x, y, damage);
  }
  void display() {
    fill(35, 155, 86);
    ellipse(x, y, 30, 30);
  }
 void move() {
    x += 5;
  }
}
