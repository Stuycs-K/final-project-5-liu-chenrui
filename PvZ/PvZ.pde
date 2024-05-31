PImage map;
Currency system;
Board board;

ArrayList<Sun> sunList = new ArrayList<Sun>();
Plant[][] plantList;
ArrayList<Zombie> zombieList = new ArrayList<Zombie>();

ArrayList<Sunflower> sunflowerList = new ArrayList<Sunflower>();

PacketUI UI;
Plant selectedPlant;
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
  
  plantList = board.getPlants();
  zombieList.add(new NormalZombie());
}

void draw(){
  image(map,0,0);
  textSize(40);
  text("Sun: " +  system.getSun(), 0, 40);
  
  UI.display();
  
  UI.getSFP().onCooldown();
  
  for(int r = 0; r < plantList.length; r++){
    for(int c = 0; c < plantList[0].length; c++){
      if(plantList[r][c] != null){
        plantList[r][c].display(250 + c * 80, 90 + r * 100);
        if(plantList[r][c].getHP() <= 0){
          plantList[r][c] = null; 
        }
      }
    }
  }
  
  for(Zombie z : zombieList){
    z.resetEatCD();
    int zX = z.getX();
    int zY = z.getY();
    int col = (zX - 250) / 80;
    if(col > 8){
     col = 8; 
    }
    if(col < 0){
     col = 0; 
    }
    int row = (zY - 70) / 100;
    if(row > 4){
     row = 4; 
    }
    if(row < 0){
     row = 0; 
    }
    
    if(plantList[row][col] != null){
      //println("row: " + row);
      //println("col: " + col);
      z.Attack(plantList[row][col]);
    }
    else{
      z.setEating(false);
    }
    z.Move();
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
   selectedPlant.display(mouseX, mouseY); 
  }
  
}

void mouseClicked(){
  
  if(mouseX >=250 && mouseX <= 980 && mouseY >= 70 && mouseY <= 570 && selecting){
    int col = (mouseX - 250) / 80;
    int row = (mouseY - 70) / 100;
    if(plantList[row][col] == null){
      plantList[row][col] = selectedPlant;
      selectedPlant.setCoord(row, col);
      system.removeSun(selectedPlant.getCost());
      selecting = false;
      selectedPacket.resetCooldown();
      selectedPacket = null;
      selectedPlant = null;
    }
  }
  else{
    selecting = false;
    selectedPacket = null;
    selectedPlant = null;
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
  
  SunflowerPacket SunPacket = UI.getSFP();
  if(mouseX <= SunPacket.getX() + 50 && mouseX >= SunPacket.getX() && mouseY <= SunPacket.getY() + 50 && mouseY >= SunPacket.getY() && SunPacket.getCooldown() == 0){
    Sunflower sunFlower = SunPacket.genSunflower();
    if(sunFlower.getCost() <= system.getSun()){
      selecting = true;
      selectedPlant = sunFlower;
      selectedPacket = SunPacket;
      sunflowerList.add(sunFlower);
    }
  }

}
