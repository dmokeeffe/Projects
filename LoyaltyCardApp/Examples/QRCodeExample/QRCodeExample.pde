import processing.video.*;

String decodedText;
Capture webCamera;

void setup() {
  size(1024, 768);
  startCamera();
}

void draw() {
  background(255);

  if (webCamera.available() == true) {
    webCamera.read();
  }
  image(webCamera, 0, 0);
}

void decodeQRCode(PImage img) {
  BarCodeReader qrReader = new BarCodeReader(img);
  println(qrReader.decode());
}

void keyPressed() {
  if (key == ' ') {
    PImage scr = get(0, 0, width, height);
    decodeQRCode(scr);
  }
}

void startCamera() {
  String[] cameras = Capture.list();

  if (cameras.length != 0) {
    webCamera = new Capture(this, cameras[0]);
    webCamera.start();
  }
}
