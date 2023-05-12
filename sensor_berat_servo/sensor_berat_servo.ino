#include "HX711.h"
#include <Servo.h>
#define DOUT  14
#define CLK  15
Servo motorServo; 
HX711 scale;
unsigned long previousMillis = 0;

// constants won't change
const int TRIG_PIN  = 16; // Arduino pin connected to Ultrasonic Sensor's TRIG pin
const int ECHO_PIN  = 17; // Arduino pin connected to Ultrasonic Sensor's ECHO pin
const int RELAY_PIN = 21; // Arduino pin connected to Relay's pin


// variables will change:
float calibration_factor = -255; //Hasil Kalibrasi
float units;

void setup()
{
  Serial.begin(9600);
  scale.begin(DOUT, CLK);
  scale.set_scale();
  scale.tare();  //Reset the scale to 0

  long zero_factor = scale.read_average(); //Get a baseline reading
  Serial.print("Zero factor: "); //This can be used to remove the need to tare the scale. Useful in permanent scale projects.
  Serial.println(zero_factor);
}

void loop()
{
 unsigned long currentMillis = millis();
  if (currentMillis - previousMillis >= 1000) 
  {
    previousMillis = currentMillis;
    
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
