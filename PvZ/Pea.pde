public class Pea{
  private int x, y;
  private int r;
  PImage sprite = loadImage("Pea.png");
  
  public Pea(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void display(){
    image(sprite, x, y);
    x++;
  }
  
  void damage(Zombie z){
    z.removeHP(1);
  }
}
