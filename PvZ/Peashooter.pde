public class Peashooter extends Plant{
  double currentCD = 1.5 * 60;
  
  public Peashooter(){
    super(100, 7, 6, 1, 1, 9, "Peashooter.png");
  }
  
  Pea Shoot(){
    if(currentCD == 0 && getActive()){
      currentCD = 1.5 * 60;
      return new Pea(getX() + 40, getY() + 30);
    }
    return null;
  }
  
  void onCooldown(){
     if(currentCD > 0){
       currentCD -= 0.5;
     }
  }
}
