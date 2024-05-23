public class Plant{
  private int Cost;
  private double refresh;
  private int HP;
  private int Damage;
  private double AtkInterval;
  private double range;
  private PImage sprite;
  
  public Plant(int cost, double refresh, int hp, int dmg, double atkInterval, double range, String link){
    Cost = cost;
    this.refresh = refresh;
    this.HP = hp;
    Damage = dmg;
    this.AtkInterval = atkInterval;
    this.range = range;
    this.sprite = loadImage(link);
  }
  
  int getCost(){
    return 0;
  }
  
}
