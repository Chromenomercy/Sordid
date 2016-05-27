import controlP5.*;
import fisica.*;
import java.util.Dictionary;

ControlP5 cp5;
static HashMap<String, State> states = new HashMap<String, State>();
//Use setState
static String state = "menu";

class State{
  /* Base class for states to extend */
  public void update(){}
  public void begin(){}
  public void finish(){}
  public void sendEvent(String e){}
  public void sendKeyPress(char k){}
}

void setup(){
  fullScreen();
  frameRate(60);
  
  //Adds frame rate indicator to top right
  cp5 = new ControlP5(this);
  cp5.addFrameRate().setInterval(10).setPosition(0, 2);
  
  //States
  states.put("menu", new Menu());
  setState("menu");
  
}

static void setState(String newState){
  /* Use to change the state */
  //Finish old state
  states.get(state).finish();
  //Start new state
  states.get(newState).begin();
  //Change state
  state = newState;
}

public void keyPressed(){
  states.get(state).sendKeyPress(key);
}

public void controlEvent(ControlEvent theEvent) {
  states.get(state).sendEvent(theEvent.getController().getName());
}

void draw(){
  //Get the object for the current state
  states.get(state).update();
}