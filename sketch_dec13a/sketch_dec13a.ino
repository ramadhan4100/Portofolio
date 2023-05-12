const int pin_button1 = 2; // yellow-left
const int pin_button2 = 3; // green-right
const int pin_button3 = 4;
const int pin_button4 = 5;

void setup() {
  Serial.begin(9600);

  pinMode(pin_button1, INPUT);
  pinMode(pin_button2, INPUT);
  pinMode(pin_button3, INPUT);
  pinMode(pin_button4, INPUT);
}

void loop() {

  if (digitalRead(pin_button1) == LOW) {
    Serial.println("L"); // Unity will read this value
    Serial.flush();
    delay(20); // This delay is important - 20 should be enough for a smooth transition.
  }

  if (digitalRead(pin_button2) == LOW) {
    Serial.println("R"); // Unity will read this value
    Serial.flush();
    delay(20);
  }
//
//    if (digitalRead(pin_button3) == LOW) {
//    Serial.println("U"); // Unity will read this value
//    Serial.flush();
//    delay(20);
//  }
//
//    if (digitalRead(pin_button4) == LOW) {
//    Serial.println("D"); // Unity will read this value
//    Serial.flush();
//    delay(20);
//  }

}
