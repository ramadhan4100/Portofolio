#include <Servo.h>
Servo motorServo; 

 const unsigned long eventTime_4 = 5000;
 unsigned long previousTime_4 = 0;
// constants won't change
const int TRIG_PIN  = 16; // Arduino pin connected to Ultrasonic Sensor's TRIG pin
const int ECHO_PIN  = 17; // Arduino pin connected to Ultrasonic Sensor's ECHO pin
const int RELAY_PIN = 21; // Arduino pin connected to Relay's pin
const int DISTANCE_THRESHOLD = 10; // centimeters

// variables will change:
float duration_us, distance_cm;

void setup() {
  Serial.begin (115200);        // initialize serial port
  motorServo.attach(25); // servo Pada Pin digital
  pinMode(TRIG_PIN, OUTPUT);  // set arduino pin to output mode
  pinMode(ECHO_PIN, INPUT);   // set arduino pin to input mode
  pinMode(RELAY_PIN, OUTPUT); // set arduino pin to output mode
}

void loop() {
  // generate 10-microsecond pulse to TRIG pin
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);

  // measure duration of pulse from ECHO pin
  duration_us = pulseIn(ECHO_PIN, HIGH);
  // calculate the distance
  distance_cm = 0.017 * duration_us;
unsigned long currentMillis = millis();
  if (currentMillis - previousTime_4 >= eventTime_4) 
  {
    previousTime_4 = currentMillis;
  if(distance_cm < DISTANCE_THRESHOLD){
    motorServo.write(150);  } // Turn Servo ke kiri to 0 degrees        
  else{
     motorServo.write(90); } //
  }
  // print the value to Serial Monitor
  Serial.print("distance: ");
  Serial.print(distance_cm);
  Serial.println(" cm");

  delay(500);
}
