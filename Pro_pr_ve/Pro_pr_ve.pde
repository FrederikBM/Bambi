PImage sign;
PImage deer;

float e = 0; 
float q = 0;
boolean pilot=true;
boolean driving=true;
boolean lighting=true;
boolean constantMotion=false;


void setup() {
  size(900, 500);
  sign = loadImage("Sign.png");
  deer = loadImage("Deer.png");
}

void tegnBaggrund() {
  background(40, 10, 100);
  fill(0);
  rect(0, 350, 900, 200);
  fill(230, 230, 230);
  ellipse(700, 100, 80, 80);
  if((lighting==false)||(constantMotion==true)){
    rect(1019-q,290,10,60);
    image(sign,1000-q,260,50,50);
  }
}

void tegnGhostDeer() {
  if((lighting==false)||(constantMotion==true)){
  image(deer,1500-q,360,100,70);
  }
}

void tegnStriber() {
  for (int i=30; i<1300; i=i+400) {
    fill(255);
    rect(i-e, 400, 200, 20);
    if (driving==true) {
      e=e+0.5;
      if (e>400) {
        e=0;
      }
      if((lighting==false)||(constantMotion==true)){
      q=q+0.5;
      
      }
    }
  }
}

void tegnPilot() {
  fill(255);
  rect(450, 300, 50, 50);
  fill(200, 30, 100);
  ellipse(475, 340, 15, 25);
  fill(0);
  ellipse(475, 320, 15, 15);
}


void tegnBil() {
  fill(20, 180, 200);
  rect(300, 300, 200, 100); 
  fill(40, 40, 40);
  ellipse(340, 400, 50, 50);
  ellipse(460, 400, 50, 50);
  fill(100);
  ellipse(500, 370, 20, 20);
  if (lighting==true) {
    noStroke();
    fill(255, 255, 0);
    ellipse(500, 370, 20, 20);
    fill(255, 255, 0, 150);
    triangle(500, 370, 580, 410, 580, 330);
    stroke(0);
  }
}

void constantMotion(){
if(lighting==false){
constantMotion=true;
}
}

void draw() {
  clear();
  constantMotion();
  tegnBaggrund();
  tegnStriber();
  tegnGhostDeer();
  tegnBil();
  tegnPilot();
}

void mouseReleased() {

  if ((500 >= mouseX)&&(mouseX >= 450)&&(350>=mouseY )&&(mouseY >= 300)&&(pilot==true)) {
    pilot=false;
    driving=false;
  } else if ((500 >= mouseX)&&(mouseX >= 450)&&(350>=mouseY )&&(mouseY >= 300)&&(pilot==false)) {
    pilot=true;
    driving=true;
  }

  if ((520 >= mouseX)&&(mouseX >= 480)&&(390>=mouseY )&&(mouseY >= 350)&&(lighting==true)) {
    lighting=false;
  } else if ((520 >= mouseX)&&(mouseX >= 480)&&(390>=mouseY )&&(mouseY >= 350)&&(lighting==false)) {
    lighting=true;
  }
}
