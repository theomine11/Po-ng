int y1 = 350;
int y2 = 350;

boolean hautg = true;
boolean basg = false;
boolean hautd = false;
boolean basd = false;



boolean menu = true;
boolean deuxjoueurs = false;

int scorea = 0;
int scoreb = 0;

float score = 0;



float vitesse = 0;



int xellipse = 600;
int yellipse = 400;



int collision11 = 0;
int collision12 = 0;

int collision21 = 0;
int collision22 = 0;

void setup() {
  background(0);
  size(1200,800);
}

void draw() {
  background(0);
  player1();
  player2();
  bot();
  deplacement();
  sortt();
  ballon();
  hud();
  menu();
  pause();
}



void player1() {
  if(!menu) {
  fill(255);
  rect(20,y1-50,20,100);
  collision11 = y1-50;
  collision12 = y1+100;
  }
}

void deplacement() { 
  y1 = mouseY;
      
      
  
  if(keyPressed) {
    if(keyCode == UP) {
      if(y2 >= 50) {
      y2 -= 6;
      }
    }
    if(keyCode == DOWN) {
      if(y2 <= 750) {
      y2 += 6;
      }
    }
  }
}



void bot() {
  if(!menu) {
    if(!deuxjoueurs) {
  fill(255);
  
  rect(1180,yellipse-50,20,100);
  collision21 = yellipse;
  collision22 = yellipse+100;
  
  score += 0.01;
  vitesse += 0.005;
    }
  }
}



void ballon() {
  if(!menu) {
  fill(255);
  stroke(0);
  
  ellipse(xellipse,yellipse,40,40);
  
  
  
  
  if(xellipse <= 60) { 
  if(yellipse >= collision11) {
    if(yellipse <= collision12) {
      
      if(hautg) {
        hautg = false;
        basd = false;
        basg = false;
      
        hautd = true;
      }
      else {
        hautg = false;
        hautd = false;
        basg = false;
      
        basd = true;
      }
    }
  }
  }
  
  
  if(xellipse >= 1150) { 
  if(yellipse >= collision21) {
    if(yellipse <= collision22) {
      
      if(hautd) {
        hautd = false;
        basd = false;
        basg = false;
      
        hautg = true;
      }
      else {
        hautg = false;
        hautd = false;
        basd = false;
      
        basg = true;
      }
    }
  }
  }
  
  
  
  
  
  if(yellipse <= 20) {
    if(hautg) {
      hautg = false;
      hautd = false;
      basd = false;
      
      basg = true;
    }
    
    if(hautd) {
      hautg = false;
      hautd = false;
      basg = false;
      
      basd = true;
    }
  }
    
  if(yellipse >= 780) {
    if(basg) {
      basg = false;
      hautd = false;
      basd = false;
      
      hautg = true;
    }
    
    if(basd) {
      hautg = false;
      basd = false;
      basg = false;
      
      hautd = true;
    }
  }
  
  //déplacements de la balle
  if(deuxjoueurs) {
    vitesse = 0;
    
    if(hautg) {
    xellipse -= 6;
    yellipse -= 6;
  }
  if(hautd) {
    xellipse += 6;
    yellipse -= 6;
  }
  if(basg) {
    xellipse -= 6;
    yellipse += 6;
  }
  if(basd) {
    xellipse += 6;
    yellipse += 6;
  }
  }
  else {
  if(hautg) {
    xellipse -= 4+vitesse;
    yellipse -= 4+vitesse;
  }
  if(hautd) {
    xellipse += 4+vitesse;
    yellipse -= 4+vitesse;
  }
  if(basg) {
    xellipse -= 4+vitesse;
    yellipse += 4+vitesse;
  }
  if(basd) {
    xellipse += 4+vitesse;
    yellipse += 4+vitesse;
  }
  }
  }
}




void sortt() {
  if(xellipse <= 0) {
    if(deuxjoueurs) {
    scoreb++;
    
    xellipse = 600;
    yellipse = 400;
    }
    else {
      background(0);
      fill(0,255,0);
      textSize(50);
      text("Perdu! Votre score :",200,700);
      text(score,670,700);
      menu = true;
    }
  }
  
  if(xellipse >= 1200) {
    if(deuxjoueurs) {
    scorea++;
    
    xellipse = 600;
    yellipse = 400;
    }
  }
}



void player2() {
  if(!menu) {
    if(deuxjoueurs) {
      fill(255);
      rect(1180,y2-50,20,100);
      collision21 = y2-50;
      collision22 = y2+100;
    }
  }
}



void hud() {
  if(!menu) {
    if(deuxjoueurs) {
  textSize(70);
  fill(255,0,0);
  text(scorea,400,80);
  
  fill(0,255,0);
  text(scoreb,800,80);
  
  stroke(255);
  line(600,0,600,800);
    }
  
  if(!deuxjoueurs) {
    textSize(70);
    fill(0,255,0);
    text(score,500,750);
  }
  }
}

void menu() {
  if(menu) {
  textSize(100);
  fill(255,0,0);
  text("Po",500,110);
  fill(0,255,0);
  text("ng",617,140);
  
  stroke(255);
  strokeWeight(4);
  line(620,25,620,180);
  
  
  
  strokeWeight(1);
  rect(525,300,150,70);
  fill(255);
  textSize(40);
  text("Solo",558,350);
  
  fill(0,255,0);
  rect(525,400,150,70);
  fill(255);
  textSize(40);
  text("Multi",554,450);
  
  textSize(20);
  text("Created by Théo Mouchet",930,40);
  
  
  if(mouseX < 675 & mouseX > 525) {
    if(mouseY < 370 & mouseY > 300) {
      if(mousePressed) {
      menu = false;
      deuxjoueurs = false;
      
      xellipse = 600;
      yellipse = 400;
      
      score = 0;
      }
      }
    }
    
    if(mouseX < 675 & mouseX > 525) {
    if(mouseY < 470 & mouseY > 400) {
      if(mousePressed) {
      menu = false;
      deuxjoueurs = true;
      
      xellipse = 600;
      yellipse = 400;
      }
      }
    }
  }
}




void pause() {
  if(keyPressed) {
    if(key == 'e') {
      menu = true;
      
      scorea = 0;
      scoreb = 0;
    }
  }
}