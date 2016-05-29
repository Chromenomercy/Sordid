
private HashMap<String, PImage> images = new HashMap<String, PImage>();

void addImage(String fileName, int w, int h){
  PImage i = loadImage(fileName);
  String name = fileName.substring(0, fileName.lastIndexOf('.'));
  i.resize(w, h);
  this.images.put(name, i);
}
void addImage(String fileName){
  PImage i = loadImage(fileName);
  String name = fileName.substring(0, fileName.lastIndexOf('.'));
  this.images.put(name, i);
}
void displayImage(String fileName, int x, int y){
  image(getImage(fileName), x, y);
}
PImage getImage(String fileName){
  PImage i = this.images.get(fileName);
  return i;
}