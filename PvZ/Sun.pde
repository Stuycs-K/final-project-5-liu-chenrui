public class Sun{
  private int x,y;
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
