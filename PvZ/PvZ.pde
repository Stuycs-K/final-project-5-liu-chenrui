PImage map;
Currency system;
Board board;
int sunCooldown;

void setup(){
  size(1400,600);
  map = loadImage("DayMap.png");
  system = new Currency();
  board = new Board(5, 9);
  
  sunCooldown = 600;
}

void draw(){
  image(map,0,0);
  textSize(40);
  text("Sun: " +  system.getSun(), 0, 40);
  
  if(sunCooldown > 0){
   sunCooldown--; 
  }
  
  if(sunCooldown == 0){
    Sun randomSun = new Sun("Sun.jpg");
    randomSun.display();
    sunCooldown = 600;
  }
  
}

void mouseClicked(){
  if(mouseX >=250 && mouseX <= 980 && mouseY >= 70 && mouseY <= 570){
    int col = (mouseX - 250) / 80;
    int row = (mouseY - 70) / 100;
    //println(row);
    //println(col);
  }
  //println(mouseX);
  //println(mouseY);
}
