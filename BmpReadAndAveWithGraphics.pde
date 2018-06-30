import processing.serial.*;

Serial myPort;
String val;
Float altitudeCurrent;
int bmpPos;

float bmpAveValue;
float[] bmpAve = new float[10];

void setup()
{
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  
  size(1600, 1200);
}


void draw()
{
  background(0);
  
  
  if (bmpPos == 10)
  {
   bmpPos = 0;
  }
  
  if (myPort.available() > 0)
  {
    val = myPort.readStringUntil('\n');
  }
  
  if (val == null){  //if no value from port
    println("null");
  }
  else  //Main code here
  {
    Float altitudeCurrent = float(val);
    
    bmpAve[bmpPos] = altitudeCurrent;
    
    bmpAveValue = (bmpAve[0] + bmpAve[1] + bmpAve[2] + bmpAve[3] + bmpAve[4] + bmpAve[5] + bmpAve[6] + bmpAve[7] + bmpAve[8] + bmpAve[9])/10;
    
    println(bmpAveValue);
    
    bmpPos = bmpPos + 1;
    
  }
  
  stroke(255);
    strokeWeight(2);
    line(0, 600, 1600, 600);
    line(80, 500, 220, 500);
    line(80, 400, 220, 400);
    line(80, 300, 220, 300);
    
    line(90, 550, 210, 550);
    line(90, 450, 210, 450);
    line(90, 350, 210, 350);
    
    rect(100, 600, 100, -bmpAveValue*10);
  
  
  
  delay(50);
}