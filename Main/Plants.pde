class Plants {
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
  void display() {
    rect(x, y, 50, 50);
  }
  void move() {
    x += 10;
    if (x > 1000) {
      x = 0;
    }
  }
}
