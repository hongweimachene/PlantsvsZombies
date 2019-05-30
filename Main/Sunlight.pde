class Sunlight {
  int x, y,time,floor;
  boolean sky;
  Sunlight(int x, int y,boolean sky) {
    this.x = x;
    this.y = y;
    this.sky = sky;
    time = (int)random(20);
    floor = (int) random(200,451);
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
