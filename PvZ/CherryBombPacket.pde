public class CherryBombPacket extends Packet{
  public CherryBombPacket(){
    super("CherryBombPacket.png", 20, 310, 50); 
  }
  
  CherryBomb genCherryBomb(){
   return new CherryBomb(); 
  }
}
