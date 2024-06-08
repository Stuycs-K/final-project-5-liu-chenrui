public class PacketUI{
  private SunflowerPacket SF;
  private PeashooterPacket PS;
  private WalnutPacket WP;
  private CherryBombPacket CBP;
  
  public PacketUI(){
    SF = new SunflowerPacket();
    PS = new PeashooterPacket();
    WP = new WalnutPacket();
    CBP = new CherryBombPacket();
  }
  
  void display(){
    SF.display();
    PS.display();
    WP.display();
    CBP.display();
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
  
  CherryBombPacket getCBP(){
    return CBP; 
  }
}
