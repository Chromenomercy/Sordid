import controlP5.*;
import fisica.*;

ControlP5 cp5;
ArrayList<State> states = new ArrayList();
int state = 0;

class State{
  public String name;
  public void update(){}
}

void setup(){
  fullScreen();
  frameRate(60);
  cp5 = new ControlP5(this);
  cp5.addFrameRate().setInterval(10).setPosition(0, 2);
  
  //States
  states.add(new Menu());
}

void draw(){
  background(100);
  State stateObject = states.get(state);
  stateObject.update();
}