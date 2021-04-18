final float SPEED=5;
final int PIPE_GAP=400;
final int START_PIPE_GAP=1920;



Bird b;
ArrayList<Pipe> pl;
boolean st=true;



void setup(){
	size(START_PIPE_GAP,1080);
	b=new Bird();
	pl=new ArrayList<Pipe>();
	for (int i=0;i<int(width/PIPE_GAP)+10;i++){
		pl.add(new Pipe());
	}
}



void keyPressed(){
	if (keyCode==32&&st==true){
		b.jump();
	}
}



void draw(){
	background(35);
	for (int i=pl.size()-1;i>=0;i--){
		Pipe p=pl.get(i);
		if (st==true){
			p.update();
		}
		p.draw();
		if (p.end==true){
			pl.remove(i);
			pl.add(new Pipe());
		}
	}
	b.update(pl);
	b.draw();
	if (b.end==true&&st==true){
		st=false;
	}
	if (b.restart==true){
		setup();
	}
}
