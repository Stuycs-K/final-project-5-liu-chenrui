public class Sunflower extends Plant{
  private int currentCD = 5 * 60;
  
  public Sunflower(){
    super(50, 7, 6, 0, 24, 0, "Sunflower.png");
  }
  
  Sun generateSun(){
    if(currentCD == 0 && getActive()){
      Sun s = new Sun(getX(), getY(), "Sun.png");
      //s.genSunDisplay();
      currentCD = 27 * 60;
      return s;
    }
    return null;
  }
  
  void onCooldown(){
     if(currentCD > 0){
       currentCD--;
     }
  }
  
}
