int numPoints = 250; // 点の数
int lengthLimit = 80; // 距離制限
int hueColor;         // hueの値
color bgColor;        // 背景色
Point[] points;

float angle;


void setup() {
  size(800, 600, P3D);
  // アンチエイリアスの品質を設定
  smooth(32);
  // HSBカラーモード
  colorMode(HSB, 360, 100, 100, 100);
  // 加算合成モード
  blendMode(ADD);
  //hueColor = (int)random(360);
  //hueColor = 360;
  hueColor = 0;
  //noLoop();
  reset();
}

void reset() {
  // 点を生成
  points = new Point[numPoints*2];
  for (int i=0; i<numPoints; i++) {
    points[i] = new Point(100);
    points[numPoints+i] = new Point(200);
  }
  
  angle = 0;
}

void draw() {
  hueColor = (hueColor+1);//%360;
  println(hueColor);
  angle += 0.01;
  
  
  background(0);
  translate(width/2, height/2);
  
  rotateY(angle);
  
  // 全ての点に対して、他の点との距離を計算し
  // lengthLimit以下である点同士で多角形を作る
  for (int i=0; i<points.length; i++) {
    Point fromP = points[i];
    // 近くの点を格納するArrayList
    ArrayList<Point> nearPoints = new ArrayList<Point>();
    for (int j=0; j<points.length; j++) {
      Point toP = points[j];
      // fromPとtoPの距離を計算
      //float dist = fromP.Pdist(toP);
      float dist = dist(fromP.x, fromP.y, fromP.z, toP.x, toP.y, toP.z);
      // lengthLimit以下ならnearPsに追加
      if (dist < lengthLimit) {
        nearPoints.add(toP);
      }
    }
    // 多角形を描画
    //strokeWeight(0.5);
    //stroke(200, 50);
    noStroke();
    fill(hueColor+color(hue(fromP.col), saturation(fromP.col), brightness(fromP.col)));
    beginShape();
    for (Point p: nearPoints) {
      vertex(p.x, p.y, p.z);
    }
    endShape(CLOSE);
  }
}

void keyPressed() {
  if (key==' ') {
    String filename = "" + year() + month() + day() + hour() + minute() + second();
    save("img/" + filename + ".png");
    //save("hoge.png");
    println("saved");
  }
}