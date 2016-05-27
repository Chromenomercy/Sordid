

public class Game extends State{
  FWorld world;
  Game(){
    Fisica.setScale(100);
    world = new FWorld();
    FCompound player = new FCompound();
    FCircle head = new FCircle(32);
    head.setPosition(0, -34);
    FBox body = new FBox(6, 50);
    body.setPosition(0, -18);
    body.setFill(0);
    FBox armL = new FBox(6, 25);
    armL.setPosition(0, -18);
    armL.setFill(0);
    FBox armR = new FBox(6, 25);
    armR.setPosition(0, -18);
    armR.setFill(0);
    FBox legL = new FBox(10, 25);
    legL.setPosition(0, 32);
    legL.setFill(0);
    FBox legR = new FBox(6, 25);
    legR.setPosition(0, 32);
    legR.setFill(0);
    player.addBody(armL);
    player.addBody(armR);
    player.addBody(legL);
    player.addBody(legR);
    player.addBody(body);
    player.addBody(head);
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
  }
}