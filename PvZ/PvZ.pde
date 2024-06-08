PImage map;
Currency system;
Board board;

ArrayList<Sun> sunList = new ArrayList<Sun>();
ArrayList<Sun> genSunList = new ArrayList<Sun>();
Plant[][] plantList;

ArrayList<Pea> PeaList = new ArrayList<Pea>();


ArrayList<Zombie> zombieList = new ArrayList<Zombie>();

ArrayList<Sunflower> sunflowerList = new ArrayList<Sunflower>();
ArrayList<Peashooter> peashooterList = new ArrayList<Peashooter>();
ArrayList<Walnut> walnutList = new ArrayList<Walnut>();

ArrayList<Lawnmower> lawnmowerList = new ArrayList<Lawnmower>();

PacketUI UI;
Plant selectedPlant;
Packet selectedPacket;

int sunCooldown;
boolean selecting = false;

int waveCooldown = 10 * 60;
int numZomb = 1;


void setup(){
  size(1400,600);
  map = loadImage("DayMap.png");
  system = new Currency();
  board = new Board(5, 9);
  plantList = board.getPlants();
  UI = new PacketUI();
  
  sunCooldown = 300;
  
  plantList = board.getPlants();
  
  lawnmowerList.add(new Lawnmower(150, 70));
  lawnmowerList.add(new Lawnmower(150, 170));
  lawnmowerList.add(new Lawnmower(150, 270));
  lawnmowerList.add(new Lawnmower(150, 370));
  lawnmowerList.add(new Lawnmower(150, 470));
  
  zombieList.add(new NormalZombie());
}

void draw(){
  image(map,0,0);
  fill(255);
  textSize(40);
  text("Sun: " +  system.getSun(), 0, 40);
  
  for(Lawnmower LM : lawnmowerList){
    if(LM.getFinished() == false){
      LM.display();
      if(LM.getActive()){
        for(Zombie z : zombieList){
          if(z.getRow() == LM.getRow() && LM.getX() >= z.getX()){
            z.removeHP(999);
          }
        }
      }
    }
  }
  
  fill(#6e3316);
  rect(0, 50, 120, 300);
  
  fill(255);
  
  UI.display();
  
  UI.getSFP().onCooldown();
  UI.getPSP().onCooldown();
  UI.getWP().onCooldown();
  UI.getCBP().onCooldown();
  
  if(waveCooldown == 0){
    for(int i = 0; i < numZomb; i++){
      zombieList.add(new NormalZombie());
    }
    waveCooldown = 10 * 60;
    numZomb++;
  }
  else if(waveCooldown > 0){
    waveCooldown--;
  }
  
  
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
  
  for(Peashooter ps : peashooterList){
    ps.onCooldown();
    for(Zombie z : zombieList){
      //println("Pea: " + ps.getR());
      //println("Zombie: " + z.getRow());
      if(ps.getR() == z.getRow() && z.getHP() > 0){
        Pea p = ps.Shoot();
        if(p != null){
          p.setActive(true);
          PeaList.add(p);
        }
      }
    }
  }
  
  for(Pea p : PeaList){
    if(p != null && p.getActive()){
      p.display();
      for(Zombie z : zombieList){
        if(z.getHP() > 0 && p.getR() == z.getRow() && p.getX() >= z.getX() && p.getX() <= z.getX() + 50){
          p.damage(z);
          p.setActive(false);
        }
      }
    }
  }
  
  for(Sunflower sf : sunflowerList){
    if(sf.getHP() > 0){
      Sun s = sf.generateSun();
      sf.onCooldown();
      genSunList.add(s);
    }
  }
  
  for(Sun s : genSunList){
    if(s != null){
      s.genSunDisplay(); 
    }
  }
  
  for(Walnut w : walnutList){
    if(w.getHP() <= 48 && w.getHP() > 24){
      w.setSprite("HurtWalnut.png"); 
    }
    else if(w.getHP() <= 24){
      w.setSprite("DyingWalnut.png"); 
    }
  }
  
  for(Zombie z : zombieList){
    if(z.getHP() > 0 && z.getHP() <= 4){
      z.setSprite("injuredNormalZombie.png"); 
    }
    if(z.getHP() > 0){
      z.resetWalkCD();
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
    if(z.getX() <= 210){
       lawnmowerList.get(z.getRow()).setActive();
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
      selectedPlant.setActive(true);
      system.removeSun(selectedPlant.getCost());
      selecting = false;
      selectedPacket.resetCooldown();
      selectedPacket = null;
      selectedPlant = null;
    }
  else{
    
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
  
  for(int i = 0; i < genSunList.size(); i++){
    Sun S = genSunList.get(i);
    if(S != null && mouseX <= S.getX() + 50 && mouseX >= S.getX() && mouseY <= S.getY() + 50 && mouseY >= S.getY()){
      S.click();
      system.addSun(50);
      genSunList.remove(S);
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
  
  PeashooterPacket PeaPacket = UI.getPSP();
  if(mouseX <= PeaPacket.getX() + 80 && mouseX >= PeaPacket.getX() && mouseY <= PeaPacket.getY() + 80 && mouseY >= PeaPacket.getY() && PeaPacket.getCooldown() == 0){
    Peashooter peaShooter = PeaPacket.genPeashooter();
    if(peaShooter.getCost() <= system.getSun()){
      selecting = true;
      selectedPlant = peaShooter;
      selectedPacket = PeaPacket;
      peashooterList.add(peaShooter);
    }
  }

  WalnutPacket WP = UI.getWP();
  if(mouseX <= WP.getX() + 80 && mouseX >= WP.getX() && mouseY <= WP.getY() + 80 && mouseY >= WP.getY() && WP.getCooldown() == 0){
    Walnut W = WP.genWalnut();
    if(W.getCost() <= system.getSun()){
      selecting = true;
      selectedPlant = W;
      selectedPacket = WP;
      walnutList.add(W);
    }
  }
  
  CherryBombPacket CBP = UI.getCBP();
  if(mouseX <= CBP.getX() + 80 && mouseX >= CBP.getX() && mouseY <= CBP.getY() + 80 && mouseY >= CBP.getY() && CBP.getCooldown() == 0){
    CherryBomb CB = CBP.genCherryBomb();
    if(CB.getCost() <= system.getSun()){
      selecting = true;
      selectedPlant = CB;
      selectedPacket = CBP;
      //walnutList.add(W);
    }
  }

}
