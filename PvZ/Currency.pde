public class Currency{
  private int Sun;
  
  public Currency(){
   Sun = 0; 
  }
  
  int getSun(){
   return this.Sun; 
  }
  
  void addSun(int sun){
    Sun += sun;
  }
  
  void removeSun(int sun){
    Sun -= sun; 
  }
}
