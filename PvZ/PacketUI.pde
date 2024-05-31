public class PacketUI{
  private SunflowerPacket SF;
  
  public PacketUI(){
    SF = new SunflowerPacket();
  }
  
  void display(){
    SF.display();
  }
  
  SunflowerPacket getSFP(){
   return SF; 
  }
}
