public class Lawnmower{
  private int x,y;
  PImage LM;
  boolean active = false;
  boolean finished = false;
  
  public Lawnmower(int x, int y){
   LM = loadImage("LawnMower.png");
   this.x = x;
   this.y = y;
  }
  
  void display(){
    image(LM, x, y);
    if(active){
     x+=5;
     if(x > 980){
       active = false;
       finished = true;
     }
    }
  }
  
  boolean getActive(){
    return active;
  }
  
  boolean getFinished(){
    return finished; 
  }
  
  void setFinished(){
    finished = true;
  }
  
  void setActive(){
    active = true; 
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
  
  int getX(){
    return x; 
  }
}
