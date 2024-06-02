public class PacketUI{
  private SunflowerPacket SF;
  private PeashooterPacket PS;
  
  public PacketUI(){
    SF = new SunflowerPacket();
    PS = new PeashooterPacket();
  }
  
  void display(){
    SF.display();
    PS.display();
  }
  
  SunflowerPacket getSFP(){
    return SF;
  }
  
  PeashooterPacket getPSP(){
    return PS; 
  }
}
