Circle[] circleArr = new Circle[600];
int idx;

float da = 0.02;
float a;


void setup() {
  size(500, 500);
    
  for (int i=0; i<circleArr.length; i++) {
    circleArr[i] = new Circle();
  }

  a = 0;
}

void draw() {
  background(255);
  
  for (int i=0; i<circleArr.length; i++) {
    circleArr[i].move();
    circleArr[i].draw();
  }
  if (circleArr[idx].dead) {
    circleArr[idx].dead = false;
    circleArr[idx].a = a;
    a += da;
  }
  idx = (idx + 1) % circleArr.length;
  println(idx);
}