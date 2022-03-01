#define led13 13
int led = 13;


void setup() {
  // put your setup code here, to run once:
  pinMode(led13, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(13, HIGH);
  delay(1000);
  digitalWrite(13, LOW);
  delay(1000);
}
