
private HashMap<String, PImage> images = new HashMap<String, PImage>();

void addImage(String fileName, int w, int h){
  PImage i = loadImage(fileName);
  i.resize(w, h);
  this.images.put(fileName, i);
}

PImage getImage(String fileName){
  PImage i = this.images.get(fileName);
  return i;
}