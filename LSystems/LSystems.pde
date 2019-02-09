LSystem system;
Turtle t;

float iterations;

void BinaryTreeSetup(){
  system = new LSystem();
  system.addRule('0', "1[0]0");
  system.addRule('1', "11");
  system.setAxiom("0");
  system.init_system();
  
  for (int i = 0; i < 9; i++){
    system.iterate();
  }
  
  t = new Turtle(new PVector(width/2, 7 * height/8), PI/2);
}

void BinaryTree(){
  char c = 0;
  float l = 1;
  float leftangle = map(mouseX, 0, width, 0, 180);
  float rightangle = map(mouseX, 0, width, 180, 0);
  leftangle -= map(mouseY, 0, height, leftangle, 0);
  rightangle -= map(mouseY, 0, height, rightangle, 0);
  t.pushState();
  system.start_read();
  while (system.has_next()){
    c = system.get_next();
    switch (c){
      case '0':
        t.forward(-l/2);
        break;
      case '1':
        t.forward(-l);
        break;
      case '[':
        t.pushState();
        t.left(radians(leftangle));
        break;
      case ']':
        t.popState();
        t.right(radians(rightangle));
        break;
      default:
        println("Unknown variable/constant.");
    }
  }
  t.popState();
} //<>// //<>//

void setup(){
  size(800, 800);
  iterations = 0;
  BinaryTreeSetup();
}

void draw(){
  background(0);
  stroke(255);
  BinaryTree();
}

void mousePressed(){
  iterations++;
  system.iterate();
}
