class Pipe {
  PVector pos;
  int pipe_width, gap;
  boolean offScreen;
  int scoreState;
  Pipe() {
    this.pipe_width=int(random(50, 120));
    this.gap=int(random(110, 150));
    this.pos=new PVector(pipes.size()>0?(pipes.get(pipes.size()-1).pos.x+PIPE_GAP):width+this.pipe_width+START_PIPE_GAP, pipes.size()>0?constrain(int(pipes.get(pipes.size()-1).pos.y+random(-350, 350)), this.gap/2+25, height-this.gap/2-25):int(random(this.gap/2+25, height-this.gap/2-25)));
    this.offScreen=false;
    this.scoreState=0;
  }
  void update() {
    this.pos.x-=SPEED;
    if (this.pos.x+this.pipe_width/2<0) {
      this.offScreen=true;
    }
  }
  boolean collision(Bird bird) {
    if (bird.pos.x+bird.w/2>=this.pos.x-this.pipe_width/2&&bird.pos.x-bird.w/2<=this.pos.x+this.pipe_width/2&&((this.pos.y-this.gap/2>=bird.pos.y-bird.h/2)||(this.pos.y+this.gap/2<=bird.pos.y+bird.h/2))) {
      this.scoreState=-1;
      return true;
    }
    if (this.scoreState==0&&bird.pos.x+bird.w/2>=this.pos.x-this.pipe_width/2&&bird.pos.x-bird.w/2<=this.pos.x+this.pipe_width/2) {
      this.scoreState=1;
    }
    if (this.scoreState==1&&bird.pos.x-bird.w/2>=this.pos.x+this.pipe_width/2) {
      this.scoreState=2;
      bird.score+=10;
    }
    return false;
  }
  void draw() {
    noStroke();
    fill(230);
    if (this.scoreState==1) {
      fill(#FFDE39);
    }
    if (this.scoreState==2) {
      fill(#A3FA2B);
    }
    if (this.scoreState==-1) {
      fill(#C6230A);
    }
    rectMode(CORNER);
    rect(this.pos.x-this.pipe_width/2, 0, this.pipe_width, this.pos.y-this.gap/2);
    rect(this.pos.x-this.pipe_width/2, this.pos.y+this.gap/2, this.pipe_width, height-this.pos.y-this.gap/2);
  }
}
