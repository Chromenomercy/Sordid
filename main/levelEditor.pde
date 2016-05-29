
class LevelEditor extends State{
  int xStart, yStart, xEnd, yEnd, wi, hi;
  ArrayList<ArrayList> rects = new ArrayList();
  String texture;
  final int buttonW = int(width*0.1);
  final int buttonH = int(height*0.05);
  final int buttonCX = int(width*0.1);
  final int buttonGap = int(width*0.01);
  
  LevelEditor(){
    // Add buttons
    int i = 0;
    for (String t:textureMapping.keySet()){
      i++;
      cp5.addButton(t).setPosition(buttonCX - buttonW/2, buttonH * i + buttonGap * i).setSize(buttonW, buttonH);
    }
    hideButtons();
  }
  public void begin(){
    showButtons();
  }
  public void finish(){
    hideButtons();
  }
  
  void hideButtons(){
    for (String t:textureMapping.keySet()){
      cp5.getController(t).hide();
    }
  }
  void showButtons(){
    for (String t:textureMapping.keySet()){
      cp5.getController(t).show();
    }
  }
  
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
  public void sendMouseClick(MouseEvent e){
    if (e.getButton() == 39){
      ArrayList toBeDeld = new ArrayList();
      for (Iterator<ArrayList> r = rects.iterator(); r.hasNext();){
        ArrayList rect = r.next();
        if (e.getX() > int(rect.get(0).toString()) && e.getX() < int(rect.get(0).toString()) + int(rect.get(2).toString())){
          if (e.getY() > int(rect.get(1).toString()) && e.getY() < int(rect.get(1).toString()) + int(rect.get(3).toString())){
            toBeDeld.add(rect);
          }
        }
      }
      for (Object r:toBeDeld){
        rects.remove(r);
      }
    }
  }
  
  public void sendEvent(String e){
    if (textureMapping.containsKey(e))
      texture = e;
  }
  public void sendMouseReleased(MouseEvent e){
    if(e.getButton() == 37){
      ArrayList newRect = new ArrayList();
      newRect.add(min(xEnd, xStart));
      newRect.add(min(yEnd, yStart));
      newRect.add(wi);
      newRect.add(hi);
      newRect.add(texture);
      rects.add(newRect);
    }
  }
  public void sendMouseDragged(MouseEvent e){
    
  }
}

class LevelEditorLoader extends State{
  String state;
  LevelEditorLoader(){
    cp5.addButton("New");
    hideButton("New");
  }
  public void sendEvent(String e){
    switch(e){
    case "New":
      
      break;
    }
  }
}