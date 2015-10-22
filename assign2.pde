PImage background1;
PImage background2;
PImage enemy;
PImage fighter;
PImage hp;
PImage treasure;
PImage start1;
PImage start2;
PImage end1;
PImage end2;

final int GAME_START=0;
final int GAME_RUNNING=1;
final int GAME_LOSE=3;
final int speed=5;

int background_X1,background_X2;
int rectX;
int fighterY;
int fighterX;
int enemyX,enemyY;
int treasureX,treasureY;
int GAMEstate;

boolean upPressed=false;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;

void setup(){
    
    size(640,480);
    background(0);
    
    background1=loadImage("img/bg1.png");
    background2=loadImage("img/bg2.png");
    enemy=loadImage("img/enemy.png");
    fighter=loadImage("img/fighter.png");
    hp=loadImage("img/hp.png");
    treasure=loadImage("img/treasure.png");
    start1=loadImage("img/start1.png");
    start2=loadImage("img/start2.png");
    end1=loadImage("img/end1.png");
    end2=loadImage("img/end2.png");
    
    GAMEstate=GAME_START;
    
    background_X1=640;
    background_X2=0;
    
    rectX=floor(random(25,204));
    
    fighterY=240;
    fighterX=590;    
    
    treasureX=floor(random(30,590));
    treasureY=floor(random(30,420));
   
    enemyX=0;   
        
}

void draw(){
  
  if(upPressed){
    fighterY-=speed;
  }
  if(downPressed){
    fighterY+=speed;
  }
  if(leftPressed){
    fighterX-=speed;
  }
  if(rightPressed){
    fighterX+=speed;
  }
  
  if(fighterX>width-50){
    fighterX=width-50;
  }  
  if(fighterX<0){
    fighterX=0;
  }
  if(fighterY>height-50){
    fighterY=height-50;
  }
  if(fighterY<0){
    fighterY=0;
  }
  
  switch(GAMEstate){
      case GAME_START:
      
      image(start1,0,0);
      
        if(mouseY>380 && mouseY<410 && mouseX>200 && mouseX<450){
          if(mousePressed){
              GAMEstate=GAME_RUNNING;
              enemyY=floor(random(40,420));
          }else{
            image(start2,0,0);
          }
        }
        
      break;
      
      case GAME_RUNNING:
            
              
        image(background1,-640+background_X1,0);
        image(background2,-640+background_X2,0);
    
        background_X1+=2;
        background_X2+=2;
        background_X1%=1280;
        background_X2%=1280;
    
        image(treasure,treasureX,treasureY);
    
        image(enemy,-70+enemyX,enemyY);
        enemyX+=4;
        enemyX%=680;
    
    
        fill(255,0,0);
        rect(20,13,rectX,25);
        image(hp,10,10);
    
        image(fighter,fighterX,fighterY);
        
        if(fighterX<enemyX+60 && fighterX+60>enemyX && fighterY<enemyY+20 && fighterY+20>enemyY){
          GAMEstate=GAME_LOSE;
          enemyX=0;
        }        
        

        
      break; 
      
      case GAME_LOSE:
      
        image(end1,0,0);
          
          if(mouseY>300 && mouseY<340 && mouseX>200 && mouseX<450){
            if(mousePressed){
              GAMEstate=GAME_START;
          }else{
            image(end2,0,0);
          }
        }
        
      break;      
  }    

    
}

void keyPressed(){
  if(key==CODED){
    switch(keyCode){
      case UP:
        upPressed=true;
      break;
      
      case DOWN:
        downPressed=true;
      break;
      
      case LEFT:
        leftPressed=true;
      break;
      
      case RIGHT:
        rightPressed=true;
      break;
    }
  }
}

void keyReleased(){
  if(key==CODED){
    switch(keyCode){
      case UP:
        upPressed=false;
      break;
      
      case DOWN:
        downPressed=false;
      break;
      
      case LEFT:
        leftPressed=false;
      break;
      
      case RIGHT:
        rightPressed=false;
      break;      
    }
  }
}
