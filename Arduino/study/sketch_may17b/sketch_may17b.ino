#define led13 13

void setup() {
  Serial.begin(9600);
  pinMode(led13, OUTPUT);
}

void loop() {
  Serial.print("read : ");
  Serial.println((char)Serial.read());
  
  digitalWrite(13, HIGH);
  delay(1000);
  digitalWrite(13, LOW);
  delay(1000);
}
