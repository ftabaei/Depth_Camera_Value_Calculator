Camera camera;
ArrayList <Button> button;
ArrayList <Slider> sliders;
void setup() {
  size (1200, 400, FX2D);
  camera = new Camera();
  button = new ArrayList<Button>();
  button.add(new Button("Reset", width/1.07, height/1.15, width/15, height/20)); 
  sliders = new ArrayList<Slider>();
  sliders.add(new Slider("Camera Matrix Column", 512, 100, 1000, 2*width/3 + 20, 0));
  sliders.add(new Slider("Camera Matrix Row", 424, 100, 1000, 2*width/3 + 20, height/9.0));
  sliders.add(new Slider("Tilt Angle", 0, -32, 14, 2*width/3 + 20, height/4.5));
  sliders.add(new Slider("Z depth Value (mm)", 4250, 500, 8000, 2*width/3 + 20, height/3.0));
  sliders.add(new Slider("Vertical View Angle", 60, 0, 160, 2*width/3 + 20, height/2.25));
  sliders.add(new Slider("Horizontal View Angle", 70, 0, 175, 2*width/3 + 20, height/1.8));
  sliders.add(new Slider("Camera Height (mm)", 3000, 0, 4000, 2*width/3 + 20, height/1.5));
}


void draw() {
  background(255);

  //UI settings
  stroke(0);
  fill(0);
  line(width/3, 0, width/3, height);
  textSize(width/80);
  text("Top", width/120, height/20);
  text("Side", width/120+width/3, height/20);
  rectMode(CORNER);
  rect(2*width/3, 0, width/3, height);
  line(width/3, height/1.3, 2*width/3, height/1.3); // floor line
  text("FLoor", width/3 + 20, height/1.24);
  fill(255);
  textSize(width/120);
  text("Default values are set for Kinect v2", width/1.11, height/1.1, 80, 30);

  camera.update();
  camera.XYCalculation();
  camera.tiltCorrection();
  camera.display();

  for (Button b : button) {
    b.update();
    b.display();
  }

  for (Slider s : sliders) {
    s.update();
    s.display();
  }
}

void mouseClicked() {
  for (Button b : button) {
    if (b.buttonOver == true) {
      for (Slider s : sliders) {
        if (s.name == "Camera Matrix Column") {
          s.value=512;
          s.sliderPos = map(s.value, s.min, s.max, s.x, s.x + s.sliderLength);
        }
        if (s.name == "Camera Matrix Row") {
          s.value=424;
          s.sliderPos = map(s.value, s.min, s.max, s.x, s.x + s.sliderLength);
        }
        if (s.name == "Tilt Angle") {
          s.value=0;
          s.sliderPos = map(s.value, s.min, s.max, s.x, s.x + s.sliderLength);
        }
        if (s.name == "Vertical View Angle") {
          s.value=60;
          s.sliderPos = map(s.value, s.min, s.max, s.x, s.x + s.sliderLength);
        }
        if (s.name == "Horizontal View Angle") {
          s.value=70;
          s.sliderPos = map(s.value, s.min, s.max, s.x, s.x + s.sliderLength);
        }
        if (s.name == "Camera Height (mm)") {
          s.value=3000;
          s.sliderPos = map(s.value, s.min, s.max, s.x, s.x + s.sliderLength);
        }
        if (s.name == "Z depth Value (mm)") {
          s.value=4250;
          s.sliderPos = map(s.value, s.min, s.max, s.x, s.x + s.sliderLength);
        }
      }
    }
  }
}
