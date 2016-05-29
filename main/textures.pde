
HashMap<String, PImage> textureMapping;

void initTextures(){
  String[] names = {"grass", "baslt", "chalk", "sandStone", "limeStone", "gravel", "dirt"};
  PImage textures = loadImage("textures.png");
  
  textureMapping = new HashMap();
  int i = 0;
  for (String name:names){
    textureMapping.put(name, textures.get(i*8, 0, 8, 8));
    i++;
  }
}