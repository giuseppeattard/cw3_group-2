import processing.io.*;

import oscP5.*;
import netP5.*;

OscP5 oscP5;

PImage stereotype1;
PImage stereotype2;
PImage stereotype3;
PImage stereotype4;

PImage artwork1;
PImage artwork2;
PImage artwork3;
PImage artwork4;
PImage artwork5;

float dist;

int i = 0;
int g = 0;

void setup() {
  size(800, 800);
  background(0);

stereotype1 = loadImage("persona2.jpg");
stereotype2 = loadImage("persona1.jpg");
stereotype3 = loadImage("persona4.jpg");
stereotype4 = loadImage("persona3.jpg");

artwork1 = loadImage("gf4.jpg");
artwork2 = loadImage("gf5.jpg");
artwork3 = loadImage("gf1.jpg");
artwork4 = loadImage("gf2.jpg");
artwork5 = loadImage("gf3.jpg");

 oscP5 = new OscP5(this,9000);

}

void draw(){
 noLoop();
  i++;
  if(i==5) i=0;
  
  g++;
  if(g==5) g=0;
  
  if (dist<30){
    if(i==0) image(stereotype1,0,0,800,800);
    else if(i==1) image(stereotype2,0,0,800,800);
    else if(i==2) image(stereotype3,0,0,800,800);
    else if(i==3) image(stereotype4,0,0,800,800);
   
  
}else{
    if(g==0) image(artwork1,0,0,800,800); 
    else if(g==1) image(artwork2,0,0,800,800);
    else if(g==2) image(artwork3,0,0,800,800);
    else if(g==3) image(artwork4,0,0,800,800);
    else if(g==4) image(artwork5,0,0,800,800);
    
  
}
}

void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  println(" value: "+theOscMessage.get(0).floatValue());
  dist = theOscMessage.get(0).floatValue();
}
