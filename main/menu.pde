
public class Menu extends State {
  private String state = " ";
  private final int buttonW = int(width*0.2);
  private final int buttonH = int(height*0.07);
  private final int buttonGap = int(height*0.05);
  private final int topButton = int(height*0.3);
  
  Menu() {
    addImage("menuBackground.png", width, height);
    addButtons();
  }
  
  public void begin(){
    this.setState("main");
  }
  
  private void ajustVisibleButtons(String s, boolean visible){
    switch (s){
    case "main":
      if(visible){
        cp5.getController("New Save").show();
        cp5.getController("Load Save").show();
        cp5.getController("Settings").show();
        cp5.getController("Exit").show();
      }
      else{
        cp5.getController("New Save").hide();
        cp5.getController("Load Save").hide();
        cp5.getController("Settings").hide();
        cp5.getController("Exit").hide();
      }
      break;
    case "settings":
      if(visible)
      cp5.getController("Back").show();
      else
      cp5.getController("Back").hide();
      break;
    }
  }
  
  private void addButtons(){
    cp5.addButton("New Save").setSize(buttonW, buttonH).setPosition(width/2-buttonW/2, buttonH * 1 + buttonGap * 1 + topButton).setVisible(false);
    cp5.addButton("Load Save").setSize(buttonW, buttonH).setPosition(width/2-buttonW/2, buttonH * 2 + buttonGap * 2 + topButton).setVisible(false);
    cp5.addButton("Settings").setSize(buttonW, buttonH).setPosition(width/2-buttonW/2, buttonH * 3 + buttonGap * 3 + topButton).setVisible(false);
    cp5.addButton("Exit").setSize(buttonW, buttonH).setPosition(width/2-buttonW/2, buttonH * 4 + buttonGap * 4 + topButton).setVisible(false);
    cp5.addButton("Back").setSize(buttonW, buttonH).setPosition(width/2-buttonW/2, buttonH * 5 + buttonGap * 5 + topButton).setVisible(false);
  }
  
  public void setState(String newState){
    ajustVisibleButtons(state, false);
    ajustVisibleButtons(newState, true);
    this.state = newState;
  }
  
  public void sendKeyPress(char k){
    
  }
  
  public void sendEvent(String e){
    switch(e){
    case "Exit":
      exit();
      break;
    case "New Save":
      //TODO change this to state of game name
      //main.setState("game");
      break;
    case "Settings":
      this.setState("settings");
      break;
    case "Back":
      this.setState("main");
      break;
    }
  }
  
  public void update() {
    image(getImage("menuBackground.png"), 0, 0);
  }
}