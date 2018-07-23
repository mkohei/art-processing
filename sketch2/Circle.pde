class Circle {
  
  final static float da=0.1, dr=0.7;
  final static int R = 10;
  
  final static float Rda = 0.01;    // random da
  
  final float MAX_R = sqrt(pow(width/2, 2)+pow(height/2,2));
    
  float a, r;
  boolean dead;
  
  Circle() {
    init();
  }
  
  void init() {
    a = 0;
    r = 0;
    dead = true;
  }
  
  void move() {
    if (!dead) {
      a += da;
      r += dr;
    }
    if (r > MAX_R) {
      init();
    }
  }
  
  void draw() {
    if (!dead) {
      float x, y, _a;
      _a = a + random(-Rda, Rda);
      x = width/2 + r*cos(_a);
      y = width/2 + r*sin(_a);
      fill(0);
      ellipse(x, y, R, R);
    }
  }
}