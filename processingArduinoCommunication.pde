import processing.serial.*; 

Serial myPort;  // Create object from Serial class
String serial = null; // initialize the string to which the message will be assigned
int end = 10;    // the number 10 is ASCII for linefeed (end of serial.println), later we will look for this to break up individual messages
String message = "Waiting...";  // initial string that will be shown on the screen

void setup() {
 
  size(400, 400);
  myPort = new Serial(this, Serial.list()[0], 115200);
  //myPort.bufferUntil(end);    //Uncomment this if you want to use the second method proposed

}

void draw() { 

  background(255); 
  
  /* Comment all the line from while .. to serial = null; } .. if you want to use the second method proposed */
  while (myPort.available() > 0) { //as long as there is data coming from serial port, read it and store it 
    println("data available");
    serial = myPort.readStringUntil(end);
  }
  if (serial != null) {  //if the string is not empty, do the the following    
     
     println("serial != null");
     String[] a = split(serial, ',');  //a new array (called 'a') that stores values into separate cells (separated by commas specified in your Arduino program)
     message = a[0] + " " + a[1];
     serial = null;  
  }

    fill(50);
    textSize(32);
    text(message, 120, 200); 
 
}

// Uncomment serialEvent function if you want to use the second method proposed
//void serialEvent(Serial whichPort) {
//     println("event");
//     serial = whichPort.readStringUntil(end);
//     if (serial != null) {  //if the string is not empty, do the the following    
//         
//         println("serial != null");
//         String[] a = split(serial, ',');  //a new array (called 'a') that stores values into separate cells (separated by commas specified in your Arduino program)
//         message = a[0] + " " + a[1];
//         serial = null;  
//    }
//
//}

