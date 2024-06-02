public class PacketUI{
  private SunflowerPacket SF;
  private PeashooterPacket PS;
  private WalnutPacket WP;
  
  public PacketUI(){
    SF = new SunflowerPacket();
    PS = new PeashooterPacket();
    WP = new WalnutPacket();
  }
  
  void display(){
    SF.display();
    PS.display();
    WP.display();
  }
  
  SunflowerPacket getSFP(){
    return SF;
  }
  
  PeashooterPacket getPSP(){
    return PS; 
  }
  
  WalnutPacket getWP(){
   return WP; 
  }
}
