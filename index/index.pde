Bird bird;
ArrayList<Pipe> pipes;
float SPEED=5;
int PIPE_GAP=400;
int START_PIPE_GAP;
boolean game_state;
void setup() {
  size(800, 600);
  START_PIPE_GAP=width;
  game_state=true;
  bird=new Bird();
  pipes=new ArrayList<Pipe>();
  for (int i=0; i<int(width/PIPE_GAP)+10; i++) {
    pipes.add(new Pipe());
  }
}
void keyPressed() {
  if (keyCode==32&&game_state==true) {
    bird.jump();
  }
}
void draw() {
  background(35);
  for (int i=pipes.size()-1; i>=0; i--) {
    Pipe p=pipes.get(i);
    if (game_state==true) {
      p.update();
    }
    p.draw();
    if (p.offScreen==true) {
      pipes.remove(i);
      pipes.add(new Pipe());
    }
  }
  bird.update(pipes);
  bird.draw();
  if (bird.end==true&&game_state==true) {
    game_state=false;
    println("Score: "+bird.score);
  }
  if (bird.restart==true) {
    setup();
  }
}
