class Segment {
int x;
int y;
Segment(int x ,int y){
this.x = x;
this.y = y;
}
}
//
//Variables
ArrayList<Segment> tail = new ArrayList<Segment>();
int direction = UP;
int pieces = 1;
Segment head = new Segment(250, 250);
int foodX;
int foodY;
int grid = 10;

void setup() {
size(500,500);
frameRate(20);
munchies();
}
//
void munchies() {
  foodX = ((int)random(50)*10);
  foodY = ((int)random(50)*10);
}
//
void draw() {
 background(150, 135, 0);
 for (int i = 0; i < width; i+=grid) {
   line (i, 0, i, height);
 }
 for (int i = 0; i < height; i+=grid) {
   line (0, i, width, i);
 }
 drawFood();
 move();
 munchmunch();
 tailControl();
 tailCrash();
 tailImage();
 snakeImage();
}
//
void drawFood() {
  //Draw the food
fill(#FA0808);
rect(foodX, foodY, 10,10);
}
void munchmunch() {
if(head.x == foodX && head.y == foodY){
  pieces += 1;
  munchies();
}
}
//
void snakeImage() {
  //Draw the head of the snake followed by its tail
 fill(#235AB7);
rect(head.x, head.y, 10,10);
}
void tailImage() {
  //Draw each segment of the tail 
for(int i = 0 ; i< tail.size(); i++){
rect(tail.get(i).x,tail.get(i).y ,10,10);
}
//
}
void tailControl() {
  tailCrash();
  tail.add(new Segment(head.x,head.y));
  if( tail.size() > pieces){
  tail.remove(0);
  }
}
void tailCrash() {
  for(int i =0; i < tail.size()-1; i++){
   if(head.x == tail.get(i).x && head.y == tail.get(i).y){
     pieces = 1;
      tail = new ArrayList<Segment>();
     tail.add(new Segment(head.x,head.y));
  }
  }
}
//
void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(key == CODED){
  if(keyCode == UP){
   direction = UP;
  }
  else if (keyCode == DOWN){
     direction = DOWN;
  }
   else if (keyCode == LEFT){
     direction = LEFT;
  }
   else if (keyCode == RIGHT){
     direction = RIGHT;;
  }
}
}
//
void move() {
  switch(direction) {
  case UP:
    // move head up here 
    head.y-=10;
    break;
  case DOWN:
    // move head down here 
    head.y+=10;
    break;
  case LEFT:
   // figure it out 
   head.x-=10;
    break;
  case RIGHT:
    // mystery code goes here 
    head.x+=10;
    break;
  }
  check();
}
//
void check() {
 //If the snake leaves the frame, make it reappear on the other side
 if( head.x > 500){
 head.x = 0;
 }
 else if (head.x < 0){
   head.x = 500;
 }
 else if (head.y > 500){
   head.y = 0;
 }
 else if (head.y < 0){
   head.y = 500;
 }
}
