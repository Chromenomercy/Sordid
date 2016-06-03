
public class Menu extends State {
  private String state = " ";
  private final int buttonW = int(width*0.2);
  private final int buttonH = int(height*0.07);
  private final int buttonGap = int(height*0.05);
  private final int topButton = int(height*0.3);
  private String currentWeather = "";
  
  Menu() {
    addButtons();
    addImage("menuBackgrounds/clearDay.png", width, height);
    addImage("menuBackgrounds/clearNight.png", width, height);
    addImage("menuBackgrounds/cloudyDay.png", width, height);
    addImage("menuBackgrounds/cloudyNight.png", width, height);
    addImage("menuBackgrounds/mistDay.png", width, height);
    addImage("menuBackgrounds/mistNight.png", width, height);
    addImage("menuBackgrounds/rainDay.png", width, height);
    addImage("menuBackgrounds/rainNight.png", width, height);
    addImage("menuBackgrounds/thunderstorm.png", width, height);
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
        cp5.getController("Level Editor").show();
        cp5.getController("Exit").show();
      }
      else{
        cp5.getController("New Save").hide();
        cp5.getController("Load Save").hide();
        cp5.getController("Settings").hide();
        cp5.getController("Level Editor").hide();
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
    cp5.addButton("New Save").setSize(buttonW, buttonH).setPosition(width/2-buttonW/2, buttonH * 0 + buttonGap * 0 + topButton).setVisible(false);
    cp5.addButton("Load Save").setSize(buttonW, buttonH).setPosition(width/2-buttonW/2, buttonH * 1 + buttonGap * 1 + topButton).setVisible(false);
    cp5.addButton("Settings").setSize(buttonW, buttonH).setPosition(width/2-buttonW/2, buttonH * 2 + buttonGap * 2 + topButton).setVisible(false);
    cp5.addButton("Level Editor").setSize(buttonW, buttonH).setPosition(width/2-buttonW/2, buttonH * 3 + buttonGap * 3 + topButton).setVisible(false);
    cp5.addButton("Exit").setSize(buttonW, buttonH).setPosition(width/2-buttonW/2, buttonH * 4 + buttonGap * 4 + topButton).setVisible(false);
    cp5.addButton("Back").setSize(buttonW, buttonH).setPosition(width/2-buttonW/2, buttonH * 4 + buttonGap * 4 + topButton).setVisible(false);
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
      main.setState("game");
      ajustVisibleButtons(state, false);
      break;
    case "Settings":
      this.setState("settings");
      break;
    case "Back":
      this.setState("main");
      break;
    case "Level Editor":
      main.setState("level editor loader");
      ajustVisibleButtons(state, false);
      break;
    }
  }
  
  public void update() {
    currentWeather = getWeatherMain();
    displayMenuBackground(currentWeather);
  }
}

void displayMenuBackground(String cw){
    String b = "";
    switch(cw){
    case"01d":
      b = "menuBackgrounds/clearDay";
      break;
    case"01n":
      b = "menuBackgrounds/clearNight";
      break;
    case"02d":
      b = "menuBackgrounds/cloudyDay";
      break;
    case"03d":
      b = "menuBackgrounds/cloudyDay";
      break;
    case"04d":
      b = "menuBackgrounds/cloudyDay";
      break;
    case"02n":
      b = "menuBackgrounds/cloudyNight";
      break;
    case"03n":
      b = "menuBackgrounds/cloudyNight";
      break;
    case"04n":
      b = "menuBackgrounds/cloudyNight";
      break;
    case"09d":
      b = "menuBackgrounds/rainDay";
      break;
    case"10d":
      b = "menuBackgrounds/rainDay";
      break;
    case"09n":
      b = "menuBackgrounds/rainNight";
      break;
    case"10n":
      b = "menuBackgrounds/rainNight";
      break;
    case"11d":
      b = "menuBackgrounds/thunderstorm";
      break;
    case"11n":
      b = "menuBackgrounds/thunderstorm";
      break;
    case"50n":
      b = "menuBackgrounds/mistNight";
      break;
    case"50d":
      b = "menuBackgrounds/mistDay";
      break;
    }
    displayImage(b, 0, 0);
  }