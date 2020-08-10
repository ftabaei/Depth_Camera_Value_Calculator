class Button {
  String buttonName;
  float x, y, buttonWidth, buttonHeight;
  int textSize, fillColor;
  Boolean buttonOver;

  Button(String tempName, float tempX, float tempY, float tempWidth, float tempHeight) {

    buttonName = tempName;
    x = tempX;
    y = tempY;
    buttonWidth = tempWidth;
    buttonHeight = tempHeight;
    textSize = width/80;
    buttonOver = false;
    fillColor = 150;
  }

  void update() {
    if (mouseX > x - buttonWidth/2 && mouseX < x + buttonWidth/2 &&
      mouseY > y - buttonHeight/2 && mouseY < y + buttonHeight/2) {
      buttonOver = true;
      stroke(150);
      fillColor = 90;
    } else {
      buttonOver = false;
      stroke(170);
      fillColor = 170;
    }
  }

  void display() {

    fill(fillColor);
    stroke(170);
    rect(x, y, buttonWidth, buttonHeight); 
    fill(0);
    textSize(textSize);
    text(buttonName, x-buttonWidth/4, y+buttonHeight/4);
  }
}
