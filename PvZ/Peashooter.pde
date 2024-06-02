public class Peashooter extends Plant{
  int currentCD = 5 * 60;
  
  public Peashooter(){
    super(100, 7, 6, 1, 1, 9, "Peashooter.png");
  }
  
  Pea Shoot(){
    if(currentCD == 0 && getActive()){
      return new Pea(getX() + 40, getY() + 40);
    }
    return null;
  }
  
  void onCooldown(){
     if(currentCD > 0){
       currentCD--;
     }
  }
}
