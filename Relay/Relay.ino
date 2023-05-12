

// Recorded Dec 27, 2017 by Robojax
#define relay1 7
#define relay2 6
#define relay3 5
#define relay4 4
void setup() {
  
  Serial.begin(9600);// setup Serial Monitor to display information
  pinMode(relay1, OUTPUT);// connected to Relay 1
  pinMode(relay2, OUTPUT);// connected to Relay 2
  pinMode(relay3, OUTPUT);// connected to Relay 3
  pinMode(relay4, OUTPUT);// connected to Relay 4  

}

void loop() {

  digitalWrite(relay3,HIGH);// turn relay 3 ON
      Serial.println(" relay 3 ON");
  delay(3000);// keep in relay 3 On for 3 seconds
  digitalWrite(relay3, LOW);// turn relay 3 OFF
      Serial.println(" relay 3 OFF");
  delay(3000);// keep in relay 3 OFF for 3 seconds

digitalWrite(relay4,HIGH);// turn relay 3 ON
      Serial.println(" relay 3 ON");
  delay(3000);// keep in relay 3 On for 3 seconds
  digitalWrite(relay4, LOW);// turn relay 3 OFF
      Serial.println(" relay 3 OFF");
  delay(3000);// keep in relay 3 OFF for 3 seconds

digitalWrite(relay1,HIGH);// turn relay 3 ON
      Serial.println(" relay 3 ON");
  delay(3000);// keep in relay 3 On for 3 seconds
  digitalWrite(relay1, LOW);// turn relay 3 OFF
      Serial.println(" relay 3 OFF");
  delay(3000);// keep in relay 3 OFF for 3 seconds

digitalWrite(relay2,HIGH);// turn relay 3 ON
      Serial.println(" relay 3 ON");
  delay(3000);// keep in relay 3 On for 3 seconds
  digitalWrite(relay2, LOW);// turn relay 3 OFF
      Serial.println(" relay 3 OFF");
  delay(3000);// keep in relay 3 OFF for 3 seconds

}
