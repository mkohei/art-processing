float dt = 1;

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
  //rotateZ(frameCount*0.005);

  // 1つ前の座標を格納する
  float lastX=0, lastY=0, lastZ=0;
  float radius = 200;
  float s=0, t=0;  

  while (s <= 180) {
    // 円状に点を描く
    // 角度をラジアンに
    float radianS = radians(s);
    float radianT = radians(t);
    // 点の座標を計算
    float x = radius * cos(radianT) * sin(radianS);
    float y = radius * sin(radianT) * sin(radianS);
    float z = radius * cos(radianS);

    // 点を描画
    stroke(0, 128, 128);
    if (lastX != 0) {
      strokeWeight(1);
      // 現在の座標から1つ前の座標に線を引く
      line(x, y, z, lastX, lastY, lastZ);
    }

    strokeWeight(15);
    point(x, y, z);
    
    // 1つ前の座標を更新
    lastX = x;
    lastY = y;
    lastZ = z;
    
    // s, t更新
    s++;
    t += dt;
  }
  dt += 0.05;
}