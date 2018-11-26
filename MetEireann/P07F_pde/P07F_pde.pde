final String dataSource = "CorkAirportMaxAirTemp-2017.csv";
final int DAYS_IN_YEAR = daysInYear(2017);
final int NUMBER_ACROSS = 30;
final int NUMBER_DOWN = DAYS_IN_YEAR / NUMBER_ACROSS + 1;

float [] temperatures;
color [] temperatureChart = { 0xFF8F00FF, 0xFF4B0082, 0xFF0000FF,
                              0xFF00FF00, 0xFFFFFF00, 0xFFFF7F00, 0xFFFF0000 };
float markerWidth, markerHeight;
float gapX, gapY;

String backgroundImage = "dawn-at-sea.jpg";
PImage wallpaper;

ButtonStrip buttonInterface;
final String [] buttonLabels = { "1968", "1978", "1988", "1998", "2008", "2018" };

void setup() {
 size(1600, 850);
  
  temperatures = getTemperatureDataFrom(dataSource);
  //print(temperatures);
  setGridParameters();
  
  wallpaper = loadImage(backgroundImage);
  
  buttonInterface = new ButtonStrip(buttonLabels);
  buttonInterface.setButtonColour(5);
  buttonInterface.setPosition((width - buttonInterface.getWidth()) / 2, height - buttonInterface.getHeight() - 10);
}
void setGridParameters() {  
  gapX = 10;
  gapY = 10;
  
  float availableWidth = width - 2 * gapX;
  float availableHeight = height - 2 * gapY;
  
  markerWidth = (availableWidth - gapX * (NUMBER_ACROSS - 1)) / NUMBER_ACROSS;
  markerHeight = (availableHeight - gapY * (NUMBER_DOWN -1 )) / NUMBER_DOWN;
}
void draw() {
  
  
    background(wallpaper);
  
  
  
  displayTemperatureChart();
  
  buttonInterface.draw();
}
void displayTemperatureChart() {
  float x = gapX, y = gapY;
  
  
  //go to new line
  for (int i = 0; i < temperatures.length; i += 1) {
   if (i != 0 && i % NUMBER_ACROSS == 0) {
     x = gapX;
     y += markerHeight + gapY;
     
   }
   fill(temperatureChart[temperatureCategory(temperatures[i])]);
   rect(x, y, markerWidth, markerHeight);
   
  x += markerWidth + gapX;
    
  }
}

int temperatureCategory(float t) {
  int c = 0;
  
  if (t < -5) {
    c = 0;
  }
  else if (t < 0) {
    c = 1;
  }
  else if (t < 5) {
    c = 2;
  }
  else if (t < 10) {
    c = 3;
  }
  else if (t < 18) {
    c = 4;
  }
  else if (t < 25) {
    c = 5;
  }
  else {
    c = 6;
  }
  
  return c;
}
