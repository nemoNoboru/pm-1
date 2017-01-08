import processing.sound.*;

class OSC {
  public float id = -1;
  protected Basic t;
  public OSC(Basic t){this.t = t;}
  public void play(float freq, float amp){};
  public void stop(){};
}

class SineSimple extends OSC{
  private SinOsc osc;
  
  public SineSimple(Basic dis){
    super(dis);
    osc = new SinOsc(t);
  }
  
  public void play(float freq, float amp){
    osc.freq(freq);
    osc.amp(amp);
    osc.play();
    id = freq;
  }
  
  public void stop(){
    osc.stop();
    id = -1;
  }
}

class OSCS {
  private OSC[] oscs_list;
  
  public OSCS(Basic t){
    oscs_list = new SineSimple[16];
    for(int i = 0; i<16; i++){
      oscs_list[i] = new SineSimple(t);
    }
  }
  
  public void play(float freq, float amp){
    for(OSC o : oscs_list){
      if(o.id < 0){
        o.play(freq,amp);
        break;
      }
    }
  }
  
  public void stop(float freq){
    for(OSC o : oscs_list){
      if(o.id == freq){
        o.stop();
        break;
      }
    }
  }
}
    