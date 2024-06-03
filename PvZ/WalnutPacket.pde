public class WalnutPacket extends Packet{
  public WalnutPacket(){
    super("WalnutPacket.png", 20, 230, 30);
  }
  
  Walnut genWalnut(){
    return new Walnut(); 
  }
}
