class Point {
  float x, y, z; // 座標
  float radius=-1;  // 半径
  color col;     // 色
  
  Point(float radius) {
    // 球体上の座標を計算
    // 球体のつむじ側に点を少なく
    // 球体のお腹側に点を多く配置する
    float s; // 仰角
    int r = (int)random(7); // 仰角分布のためのrandom
    // 下側のつむじ
    if (r==0) s = random(0, PI/4);
    // 上側のつむじ
    else if (r==6) s = random(3*PI/4, PI); 
    // お腹周り
    else s = random(PI/4, 3*PI/4);
    
    float t = random(2*PI); // 方位角
    //radius = random(200, 500);
    //radius = random(100, 200);
    this.radius = radius;
    x = radius * sin(s) * cos(t);
    y = radius * cos(s);
    z = radius * sin(s) * sin(t);
    
    // hueColorをベースにランダムな色を設定
    col = color(hueColor + random(60), random(100), random(40));
  }
  
  float Pdist(Point P) {
    return dist(x, y, z, P.x, P.y, P.z);
  }
}