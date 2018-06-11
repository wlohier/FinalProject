class VictoryScreen implements Screen{
  void display(){
    if(won){
      fill(50, 205, 50);
      rect(0, 0, 600, 400);
      image(dabSterr, 200, 150, 250, 120);
      fill(255);
      textSize(50);
      text("You Won!!", 200, 70);
      textSize(20);
      text("Mr. Sterr got his crib for nolan and a little extra\n for him and Mrs. Sterr to take a long overdue vacation!", 50, 100);
      fill(0);
      text("You made: $" + money + " in " + timer/60 + " seconds!!", 50, 300);
      fill(255);
      rect(250, 330, 100, 50);
      fill(0);
      text("restart", 260, 350);
    }
  }
  
  void clicked(){
    if(won);
    if(pmouseX > 250 && pmouseX < 350 &&
       pmouseY > 330 && pmouseY < 380){
      won = false;
      reset();
    }
  }
}
