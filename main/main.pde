import controlP5.*;
import fisica.*;

ControlP5 cp5;
ArrayList<State> states = new ArrayList();
//Use setState
String state = "phys";

class State{
  /* Base class for states to extend */
  public String name;
  public void update(){}
  public void begin(){}
  public void finish(){}
}

void setup(){
  Fisica.init(this);
  fullScreen();
  frameRate(60);
  
  //Adds frame rate indicator to top right
  cp5 = new ControlP5(this);
  cp5.addFrameRate().setInterval(10).setPosition(0, 2);
  
  //States
  states.add(new Menu());
  states.add(new Phys());
  
}

void setState(String newState){
  /* Use to change the state */
  //Finish old state
  for (State stateObject : states){
    if (stateObject.name == state){
      stateObject.finish();
    }
  }
  //Start new state
  for (State stateObject : states){
    if (stateObject.name == newState){
      stateObject.begin();
    }
  }
  //Change state
  state = newState;
}

void draw(){
  //Get the object for the current state
  for (State stateObject : states){
    if (stateObject.name == state){
      //Update the current state
      stateObject.update();
    }
  }
}