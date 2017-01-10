class Mapper {
  Module m;
  
  public Mapper(){
    m = new fmSynth();
  }
  
  public void routeButtns(int pitch){
    switch(pitch){
      case 64:
      m.up();
      break;
      case 65:
      m.down();
      break;
      case 66:
      m.left();
      break;
      case 67:
      m.right();
      break;
      case 68:
      m.h1();
      break;
      case 69:
      m.h2();
      break;
      case 70:
      m.h3();
      break;
      case 71:
      m.h4();
      break;
    }
  }
      
  
  public void routeCtrl(int pitch,boolean active){
    if(pitch < 40 ){
      if(active){
        m.launchpadOn(pitch);
      }else{
        m.launchpadOff(pitch);
      }
    }else{
      if(active){
        routeButtns(pitch);
      }
    }
  }
  
  public void map(int channel, int pitch, int velocity, boolean active){
    if(channel == 0){
      routeCtrl(pitch,active);
    }else{
      if(active){
        m.play(pitch,velocity);
      }else{
        m.stop(pitch,velocity);
      }
    }
  }
  
  public void mapController(int channel, int number, int value){
    switch(number){
      case 48: 
      m.c1(value);
      break;
      case 49: 
      m.c2(value);
      break;
      case 50: 
      m.c3(value);
      break;
      case 51: 
      m.c4(value);
      break;
      case 52: 
      m.c5(value);
      break;
      case 53: 
      m.c6(value);
      break;
      case 54: 
      m.c7(value);
      break;
      case 55: 
      m.c8(value);
      break;
    }
  }
}