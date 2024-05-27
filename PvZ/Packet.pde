public class Packet{
 private PImage packetImage;
 private boolean onCooldown;
 private int cooldown;
 private int x,y;
 
 public Packet(String link, int x, int y, int CD){
   packetImage = loadImage(link);
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
 
 void place(){
   
 }
}
