class Bird{
	PVector p;
	float vy;
	float g;
	boolean end;
	int w;
	int h;
	int a_idx;
	boolean restart;



	Bird(){
		this.vy=0;
		this.p=new PVector(200,height/2);
		this.g=0;
		this.end=false;
		this.w=25;
		this.h=20;
		this.a_idx=-1;
		this.restart=false;
	}



	void jump(){
		this.g=0.115;
		this.vy=constrain(this.vy-3,-4,4);
	}



	void update(ArrayList<Pipe> pl){
		if (this.a_idx==0){
			this.vy=-3;
			this.g=0.2;
		}
		if (this.end==false){
			this.p.y+=this.vy;
			this.vy+=this.g;
			if (this.p.y<10){
				this.p.y=10;
				this.vy=0;
			}
			if (this.p.y>=height-10){
				this.end=true;
			}
			for (Pipe p:pl){
				if (p.collision(this)){
					this.end=true;
				}
			}
		}
		if (this.end==true){
			this.p.y+=this.vy;
			this.vy+=this.g;
			this.a_idx++;
		}
		if (this.p.y-this.w/2>=height){
			this.restart=true;
		}
	}



	void draw(){
		noStroke();
		fill(#fad728);
		ellipseMode(CENTER);
		translate(this.p.x,this.p.y);
		if (this.a_idx>0&&this.a_idx<20){
			rotate(map(this.a_idx,0,20,0,PI/2));
		}
		if (this.a_idx>=20){
			rotate(PI/2);
		}
		ellipse(0,0,this.w,this.h);
	}
}
