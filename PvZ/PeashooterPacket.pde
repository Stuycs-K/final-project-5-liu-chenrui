public class PeashooterPacket extends Packet{
  public PeashooterPacket(){
    super("PeashooterPacket.png", 0, 80, 8);
  }
  
  Peashooter genSunflower(){
   return new Peashooter(); 
  }
}
