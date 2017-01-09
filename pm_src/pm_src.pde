import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus
Mapper maper;

void setup() {
  size(400, 400);
  background(0);
  myBus = new MidiBus(this, 0,1);
  maper = new Mapper();
}

void draw() {
}

void sendNote(int channel, int pitch, int velocity){

}

void noteOn(int channel, int pitch, int velocity) {
  maper.map(channel,pitch,velocity,true);
}

void noteOff(int channel, int pitch, int velocity) {
 
}

void controllerChange(int channel, int number, int value) {
    maper.mapController(channel,number,value);
}