//check this out for working with tables
//https://processing.org/reference/loadTable_.html
//https://processing.org/reference/Table.html

//final String dataSource = "CorkAirportMaxAirTemp-2017.csv";
final String dataSource = "dly3904.csv";
final int DAYS_IN_YEAR = daysInYear(2017);
final int NUMBER_ACROSS = 30;
final int NUMBER_DOWN = DAYS_IN_YEAR / NUMBER_ACROSS + 1;
Button button1;  // the button
int clk = 1;       // number of times the button is clicked

float [] temperatures;
color [] temperatureChart = { 0xFF8F00FF, 0xFF4B0082, 0xFF0000FF,
                              0xFF00FF00, 0xFFFFFF00, 0xFFFF7F00, 0xFFFF0000 };
                             
float markerWidth, markerHeight;
float gapX, gapY;

String backgroundImage = "dawn-at-sea.jpg";
PImage wallpaper;


//final String [] buttonLabels = { "1968", "1978", "1988", "1998", "2008", "2018" };

void setup() {
 size(1600, 850);
  
  temperatures = getTemperatureDataFrom(dataSource);
  print(temperatures);
  setGridParameters();
  
  wallpaper = loadImage(backgroundImage);
// create the button object
  button1 = new Button("1968", 600, 700, 100, 50);
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
 
// draw a square if the mouse curser is over the button
  if (button1.MouseIsOver()) {
   // rect(200, 20, 50, 50);
  }
  // draw the button in the window
  button1.Draw();
 // background(wallpaper);
  
}
void displayTemperatureChart() {
  float x = gapX, y = gapY;
  
  
  //go to new line
  for (int i = 0; i < temperatures.length; i += 1) {
   if (i != 0 && i % NUMBER_ACROSS == 0) {
     x = gapX;
     y += markerHeight + gapY;
     
   }
   fill(temperatureChart[temperatureCategory(temperatures[i])]); //instead of temperatures[i] you could you your data from your table
   rect(x, y, markerWidth, markerHeight);
   
  x += markerWidth + gapX;
    
  }
}

void mousePressed() {
if (button1.MouseIsOver()) {
  displayTemperatureChart();
    // print some text to the console pane if the button is clicked
    print("Clicked: ");
    println(clk++);
    updateDatasource();
  }
}

//could be used to update the datasource
void updateDatasource() {


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
