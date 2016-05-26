import controlP5.*;
import fisica.*;

ControlP5 cp5;

void setup(){
  fullScreen();
  frameRate(60);
  cp5 = new ControlP5(this);
  cp5.addFrameRate().setInterval(10).setPosition(0, 2);
}

void draw(){
  
  drawMenu();
}