public class Board{
 private int rows;
 private int cols;
 private Plant[][] plants;
  
 private int top_left_x = 250;
 private int top_right_y = 85;
 private int cell_width = 80;
 private int cell_height = 80;
 
 public Board(int row, int col){
   rows = row;
   cols = col;
   plants = new Plant[row][col];
 }
 
 public PVector getWorldPos(float row, float column){
  return new PVector(top_left_x + row*top_right_y, column*cell_width, column*cell_height);
 }
}
