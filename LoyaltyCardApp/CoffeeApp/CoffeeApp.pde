import com.cage.zxing4p3.*;

import processing.video.*;

import qrcodeprocessing.*;

import processing.dxf.*;

import com.cage.zxing4p3.*;

import qrcodeprocessing.*;

import com.cage.zxing4p3.*;

import processing.video.*;

import http.requests.*;

String decodedText;
Capture webCamera;
JSONObject json; 
String currentNumberOfStamps;
String id;
int currentNumberOfStampsInt;
PImage emptyCup;
PImage fullCup;
String requestStatus = "failed";
String runOnce = "Y";
PImage empty_card;
PImage stamp1;
PImage stamp2;
PImage stamp3;
PImage stamp4;
PImage stamp5;
PImage stamp6;
PImage stamp7;
PImage stamp8;
PImage stamp9;
PImage free_coffee;

void setup() {
  background(255);
  size(1024, 768);
  startCamera();
  empty_card = loadImage("empty_card.PNG"); //load the image
  stamp1 = loadImage("1_stamp.PNG"); //load the image
  stamp2 = loadImage("2_stamp.PNG"); //load the image
  stamp3 = loadImage("3_stamp.PNG"); //load the image
  stamp4 = loadImage("4_stamp.PNG"); //load the image
  stamp5 = loadImage("5_stamp.PNG"); //load the image
  stamp6 = loadImage("6_stamp.PNG"); //load the image
  stamp7 = loadImage("7_stamp.PNG"); //load the image
  stamp8 = loadImage("8_stamp.PNG"); //load the image
  stamp9 = loadImage("9_stamp.PNG"); //load the image
  free_coffee = loadImage("free_coffee.PNG"); //load the image
}

void draw() {

  if (webCamera.available() == true && requestStatus == "failed") {
    webCamera.read();
    image(webCamera, 0, 0);
  }

  if (requestStatus == "success" && runOnce == "Y") {
    runOnce = "N";
    showCard();
  }
}

void decodeQRCode(PImage img) {
  BarCodeReader qrReader = new BarCodeReader(img);
  json = parseJSONObject(qrReader.decode());
  println(json);
  id = json.getString("ID");
  println("decodeQRCode method finished");
  getStamp(id);
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

void getStamp(String id) {

  println(id);
  String url = "https://cs1.ucc.ie/~iw2/voucher/";
  url = url + id;
  GetRequest get = new GetRequest(url);
  println("request method finished");
  get.send();
  currentNumberOfStamps = get.getContent();
  currentNumberOfStampsInt = Integer.parseInt(currentNumberOfStamps); 
  if (currentNumberOfStamps != null) {
    requestStatus = "success";
  } else {
    requestStatus = "failed";
  }
  println("Request status: " + requestStatus);
  println("Reponse Content: " + currentNumberOfStamps);

  if (currentNumberOfStampsInt >= 10) { 
    clearCard();
  } else { 
    println("Need to pay this time!");
  } 

  stopCamera(); // stop camera
}

void clearCard() {
  println("free coffee!!");

  String url = "https://cs1.ucc.ie/~iw2/reset/";
  url = url + id;
  GetRequest get = new GetRequest(url);
  println("reset method finished");
  get.send();
  currentNumberOfStamps = get.getContent();
  println("Card being cleared");
  println("Reponse Content: " + currentNumberOfStamps);
  /*  exit(); */
}


void showCard() {

  println("showCard method starting");
  background(255);
  //decide which image to use
  if (currentNumberOfStampsInt == 1) {
    image(stamp1, 0, 0);
  }
  if (currentNumberOfStampsInt == 2) {
    image(stamp2, 0, 0);
  }
  if (currentNumberOfStampsInt == 3) {
    image(stamp3, 0, 0);
  }
  if (currentNumberOfStampsInt == 4) {
    image(stamp4, 0, 0);
  }
  if (currentNumberOfStampsInt == 5) {
    image(stamp5, 0, 0);
  }
  if (currentNumberOfStampsInt == 6) {
    image(stamp6, 0, 0);
  }
  if (currentNumberOfStampsInt == 7) {
    image(stamp7, 0, 0);
  }
  if (currentNumberOfStampsInt == 8) {
    image(stamp8, 0, 0);
  }
  if (currentNumberOfStampsInt == 9) {
    image(stamp9, 0, 0);
  }
  if (currentNumberOfStampsInt > 9) {
    image(free_coffee, 0, 0);
    println("Free coffee - No need to pay!");
  }

  println("showCard method finished");
}

void stopCamera() {

  webCamera.stop(); // stop camera
}
