int levels;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 2;
}

/*Create Sierpiski's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/
void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
    //YOU WRITE THIS METHOD!
    if(levels >= 0){
    fill(245, 2, 2);
    triangle(v1x, v1y, v2x, v2y, v3x, v3y);
      if(levels >= 1){
        fill(255);
        triangle((v1x + v2x)/2, (v1y+ v2y)/2, (v1x + v3x)/2, (v1y + v3y)/2, (v2x+ v3x) / 2, (v2y + v3y)/2);
        if(levels >= 2){
          float x1 = (v1x + v2x)/2;
          float y1 = (v1y+ v2y)/2;
          float x2 = (v1x + v3x)/2;
          float y2 = (v1y + v3y)/2;
          float x3 = (v2x+ v3x) / 2;
          float y3 = (v2y + v3y)/2;
          fill(255);
          triangle((v1x + x1)/2, (v1y + y1)/2, (x1 + x2)/2, (y1 + y2)/2, (x2 + v1x)/2, (y2 + v1y)/2);
          triangle((v2x + x1)/2, (v2y + y1)/2, (x1 + x3)/2, (y1 + y3)/2, (v2x + x3)/2, (v2y + y2)/2);
          triangle((v3x + x2)/2, (v3y + y2)/2, (x2 + x3)/2, (y2 + y3)/2, (v3x + x3)/2, (v3y + y3)/2);
          if(levels >=3){
            float x1v1 = (v1x + x1)/2;
            float y1v1 = (v1y + y1)/2;
            float x12 = (x1 + x2)/2;
            float y12 = (y1 + y2)/2;
            float x2v1 = (x2 + v1x)/2;
            float y2v1 = (y2 + v1y)/2;
            float x1v2 = (v2x + x1)/2;
            float y1v2 = (v2y + y1)/2;
            float x13 = (x1 + x3)/2;
            float y13 = (y1 + y3)/2;
            float x2v2 = (v2x + x3)/2;
            float y2v2 = (v2y + y2)/2;
            float x2v3 = (v3x + x2)/2;
            float y2v3 = (v3y + y2)/2;
            float x23 = (x2 + x3)/2;
            float y23 = (y2 + y3)/2;
            float x3v3 = (v3x + x3)/2;
            float y3v3 = (v3y + y3)/2;
            triangle((v1x + x1v1)/2, (v1y + y1v1)/2, (x2v1 + x1v1)/2, (y2v1 + y1v1)/2, (x2v1 + v1x)/2, (y2v1 + v1y)/2);
            triangle((x2 + x12)/2, (y2 + y12)/2, (x12 + x2v1)/2, (y12 + y2v1)/2, (x2 + x2v1)/2, (y2+y2v1)/2);
            triangle((x1v1 + x1)/2, (y1v1 +y1)/2, (x12 + x1)/2, (y12 + y1)/2, (x1v1 + x12)/2, (y1v1 + y12)/2);
            triangle((x2 + x2v3)/2, (y2 + y2v3)/2, (x2v3+ x23)/2, (y2v3 + y23)/2, (x23 + x2)/2, (y23 + y2)/2);
            triangle((x2v3 + v3x)/2, (v3y + y2v3)/2, (x3v3 + x2v3)/2, (y3v3 + y2v3)/2, (v3x + x3v3)/2, (v3y + y3v3)/2);
            triangle((x3v3 + x3)/2, (y3v3 + y3)/2, (x23 + x3v3)/2, (y23 + y3v3)/2, (x3 + x23)/2, (y3 + y23)/2);
            triangle((x3 + x2v2)/2, (y3 + y2v2)/2, (x13 + x3)/2, (y13 + y3)/2, (x2v2 + x13)/2, (y2v2 + y13)/2);
            triangle((v2x + x2v2)/2, (v2y + y2v2)/2, (x1v2 + x2v2)/2, (y1v2 + y2v2)/2, (v2x + x1v2)/2, (v2y + y1v2)/2);
            triangle((x13 + x1v2)/2, (y13 + y1v2)/2, (x1 + x1v2)/2, (y1 + y1v2)/2, (x1 + x13)/2, (y1+y13)/2);
          }
        }
      }
    }
}

void draw() { 
  background(50);  
  
  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levles",20,20);

  gasket(levels,0, height-10, width, height-10, width/2, 10);

 //koch(levels,width-10, height/2,10, height/3 ); 
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
 levels ++;  
}

void keyPressed(){
 levels --; 
}
