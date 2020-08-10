class Slider {
  float x;
  float y;
  float sliderPos;
  float sliderLength;
  float slider_width = width/25;
  float slider_height = height/30;
  int min;
  int max;
  int value;
  int range;
  String name;
  boolean over = false;


  Slider (String tempText, int valTemp, int tempMin, int tempMax, float tempX, float tempY) {
    x = tempX;
    y = tempY;
    min = tempMin;
    max = tempMax;
    range= max - min;
    //value = (min + max)/2;
    value = valTemp;
    sliderLength = width/3.5;
    sliderPos = map(value, min, max, x, x + sliderLength);
    name = tempText;
  }

  void update () {

    if ((over) && (mousePressed)) {
      sliderPos = mouseX;
      value = (int) map(sliderPos, x, x + sliderLength, min, max);


      if (value <= min) {
        value = min;
        over = false;
        sliderPos = x;
      }
      if (value >= max) {
        value = max;
        over = false;
        sliderPos = x + sliderLength;
      }
    }

    if (mouseX > sliderPos - (slider_width)/2 && mouseX < sliderPos + (slider_width)/2 &&
        mouseY > y - (slider_height)/2 + height/13 && mouseY < y + (slider_height)/2 + height/13) {
      fill(200);
      over = true;
    } else {
      fill(255);
      over = false;
    }
  }

  void display() {

    textSize(width/100);
    text(name, x, y+height/20);
    text(min, x, y+height/8.5);
    text(max, x + sliderLength-10, y+height/8.5);
    stroke(255);
    line (x, y+height/13, x + sliderLength, y+height/13);
    rectMode(CENTER);
    rect(sliderPos, y+height/13, slider_width, slider_height);
    fill(0);
    text(value, sliderPos-20, y+height/11.5);
  }
}
