String backgroundImage = "dawn-at-sea.jpg";
PImage wallpaper;

ButtonStrip buttonInterface;
final String [] buttonLabels = { "1968", "1978", "1988", "1998", "2008", "2018" };

void setup() {
  size(2000, 1000);
  
  wallpaper = loadImage(backgroundImage);
  
  buttonInterface = new ButtonStrip(buttonLabels);
  buttonInterface.setButtonColour(5);
  buttonInterface.setPosition((width - buttonInterface.getWidth()) / 2, height - buttonInterface.getHeight() - 10);
}

void draw() {
  background(wallpaper);
  
  buttonInterface.draw();
}
