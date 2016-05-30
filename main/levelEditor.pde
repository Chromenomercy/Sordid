String mapName;
ArrayList<ArrayList> editorRects = new ArrayList<ArrayList>();

void setMapName(String n){
  if (n.equals("")){
    n = "_";
  }
  mapName = n;
  editorRects = loadMap(n);
}

class LevelEditor extends State{
  int xStart, yStart, xEnd, yEnd, wi, hi;
  String texture;
  final int buttonW = int(width*0.1);
  final int buttonH = int(height*0.05);
  final int buttonCX = int(width*0.1);
  final int buttonGap = int(width*0.01);
  
  LevelEditor(){
    // Add buttons
    int i = 0;
    for (String t:blockNames){
      i++;
      cp5.addButton(t).setPosition(buttonCX - buttonW/2, buttonH * i + buttonGap * i).setSize(buttonW, buttonH);
    }
    cp5.addButton("Export Save").setSize(buttonW, buttonH).setPosition(width-buttonW, buttonH);
    hideButtons();
  }
  public void begin(){
    showButtons();
    textureWrap(REPEAT);
    strokeWeight(2);
    texture = blockNames.get(1);
    xStart = mouseX;
    yStart = mouseY;
  }
  public void finish(){
    hideButtons();
    saveMap(mapName, editorRects);
    editorRects = new ArrayList<ArrayList>();
  }
  
  void hideButtons(){
    for (String t:blockNames){
      cp5.getController(t).hide();
    }
    cp5.getController("Export Save").hide();
  }
  void showButtons(){
    for (String t:blockNames){
      cp5.getController(t).show();
    }
    cp5.getController("Export Save").show();
  }
  
  public void update(){
    background(120);
    for (ArrayList rect:editorRects){
      Object t = rect.get(4);
      if (t != null){
        String t2 = t.toString();
        fill(0);
        beginShape();
        texture(getImage(t2));
        vertex((int)rect.get(0), (int)rect.get(1), 0, 0);
        vertex((int)rect.get(0)+(int)rect.get(2), (int)rect.get(1), (int)rect.get(2), 0);
        vertex((int)rect.get(0)+(int)rect.get(2), (int)rect.get(1)+(int)rect.get(3), (int)rect.get(2), (int)rect.get(3));
        vertex((int)rect.get(0), (int)rect.get(1)+(int)rect.get(3), 0, (int)rect.get(3));
        vertex((int)rect.get(0), (int)rect.get(1), 0, 0);
        endShape();
      }
    }
    if (mouseButton == LEFT){
      xEnd = mouseX;
      yEnd = mouseY;
      wi = Math.abs(xEnd-xStart);
      hi = Math.abs(yEnd-yStart);
      fill(120, 120, 120, 100);
      rect(min(xEnd, xStart), min(yEnd, yStart), wi, hi);
    } else if (mouseButton == RIGHT){
      xEnd = mouseX;
      yEnd = mouseY;
      wi = Math.abs(xEnd-xStart);
      hi = Math.abs(yEnd-yStart);
      stroke(255, 0, 0);
      fill(120, 0, 0, 100);
      rect(min(xEnd, xStart), min(yEnd, yStart), wi, hi);
      stroke(0, 0, 0);
    }
  }
  public void sendMousePressed(MouseEvent e){
    xStart = e.getX();
    yStart = e.getY();
  }
  public void sendMouseClick(MouseEvent e){
    if (e.getButton() == 39){
      ArrayList toBeDeld = new ArrayList();
      for (ListIterator<ArrayList> r = editorRects.listIterator(editorRects.size()); r.hasPrevious();){
        ArrayList rect = r.previous();
        if (e.getX() > int(rect.get(0).toString()) && e.getX() < int(rect.get(0).toString()) + int(rect.get(2).toString())){
          if (e.getY() > int(rect.get(1).toString()) && e.getY() < int(rect.get(1).toString()) + int(rect.get(3).toString())){
            toBeDeld.add(rect);
            break;
          }
        }
      }
      for (Object r:toBeDeld){
        editorRects.remove(r);
      }
    }
  }
  
  public void sendEvent(String e){
    if (blockNames.contains(e))
      texture = e;
    if (e == "Export Save"){
      exportMap(mapName, editorRects);
    }
  }
  public void sendMouseReleased(MouseEvent e){
    if(e.getButton() == 37 && (xEnd!=xStart||yEnd!=yStart)){
      ArrayList newRect = new ArrayList();
      newRect.add(min(xEnd, xStart));
      newRect.add(min(yEnd, yStart));
      newRect.add(wi);
      newRect.add(hi);
      newRect.add(texture);
      editorRects.add(newRect);
    } else if (e.getButton() == 39){
      ArrayList toBeDeld = new ArrayList();
      for (ListIterator<ArrayList> r = editorRects.listIterator(editorRects.size()); r.hasPrevious();){
        ArrayList rect = r.previous();
        if (min(xStart, xEnd) <= int(rect.get(0).toString()) && max(xStart, xEnd) >= int(rect.get(0).toString()) + int(rect.get(2).toString())){
          if (min(yStart, yEnd) <= int(rect.get(1).toString()) && max(yStart, yEnd) >= int(rect.get(1).toString()) + int(rect.get(3).toString())){
            toBeDeld.add(rect);
          }
        }
      }
      for (Object r:toBeDeld){
        editorRects.remove(r);
      }
    }
  }
  public void sendMouseDragged(MouseEvent e){
    
  }
}

class LevelEditorLoader extends State{
  final int buttonW = int(width*0.15);
  final int buttonH = int(height*0.05);
  final int buttonCX = int(width*0.5);
  final int buttonGap = int(height*0.01);
  String state;
  LevelEditorLoader(){
    cp5.addButton("New").setPosition(buttonCX - buttonW/2, buttonH).setSize(buttonW, buttonH);
    hideButton("New");
    cp5.addButton("Go").setPosition(buttonCX - buttonW/2, buttonH).setSize(buttonW, buttonH);
    hideButton("Go");
    cp5.addTextfield("Map Name").setPosition(buttonCX - buttonW/2, buttonH*2 + buttonGap*1).setSize(buttonW, buttonH);
    hideButton("Map Name");
  }
  void hideButton(String b){
    cp5.getController(b).hide();
  }
  void showButton(String b){
    cp5.getController(b).show();
  }
  public void begin(){
    showButton("New");
  }
  public void update(){
    image(getImage("menuBackground"), 0, 0);
  }
  public void sendEvent(String e){
    switch(e){
    case "New":
      hideButton("New");
      showButton("Map Name");
      showButton("Go");
      break;
    case "Go":
      hideButton("Go");
      hideButton("Map Name");
      setState("level editor");
      setMapName(cp5.get(Textfield.class, "Map Name").getText());
      break;
    }
  }
}