/* please implement your assign2 code in this file. */
PImage bg1, bg2, start1, start2, end1, end2;
PImage enemy, fighter, hpimage, treasure;
float hp, fx, fy, tx, ty, ex, ey_c, ey_b,ey_a;
final int GAME_START = 1, GAME_RUN = 2, GAME_OVER = 3;
int background_speed, state = GAME_START,i = 1,level;
boolean upPressed = false, downPressed = false, leftPressed = false, rightPressed = false;

void setup () {
  size(640,480) ;
  background_speed = 0;
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  enemy = loadImage("img/enemy.png");
  fighter = loadImage("img/fighter.png");
  hpimage = loadImage("img/hp.png");
  treasure = loadImage("img/treasure.png");
  start2 = loadImage("img/start1.png");
  start1 = loadImage("img/start2.png");
  end2 = loadImage("img/end1.png");
  end1 = loadImage("img/end2.png");
  
  hp = 45;
  fx= random(0,599);
  fy = random(30,431);
  tx = random(0,599);
  ty = random(30,431);
  ex = 0;
  ey_c = random(30,431);
  ey_b = random(30,220); 
  ey_a = random(110,300); 
}
void draw() {

  switch(state){
    
    case GAME_START:
      image(start1,0,0);//start1
      if(mouseY > height/2+144 && mouseY < height/2+168)
      {
        if(mouseX > width/2-96 && mouseX < width/2+96){
          image(start2,0,0);//start2
          if(mousePressed)
            state = GAME_RUN; 
        }  
      }
      break;
      
    case GAME_RUN:
      //background;
      image(bg2,-640 + (background_speed+640) % 1280,0);
      image(bg1,-640 + background_speed % 1280,0);
  
      //hp
      fill(256,0,0);
      rect(11,6,hp,29);
      image(hpimage,5,5);
  
      image(treasure,tx,ty);//treasure
      image(fighter,fx,fy);//fighter
      
      //enemy wave
      if(i==1){
      for(int j=0; j<=4;j++){        //enemyC
         image(enemy,ex-j*51,ey_c);
         if(ex == 844){
           i = 2;
           ex = 0;
           ey_c = random(30,431);
           break;
         }
      }
      }
      else if(i==2){        //enemyB
      for(int j=0; j<=4;j++){
         image(enemy,ex-j*51,ey_b+j*51);
          if(ex == 844){
           i = 3;
           ex = 0;
           ey_b = random(30,230); 
           break;
         }
      }
      }
      else{        //enemyA
        for(int j= 0; j<5; j++){
          if(j==1||j==3)
            level = 1;
          else if(j==2)
            level = 2;
          else
            level = 3;
           
          if(level==2||level==1){
            image(enemy,ex-j*51,ey_a+level*51);
            image(enemy,ex-j*51,ey_a-level*51);
          }
          else
            image(enemy,ex-(j%5)*51,ey_a);
          if(ex == 844){
             i = 1;
             ex = 0;
             ey_a = random(110,300); 
             break;
          }  
        }
      }
      ex += 4;
      background_speed++;
      
      // move of fighter
      if(upPressed){
        fy -= 4;
        if(fy < 0)
          fy = 0;
      }
      if(downPressed){
        fy += 4;
        if(fy > height-51)
          fy = height-51;
      }
      if(leftPressed){
        fx -= 4;
        if(fx < 0)
          fx = 0;
      }
      if(rightPressed){
        fx += 4;
        if(fx > width-51)
          fx = width-51;
      }      
      break;
  }
}

void keyPressed(){
  if(key == CODED){
    switch(keyCode){
      case UP:
       upPressed = true;
      break;
      case DOWN:
        downPressed = true;
      break;
      case LEFT:
        leftPressed = true;
      break;
      case RIGHT:
        rightPressed = true;
      break;
    }
  }
}

void keyReleased(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        upPressed = false;
      break;
      case DOWN:
        downPressed = false;
      break;
      case LEFT:
        leftPressed = false;
      break;
      case RIGHT:
        rightPressed = false;
      break;
    }
  }
}
