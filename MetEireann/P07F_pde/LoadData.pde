float [] getTemperatureDataFrom(String dataSource) {
  String [] lines = loadStrings(dataSource);
  println("there are " + lines.length + " lines");
  
  float [] d = new float [lines.length];
  
  //if first year is pressed do this one
  for (int i = 0; i < d.length ; i += 1) { //
    String [] f = splitTokens(lines[i], ",");
    d[i] = float(f[4]);
  }
  /*

int variableOfInterest = ""
min button created and when that button is clicked the variable variableOfInterest is set to 0
max button created and when that button is clicked the variable variableOfInterest is set to 1
  for (int i = 0; i < d.length ; i += 1) {
    String [] f = splitTokens(lines[i], ",");
    if (variableOfInterest == 0){
    d[i] = float(f[2]);
    }
     if (variableOfInterest == 1){
    d[i] = float(f[4]);
    }
    
  }
  */
  
  return d;
}
  
//https://processing.org/examples/conditionals2.html

//for (init; test; update) { 
  //statements
//} 
  
//init  statement executed once when beginning loop
//test  if the test evaluates to true, the statements execute
//update  executes at the end of each iteration
//statements  collection of statements executed each time through the loop
