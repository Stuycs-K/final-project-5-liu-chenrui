public class WalnutPacket extends Packet{
  public WalnutPacket(){
    super("WalnutPacket.png", 0, 230, 30);
  }
  
  Walnut genWalnut(){
    return new Walnut(); 
  }
}
