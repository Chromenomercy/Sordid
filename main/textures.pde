
HashMap<String, PImage> textureMapping;

void initTextures(){
  addImage("grass.png");
  addImage("basalt.png");
  addImage("chalk.png");
  addImage("sandStone.png");
  addImage("limeStone.png");
  addImage("gravel.png");
  addImage("dirt.png");
  
  textureMapping = new HashMap();
  textureMapping.put("grass", images.get("grass.png"));
  textureMapping.put("basalt", images.get("basalt.png"));
  textureMapping.put("chalk", images.get("chalk.png"));
  textureMapping.put("sandStone", images.get("sandStone.png"));
  textureMapping.put("limeStone", images.get("limeStone.png"));
  textureMapping.put("gravel", images.get("gravel.png"));
  textureMapping.put("dirt", images.get("dirt.png"));
}