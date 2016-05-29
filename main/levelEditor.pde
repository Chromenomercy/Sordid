
class LevelEditor extends State{
  int xStart, yStart, xEnd, yEnd, wi, hi;
  ArrayList<ArrayList> rects = new ArrayList();
  char texture;
  
  LevelEditor(){}
  
  public void update(){
    background(120);
    if (mouseButton == LEFT){
      xEnd = mouseX;
      yEnd = mouseY;
      wi = Math.abs(xEnd-xStart);
      hi = Math.abs(yEnd-yStart);
      fill(120, 120, 120, 100);
      rect(min(xEnd, xStart), min(yEnd, yStart), wi, hi);
    }
    for (ArrayList rect:rects){
      fill(0);
      rect(int(rect.get(0).toString()), int(rect.get(1).toString()), int(rect.get(2).toString()), int(rect.get(3).toString()));
    }
  }
  public void sendMousePressed(MouseEvent e){
    xStart = e.getX();
    yStart = e.getY();
  }
  public void sendMouseReleased(MouseEvent e){
    ArrayList newRect = new ArrayList();
    newRect.add(min(xEnd, xStart));
    newRect.add(min(yEnd, yStart));
    newRect.add(wi);
    newRect.add(hi);
    newRect.add(texture);
    rects.add(newRect);
  }
  public void sendMouseDragged(MouseEvent e){
    
  }
}