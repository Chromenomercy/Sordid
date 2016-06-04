

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
  Player(int x, int y){
    head = new FCircle(25);
    head.setFill(color(0));
    
    body = new FBox(10, 60);
    body.setPosition(0, 42);
    body.setNoStroke();
    body.setNoFill();
    
    armL = new FBox(10, 50);
    armL.setPosition(-20, 30);
    armL.setRotation(radians(45));
    armL.setNoStroke();
    armL.setNoFill();
    
    armR = new FBox(10, 50);
    armR.setPosition(20, 30);
    armR.setRotation(radians(-45));
    armR.setNoStroke();
    armR.setNoFill();
    
    legL = new FBox(10, 50);
    legL.setRotation(radians(-45));
    legL.setPosition(18, 90);
    legL.setNoStroke();
    legL.setNoFill();
    
    legR = new FBox(10, 50);
    legR.setRotation(radians(45));
    legR.setPosition(-18, 90);
    legR.setNoStroke();
    legR.setNoFill();
    
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
  }
}