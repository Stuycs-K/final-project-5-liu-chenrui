public class Plant{
  private int Cost;
  private int refresh;
  private int HP;
  private int Damage;
  private int AtkInterval;
  private int range;
  private PImage sprite;
  
  public Plant(int cost, int refresh, int hp, int dmg, int atkInterval, int range, String link){
    Cost = cost;
    this.refresh = refresh;
    this.HP = hp;
    Damage = dmg;
    this.AtkInterval = atkInterval;
    this.range = range;
    this.sprite = loadImage(link);
  }
  
  int getCost(){
    return Cost;
  }
  
  double getRefresh(){
   return refresh; 
  }
  
}
