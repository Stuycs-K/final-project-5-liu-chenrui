int Sun;
PImage map;

void setup(){
  size(1400,600);
  map = loadImage("DayMap.png");
}

void draw(){
  image(map,0,0);
  square(250, 85, 85);
}

void mouseClicked(){
  
}
