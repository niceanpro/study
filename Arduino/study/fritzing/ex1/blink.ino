#define LED_PIN 2
#define HIGH_TIME 1000
#define LOW_TIME 500

void setup() {
  // put your setup code here, to run once:
  pinMode(LED_PIN, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(LED_PIN, HIGH);
  delay(HIGH_TIME);
  digitalWrite(LED_PIN, LOW);
  delay(OW_TIME);
}