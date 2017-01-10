class fmSynth implements Module {
  
  protected int carrierFeq,fmFeq;
  protected float carrierAmp,fmAmp;
  protected Oscil wave,fm;
  protected float minAmp;
  
  public fmSynth(){
    
    // todo create a bank of oscils.
    carrierFeq = 200;
    carrierAmp = 0.8;
    fmFeq= 10;
    fmAmp = 2;
    wave = new Oscil( carrierFeq, carrierAmp, Waves.SINE);
    fm = new Oscil( fmFeq, fmAmp, Waves.SINE);
    fm.patch(wave.frequency);
  }
  
  public void launchpadOn(int button){};
  public void launchpadOff(int button){};
  public void up(){};
  public void down(){};
  public void right(){};
  public void left(){};
  public void h1(){};
  public void h2(){};
  public void h3(){};
  public void h4(){};
  public void play(int pitch, int vel){
    fm.setFrequency(Frequency.ofMidiNote(pitch));
    fm.setAmplitude(minAmp + (vel/20.0));
    print("playing");
    wave.patch(out);
  };
  public void stop(int pitch, int vel){
    wave.unpatch(out);
    print("stoping");
  };
  public void c1(int value){
    this.minAmp = value/20.0;
  }
  public void c2(int value){
    wave.setAmplitude(value/10.0);
  };
  public void c3(int value){
    fm.setAmplitude(value/10.0);
  };
  public void c4(int value){};
  public void c5(int value){};
  public void c6(int value){};
  public void c7(int value){};
  public void c8(int value){};
}