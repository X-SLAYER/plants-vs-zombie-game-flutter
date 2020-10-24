class MainHandler {
  double x;
  double y;

  MainHandler(this.x, this.y);

  initCords(double x, double y) {
    this.x = x;
    this.y = y;
  }

  stepOnX(double x) {
    this.x += x;
  }

  stepOnY(double y) {
    this.y += y;
  }

  moveUp(double step) {
    if (y <= 1) {
      stepOnY(step);
    }
  }

  moveDown(double step) {
    if (y <= 0.9) {
      stepOnY(step);
    }
  }

  moveRight() {
    stepOnX(0.02);
  }

  moveLeft() {
    stepOnX(-0.02);
  }
}
