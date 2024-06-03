public class SunflowerPacket extends Packet{
  public SunflowerPacket(){
    super("SunflowerPacket.png", 20, 80, 8);
  }
  
  Sunflower genSunflower(){
   return new Sunflower(); 
  }
}
