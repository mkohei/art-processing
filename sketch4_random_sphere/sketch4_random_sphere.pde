int numPoints = 300;
float[] xPos = new float[numPoints];
float[] yPos = new float[numPoints];
float[] zPos = new float[numPoints];

void setup() {
  size(500, 500, P3D);
  
  // 半径200の球体状に点をランダムに配置
  float radius = 200; // 半径
  for (int i=0; i<numPoints; i++) {
    float radianS = radians(random(180));
    float radianT = radians(random(360));
    xPos[i] = radius * sin(radianS) * cos(radianT);
    yPos[i] = radius * sin(radianS) * sin(radianT);
    zPos[i] = radius * cos(radianS);
  }
}

void draw() {
  background(0);

  // 原点を中心に
  translate(width/2, height/2, 0);  
  // X軸を中心に回転
  rotateX(frameCount*0.005);
  // Z軸の中心に回転
  rotateZ(frameCount*0.005);

  for (int i=0; i<numPoints; i++) {
    stroke(0, 128, 128);
    strokeWeight(8);
    point(xPos[i], yPos[i], zPos[i]);
  }
}