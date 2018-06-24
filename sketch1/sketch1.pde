final int R = 200;          // Radius
final int center_r = 30;    // center radius
final float RRR = 0.5;      // Radius Random Ratio
final float DRRR = 0.05;     // Diff Radius Random Ratio


float angle = 0;
float v_angle = 0.03;
float center_angle = 0;
float v_center_angle = 0.07;
float cx, cy;
float x1, y1, x2, y2;
float _R;

void setup() {
  size(500, 500);
  background(255);
  
  _R = R;
}

void draw() {
  fill(255, 3);
  rect(0, 0, width, height);
  
  angle += v_angle;
  center_angle += v_center_angle;
  
  //cx = width/2 + center_r * cos(-center_angle);
  //cy = height/2 + center_r * sin(-center_angle);
  cx = width/2;
  cy = height/2;
  
  //_R = R + random(-R * RRR, R * RRR);
  _R += random(-R*DRRR, R*DRRR);
  
  x1 = cx + _R*cos(angle);
  y1 = cy + _R*sin(angle);
  x2 = cx + _R*cos(angle + PI);
  y2 = cy + _R*sin(angle + PI);
  
  stroke(0);
  line(x1, y1, x2, y2);
  
  
}

  