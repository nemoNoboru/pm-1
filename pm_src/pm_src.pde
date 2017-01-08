import themidibus.*; //Import the library
import processing.sound.*;

SinOsc sine;
MidiBus myBus; // The MidiBus
AudioDevice myAudioServer;

int freq;
int amp;
int add;

OSCS oscdb;

void setup() {
  size(400, 400);
  background(0);
  oscdb = new OSCS(this);


  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.

  // Either you can
  //                   Parent In Out
  //                     |    |  |
  //myBus = new MidiBus(this, 0, 1); // Create a new MidiBus using the device index to select the Midi input and output devices respectively.

  // or you can ...
  //                   Parent         In                   Out
  //                     |            |                     |
  //myBus = new MidiBus(this, "IncomingDeviceName", "OutgoingDeviceName"); // Create a new MidiBus using the device names to select the Midi input and output devices respectively.

  // or for testing you could ...
  //                 Parent  In        Out
  //                   |     |          |
  myBus = new MidiBus(this, 0,1); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
  myAudioServer = new AudioDevice(this, 44100, 128);
  sine = new SinOsc(this);
}

void draw() {

}

void sendNote(int channel, int pitch, int velocity){
  myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
  delay(20);
  myBus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff
}

void noteOn(int channel, int pitch, int velocity) {
  float vl = 1.0 / 5.0;
  oscdb.play(pitch+50,vl);
}

void noteOff(int channel, int pitch, int velocity) {
  oscdb.stop(pitch+50);
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
  if(number == 48 ){
    freq = value;
  }else if(number == 49){
    amp = value;
  }else if(number == 50){
    add = value;
  }
    
}

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}