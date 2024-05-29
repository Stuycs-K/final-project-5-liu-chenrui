public class PacketUI{
  private ArrayList<Packet> packetList;
  
  public PacketUI(){
    packetList = new ArrayList<Packet>();
    
    packetList.add(new Packet("Sunflower_seed_packet.jpg", new Sunflower(), 0, 80, 8));
  }
  
  void display(){
    for(Packet p : packetList){
     p.display(); 
    }
  }
  
  ArrayList<Packet> getPackets(){
   return packetList; 
  }
}
