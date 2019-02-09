class Turtle {
  PVector[] loc;
  float[] rot;
  int index;
  
  Turtle(PVector loc, float rot){
    this.loc = new PVector[30];
    this.rot = new float[30];
    this.loc[index] = loc;
    this.rot[index] = rot;
    index = 0;
  }
  
  void forward(float l){
    PVector start = loc[index];
    PVector end = PVector.add(start, this.polar(l, rot[index]));
    line(start.x, start.y, end.x, end.y);
    loc[index] = end;
  }
  
  void left(float theta){
    rot[index] += theta;
  }
  
  void right(float theta){
    rot[index] -= theta;
  }
  
  void pushState(){
    index++;
    loc[index] = loc[index - 1];
    rot[index] = rot[index - 1];
  }
  
  void popState(){
    index--;
  }
  
  PVector polar(float r, float theta){
    return new PVector(r*cos(theta), r*sin(theta));
  }
}
