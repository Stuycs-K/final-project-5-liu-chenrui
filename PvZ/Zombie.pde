public class Zombie{
  private int HP;
  private int Speed;
  private int Defense;
  private int Damage;
  private PImage sprite;
  private int r,c;
  private int x,y;
  private boolean eating = false;
  
  public Zombie(int hp, int speed, int def, int dmg, String link, int r, int c){
    HP = hp;
    Speed = speed;
    Defense = def;
    Damage = dmg;
    
    this.r = r;
    this.c = c;
    this.x = 1000;
    this.y = 70 + r * 105;
    
    sprite = loadImage(link);
  }
  
  void Move(){
    image(sprite, x, y);
    if(x > 250 && !eating){
      x -= Speed; 
    }
  }
  
  void Attack(Plant target){
    
  }
  
  //void setPos(int x, int y){
  //  this.x = x;
  //  this.y = y;
  //}
  
  int getX(){
    return x; 
  }
  
  int getY(){
    return y; 
  }
  
  int getRow(){
   return r; 
  }
  
  int getColumn(){
   return c; 
  }
}
