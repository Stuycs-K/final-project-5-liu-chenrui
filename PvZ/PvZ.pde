PImage map;
Currency system;
Board board;
int sunCooldown;
ArrayList<Sun> sunList;


void setup(){
  size(1400,600);
  map = loadImage("DayMap.png");
  system = new Currency();
  board = new Board(5, 9);
  
  sunCooldown = 300;
  
  sunList = new ArrayList<Sun>();
}

void draw(){
  image(map,0,0);
  textSize(40);
  text("Sun: " +  system.getSun(), 0, 40);
  
  
  
  if(sunCooldown > 0){
   sunCooldown--; 
  }
  
  if(sunCooldown == 0){
    sunList.add(new Sun("Sun.png"));
    sunCooldown = 300;
  }
  
  for (Sun s : sunList){
   s.display();
  }
  
}

void mouseClicked(){
  if(mouseX >=250 && mouseX <= 980 && mouseY >= 70 && mouseY <= 570){
    int col = (mouseX - 250) / 80;
    int row = (mouseY - 70) / 100;
    //println(row);
    //println(col);
  }
  
  for(int i = 0; i < sunList.size(); i++){
    Sun S = sunList.get(i);
    if(mouseX <= S.getX() + 50 && mouseX >= S.getX() && mouseY <= S.getY() + 50 && mouseY >= S.getY()){
      S.click();
      system.addSun(50);
      sunList.remove(S);
      i--;
   }
  }
  
  //for (Sun S : sunList){
  // //println(S.getX());
  // //println(S.getY());
  // //println(mouseX);
  // //println(mouseY);
  // if(mouseX <= S.getX() + 50 && mouseX >= S.getX() && mouseY <= S.getY() + 50 && mouseY >= S.getY()){
  //  S.click();
  //  system.addSun(50);
  //  sunList.remove(S);
  // }
  //}
  //println(mouseX);
  //println(mouseY);
}
