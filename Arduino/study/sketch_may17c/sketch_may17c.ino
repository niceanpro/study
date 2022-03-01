int s = 0;

void setup() {
  Serial.begin(9600);
  pinMode(13, OUTPUT);
}

void loop() {
  if(Serial.available())
  {
    String a;
    a = Serial.readString();
    if(a == "on")
      digitalWrite(13, HIGH);
    else if(a == "off")
      digitalWrite(13, LOW);
  }
  if(s > 0 && s < 8){
        digitalWrite(13, HIGH);
        delay(1000);
  }
  else if(s > 8 && s <= 12){
      f(2);
  }else if(s >= 12 && s < 16){
      f(3);
  }else if(s >= 16 && s < 20){
      f(4);
  }else if(s >= 20 && s < 24){
      f(5);
  }else if(s >= 24 && s < 28){
      f(6);
  }else if(s > 34){
    digitalWrite(13, LOW);
    delay(1000);
    s = 0;
  }
  
  s += 1;
  Serial.println(s);
}

void f(int c)  // c : count - 2, 3, 4
{
  int f = 0;
  int d = 1000/c;
  
  Serial.print("c = ");
  Serial.println( c);
  Serial.print("d = ");
  Serial.println(d);


  for(f = 0; f < c; f++){
    digitalWrite(13, LOW);
    delay(d);
    digitalWrite(13, HIGH);
    delay(d);
  }
  return;
}

