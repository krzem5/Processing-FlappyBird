class Pipe{
	PVector p;
	int w;
	int sz;
	boolean end;
	int s_st;



	Pipe(){
		this.w=int(random(50,120));
		this.sz=int(random(110,150));
		this.p=new PVector(pl.size()>0?(pl.get(pl.size()-1).p.x+PIPE_GAP):width+this.w+START_PIPE_GAP,pl.size()>0?constrain(int(pl.get(pl.size()-1).p.y+random(-350,350)),this.sz/2+25,height-this.sz/2-25):int(random(this.sz/2+25,height-this.sz/2-25)));
		this.end=false;
		this.s_st=0;
	}



	void update(){
		this.p.x-=SPEED;
		if (this.p.x+this.w/2<0){
			this.end=true;
		}
	}



	boolean collision(Bird b){
		if (b.p.x+b.w/2>=this.p.x-this.w/2&&b.p.x-b.w/2<=this.p.x+this.w/2&&((this.p.y-this.sz/2>=b.p.y-b.h/2)||(this.p.y+this.sz/2<=b.p.y+b.h/2))){
			this.s_st=-1;
			return true;
		}
		if (this.s_st==0&&b.p.x+b.w/2>=this.p.x-this.w/2&&b.p.x-b.w/2<=this.p.x+this.w/2){
			this.s_st=1;
		}
		if (this.s_st==1&&b.p.x-b.w/2>=this.p.x+this.w/2){
			this.s_st=2;
		}
		return false;
	}



	void draw(){
		noStroke();
		fill(230);
		if (this.s_st==1){
			fill(#ffde39);
		}
		if (this.s_st==2){
			fill(#a3fa2b);
		}
		if (this.s_st==-1){
			fill(#c6230a);
		}
		rectMode(CORNER);
		rect(this.p.x-this.w/2,0,this.w,this.p.y-this.sz/2);
		rect(this.p.x-this.w/2,this.p.y+this.sz/2,this.w,height-this.p.y-this.sz/2);
	}
}
