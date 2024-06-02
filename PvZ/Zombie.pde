public class Zombie{
  private int HP;
  private int Speed;
  private int Defense;
  private int Damage;
  private PImage sprite;
  private int r;
  private int x,y;
  private boolean eating = false;
  private int eatCD = 30;
  private int walkCD = 60;
  
  public Zombie(int hp, int speed, int def, int dmg, String link, int r){
    HP = hp;
    Speed = speed;
    Defense = def;
    Damage = dmg;
    
    this.r = r;
    this.x = 980;
    this.y = 70 + r * 100;
    
    sprite = loadImage(link);
  }
  
  void Move(){
    image(sprite, x, y);
    if(x > 250 && !eating && walkCD == 0){
      x -= Speed; 
    }
  }
  
  void Attack(Plant target){
    eating = true;
    if(eatCD == 0){
      target.loseHP(Damage);
      eatCD = 30;
    }
  }
  
  void resetEatCD(){
    if(eatCD > 0){
      eatCD--; 
    }
  }
  
  void setEating(boolean e){
    eating = e;    
  }
  
  void removeHP(int hp){
    this.HP -= hp;
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
    int row = (y - 70) / 100;
    if(row > 4){
     row = 4; 
    }
    if(row < 0){
     row = 0; 
    }
   return row; 
  }
  
  int getCol(){
    int col = (x - 250) / 80;
    if(col > 8){
     col = 8; 
    }
    if(col < 0){
     col = 0; 
    }
    return col;
  }
  
}
