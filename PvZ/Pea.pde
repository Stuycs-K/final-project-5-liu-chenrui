public class Pea{
  private int x, y;
  private int r;
  private boolean active = false;
  PImage sprite = loadImage("Pea.png");
  
  public Pea(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  int getR(){
    int row = (y - 70) / 100;
    if(row > 4){
     row = 4; 
    }
    if(row < 0){
     row = 0; 
    }
    return row; 
  }
  
  int getX(){
    return x; 
  }
  
  boolean getActive(){
    return active; 
  }
  
  void display(){
    if(active){
      image(sprite, x, y);
      x += 4;
    }
  }
  
  void damage(Zombie z){
    z.removeHP(1);
  }
  
  void setActive(boolean b){
    active = b; 
  }
}
