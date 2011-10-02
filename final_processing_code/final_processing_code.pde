import processing.serial.*;
import cc.arduino.*;
import eeml.*;
import pachuino.*;

Pachuino p;
float lastUpdate;

void setup(){   
    p = new Pachuino(this, Arduino.list()[1], 57600);   
    p.manualUpdate("http://www.pachube.com/api/35451.xml"); 
    p.setKey("GBS3k0F-wFU_1XbjiYMry-cf-sb38LASl2-scnFVPEU");   

      
    p.addLocalSensor("analog", 0,"lightSensor");
  
}

void draw(){
   
 
  float tempVal1 = p.localSensor[0].value;
    println (tempVal1);
    if ((millis() - lastUpdate) > 12000){
      p.analogWrite(0, p.localSensor[0].value);
    }   
}




void onReceiveEEML(DataIn d){ 
    p.updateRemoteSensors(d);
}
