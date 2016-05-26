

public class Menu extends State{
  private String state = "main";
  Menu(){
    this.name = "menu";
  }
  
  public void update(){
    background(0);
    switch (this.state){
      case "main":
        break;
    }
  }
}