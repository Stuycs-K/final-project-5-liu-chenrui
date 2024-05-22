int Sun;
PImage map;

void setup(){
  size(1400,600);
  map = loadImage("DayMap.png");
}

void draw(){
  image(map,0,0);
  square(260, 90, 75);
  square(340, 85, 75);
}

void mouseClicked(){
  
}
