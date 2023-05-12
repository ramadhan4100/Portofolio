#include "WiFi.h"
int analogPin = A0; // pin arduino yang terhubung dengan pin S modul sensor tegangan
const char* ssid = "lfistha2";
const char* password =  "ojodownload";
const int pinADC = A0;
int sensitivitas = 185; //tegantung sensor arus yang digunakan, yang ini 5A
int nilaiadc= 00;
int teganganoffset = 2500; //nilai pembacaan offset saat tidak ada arus yang lewat
double tegangan = 00;
double nilaiarus = 00;

float Vmodul = 0.0; 
float hasil = 0.0;
float R1 = 30000.0; //30k
float R2 = 7500.0; //7500 ohm resistor, 
int value = 0;
 
 
void setup() {
 
  Serial.begin(115200);
 
  WiFi.begin(ssid, password);
 
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.println("Connecting to WiFi..");
  }
 
Serial.println("Connected to the WiFi network");
Serial.begin(9600); //baud komunikasi serial monitor 9600bps
delay(2000);

   pinMode(analogPin, INPUT);
   Serial.begin(9600);
   Serial.println("mengukur tegangan DC");
   Serial.println("https://www.cronyos.com");

}
 
void data_olah(){
  nilaiadc = analogRead(pinADC);
  tegangan = (nilaiadc / 1024.0) * 5000;
  nilaiarus = ((tegangan - teganganoffset) / sensitivitas);
}
 

void volt()
{
   value = analogRead(analogPin);
   Vmodul = (value * 5.0) / 1024.0;
   hasil = Vmodul / (R2/(R1+R2));
 
  Serial.print("Tegangan keluaran modul = ");
  Serial.print(Vmodul,2);
  Serial.print("volt");
  Serial.print(", Hasil pengukuran = ");
  Serial.print(hasil,2);
  Serial.println("volt");
  delay(500);
}

void loop(){
   volt();
   data_olah();
  Serial.print("Nilai ADC yang terbaca = " );
  Serial.print(nilaiadc);
 
  Serial.print("\t tegangan (mV) = ");
  Serial.print(tegangan,3);
 
  Serial.print("\t Arus = ");
  Serial.println(nilaiarus,3);
 
  delay(1000);
}
