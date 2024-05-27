public class PacketUI{
  ArrayList<Packet> packetList;
  
  public PacketUI(){
    packetList = new ArrayList<Packet>();
  }
  
  void display(){
    for(Packet p : packetList){
     p.display(); 
    }
  }
}
