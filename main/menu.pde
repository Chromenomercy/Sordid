
public class Menu extends State {
  private String state;
  private final int buttonW = int(width*0.2);
  private final int buttonH = int(height*0.07);
  private final int buttonGap = int(height*0.05);
  private final int topButton = int(height*0.3);
  
  Menu() {
    addImage("menuBackground.png", width, height);
  }
  
  public void begin(){
    setState("main");
  }
  
  public void setState(String newState){
    switch (newState){
    case "main":
      cp5.addButton("New Save").setSize(buttonW, buttonH).setPosition(width/2-buttonW/2, buttonH * 1 + buttonGap * 1 + topButton);
      cp5.addButton("Load Save").setSize(buttonW, buttonH).setPosition(width/2-buttonW/2, buttonH * 2 + buttonGap * 2 + topButton);
      cp5.addButton("Settings").setSize(buttonW, buttonH).setPosition(width/2-buttonW/2, buttonH * 3 + buttonGap * 3 + topButton);
      cp5.addButton("Exit").setSize(buttonW, buttonH).setPosition(width/2-buttonW/2, buttonH * 4 + buttonGap * 4 + topButton);
      break;
    }
    this.state = newState;
  }
  
  public void sendEvent(String e){
    switch(e){
    case "Exit":
      exit();
    }
  }
  
  public void update() {
    image(getImage("menuBackground.png"), 0, 0);
    switch(this.state){
    case "main":
    
    }
  }
}