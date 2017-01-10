import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus
Mapper maper;

Minim minim;
AudioOutput out;

void setup() {
  size(400, 400);
  background(0);
  myBus = new MidiBus(this, 0,1);
  maper = new Mapper();
  
  minim = new Minim( this );
  out   = minim.getLineOut();
}

void draw() {
}

void sendNote(int channel, int pitch, int velocity){

}

void noteOn(int channel, int pitch, int velocity) {
  maper.map(channel,pitch,velocity,true);
}

void noteOff(int channel, int pitch, int velocity) {
  maper.map(channel,pitch,velocity,false);
}

void controllerChange(int channel, int number, int value) {
    maper.mapController(channel,number,value);
}