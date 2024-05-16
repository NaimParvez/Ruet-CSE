void setup() {
  // put your setup code here, to run once:
  // pinMode(PC13, OUTPUT);// digital pin
  // pinMode(PC15,OUTPUT);// digital pin
  pinMode(PB0, OUTPUT);  // pwm pin
  // digitalWrite(PC15, LOW);// digital pin
}

void loop() {


  // 1st ex-Led turning on off
  // digitalWrite(PC15, LOW);
  // delay(100);
  // digitalWrite(PC15, HIGH);
  // delay(100);


  //2nd ex-blinking rate change
  // for (int i = 100; i <= 1000; i += 100) {
  //   digitalWrite(PC15, LOW);
  //   delay(i);
  //   digitalWrite(PC15, HIGH);
  //   delay(i);
  // }
  // for (int i = 1000; i >= 100; i -= 100) {
  //   digitalWrite(PC15, LOW);
  //   delay(i);
  //   digitalWrite(PC15, HIGH);
  //   delay(i);
  // }


  //3rd ex- fading the Led(using pwm)
  //   for (int i = 0; i <256; i +=5) {
  //     analogWrite(PB0,i);
  //     delay(50);
  //   }
  //   for (int i = 255; i >= 1; i -=5) {
  //     analogWrite(PB0,i);
  //     delay(50);
  //   }
}
