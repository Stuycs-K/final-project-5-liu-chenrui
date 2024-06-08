public class CherryBomb extends Plant{
  boolean active = false;
  
  public CherryBomb(){
    super(150, 50, 999, 90, 1, 0, "CherryBomb.png");
  }
  
  void setActive(){
    active = true; 
  }
}
