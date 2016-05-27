
class LevelEditor extends State{
  int xStart, yStart, xEnd, yEnd, wi, hi;
  
  LevelEditor(){}
  
  public void update(){
    background(120);
    if (mouseButton == LEFT){
      fill(0);
      xEnd = mouseX;
      yEnd = mouseY;
      wi = Math.abs(xEnd-xStart);
      hi = Math.abs(yEnd-yStart);
      rect(Math.min(xEnd, xStart), Math.min(yEnd, yStart), wi, hi);
    }
  }
  public void sendMousePressed(MouseEvent e){
    xStart = e.getX();
    yStart = e.getY();
  }
  public void sendMouseDragged(MouseEvent e){
    
  }
}