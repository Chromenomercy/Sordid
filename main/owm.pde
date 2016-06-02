import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

HttpURLConnection urlConnection;
BufferedReader readerOWM;
JSONObject jObj;

// Will contain the raw JSON response as a string.
String forecastJsonStr;
String cityName = "London";

String getWeatherMain(){
  String f = "01d";
  if (updateForcast()==0){
    jObj = parseJSONObject(forecastJsonStr);
    f = jObj.getJSONArray("weather").getJSONObject(0).getString("icon");
  }
  else {
    print("Error on updating forcast");
  }
  return f;
}
int updateForcast(){
  try {
    // Construct the URL for the OpenWeatherMap query
    // Possible parameters are avaiable at OWM's forecast API page, at
    // http://openweathermap.org/API#forecast
    URL url = new URL("http://api.openweathermap.org/data/2.5/weather?q="+cityName+"&APPID=cfec1fbb934ff73c5f8e98334a0ca568");
  
    // Create the request to OpenWeatherMap, and open the connection
    urlConnection = (HttpURLConnection) url.openConnection();
    urlConnection.setRequestMethod("GET");
    urlConnection.connect();
  
    // Read the input stream into a String
    InputStream inputStream = urlConnection.getInputStream();
    StringBuffer buffer = new StringBuffer();
    if (inputStream == null) {
      // Nothing to do.
      return -1;
    }
    readerOWM = new BufferedReader(new InputStreamReader(inputStream));
  
    String line;
    while ((line = readerOWM.readLine()) != null) {
        // Since it's JSON, adding a newline isn't necessary (it won't affect parsing)
        // But it does make debugging a lot easier if you print out the completed
        // buffer for debugging.
        buffer.append(line + "\n");
    }
  
    if (buffer.length() == 0) {
      return -1;
      // Stream was empty.  No point in parsing.
    }
    forecastJsonStr = buffer.toString();
    //print(forecastJsonStr);
  } 
  catch (IOException e) {
    // If the code didn't successfully get the weather data, there's no point in attemping
    // to parse it.
  } finally{
    if (urlConnection != null) {
      urlConnection.disconnect();
    }
    if (readerOWM != null) {
      try {
        readerOWM.close();
      } catch (final IOException e) {
        return -1;
      }
    }
  }
  return 0;
}