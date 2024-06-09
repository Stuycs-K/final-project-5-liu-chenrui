public class CherryBomb extends Plant{
  boolean active = false;
  int currCooldown = 60;
  
  public CherryBomb(){
    super(150, 50, 999, 90, 1, 0, "CherryBomb.png");
  }
  
  void setActive(boolean b){
    active = b; 
  }
  
  boolean getActive(){
    return active; 
  }
  
  int getCooldown(){
    return currCooldown; 
  }
  
  void onCooldown(){
    if(currCooldown > 0){
      currCooldown--; 
      active = true;
    }
  }
  
}
