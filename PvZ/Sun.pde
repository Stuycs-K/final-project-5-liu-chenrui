public class Sun{
  private float x,y;
  private PImage sprite;
  private boolean clicked;
  
  public Sun(String link){
    sprite = loadImage(link);
    clicked = false;
    x = 250 + random(730);
    y = 0;
  }
  
  void display(){
    if(clicked == false){
      image(sprite, x, y);
      y++;
    }
  }
  
}
