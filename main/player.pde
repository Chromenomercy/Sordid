

public class Player{
  int state = 0;
  int animStart = 0;
  FBox player;
  int W = 75;
  int H = 150;
  int lenX;
  int lenY;
  Player(int x, int y, int xFrames, int yFrames){
    lenX = xFrames;
    lenY = yFrames;
    addImage("sordSpriteSheet.png");
    player = new FBox(75, 150);
    player.attachImage(getImage("sordSpriteSheet").get(0, 0, W, H));
    player.setPosition(x, y);
    player.setRotatable(false);
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
    player.dettachImage();
    player.attachImage(getImage("sordSpriteSheet").get(x, y, W, H));
    
  }
}