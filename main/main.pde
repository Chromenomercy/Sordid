import org.dishevelled.processing.frames.*;

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
  public void sendMouseClick(MouseEvent e){}
  public void sendMouseDragged(MouseEvent e){}
  public void sendMouseMoved(MouseEvent e){}
  public void sendMouseReleased(MouseEvent e){}
  public void sendMouseWheel(MouseEvent e){}
  public void sendMousePressed(MouseEvent e){}
  public void sendKeyReleased(KeyEvent e){}
  public void sendKeyTyped(KeyEvent e){}
}

void setup(){
  Fisica.init(this);
  fullScreen();
  frameRate(60);
  
  //Adds frame rate indicator to top right
  cp5 = new ControlP5(this);
  cp5.addFrameRate().setInterval(10).setPosition(0, 2);
  
  //States
  states.put("menu", new Menu());
  states.put("game", new Game());
  states.put("level editor", new LevelEditor());
  setState("menu");
  
}

//Event handling
public void keyPressed(){
  //if (key==27) key=0;
  states.get(state).sendKeyPress(key);
}
public void mouseClicked(MouseEvent e){
  states.get(state).sendMouseClick(e);
}
public void mouseDragged(MouseEvent e){
  states.get(state).sendMouseDragged(e);
}
public void mouseMoved(MouseEvent e){
  states.get(state).sendMouseMoved(e);
}
public void mouseReleased(MouseEvent e){
  states.get(state).sendMouseReleased(e);
}
public void mouseWheel(MouseEvent e){
  states.get(state).sendMouseWheel(e);
}
public void mousePressed(MouseEvent e){
  states.get(state).sendMousePressed(e);
}
public void keyReleased(KeyEvent e){
  states.get(state).sendKeyReleased(e);
}
public void keyTyped(KeyEvent e){
  states.get(state).sendKeyTyped(e);
}

public void controlEvent(ControlEvent theEvent) {
  states.get(state).sendEvent(theEvent.getController().getName());
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

void draw(){
  //Get the object for the current state
  states.get(state).update();
}