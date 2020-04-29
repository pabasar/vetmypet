#include "DHT.h"

#define DHTPIN 2     

#define DHTTYPE DHT11   

DHT dht(DHTPIN, DHTTYPE);

void setup() {
  Serial.begin(9600);

  dht.begin();
}

void loop() {
  
  delay(2000);

  
  //float h = dht.readHumidity();

  float t = dht.readTemperature();
  
  float f = dht.readTemperature(true);

  
  /*
  if (isnan(h) || isnan(t) || isnan(f)) {
    Serial.println("Failed to read from DHT sensor!");
    return;
  }
  */

  float hif = dht.computeHeatIndex(f, h);
  float hic = dht.computeHeatIndex(t, h, false);

  /*
  if (t >= 40) {
  Serial.print(" Warning!!! High Temperature");
}

  if (t <= 37) {
  Serial.print(" Warning!!! Low Temperature");
}
  */

  
  //Serial.print("Temperature: ");
  Serial.println(t);
  //Serial.print(" Celcius ");
  //Serial.println("");
}
