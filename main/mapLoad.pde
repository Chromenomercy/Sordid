
import java.io.BufferedWriter;
import java.io.FileWriter;

BufferedReader reader;
String fileName = "maps.txt";

String getAllFileText(){
  String existingData = "";
  String ln = "";
  reader = createReader(fileName);
  while (true) {
    try {
      ln = reader.readLine();
      if (ln.equals(null))break;
      existingData = existingData.concat(ln + "\r\n");
    }
    catch(IOException e) {
      break;
    }
    catch(NullPointerException e) {
      break;
    }
  }
  return existingData;
}

ArrayList<String> getMapNames(){
  String line = "";
  ArrayList<String> mapNames = new ArrayList<String>();
  reader = createReader(fileName);
  do {
    try {
      line = reader.readLine();
      if (line.substring(0, 2).equals("//")) {
        if (line.length() > 2){
          mapNames.add(line.substring(2));
        }
      }
    }
    catch(IOException e) {
      print(mapNames);
      return mapNames;
    }
    catch(NullPointerException e) {
      break;
    }
  } while (line != null);
  return mapNames;
}
void saveMap(String n, ArrayList<ArrayList> m) {
  String existingData = getAllFileText();
  PrintWriter output = createWriter("data/maps.txt");
  output.println("//" + n);
  for (ArrayList r:m){
    if (!r.get(2).toString().equals("0") && !r.get(3).toString().equals("0")){
      output.println(r.get(0).toString()+","+r.get(1).toString()+","+r.get(2).toString()+","+r.get(3).toString()+","+r.get(4));
    }
  }
  output.print(existingData);
  output.flush();
  output.close();
}

ArrayList<ArrayList> getMap() {
  ArrayList<ArrayList> map = new ArrayList<ArrayList>();
  String line = "";
  do {
    try {
      line = reader.readLine();
      if (line.substring(0, 2).equals("//")) {
        return map;
      } else {
        ArrayList nr = new ArrayList();
        String[] l = line.split(",");
        nr.add(int(l[0]));
        nr.add(int(l[1]));
        nr.add(int(l[2]));
        nr.add(int(l[3]));
        nr.add(l[4]);
        map.add(nr);
      }
    }
    catch(IOException e) {
      return map;
    }
    catch(NullPointerException e) {
      print("Error on maps");
      return map;
    }
  } while (line != null);
  return map;
}

ArrayList<ArrayList> loadMap(String n) {
  reader = createReader(fileName);
  String line = "";
  do {
    try {
      line = reader.readLine();
      if(line.equals(null))break;
      if (line.substring(0, 2).trim().equals("//")) {
        if (line.substring(2).trim().equals(n)) {
          return getMap();
        }
      }
    }
    catch(IOException e) {
      line = null;
    }
    catch(NullPointerException e) {
      
    }
  } while (line != null);
  //if no map with entered name is found:
  saveMap(n, new ArrayList());
  return new ArrayList<ArrayList>();
}

void appendTextToFile(String filename, String text) {
  File f = new File(dataPath(filename));
  if (!f.exists()) {
    createFile(f);
  }
  try {
    PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(f, true)));
    out.println(text);
    out.close();
  }
  catch (IOException e) {
    e.printStackTrace();
  }
}

void createFile(File f) {
  File parentDir = f.getParentFile();
  try {
    parentDir.mkdirs(); 
    f.createNewFile();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
}    