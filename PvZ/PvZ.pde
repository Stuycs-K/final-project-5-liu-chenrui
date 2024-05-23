PImage map;
Currency system;
Board board;

void setup(){
  size(1400,600);
  map = loadImage("DayMap.png");
  image(map,0,0);
  //square(250, 80, 80);
  system = new Currency();
}

void draw(){
  textSize(40);
  text("Sun: " +  system.getSun(), 0, 40);
  
}

void mouseClicked(){
  if(mouseX >=250 && mouseX <= 980 && mouseY >= 70 && mouseY <= 570){
    int col = (mouseX - 250) / 80;
    int row = (mouseY - 70) / 80;
    println(row);
    println(col);
  }
  //println(mouseX);
  //println(mouseY);
}
