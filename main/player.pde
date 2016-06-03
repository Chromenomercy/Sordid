

public class Player{
  int state = 0;
  int animStart = 0;
  FCompound entity;
  FCircle head;
  FBox body;
  FBox armL;
  FBox armR;
  FBox legL;
  FBox legR;
  int W = 75;
  int H = 150;
  int lenX;
  int lenY;
  Player(int x, int y, int xFrames, int yFrames){
    lenX = xFrames;
    lenY = yFrames;
    head = new FCircle(25);
    head.setFill(color(0));
    body = new FBox(10, 60);
    //body = new FPoly();
    //body.vertex(0, 0);
    //body.vertex(2, 1);
    //body.vertex(3, 2);
    //body.vertex(4, 3);
    //body.vertex(10, 10);
    //body.vertex(10, 60);
    //body.vertex(4, 62);
    //body.vertex(3, 63);
    //body.vertex(2, 64);
    //body.vertex(0, 65);
    //body.vertex(-2, 64);
    //body.vertex(-3, 63);
    //body.vertex(-4, 62);
    //body.vertex(-10, 60);
    //body.vertex(-10, 10);
    //body.vertex(-4, 3);
    //body.vertex(-3, 2);
    //body.vertex(-2, 1);
    //body.vertex(0, 0);
    armL = new FBox(10, 50);
    armL.setPosition(-20, 30);
    armL.setRotation(radians(45));
    armL.setFill(color(0));
    armR = new FBox(10, 50);
    armR.setPosition(20, 30);
    armR.setRotation(radians(-45));
    armR.setFill(color(0));
    legL = new FBox(10, 50);
    legL.setRotation(radians(-45));
    legL.setPosition(20, 100);
    legL.setFill(color(0));
    legR = new FBox(10, 50);
    legR.setRotation(radians(45));
    legR.setPosition(-20, 100);
    legR.setFill(color(0));
    body.setPosition(0, 42);
    body.setFill(color(0));
    entity = new FCompound();
    entity.addBody(head);
    entity.addBody(body);
    entity.addBody(armL);
    entity.addBody(armR);
    entity.addBody(legL);
    entity.addBody(legR);
    entity.setPosition(x, y);
    entity.setRotatable(false);
  }
  public void update(){
    int newState = int(random(1000));
    if(state==0&&newState<2){
      state = newState;
      animStart = frameCount;
    } else if(state==1 && frameCount-animStart==60){
      state = 0;
      animStart = frameCount;
    }
    int fi = frameCount-animStart;
    int x = fi%lenX*W;
    int y = state*H;
    entity.dettachImage();
    
  }
}