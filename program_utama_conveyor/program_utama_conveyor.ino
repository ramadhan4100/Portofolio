#include <SPI.h>
#include <Ethernet.h>
#include <Servo.h>
#include "Mudbus.h"
#include "HX711.h"
#define DOUT  14
#define CLK  15
#define trigPin 33
#define echoPin 32
#define trigPin2 31
#define echoPin2 30
#define LAMPU1 50
#define IN1 42 // deklarasi pin IN1
#define IN2 40  // deklarasi pin IN2
#define ENA 44 // deklarasi pin ENA
#define RELAY_ON LOW
#define RELAY_OFF HIGH
 
Mudbus Mb;
HX711 scale;
Servo motorServo1; 
Servo motorServo2; 
 const unsigned long eventTime_1 = 100; // interval in ms
 const unsigned long eventTime_2 = 15000;
 const unsigned long eventTime_3 = 1000;
 const unsigned long eventTime_4 = 3000;
 const unsigned long eventTime_5 = 15000;
  
 unsigned long previousTime_1 = 0;
 unsigned long previousTime_2 = 0;
 unsigned long previousTime_3 = 0;
 unsigned long previousTime_4 = 0;
 unsigned long previousTime_5 = 0;
 
const int TRIG_PIN  = 16; // Arduino pin connected to Ultrasonic Sensor's TRIG pin
const int ECHO_PIN  = 17; // Arduino pin connected to Ultrasonic Sensor's ECHO pin
const int RELAY_PIN = 35; // Arduino pin connected to Relay's pin
const int DISTANCE_THRESHOLD = 17; 

 
 int counter1 = 0;
 int counter2 = 0;
 int currentState1 = 0;
 int previousState1 = 0;
 int currentState2 = 0;
 int previousState2 = 0;
int gerak1 = 0;
int lampu1 = 0;
int lampu2 = 0;
int lampu3 = 0;

float duration_us, distance_cm;
float calibration_factor = -355; //Hasil Kalibrasi
float units;

void setup()
{
  uint8_t mac[]     = { 0x90, 0xA2, 0xDA, 0x00, 0x51, 0x09 };
  uint8_t ip[]      = { 192, 168, 2, 128 };
  uint8_t gateway[] = { 192, 168, 2, 1 };
  uint8_t subnet[]  = { 255, 255, 255, 0 };
  Ethernet.begin(mac, ip, gateway, subnet);
/*  pinMode(Su1,INPUT);
  pinMode(Su2, INPUT);
  pinMode(Sb, INPUT);
  pinMode(M, OUTPUT);
  pinMode(push1, OUTPUT);
  pinMode(push2, OUTPUT);
*/
 Serial.begin(115200);
 // Konfigurasi pin-pin sebagai Output
 pinMode(IN1, OUTPUT); 
 pinMode(IN2, OUTPUT);
 pinMode(ENA, OUTPUT);
 pinMode(trigPin, OUTPUT);
 pinMode(echoPin, INPUT);
 pinMode(trigPin2, OUTPUT);
 pinMode(echoPin2, INPUT);
 motorServo1.attach(25); 
 motorServo2.attach(26); // servo Pada Pin digital
 pinMode(TRIG_PIN, OUTPUT);  // set arduino pin to output mode
 pinMode(ECHO_PIN, INPUT);   // set arduino pin to input mode
 pinMode(RELAY_PIN, OUTPUT); // set arduino pin to output mode
pinMode(50, OUTPUT);
  // Relay setup.
  pinMode(RELAY_PIN, OUTPUT);
  digitalWrite(RELAY_PIN, RELAY_OFF);

 scale.begin(DOUT, CLK);
 scale.set_scale();
 scale.tare();  //Reset the scale to 0

 long zero_factor = scale.read_average(); //Get a baseline reading
 Serial.print("Zero factor: "); //This can be used to remove the need to tare the scale. Useful in permanent scale projects.
 Serial.println(zero_factor);
}

void loop()
{ 
  Mb.Run();

        conveyor();
        kotak1();
        kotak2();

        sensor_berat();
        servo1();
        servo2();
       
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  digitalWrite(ENA, 1500); 
      //kontrol analog

  //Mb.R[0]             = random(0,1000);
  Mb.R[0]             = lampu1;
  Mb.R[1]             = units;
  Mb.R[2]             = counter1;
  Mb.R[3]             = counter2;
  Mb.R[4]             = lampu2;
  Mb.R[6]             = lampu3;
//kontrol digital

//Mb.C[6]             = digitalRead(23);
//  Mb.C[5]             = HIGH;
  //pin 7 to Mb.C[0]
 digitalWrite(35, Mb.C[5]); //pin 8 from Mb.C[1]

 // }
} 

     
void kotak1(){
  unsigned long currentMillis = millis();
  if (currentMillis - previousTime_1 >= eventTime_1) 
  {
   previousTime_1 = currentMillis;
 long duration, distance;
 digitalWrite(trigPin, LOW); 
 delayMicroseconds(2); 
 digitalWrite(trigPin, HIGH);
 delayMicroseconds(10); 
 digitalWrite(trigPin, LOW);
 duration = pulseIn(echoPin, HIGH);
 distance = (duration/2) / 29.1;
 if (distance <= 5){ 
 currentState1 = 1;
 }
 else {
 currentState1 = 0;
 }

 if(currentState1 != previousState1){
if(currentState1 == 1){
counter1 = counter1 + 1;
Serial.print ("Kotak1: ");
Serial.println(counter1);
      }
    }
  }
}

void kotak2(){
  unsigned long currentMillis = millis();
  if (currentMillis - previousTime_2 >= eventTime_2) 
  {
    previousTime_2 = currentMillis;
 long duration, distance;
 digitalWrite(trigPin2, LOW); 
 delayMicroseconds(2); 
 digitalWrite(trigPin2, HIGH);
 delayMicroseconds(10); 
 digitalWrite(trigPin2, LOW);
 duration = pulseIn(echoPin2, HIGH);
 distance = (duration/2) / 29.1;
 if (distance <= 10){ 
 currentState2 = 1;
 }
 else {
 currentState2 = 0;
 }

 if(currentState2 != previousState2){
if(currentState2 == 1){
counter2 = counter2 + 1;
Serial.print ("Kotak2: ");
Serial.println(counter2);
      }
    }
  }
}

void sensor_berat(){
  unsigned long currentMillis = millis();
  if (currentMillis - previousTime_3 >= eventTime_3) 
  {
    previousTime_3 = currentMillis;
  scale.set_scale(calibration_factor); //Adjust to this calibration factor

  Serial.print("Reading: ");
  units = scale.get_units(), 1;
  if (units < 0)
  {
    units = 0.00;
  }
  Serial.print("Berat: ");
  Serial.print(units);
  Serial.print(" Gram");
  Serial.println();
 
    }
}    

void servo1(){
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
    motorServo1.write(75); 
   // digitalWrite(50, HIGH);
lampu1=40,96;
    } // Turn Servo ke kiri to 0 degrees        
  else{
     motorServo1.write(0); 
    // digitalWrite(50, LOW);
    lampu1=0;

     
      } 
  }
  // print the value to Serial Monitor
  Serial.print("distance: ");
  Serial.print(distance_cm);
  Serial.println(" cm");

  delay(500);
}

void servo2(){
 unsigned long currentMillis = millis();
   if (currentMillis - previousTime_5 >= eventTime_5 ) {
    previousTime_5 = currentMillis;
    gerak1 = 1;}
  if(8 < units && units < 30 && gerak1==0){ 
lampu2=40,96;
    motorServo2.write(155);
    gerak1=0;}
    // Turn Servo ke kiri to 0 degrees       
  if(units > 30 && units < 4 && gerak1 == 1){
     motorServo2.write(90);  //
     gerak1=0;
     lampu2=0;}
}

void conveyor(){

      if (digitalRead(RELAY_PIN) == LOW) {
       lampu3 = 4096; 
      }
      else {
        lampu3 = 0;
      }
  }
  
  // print the value to Serial Monitor
