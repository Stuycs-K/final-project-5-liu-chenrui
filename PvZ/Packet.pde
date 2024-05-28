public class Packet{
 private PImage packetImage;
 private PImage plantImage;
 private boolean onCooldown;
 private int cooldown;
 private int cost;
 private int x,y;
 private Plant plant;
 
 public Packet(String link, Plant plant, String plantLink, int x, int y, int CD, int cost){
   packetImage = loadImage(link);
   plantImage = loadImage(plantLink);
   this.cost = cost;
   this.plant = plant;
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
 
 int getCost(){
  return cost; 
 }
 
 Plant getPlant(){
  return plant; 
 }
 
 void place(){
   
 }
}
