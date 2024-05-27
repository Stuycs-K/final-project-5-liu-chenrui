public class Packet{
 private PImage packetImage;
 private PImage plantImage;
 private boolean onCooldown;
 private int cooldown;
 private int x,y;
 
 public Packet(String link, String plantLink, int x, int y, int CD){
   packetImage = loadImage(link);
   plantImage = loadImage(plantLink);
   this.x = x;
   this.y = y;
   this.cooldown = CD;
 }
 
 int getX(){
  return x; 
 }
 
 int getY(){
   return y;
 }
 
 void display(){
  image(packetImage, x, y);
 }
 
 void display(int x, int y){
  image(plantImage, x, y);
 }
 
 void place(){
   
 }
}
