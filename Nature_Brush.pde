/* For this exercise, I used the mouse pressed and released functions to make plant brushes that draws stems and various plants
 when released. One of the more challenging aspects of my plan was to have the rotation of the plants match the rotational direction of
 the stems. I somewhat achieved this by having multiple if/else statements that would change the rotation of the flower arc based on 
 the value of mouseX-pmouseX. Overall, I would improve that aspect of the code if I could. Also add more variety to colors and size.
 */

boolean released = false;
String plantType = "FLOWER";
int rightrot = 0;
int brightness = 49;
int mbr = 85;


void setup () {
  //size(800, 800);
  frameRate(80);
  fullScreen();
  background(#CCCCCC);
}

//flower code
void flower () {
  strokeWeight(30);
  colorMode(HSB, 360, 100, 100);
  stroke(120, 17, brightness);
  strokeCap(ROUND);
  //rotation of stem
  if (mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    if (mouseX - pmouseX > 2 && mouseX - pmouseX < 15) {
      rightrot = 1;
    } else if (mouseX - pmouseX > 15) {
      rightrot = 2;
    } else if (mouseX - pmouseX < -2 && mouseX - pmouseX > -15) {
      rightrot = 3;
    } else if (mouseX - pmouseX < -15) {
      rightrot = 4;
    } else {
      rightrot = 0;
    }
  }
  noStroke();
  if (released) {
    if (plantType == "FLOWER") {
      float flowersize = random(100, 175);
      float hue = random(42, 46);
      float sat = random(2, 12);
      float polpos = random(mouseX-25, mouseX+25);
      fill(#E54B23);
      circle(mouseX, mouseY, flowersize/3);

      //pollen piece
      noFill();
      strokeWeight(3);
      stroke(#E54B23);
      bezier(polpos, mouseY - 100, random(mouseX-50, mouseX+50), mouseY - 50, random(mouseX-50, mouseX+50), mouseY-50, mouseX, mouseY);
      fill(#E54B23);
      circle(polpos, mouseY - 100, 10);

      //fill(#fef7e1);
      //flower code + rotation
      noStroke();
      fill(hue, sat, random(95, 100));
      if (rightrot == 1) {
        arc(mouseX, mouseY, flowersize, flowersize, radians(random(-10, 10)), radians(random(240, 260)));
      } else if (rightrot == 3) {
        arc(mouseX, mouseY, flowersize, flowersize, radians(random(-80, -60)), radians(random(190, 170)));
      } else if (rightrot == 2) {
        arc(mouseX, mouseY, flowersize, flowersize, radians(random(25, 45)), radians(random(275, 295)));
      } else if (rightrot == 4) {
        arc(mouseX, mouseY, flowersize, flowersize, radians(random(-115, -95)), radians(random(135, 155)));
      } else if (rightrot == 0) {
        arc(mouseX, mouseY, flowersize, flowersize, radians(random(-45, -25)), radians(random(205, 225)));
      }
      sat = random(2, 12);
      hue = random(42, 46);
    }
    released = false;
    filter(BLUR, 0.75);
    brightness = brightness + 1;
  }
}

//mushroom code
void mushroom () {
  //mushroom stem
  strokeWeight(random(55, 75));
  strokeCap(SQUARE);
  stroke(351, 66, mbr);
  if (mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  noStroke();
  if (released) {
    if (plantType == "MUSHROOM") {
      float mushrsize = random(125, 200);
      float mushrbr = random(70, 80);
      float mushrlineX = random(-30, 30);
      float mushrlineY = random(50, 125);
      colorMode(HSB, 360, 100, 100);
      fill(229, 58, mushrbr);
      //fill(#455FCD);
      //mushroom head
      arc(mouseX, mouseY, mushrsize, mushrsize, radians(180), radians(360));
      ellipse(mouseX, mouseY, mushrsize, mushrsize/3.5);
      strokeWeight(10);
      stroke(229, 58, mushrbr, 50);
      //stroke(#455FCD);
      //mushroom hanging lines
      for (int i = 0; i < random(2, 5); i++) {
        line(mouseX+mushrlineX, mouseY, mouseX+mushrlineX, mouseY+mushrlineY);
        circle(mouseX+mushrlineX, mouseY+mushrlineY, 10);
        mushrlineX = random(-65, 65);
        mushrlineY = random(30, 75);
      }
    }
    released = false;
    filter(BLUR, 0.75);
    mbr = mbr + 1;
  }
}

//grass code
void grass () {
  noStroke();
  colorMode(HSB, 360, 100, 100);
  fill(random(114, 118), random(38, 40), random(29, 31));
  //fill(#346A2E);
  if (mousePressed) {
    beginShape();
    vertex(mouseX, mouseY);
    bezierVertex(mouseX+25, mouseY+100, mouseX+120, mouseY, mouseX+50, mouseY+200);
    bezierVertex(mouseX+30, mouseY+100, mouseX, mouseY+150, mouseX-25, mouseY+100);
    endShape();
  }
  if (released) {
    fill(random(80, 95), random(38, 40), random(29, 31));
    bezier(mouseX+random(-10, 10), mouseY-random(75, 150), mouseX+random(-20, 20), mouseY, mouseX+random(-10, 10), mouseY-25, mouseX, mouseY+100);
    bezier(mouseX+random(-75, -30), mouseY-random(75, 150), mouseX+random(25, 50), mouseY, mouseX+random(-10, 10), mouseY-25, mouseX+10, mouseY+100);
    bezier(mouseX+random(30, 75), mouseY-random(75, 150), mouseX+random(-25, -50), mouseY, mouseX+random(-10, 10), mouseY-25, mouseX-10, mouseY+100);
  }
  released = false;
}

//buttons + plant type instances
void draw () {
  if (plantType == "FLOWER") {
    noStroke();
    fill(#CCCCCC);
    rect(45, 45, 405, 85, 50, 50, 50, 50);
    stroke(#43AA6A);
    strokeWeight(5);
    fill(#43AA6A, 50);
    rect(55, 55, 200, 65, 50, 50, 50, 50);
    noFill();
    rect(275, 55, 65, 65, 50, 50, 50, 50);
    rect(365, 55, 65, 65, 50, 50, 50, 50);
    fill(0);
    textSize(28);
    text("[1] FLOWER", 80, 98); 
    flower();
  }
  if (plantType == "MUSHROOM") {
    noStroke();
    fill(#CCCCCC);
    rect(45, 45, 405, 85, 50, 50, 50, 50);
    stroke(#43AA6A);
    strokeWeight(5);
    rect(55, 55, 65, 65, 50, 50, 50, 50);
    fill(#43AA6A, 50);
    rect(140, 55, 200, 65, 50, 50, 50, 50);
    noFill();
    rect(365, 55, 65, 65, 50, 50, 50, 50);
    fill(0);
    textSize(22.5);
    text("[2] MUSHROOM", 157, 96); 
    mushroom();
  }
  if (plantType == "GRASS") {
    noStroke();
    fill(#CCCCCC);
    rect(45, 45, 405, 85, 50, 50, 50, 50);
    stroke(#43AA6A);
    strokeWeight(5);
    noFill();
    rect(55, 55, 65, 65, 50, 50, 50, 50);
    rect(140, 55, 65, 65, 50, 50, 50, 50);
    fill(#43AA6A, 50);
    rect(225, 55, 200, 65, 50, 50, 50, 50);
    fill(0);
    textSize(28);
    text("[3] GRASS", 260, 98); 
    grass();
  }
  fill(0);
  textSize(15);
  text("[b/B] CLEAR", 60, 150);
  text("[SPACE] SAVE IMAGE", 275, 150);
}

void mousePressed() {
}

void mouseReleased() {
  released = true;
}

void keyPressed() {
  if (key == '1') {
    plantType = "FLOWER";
  }
  if (key == '2') {
    plantType = "MUSHROOM";
  }
  if (key == '3') {
    plantType = "GRASS";
  }
  if (key == ' ') {
    saveFrame("Workshop_3_###.jpg");
  }
  if (key == 'b'||key == 'B') {
    background(#CCCCCC);
  }
}
