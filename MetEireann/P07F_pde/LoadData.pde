float [] getTemperatureDataFrom(String dataSource) {
  String [] lines = loadStrings(dataSource);
  
  float [] d = new float [lines.length];
  
  for (int i = 0; i < d.length; i += 1) {
    String [] f = splitTokens(lines[i], ",");
    d[i] = float(f[1]);
  }
  
  return d;
}
