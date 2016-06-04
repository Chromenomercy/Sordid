

public class Player{
  int state = 0;
  int animStart = 0;
  FCompound entity;
  FCircle head;
  FBox body;
  FBox armL1;
  FBox armR1;
  FBox legL1;
  FBox legR1;
  FBox armL2;
  FBox armR2;
  FBox legL2;
  FBox legR2;
  int W = 75;
  int H = 150;
  Player(int x, int y){
    addImage("limb.png");
    addImage("body.png");
    head = new FCircle(25);
    head.setPosition(0, -12);
    head.setFill(color(0));
    
    body = new FBox(10, 60);
    body.setPosition(0, 30);
    body.attachImage(getImage("body"));
    body.setNoStroke();
    body.setNoFill();
    
    armL1 = new FBox(10, 30);
    armL1.setRotation(radians(45));
    armL1.setPosition(-7, 10);
    armL1.attachImage(getImage("limb"));
    armL1.setNoStroke();
    armL1.setNoFill();
    
    armL2 = new FBox(10, 30);
    armL2.setRotation(radians(45));
    armL2.setPosition(-25, 28);
    armL2.attachImage(getImage("limb"));
    armL2.setNoStroke();
    armL2.setNoFill();
    
    armR1 = new FBox(10, 30);
    armR1.setPosition(7, 10);
    armR1.setRotation(radians(-45));
    armR1.attachImage(getImage("limb"));
    armR1.setNoStroke();
    armR1.setNoFill();
    
    armR2 = new FBox(10, 30);
    armR2.setPosition(25, 28);
    armR2.setRotation(radians(-45));
    armR2.attachImage(getImage("limb"));
    armR2.setNoStroke();
    armR2.setNoFill();
    
    legL1 = new FBox(10, 30);
    legL1.setRotation(radians(45));
    legL1.setPosition(-7, 62);
    legL1.attachImage(getImage("limb"));
    legL1.setNoStroke();
    legL1.setNoFill();
    
    legL2 = new FBox(10, 30);
    legL2.setRotation(radians(45));
    legL2.setPosition(-25, 80);
    legL2.attachImage(getImage("limb"));
    legL2.setNoStroke();
    legL2.setNoFill();
    
    legR1 = new FBox(10, 30);
    legR1.setRotation(radians(-45));
    legR1.setPosition(7, 62);
    legR1.attachImage(getImage("limb"));
    legR1.setNoStroke();
    legR1.setNoFill();
    
    legR2 = new FBox(10, 30);
    legR2.setRotation(radians(-45));
    legR2.setPosition(25, 80);
    legR2.attachImage(getImage("limb"));
    legR2.setNoStroke();
    legR2.setNoFill();
    
    entity = new FCompound();
    entity.addBody(head);
    entity.addBody(body);
    entity.addBody(armL1);
    entity.addBody(armR1);
    entity.addBody(legL1);
    entity.addBody(legR1);
    entity.addBody(armL2);
    entity.addBody(armR2);
    entity.addBody(legL2);
    entity.addBody(legR2);
    entity.setPosition(x, y);
    entity.setRotatable(false);
    
  }
  public void update(){
  }
}