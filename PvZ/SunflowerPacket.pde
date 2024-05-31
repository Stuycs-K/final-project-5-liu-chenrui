public class SunflowerPacket extends Packet{
  public SunflowerPacket(){
    super("Sunflower_seed_packet.jpg", 0, 80, 8);
  }
  
  Sunflower genSunflower(){
   return new Sunflower(); 
  }
}
