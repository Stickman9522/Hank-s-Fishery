import processing.sound.*;
SoundFile backgroundSong;
SoundFile splash;
SoundFile error;

// declare picture vars
PImage PolarBearStart;
PImage PolarBear_Background;
PImage Perch;
PImage Sardine;
PImage Red_Mullet;
PImage Squid;
PImage Tuna;
PImage Sturgeon;
PImage Albacore;
PImage Midnight_Carp;
PImage Glacierfish;
PImage PolarBearwFish;
PImage PolarBear;
PImage caughtbackground;
PImage background;
PImage wood;



// easy mode 
Meter easy;

// medium mode
Meter medium;

// hard mode
Meter hard;

int state = 0;

int[] fishArray = {100,0,0,0,0,0,0,0,0,0};


void setup(){
  size(800, 700);
  background(0,200,200);
  
  // initialize images
  PolarBearStart = loadImage("PolarBearStart.png");
  PolarBearStart.resize(600,450);
  Perch = loadImage("Perch.png");
  Perch.resize(110,110);
  Sardine = loadImage("Sardine.png");
  Sardine.resize(110,110);
  Red_Mullet = loadImage("Red_Mullet.png");
  Red_Mullet.resize(110,110);
  Squid = loadImage("Squid.png");
  Squid.resize(110,110);
  Tuna = loadImage("Tuna.png");
  Tuna.resize(110,110);
  Sturgeon = loadImage("Sturgeon.png");
  Sturgeon.resize(110,110);
  Albacore = loadImage("Albacore.png");
  Albacore.resize(110,110);
  Midnight_Carp = loadImage("Midnight_Carp.png");
  Midnight_Carp.resize(110,110);
  Glacierfish = loadImage("Glacierfish.png");
  Glacierfish.resize(110,110);
  PolarBear_Background = loadImage("PolarBear_Background.png");
  PolarBear_Background.resize(800,700);
  PolarBearwFish = loadImage("PolarBearwFish.png");
  PolarBearwFish.resize(250,250);
  caughtbackground = loadImage("caughtbackground.jpeg");
  caughtbackground.resize(800,700);
  background = loadImage("background.jpeg");
  background.resize(800,700);
  wood = loadImage("wood.png");
  wood.resize(800,700);
  
  
  
  
  easy = new Meter(550, height/8, 50, 400, 4, 550 + 1, height/8, 48, 75);
  medium = new Meter(550, height/8, 50, 400, 8, 550 + 1, height/8, 48, 75);
  hard = new Meter(550, height/8, 50, 400, 12, 550 + 1, height/8, 48, 75);
  
  // music
  backgroundSong = new SoundFile(this, "backgroundSong.mp3");
  backgroundSong.play();
  splash = new SoundFile(this, "splash.wav");
  error = new SoundFile(this, "error.wav");
}

void draw(){
  if (!backgroundSong.isPlaying()){
    backgroundSong.play();
  }
  switch(state){
    // start screen
    case 0:
    background(background);
    image(PolarBearStart, 75, 75);
    textSize(75);
    fill(0);
    text("Hank's Fishery", width/8, 75); 
    textSize(50);
    text("How to Play: Click to Catch Fish", width/16, height/4*3+75);
    textSize(75);
    text("Press 's' to Start", width/16, height-20);
    if (keyPressed == true){
      if (key == 's'){
        state = 1;
      }
    }
    break;
    
    // play screen easy mode
    case 1:
    background(PolarBear_Background);
    easy.render();
    easy.Movement();
    easy.bar();
    easy.points();
    easy.pointBar();
    break;
    
    // play screen medium mode
    case 2:
    background(PolarBear_Background);
    medium.render();
    medium.Movement();
    medium.bar();
    medium.points();
    medium.pointBar();
    break;
    
    case 3:
    background(PolarBear_Background);
    hard.render();
    hard.Movement();
    hard.bar();
    hard.points();
    hard.pointBar();
    break;
    
    
    // fish caught cases
    case 100:
    background(caughtbackground);
    fill(0);
    textSize(75);
    text("You Caught a Perch!", width/8, height/16+50);
    image(Perch, width/2-55, height/4-45);
    image(PolarBearwFish, width/2+125, height/2-125);
    textSize(50);
    text("Press X to leave", width/8, height-150);
    if(keyPressed == true){
      if(key == 'x'){
      fishArray[0] = 0;
      fishArray[1] = 101;
      easy.resetPoints();
      state = 1;      
      }
    }
    break;

    case 101:
    background(caughtbackground);
    textSize(75);
    fill(0);
    text("You Caught a Sardine!", width/8-15, height/16+50);
    image(PolarBearwFish, width/2+125, height/2-125);
    textSize(50);
    image(Sardine, width/2-55, height/4-45);
    text("Press X to leave", width/8, height-150);
    if(keyPressed == true){
      if(key == 'x'){
      easy.resetPoints();
      fishArray[1] = 0;
      fishArray[2] = 102;
      state = 1;
      }
    }
    break;
    
    case 102:
    background(caughtbackground);
    textSize(70);
    fill(0);
    text("You Caught a Red Mullet!", width/8-40, height/16+50);
    image(PolarBearwFish, width/2+125, height/2-125);
    textSize(50);
    image(Red_Mullet, width/2-55, height/4-45);
    text("Press X to leave", width/8, height-150);
    if(keyPressed == true){
      if(key == 'x'){
        easy.resetPoints();
        fishArray[2] = 0;
        fishArray[3] = 103;
        state = 1;
      }
    }
    break;
    
    // fish before medium mode
    case 103:
    background(caughtbackground);
    textSize(75);
    fill(0);
    text("You Caught a Squid!", width/8-25, height/16+50);
    image(PolarBearwFish, width/2+125, height/2-125);
    textSize(50);
    image(Squid, width/2-55, height/4-45);
    text("Press X to leave", width/8, height-150);
    if(keyPressed == true){
      if(key == 'x'){
        easy.resetPoints();
        medium.resetPoints();
        hard.resetPoints();
        fishArray[3] = 0;
        fishArray[4] = 104;
        state = 2;
      }
    }
    break;
    
    case 104:
    background(caughtbackground);
    textSize(75);
    fill(0);
    text("You Caught a Tuna!", width/8, height/16+50);
    textSize(50);
    image(Tuna, width/2-55, height/4-45);
    image(PolarBearwFish, width/2+125, height/2-125);
    text("Press X to leave", width/8, height-150);
    if(keyPressed == true){
      if(key == 'x'){
        easy.resetPoints();
        medium.resetPoints();
        hard.resetPoints();
        fishArray[4] = 0;
        fishArray[5] = 105;
        state = 2;
      }
    }
    break;
    
     case 105:
    background(caughtbackground);
    textSize(75);
    fill(0);
    text("You Caught a Sturgeon!", width/8-55, height/16+50);
    image(PolarBearwFish, width/2+125, height/2-125);
    textSize(50);
    image(Sturgeon, width/2-55, height/4-45);
    text("Press X to leave", width/8, height-150);
    if(keyPressed == true){
      if(key == 'x'){
        easy.resetPoints();
        medium.resetPoints();
        hard.resetPoints();
        fishArray[5] = 0;
        fishArray[6] = 106;
        state = 2;
      }
    }
    break;
    
     case 106:
    background(caughtbackground);
    textSize(65);
    fill(0);
    text("You caught an Albacore", width/8-20, height/16+50);
    image(PolarBearwFish, width/2+125, height/2-125);
    textSize(50);
    image(Albacore, width/2-55, height/4-45);
    text("Press X to leave", width/8, height-150);
    if(keyPressed == true){
      if(key == 'x'){
        easy.resetPoints();
        medium.resetPoints();
        hard.resetPoints();
        fishArray[6] = 0;
        fishArray[7] = 107;
        state = 3;
      }
    }
    break;
    
    case 109:
    background(wood);
    image(Perch, width/6-55, 100);
    image(Sardine, width/6*2-55, 100);
    image(Red_Mullet, width/6*3-55, 100);
    image(Squid, width/6*5-165, 100);
    image(Tuna, width/6*5, 100);
    
    image(Sturgeon, width/5-55, 300);
    image(Albacore, width/5*2-55, 300);
    image(Midnight_Carp, width/5*3-55, 300);
    image(Glacierfish, width/5*4-55, 300);
    textSize(60);
    fill(255);
    text("You Filled Your Index!", width/8+55, height/4*3);
    text("Thanks for Playing!!!", width/8+55, height/4*3+100);
    break;
    
   
    case 107:
    background(caughtbackground);
    textSize(60);
    fill(0);
    text("You caught a Midnight Carpe", width/8-50, height/16+50);
    image(PolarBearwFish, width/2+125, height/2-125);
    textSize(50);
    image(Midnight_Carp, width/2-55, height/4-45);
    text("Press X to leave", width/8, height-150);
    if(keyPressed == true){
      if(key == 'x'){
        easy.resetPoints();
        medium.resetPoints();
        hard.resetPoints();
        fishArray[7] = 0;
        fishArray[8] = 108;
        state = 3;
      }
    }
    break;
    
    case 108:
    background(caughtbackground);
    textSize(65);
    fill(0);
    text("You caught a Glacierfish", width/8-45, height/16+50);
    textSize(50);
    image(Glacierfish, width/2-55, height/4-45);
    image(PolarBearwFish, width/2+125, height/2-125);
    text("Press X to leave", width/8, height-150);
    if(keyPressed == true){
      if(key == 'x'){
        easy.resetPoints();
        medium.resetPoints();
        hard.resetPoints();
        fishArray[8] = 0;
        fishArray[9] = 109;
        state = 109;
      }
    }
    break;
  }
}



void mousePressed(){
  easy.register();
  medium.register();
  hard.register();
}
