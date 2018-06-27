void setup() {
  size(500, 500, P3D);
}

void draw() {
  background(0);

  // 原点を中心に
  translate(width/2, height/2, 0);  
  // X軸を中心に回転
  rotateX(frameCount*0.005);
  // Z軸の中心に回転
  rotateZ(frameCount*0.005);

  // 円状に点を描く
  float radius = 200; // 半径
  for (int s=0; s <= 180; s += 10) {
    float radianS = radians(s);
    float z = radius * cos(radianS);
    for (int t=0; t < 360; t+=10) {
      // 角度をラジアンに
      float radianT = radians(t);
      // 点の座標を計算
      float x = radius * cos(radianT) * sin(radianS);
      float y = radius * sin(radianT) * sin(radianS);
      // 点を描画
      stroke(0, 128, 128);
      strokeWeight(8);
      point(x, y, z);
    }
  }
}