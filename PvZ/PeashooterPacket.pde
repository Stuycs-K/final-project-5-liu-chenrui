public class PeashooterPacket extends Packet{
  public PeashooterPacket(){
    super("PeashooterPacket.png", 0, 150, 8);
  }
  
  Peashooter genPeashooter(){
   return new Peashooter(); 
  }
}
