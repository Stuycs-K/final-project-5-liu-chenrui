public class Sunflower extends Plant{
  int currentCD = 5;
  
  public Sunflower(){
    super(50, 8, 6, 0, 24, 0, "Sunflower.png");
  }
  
  void generateSun(){
    if(currentCD == 0){
      Sun s = new Sun(getX(), getY(), "Sun.png");
      s.genSunDisplay();
    }
  }
  
}
