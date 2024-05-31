public class Plant{
  private int Cost;
  private int refresh;
  private int HP;
  private int Damage;
  private int AtkInterval;
  private int range;
  private PImage sprite;
  
  private int r,c;
  private int x,y;
  
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
  
  void display(int x, int y){
   image(sprite, x, y); 
  }
  
  void setCoord(int r, int c){
    this.r = r;
    this.c = c;
    this.x = 250 + c * 80;
    this.y = 70 + r * 100;
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
   return y; 
  }
  
  int getHP(){
   return HP; 
  }
  
  int getInterval(){
   return AtkInterval; 
  }
  
  void loseHP(int hp){
   this.HP -= hp; 
  }
}
