public class Lawnmower{
  private int x,y;
  PImage LM;
  boolean active = false;
  
  public Lawnmower(int x, int y){
   LM = loadImage("LawnMower.png");
   this.x = x;
   this.y = y;
  }
  
  void display(){
    image(LM, x, y); 
  }
}
