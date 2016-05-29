

public class Game extends State{
  FWorld world;
  Animation currentAnimation;
  int counter;
  FBox player;
  PImage test;
  int W = 75;
  int H = 150;
  int lenX = 60;
  int lenY = 1;
  Game(){
    counter = 0;
    addImage("sordSpriteSheet.png");
    Fisica.setScale(100);
    world = new FWorld();
    player = new FBox(75, 150);
    player.attachImage(getImage("sordSpriteSheet.png").get(0, 0, W, H));
    player.setPosition(width/2, height-300);
    player.setRotatable(false);
    FBox ground = new FBox(width, 100);
    ground.setPosition(width/2, height-150);
    ground.setStatic(true);
    world.add(ground);
    world.add(player);
    world.setEdges();
  }
  public void update(){
    background(255);
    world.step();
    world.draw();
    int fi = frameCount; // starting cell based on number in the for loop, animation based on frameCount
    int x = fi%lenX*W; // get the x texture coordinate of the cell
    int y = fi/lenY%lenY*H; // get the y texture coordinate of the cell
    player.dettachImage();
    player.attachImage(getImage("sordSpriteSheet.png").get(x, y, W, H));
    
    
  }
}