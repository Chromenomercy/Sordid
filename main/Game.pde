

public class Game extends State{
  int playerState = 1;
  FWorld world;
  int counter;
  Player player;
  Game(){
    counter = 0;
    addImage("sordSpriteSheet.png");
    Fisica.setScale(100);
    player = new Player(width/2, height-300, 60, 1);
    world = new FWorld();
    FBox ground = new FBox(width, 100);
    ground.setPosition(width/2, height-150);
    ground.setStatic(true);
    world.add(ground);
    world.add(player.player);
    world.setEdges();
  }
  public void update(){
    background(255);
    world.step();
    world.draw();
    player.update();
  }
}