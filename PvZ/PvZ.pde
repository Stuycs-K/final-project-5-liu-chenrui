PImage map;
Currency system;
Board board;

ArrayList<Sun> sunList;
Plant[][] plantList;

PacketUI UI;
Packet selectedPacket;

int sunCooldown;
boolean selecting = false;


void setup(){
  size(1400,600);
  map = loadImage("DayMap.png");
  system = new Currency();
  board = new Board(5, 9);
  plantList = board.getPlants();
  UI = new PacketUI();
  
  sunCooldown = 300;
  sunList = new ArrayList<Sun>();
}

void draw(){
  image(map,0,0);
  textSize(40);
  text("Sun: " +  system.getSun(), 0, 40);
  
  UI.display();
  
  for(Packet p : UI.getPackets()){
   p.onCooldown(); 
  }
  
  for(int r = 0; r < plantList.length; r++){
    for(int c = 0; c < plantList[0].length; c++){
      if(plantList[r][c] != null){
        plantList[r][c].display(250 + c * 80, 90 + r * 100);
      }
    }
  }
  
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
   selectedPacket.getPlant().display(mouseX, mouseY); 
  }
  
}

void mouseClicked(){
  
  if(mouseX >=250 && mouseX <= 980 && mouseY >= 70 && mouseY <= 570 && selecting){
    int col = (mouseX - 250) / 80;
    int row = (mouseY - 70) / 100;
    if(plantList[row][col] == null){
      plantList[row][col] = selectedPacket.getPlant();
      selectedPacket.getPlant().setCoord(row, col);
      system.removeSun(selectedPacket.getPlant().getCost());
      selecting = false;
      selectedPacket.resetCooldown();
      selectedPacket = null;
    }
  }
  else{
    selecting = false;
    selectedPacket = null;
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
    if(mouseX <= p.getX() + 50 && mouseX >= p.getX() && mouseY <= p.getY() + 50 && mouseY >= p.getY() && p.getCooldown() == 0){
      if(p.getPlant().getCost() <= system.getSun()){
        selecting = true;
        selectedPacket = p;
      }
    }
    
  }

}
