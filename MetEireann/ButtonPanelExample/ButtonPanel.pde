final int BUTTON_WIDTH = 90;
final int BUTTON_HEIGHT = BUTTON_WIDTH / 3 * 2;

final int HORIZONTAL_GAP = 20;
final int VERTICAL_GAP = 30;

/**
 * This class is used to create a multiple-exclusion scope for a set of buttons. 
 * Creating a set of buttons with a ButtonStrip object means that only one of the buttons in 
 * the group can be selected.
 * The presentation of a  ButtonStrip is a single horizontal row of buttons.
 */
class ButtonStrip {
  float x, y, w, h;
  int numberOfButtons; 
  color [] palette = { #618833, #8bc34a, #a2cf6e, #b28704, #ffc107, #ffcd38, #1769aa, #2196f3, #4dabf5 };
  int buttonColour = 0;
  String [] labels;
  PFont buttonFont;

  /**
   * Create a ButtonStrip object with n buttons determined from the number of labels.
   * The labels are assigned to the buttons from left to right.
   */
  ButtonStrip(String [] labels) {
    this.setLabels(labels);

    this.w = HORIZONTAL_GAP + this.numberOfButtons * (BUTTON_WIDTH + HORIZONTAL_GAP);
    this.h = VERTICAL_GAP * 2 + BUTTON_HEIGHT;

    this.buttonFont = createFont("Helvetica Neue", 20);
  }

  /**
   * Set the position of the ButtonStrip object.
   * It is the caller's responsibility to ensure the ButtonStrip object is visible.
   */
  void setPosition(float x, float y) {
    this.x = x;
    this.y = y;
  }

  float getWidth() {
    return this.w;
  }

  float getHeight() {
    return this.h;
  }

  /**
   * All buttons are drawn in the same colour.
   * Only colours within the ButtonStrip palette are allowed.
   */
  void setButtonColour(int n) {
    if (0 <= n && n < this.palette.length) {
      this.buttonColour = n;
    }
  }

  /**
   * Set the labels for each button left-to-right.
   */
  void setLabels(final String [] labels) {
    this.numberOfButtons = labels.length;
    this.labels = new String [labels.length];
    arrayCopy(labels, this.labels);
  }

  void draw() {
    this.drawBlurredRectangle(this.x, this.y, this.w, this.h);

    float x = this.x + HORIZONTAL_GAP;
    float y = this.y + VERTICAL_GAP;

    textAlign(CENTER, CENTER);
    textFont(this.buttonFont);
    noStroke();

    for (int i = 0; i < numberOfButtons; i += 1) {
      fill(palette[buttonColour]);
      rect(x, y, BUTTON_WIDTH, BUTTON_HEIGHT, 20);
      fill(0);
      text(this.labels[i], x + BUTTON_WIDTH / 2, y + BUTTON_HEIGHT / 2);
      x += (BUTTON_WIDTH + HORIZONTAL_GAP);
    }
  }

  /**
   * Returns the index of the selected button or -1 if no button is selected.
   */
  int pressed() {
    int b = -1;

    float x = this.x + HORIZONTAL_GAP;
    float y = this.y + VERTICAL_GAP;

    for (int i = 0; i < this.numberOfButtons; i += 1) {
      if (this.mouseInRectangle(x + i * (BUTTON_WIDTH + HORIZONTAL_GAP), y, BUTTON_WIDTH, BUTTON_HEIGHT)) {
        b = i;
      }
    }

    return b;
  }

  boolean mouseInRectangle(float x, float y, float w, float h) {
    return (mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y + h);
  }

  void drawBlurredRectangle(float x, float y, float w, float h) {
    PGraphics pg = createGraphics(int(w), int(h));

    pg.beginDraw();
    pg.image(get(int(x), int(y), int(w), int(h)), 0, 0);
    pg.filter(BLUR, 5);
    pg.endDraw();

    image(pg, x, y);
  }
}
