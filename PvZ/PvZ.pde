PImage map;
Currency system;
Board board;
int sunCooldown;
ArrayList<Sun> sunList;
PacketUI UI;
boolean selecting = false;
Packet selectedPacket;


void setup(){
  size(1400,600);
  map = loadImage("DayMap.png");
  system = new Currency();
  board = new Board(5, 9);
  UI = new PacketUI();
  
  sunCooldown = 300;
  
  sunList = new ArrayList<Sun>();
}

void draw(){
  image(map,0,0);
  textSize(40);
  text("Sun: " +  system.getSun(), 0, 40);
  
  UI.display();
  
  if(sunCooldown > 0){
   sunCooldown--; 
  }
  
  if(sunCooldown == 0){
    sunList.add(new Sun("Sun.png"));
    sunCooldown = 300;
  }
  
  for(Sun s : sunList){
   s.display();
  }
  
  if(selecting){
   selectedPacket.display(mouseX, mouseY); 
  }
  
}

void mouseClicked(){
  
  selecting = false;
  
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
  
  for(Packet p : UI.getPackets()){
    if(mouseX <= p.getX() + 50 && mouseX >= p.getX() && mouseY <= p.getY() + 50 && mouseY >= p.getY()){
      selecting = true;
      selectedPacket = p;
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
