

public class Phys extends State{
  FWorld world;
  Phys(){
    name = "phys";
    world = new FWorld();
    FPoly p = new FPoly();
    p.vertex(-2, -20);
    p.vertex(2, -20);
    p.vertex(3, -18);
    p.vertex(3, -16);
    p.vertex(2, -14);
    p.vertex(2, -10);
    p.vertex(4, -10);
    p.vertex(5, 0);
    p.vertex(3, -9);
    p.vertex(3, 2);
    p.vertex(5, 19);
    p.vertex(4, 20);
    p.vertex(1, 4);
    p.vertex(-1, 4);
    p.vertex(-4, 20);
    p.vertex(-5, 19);
    p.vertex(-3, 2);
    p.vertex(-3, -9);
    p.vertex(-5, 0);
    p.vertex(-4, -10);
    p.vertex(-2, -10);
    p.vertex(-2, -14);
    p.vertex(-3, -16);
    p.vertex(-3, -18);
    p.setPosition(300, 100);
    world.add(p);
    p.setPosition(width/2, height/2);
    world.add(p);
    world.setEdges();
    world.remove(world.top);
    world.setEdgesFriction(1000);
    world.setEdgesRestitution(0);
  }
  public void update(){
    background(255);
    world.step();
    world.draw();
  }
}