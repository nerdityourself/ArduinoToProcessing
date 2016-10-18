/*
@author NerdItYourself
@version 1.0, 18/10/2016
*/

int btnPin = 7;
int cnt = 0;

void setup(void)
{
  // Start serial port
  Serial.begin(115200);
  // Set digital pin mode
  pinMode(btnPin, OUTPUT);
  digitalWrite(btnPin, HIGH);

}
  
void loop(void)
{
  int digState = digitalRead(btnPin);
  
  if(digState == 0)
  {  
      cnt++;
      // Message that will be sent
      Serial.print("Message"); 
      Serial.print(",");     // this character will be used to separate the parts of the message
      Serial.print(cnt, DEC);
      Serial.println();     // this character will be used to identify the end of the message
      // Delay to avoid multilple message
      delay(500);  
  }
 
}


