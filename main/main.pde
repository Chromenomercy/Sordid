import controlP5.*;
import fisica.*;

ControlP5 cp5;
ArrayList<State> states = new ArrayList();
int state = 0;

class State{
  /* Base class for states to extend */
  public String name;
  public void update(){}
}

void setup(){
  fullScreen();
  frameRate(60);
  
  //Adds frame rate indicator to top right
  cp5 = new ControlP5(this);
  cp5.addFrameRate().setInterval(10).setPosition(0, 2);
  
  //States
  states.add(new Menu());
}

void draw(){
  //Get the object for the current state
  State stateObject = states.get(state);
  //Update the current state
  stateObject.update();
}