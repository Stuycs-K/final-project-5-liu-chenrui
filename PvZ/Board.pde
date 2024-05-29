public class Board{
 private int rows;
 private int cols;
 private Plant[][] plants;
 
 public Board(int row, int col){
   rows = row;
   cols = col;
   plants = new Plant[rows][cols];
 }
 
 public Plant[][] getPlants(){
  return plants; 
 }
 
}
