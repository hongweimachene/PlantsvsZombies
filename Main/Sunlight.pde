class Sunlight {
  int x, y; 
  Sunlight(int x, int y) {
    this.x = x;
    this.y = y;
  }
  void display() {
    image(shine, x, y);
  }
  boolean isMouseNear(int x, int y) {
    if (dist(this.x, this.y, x, y) < 3) {
      return true;
    } else {
      return false;
    }
  }
}
