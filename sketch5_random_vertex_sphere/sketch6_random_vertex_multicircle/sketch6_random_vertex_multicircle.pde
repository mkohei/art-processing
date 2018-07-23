Arc[] arcs;
int numArcs = 100; // 孤の数
int lengthLimit = 160; // 距離制限
int hueColor;
color bgColor;
boolean save = false;

void setup() {
  size(displayWidth, displayHeight, P3D);
  smooth(32);
  colorMode(HSB, 360, 100, 100, 100);;
  blendMode(ADD);
  noLoop();
  reset();
}

void reset() {
  hueColor = int(random(360));
  bgColor = color(hueColor, 80, 15);
  arcs = new Arc[numArcs];
  for (int i=0; i<arcs.length; i++) {
    arcs[i] = new Arc();
  }
}

void draw() {
  background(bgColor);
  translate(width/2, height/2, 0);
  // このアングルがかっこいい
  rotateX(radians(-30));
  rotateZ(radians(30));
  
  // 孤を表示
  for (int i=0; i<arcs.length; i++) {
    arcs[i].display();
  }
}

void keyPressed() {
  if (key==' ') {
    String filename = "" + year() + month() + day() + hour() + minute() + second();
    save("img/" + filename + ".png");
    //save("hoge.png");
    println("saved");
  }
  if (key=='r') {
    reset();
    redraw();
  }
}

// １個の子を表すクラス
class Arc {
  Point[] points; // 点の集合
  float maxRadius = height/2 - 100; // 最大半径
  
  Arc() {
    // 孤の長さ
    float arcLength = random(PI/2, 3*PI/2);
    // 球体の座標計算用の値
    float radianS = random(PI);
    float radianT = random(2*PI);
    // 半径を100~maxRadiusまでランダムに設定
    float radius = 100 + random( (maxRadius-100)*sin(radianS) );
    // 半径の大きさに応じて点の数を決める
    int n = (int)map(radius, 100, maxRadius, 5, 100);
    points = new Point[n];
    for (int i=0; i<n; i++) {
      points[i] = new Point();
    }
    // 点を孤上に配置する
    for (int i=0; i<n; i++) {
      float randRadianT = random(radianT, radianT+arcLength);
      // 各方向のランダムな拡散値
      float spreadXZ = random(-10, 10);
      float spreadY = random(-10, 10);
      points[i].x = (radius+spreadXZ) * cos(randRadianT);
      points[i].y = maxRadius * cos(radianS) + spreadY;
      points[i].z = (radius+spreadXZ) * sin(randRadianT);
    }
    // 全ての点が他の全ての点に対してlengthLimit以内にある点を保存
    for (int i=0; i<points.length; i++) {
      Point fromP = points[i];
      for (int j=0; j<points.length; j++) {
        if (i==j) continue; // 自身は含まない
        Point toP = points[j];
        // 距離を計算
        float dist = dist(fromP.x, fromP.y, fromP.z, toP.x, toP.y, toP.z);
        if (dist < lengthLimit) {
          // fromPのnearPsにtoPを追加
          fromP.addNearPoint(toP);
        }
      }
    }
  }
  
  // 近くのてんを結んで多角形を描画
  void display() {
    for (int i=0; i<points.length; i++) {
      ArrayList<Point> ps = points[i].nearPs;
      fill(points[i].col);
      beginShape();
      for (Point p: ps) {
        vertex(p.x, p.y, p.z);
      }
      endShape(CLOSE);
    }
  }
  
  // １個の点を表すクラス
  class Point {
    float x, y, z;
    // 近くの点を保持
    ArrayList<Point> nearPs = new ArrayList<Point>();
    color col;
    
    Point() {
      col = color(random(-60, 60), random(100), random(40));
    }
    
    void addNearPoint(Point p) {
      nearPs.add(p);
    }
  }
}