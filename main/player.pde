

public class Player{
  int state = 0;
  int animStart = 0;
  FCompound entity;
  FCircle head;
  FPoly body;
  int W = 75;
  int H = 150;
  int lenX;
  int lenY;
  Player(int x, int y, int xFrames, int yFrames){
    lenX = xFrames;
    lenY = yFrames;
    head = new FCircle(25);
    head.setFill(color(0));
    body = new FPoly();
    body.vertex(0, 0);
    body.vertex(2, 1);
    body.vertex(3, 2);
    body.vertex(4, 3);
    body.vertex(5, 5);
    body.vertex(5, 60);
    body.vertex(4, 62);
    body.vertex(3, 63);
    body.vertex(2, 64);
    body.vertex(0, 65);
    body.vertex(-2, 64);
    body.vertex(-3, 63);
    body.vertex(-4, 62);
    body.vertex(-5, 60);
    body.vertex(-5, 5);
    body.vertex(-4, 3);
    body.vertex(-3, 2);
    body.vertex(-2, 1);
    body.vertex(0, 0);
    body.setPosition(0, 12);
    body.setDensity(10);
    body.setRestitution(0.5);
    body.setFill(color(0));
    entity = new FCompound();
    entity.addBody(head);
    entity.addBody(body);
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