

public class Game extends State{
  FWorld world;
  Game(){
    name = "game";
    Fisica.setScale(100);
    world = new FWorld();
    world.setGravity(0, -100);
    for (int i=0;i<16;i++){
      for (int j=0;j<16;j++){
        FCircle head = new FCircle(16);
        head.setPosition(16+i*width/16,16+j*height/16);
        head.setFillColor(color(random(255), random(255), random(255)));
        head.setRestitution(1);
        head.setFriction(0);
        world.add(head);
      }
    }
    world.setEdges();
    world.setEdgesFriction(0);
    world.setEdgesRestitution(1);
  }
  public void update(){
    background(255);
    world.step();
    world.draw();
  }
}