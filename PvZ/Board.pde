public class Board{
 private int rows = 5;
 private int cols = 9;
  
 private int top_left_x = 250;
 private int top_right_y = 85;
 private int cell_width = 85;
 private int cell_height = 85;
 
 public PVector getWorldPos(float row, float column){
  return new PVector(top_left_x + row*top_right_y, column*cell_width, column*cell_height);
 }
}
