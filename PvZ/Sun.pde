public class Sun{
  private int x,y;
  private int limit;
  private PImage sprite;
  private boolean clicked;
  
  public Sun(String link){
    sprite = loadImage(link);
    clicked = false;
    x = 250 + (int)random(730);
    y = 0;
  }
  
  public Sun(int x, int y, String link){
    sprite = loadImage(link);
    clicked = false;
    this.x = x;
    this.y = y;
    limit = y + 50;
  }
  
  void genSunDisplay(){
    if(clicked == false){
      image(sprite, x, y);
      if(y < limit){
        y++;
      }
    }
  }
  
  void display(){
    if(clicked == false){
      image(sprite, x, y);
      y++;
    }
  }
  
  boolean isClicked(){
   return clicked; 
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
   return y; 
  }
  
  void click(){
   this.clicked = true; 
  }
  
}
