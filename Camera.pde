class Camera {  
  float x, y; //location of the object
  float col, row, alpha, beta, theta, Xk, Yk, Zk, Xr, Yr, Zr,camHeight; //kinect variables


  Camera () {
    x = 212;
    y = 256;
    Zk = 100;
    col = 512;
    row = 424;
    alpha = 35;
    beta = 30;
    theta = 0;
    camHeight=height/2;
  }

  void update() {
    // camera tilt
    for (Slider s : sliders) {
      if (s.name == "Camera Matrix Column") {
          col = s.value;
        }
        if (s.name == "Camera Matrix Row") {
          row = s.value;
        }
      if (s.name == "Tilt Angle") {
        theta = radians(s.value);
      }
      if (s.name == "Vertical View Angle") {
        beta = s.value/2;
      }
      if (s.name == "Horizontal View Angle") {
        alpha = s.value/2;
      }
      if (s.name == "Camera Height (mm)") {
        camHeight = map(s.value, 0, 4000, height/1.3, height/4) ;
      }
      if (s.name == "Z depth Value (mm)") {
        Zk = s.value;
      }
    }
  }

  void XYCalculation() {
    Xk = ((col/2-y+1) * Zk*tan(radians(alpha)))/(col/2);
    Yk = ((row/2-x+1) * Zk*tan(radians(beta)))/(row/2);
  }

  void tiltCorrection() {
    Yr = Zk * sin(radians(theta)) + Yk * cos(radians(theta));
    Zr = Zk * cos(radians(theta)) + Yk * sin(radians(theta));
  }

  void display () {

    // Camera Top view
    translate(width/15, height/2);
    rectMode(CENTER);
    rect(0, 0, width/30, width/10);
    line(0, 0, width/5, 0);     // Camera z axis
    pushMatrix();
    rotate(radians(alpha));
    stroke(0,200,200);
    line(0, 0, width/5, 0);
    popMatrix();
    pushMatrix();
    rotate(radians(-alpha));
    line(0, 0, width/5, 0);
    popMatrix();
    translate(-width/15, -height/2);


    // Camera Side view
    translate(width/2.5, camHeight);
    pushMatrix();
    rotate(-theta);
    rectMode(CENTER);
    stroke(0);
    rect(0, 0, width/30, width/30);
    line(0, 0, width/5, 0);     // Camera z axis
    pushMatrix();
    rotate(radians(beta));
    stroke(0,200,200);
    line(0, 0, width/5, 0);
    popMatrix();
    pushMatrix();
    rotate(radians(-beta));
    line(0, 0, width/5, 0);
    popMatrix();
    popMatrix();
    translate(-width/2.5, -camHeight);
    
    // Camera Calculations
    textSize(width/100);
    fill(255);
    text("Camera's matrix X , Y value: ", width/1.46, height/1.2);
    fill(255,255,0);
    text("Cam X = " + nf(Xk, 0, 2), width/1.46, height/1.15);
    text("Cam Y = " + nf(Yk, 0, 2), width/1.3, height/1.15);
    fill(255);
    text("Camera's Y , Z value after tilt correction: ", width/1.46, height/1.09);
    fill(0, 255, 255);
    text("Cam Y = " + nf(Yr, 0, 2), width/1.46, height/1.05);
    text("Cam Z = " + nf(Zr, 0, 2), width/1.3, height/1.05);
  }
}
