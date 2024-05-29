public class Packet{
 private PImage packetImage;
 private int cooldown;
 private int x,y;
 private Plant plant;
 
 private int currentCD = 0;
 
 public Packet(String link, Plant plant, int x, int y, int CD){
   packetImage = loadImage(link);
   this.plant = plant;
   this.x = x;
   this.y = y;
   this.cooldown = CD * 60;
 }
 
 int getX(){
  return x; 
 }
 
 int getY(){
   return y;
 }
 
 void display(){
  image(packetImage, x, y);
  if(currentCD > 0){
  textSize(20);
  text(currentCD / 60 + 1, x + 20, y);
  }
 }
 
 void display(int x, int y){
  image(packetImage, x, y);
 }
 
 void onCooldown(){
   if(currentCD > 0){
     this.currentCD--;
   }
 }
 
 void resetCooldown(){
  currentCD = cooldown; 
 }
 
 int getCooldown(){
  return this.currentCD; 
 }
 
 Plant getPlant(){
  return plant; 
 }
 
}
