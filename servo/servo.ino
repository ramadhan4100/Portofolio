#include <Servo.h>;

Servo Myservo;

void setup(){

}

void loop(){
Myservo.attach(25);
Myservo.write(90);
delay (1000);
Myservo.detach();
delay (1000);
Myservo.attach(25);
Myservo.write(0);
delay (1000);
Myservo.detach();
delay (1000);
}
