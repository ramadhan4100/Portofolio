#define LED_1 6
#define LED_2 7
#define BUTTON_A 2
#define BUTTON_B 3
#define POTENTIOMETER_PIN A1

unsigned long delayTime = 20000;
unsigned long delayStart = 0;
unsigned long delaytkn = 0;

String Mode;

byte lastButtonState1 = LOW;
byte lastButtonState2 = LOW;
byte buttonState1;
byte buttonState2;
bool LEDOn = true;
bool cond = true;
bool sw = true;
bool ah = true;


int LastpValue;
int pValue;
int brightness_1;
int brightness_2;
int i;
int j;
int k;

void setup()
{
  Serial.begin(9600);
  pinMode(LED_1, OUTPUT);
  pinMode(LED_2, OUTPUT);
  pinMode(BUTTON_A, INPUT);
  pinMode(BUTTON_B, INPUT);

}

void loop()
{

  if (Serial.available()) {
    Mode = Serial.readStringUntil('\n');
    Serial.println(Mode);
    if (Mode == "MODE1" || Mode == "MODE2") {
      sw = false;
      ah = false;
    }
    if (Mode == "EXIT") {
      sw = true;
      LEDOn == true;
      ah == true;
      Mode = "";
    }
  }

  button();

  if (LEDOn == false && sw == true) {
    control_1();
    Serial.println("State is On");
  }

  if (sw == false) {
    control_2();
    LEDOn = false;
  }

  if (LEDOn == true || ah == false) {
    digitalWrite(LED_1, LOW);
    digitalWrite(LED_2, LOW);
    Serial.println("State is Off");
  }

  if ((millis() - delayStart) >= delayTime) {
    LEDOn = true;
    if (cond == false || pValue > LastpValue + 5 || pValue < LastpValue - 5) {
      delayStart = millis();
      LEDOn = false;
    }
  }

  Serial.print("Potentiometer Value :");
  Serial.print(pValue);
  Serial.println("");

  if (pValue >= LastpValue + 3 || pValue <= LastpValue - 3)
  {
    LastpValue = pValue;
  }
}

void control_1() {
  pValue = analogRead(POTENTIOMETER_PIN);

  if (cond) {
    brightness_1 = map(pValue, 0, 1023, 0, 100);
    brightness_2 = map(pValue, 0, 1023, 100, 0);
    analogWrite(LED_1, brightness_1);
    analogWrite(LED_2, brightness_2);
  }
  else {
    brightness_1 = map(pValue, 0, 1023, 100, 0);
    brightness_2 = map(pValue, 0, 1023, 0, 100);
    analogWrite(LED_1, brightness_1);
    analogWrite(LED_2, brightness_2);
  }
  Serial.print("Brightness 1:");
  Serial.print(brightness_1);
  Serial.println("%");
  Serial.print("Brightness 2:");
  Serial.print(brightness_2);
  Serial.println("%");
  delay(100);
}

void control_2() {
  Serial.print("Counter : ");
  Serial.println(k);

  if (millis() - delaytkn < 3000) {
    if (k == 1 && millis() - delaytkn < 500) {
      digitalWrite(LED_2, HIGH);
      ah = true;
    }
    if (k == 2 && millis() - delaytkn < 500) {
      digitalWrite(LED_1, HIGH);
      digitalWrite(LED_2, LOW);
    }
    if (k == 3 && millis() - delaytkn < 500) {
      digitalWrite(LED_1, LOW);
      digitalWrite(LED_2, HIGH);
    }
    if (k == 4 && millis() - delaytkn < 800) {
      digitalWrite(LED_1, HIGH);
    }
    if (k == 5 && millis() - delaytkn < 1000) {
      ah = false;
    }
  }
  else {
    k = 0;
  }
}



void button() {
  buttonState1 = digitalRead(BUTTON_A);
  buttonState2 = digitalRead(BUTTON_B);
  if (buttonState1 != lastButtonState1) {
    lastButtonState1 = buttonState1;
    if (lastButtonState1 == HIGH) { // button has been released
      LEDOn = false;
      delayStart = millis();
      i++;
    }
    if (i > 1) {
      LEDOn = true;
      i = 0;
    }
    delay(50);
  }

  if (buttonState2 != lastButtonState2) {
    lastButtonState2 = buttonState2;
    if (buttonState2 == HIGH && LEDOn == false && sw == true) { // button has been released
      cond = ! cond;
      j++;
    }
    if (sw == false) {
      if (buttonState2 == HIGH && Mode == "MODE1") { // button has been released
        k++;
        delaytkn = millis();
      }
      if (buttonState2 == HIGH && Mode == "MODE2") {
        ah = true;
        digitalWrite(LED_1, HIGH);
        digitalWrite(LED_2, HIGH);
      }
      if (buttonState2 == LOW && Mode == "MODE2") {
        digitalWrite(LED_1, LOW);
        digitalWrite(LED_2, LOW);
      }
    }
    delay(50);
  }
}
