class Sunlight {
  int x, y,time;
  Sunlight(int x, int y) {
    this.x = x;
    this.y = y;
    time = (int)random(20);
  }
  void display() {
    image(shine, x, y);
  }
  boolean isMouseNear(int x, int y) {
    if (dist(this.x + 35, this.y + 35, x, y) < 50 && mousePressed) {
      return true;
    } else {
      return false;
    }
  }
}
