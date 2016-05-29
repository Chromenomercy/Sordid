List<String> blockNames = Arrays.asList("grass", "basalt", "chalk", "sandStone", "limeStone", "gravel", "dirt");
void initTextures(){
  PImage textures = loadImage("textures.png");
  
  int i = 0;
  for (String name:blockNames){
    images.put(name, textures.get(i*8, 0, 8, 8));
    i++;
  }
}