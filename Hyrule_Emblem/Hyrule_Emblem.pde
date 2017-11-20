
// IMAGES
/*
right side of the screen is width. center is x/2; and y/2;
 Void keyPressed()--------- operation
 {
 background (random(255), random(255), random(255); to change bg color every time a key is pressed  
 }
 mouseX: to change the mouse position
 mouseY: to change the mouse position
 float: can do decimals when int can't.
 return: gives you an answer. Score like stuff.
 if (mouseX> buttonX && mouseX<buttonX. Use && for easy nested if statements.
 */
import de.voidplus.leapmotion.*;
import processing.sound.*;
SoundFile file;
import processing.video.*;
LeapMotion leap;
Movie myMovie;
Weapon Garrow;
Weapon Arrow; 
Weapon Zarrow;
Weapon Darrow;
int scene = 0;
int x = 0;
int y =100;
int x2 = 0;
int y2 = 700;
int x3 = 0;
int y3 = 500;
int x4 = 0;
int y4 = 300;
int h2= 150;
int w2= 143;
PImage img;
PImage zeldarrow;
PImage dArrow;
PImage linkarrow;
PImage garrow;
PImage screen;
PImage gameover;
PImage ganon;
PImage linky;
PImage zeld;
PImage dlink;
PImage vict;
boolean gameWin = false;
boolean gameOver = false;
int HEALTH=4;
float[] hp=new float[HEALTH];
float arrowX = 450;
float arrowY = 100;
float arrowX2 = 450;
float arrowY2 = 300;
float arrowX3 = 450;
float arrowY3 = 500;
float arrowX4 = 450;
float arrowY4 = 700;
boolean arrowExists = false;
boolean hasTheMovieStarted = false;

void setup ()
{
  leap = new LeapMotion(this);
  leap = new LeapMotion(this).allowGestures();  // All gestures
  // leap = new LeapMotion(this).allowGestures("circle, swipe, screen_tap, key_tap");
  // leap = new LeapMotion(this).allowGestures("swipe");  // Leap detects only swipe gestures
  fullScreen(P2D);
  linkarrow = loadImage("Arrow.png");
  Garrow=new Weapon(250, 0, 700, 20, "Garrow.png");
  Arrow=new Weapon(500, 0, 100, 35, "Arrow.png");
  Zarrow=new Weapon(100, 0, 500, 15, "Zarrow.png");
  Darrow=new Weapon(150, 0, 300, 25, "Darrow.png");
  screen = loadImage("Splash.PNG");
  gameover= loadImage("gameover.jpg");
  linky =  loadImage("Link.png");
  ganon = loadImage("Ganondorf.png"); 
  zeld = loadImage("Zelda.png");
  dlink = loadImage ("Dark Link.png");
  dArrow = loadImage ("Darrow.png");
  //zeldarrow = loadImage ("Zarrow.png");
  garrow = loadImage ("Garrow.png");
  file = new SoundFile(this, "Hyrule.mp3");
  file.play();
  file.amp(0.5);
  myMovie = new Movie(this, "Dragmire.mp4");
  myMovie.play();
  myMovie.speed(0.5);
  myMovie.volume(0);
  for (int i=0; i<HEALTH; i++)
  {
    hp[i]=100;
  }
}



void draw ()
{

  int fps = leap.getFrameRate();
  for (Hand hand : leap.getHands ()) {


    // ==================================================
    // 2. Hand

    int     handId             = hand.getId();
    PVector handPosition       = hand.getPosition();
    PVector handStabilized     = hand.getStabilizedPosition();
    PVector handDirection      = hand.getDirection();
    PVector handDynamics       = hand.getDynamics();
    float   handRoll           = hand.getRoll();
    float   handPitch          = hand.getPitch();
    float   handYaw            = hand.getYaw();
    boolean handIsLeft         = hand.isLeft();
    boolean handIsRight        = hand.isRight();
    float   handGrab           = hand.getGrabStrength();
    float   handPinch          = hand.getPinchStrength();
    float   handTime           = hand.getTimeVisible();
    PVector spherePosition     = hand.getSpherePosition();
    float   sphereRadius       = hand.getSphereRadius();

    // --------------------------------------------------
    // Drawing
    hand.draw();


    // ==================================================
    // 3. Arm

    if (hand.hasArm()) {
      Arm     arm              = hand.getArm();
      float   armWidth         = arm.getWidth();
      PVector armWristPos      = arm.getWristPosition();
      PVector armElbowPos      = arm.getElbowPosition();
    }


    // ==================================================
    // 4. Finger

    Finger  fingerThumb        = hand.getThumb();
    // or                        hand.getFinger("thumb");
    // or                        hand.getFinger(0);

    Finger  fingerIndex        = hand.getIndexFinger();
    // or                        hand.getFinger("index");
    // or                        hand.getFinger(1);

    Finger  fingerMiddle       = hand.getMiddleFinger();
    // or                        hand.getFinger("middle");
    // or                        hand.getFinger(2);

    Finger  fingerRing         = hand.getRingFinger();
    // or                        hand.getFinger("ring");
    // or                        hand.getFinger(3);

    Finger  fingerPink         = hand.getPinkyFinger();
    // or                        hand.getFinger("pinky");
    // or                        hand.getFinger(4);

    if (dist(hand.getThumb().getPosition().x, hand.getThumb().getPosition().y, hand.getIndexFinger().getPosition().x, hand.getIndexFinger().getPosition().y)<5)
    {
      Arrow.isAlive=true;
    }
    for (Finger finger : hand.getFingers()) {
      // or              hand.getOutstretchedFingers();
      // or              hand.getOutstretchedFingersByAngle();

      int     fingerId         = finger.getId();
      PVector fingerPosition   = finger.getPosition();
      PVector fingerStabilized = finger.getStabilizedPosition();
      PVector fingerVelocity   = finger.getVelocity();
      PVector fingerDirection  = finger.getDirection();
      float   fingerTime       = finger.getTimeVisible();

      // ------------------------------------------------
      // Drawing

      // Drawing:
      // finger.draw();  // Executes drawBones() and drawJoints()
      // finger.drawBones();
      // finger.drawJoints();

      // ------------------------------------------------
      // Selection



      switch(finger.getType()) {
      case 0:
        // System.out.println("thumb");

        break;
      case 1:
        // System.out.println("index");
        break;
      case 2:
        // System.out.println("middle");
        break;
      case 3:
        // System.out.println("ring");
        break;
      case 4:
        // System.out.println("pinky");
        break;
      }


      // ================================================
      // 5. Bones
      // --------
      // https://developer.leapmotion.com/documentation/java/devguide/Leap_Overview.html#Layer_1

      Bone    boneDistal       = finger.getDistalBone();
      // or                      finger.get("distal");
      // or                      finger.getBone(0);

      Bone    boneIntermediate = finger.getIntermediateBone();
      // or                      finger.get("intermediate");
      // or                      finger.getBone(1);

      Bone    boneProximal     = finger.getProximalBone();
      // or                      finger.get("proximal");
      // or                      finger.getBone(2);

      Bone    boneMetacarpal   = finger.getMetacarpalBone();
      // or                      finger.get("metacarpal");
      // or                      finger.getBone(3);

      // ------------------------------------------------
      // Touch emulation

      int     touchZone        = finger.getTouchZone();
      float   touchDistance    = finger.getTouchDistance();

      switch(touchZone) {
      case -1: // None
        break;
      case 0: // Hovering
        // println("Hovering (#" + fingerId + "): " + touchDistance);
        break;
      case 1: // Touching
        // println("Touching (#" + fingerId + ")");
        break;
      }
    }


    // ==================================================
    // 6. Tools

    for (Tool tool : hand.getTools()) {
      int     toolId           = tool.getId();
      PVector toolPosition     = tool.getPosition();
      PVector toolStabilized   = tool.getStabilizedPosition();
      PVector toolVelocity     = tool.getVelocity();
      PVector toolDirection    = tool.getDirection();
      float   toolTime         = tool.getTimeVisible();

      // ------------------------------------------------
      // Drawing:
      // tool.draw();

      // ------------------------------------------------
      // Touch emulation

      int     touchZone        = tool.getTouchZone();
      float   touchDistance    = tool.getTouchDistance();

      switch(touchZone) {
      case -1: // None
        break;
      case 0: // Hovering
        // println("Hovering (#" + toolId + "): " + touchDistance);
        break;
      case 1: // Touching
        // println("Touching (#" + toolId + ")");
        break;
      }
    }
  }


  // ====================================================
  // 7. Devices

  for (Device device : leap.getDevices()) {
    float deviceHorizontalViewAngle = device.getHorizontalViewAngle();
    float deviceVericalViewAngle = device.getVerticalViewAngle();
    float deviceRange = device.getRange();
  }


  SplashScreen();
  Movie();
  Garrow.Render();
  Arrow.Render();
  Zarrow.Render();
  Darrow.Render();
  Input();
  GameOver();
}



void leapOnInit() {
  // println("Leap Motion Init");
}
void leapOnConnect() {
  // println("Leap Motion Connect");
}
void leapOnFrame() {
  // println("Leap Motion Frame");
}
void leapOnDisconnect() {
  // println("Leap Motion Disconnect");
}
void leapOnExit() {
  // println("Leap Motion Exit");
}


// 1. Swipe Gesture

void leapOnSwipeGesture(SwipeGesture g, int state) {
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector position         = g.getPosition();
  PVector positionStart    = g.getStartPosition();
  PVector direction        = g.getDirection();
  float   speed            = g.getSpeed();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();
  Garrow.isAlive=true;
  switch(state) {
  case 1: // Start
    break;
  case 2: // Update
    break;
  case 3: // Stop
    println("SwipeGesture: " + id);
    break;
  }
}


// ======================================================
// 2. Circle Gesture

void leapOnCircleGesture(CircleGesture g, int state) {
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector positionCenter   = g.getCenter();
  float   radius           = g.getRadius();
  float   progress         = g.getProgress();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();
  int     direction        = g.getDirection();
  Zarrow.isAlive=true;
  switch(state) {
  case 1: // Start
    break;
  case 2: // Update
    break;
  case 3: // Stop
    println("CircleGesture: " + id);
    break;
  }

  switch(direction) {
  case 0: // Anticlockwise/Left gesture
    break;
  case 1: // Clockwise/Right gesture
    break;
  }
}


// ======================================================
// 3. Screen Tap Gesture

void leapOnScreenTapGesture(ScreenTapGesture g) {
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector position         = g.getPosition();
  PVector direction        = g.getDirection();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();
  Darrow.isAlive=true;
  println("ScreenTapGesture: " + id);
}


// ======================================================
// 4. Key Tap Gesture

void leapOnKeyTapGesture(KeyTapGesture g) {
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector position         = g.getPosition();
  PVector direction        = g.getDirection();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();

  println("KeyTapGesture: " + id);
}

void Movie()
{
  if (gameWin==true)
  {
    image(vict, 0, 0, width, height);
    if (hasTheMovieStarted == false) {
      hasTheMovieStarted = true;
      myMovie.jump(0.1);
      myMovie.loop();
    }
    image(myMovie, 0, 0, width, height);
    myMovie.frameRate(30);
  }
}

void SplashScreen()
{
  if (scene==0)
  {
    image( screen, 0, 0, width, height);
  }
  if (scene==1)
  {
    PlayGame();
  }
}

void GameOver()
{
  if (scene==2)
  {
    image( gameover, 0, 0, width, height);
  }

  if (gameOver==true)
  {
    scene=2;
  }

}
void movieEvent(Movie m) 
{
  m.read();
}

void PlayGame()
{
  background(0);

  if (gameWin == false) {
    Collision();
    Link();
    Ganondorf();
    Zelda();
    DarkLink();
  }

  fill(255, 51, 30);
  rect(x, y, hp[0], 5);

  fill(255, 51, 30);
  rect(x2, y2, hp[1], 5);

  fill(255, 51, 30);
  rect(x3, y3, hp[2], 5);

  fill(255, 51, 30);
  rect(x4, y4, hp[3], 5);
}

void Link()
{
  image(linky, x, y);

  if (x>2200)
  {
    x= -1000;
  }
  if (y>1200)
  {
    y= -650;
  }
}


void Ganondorf()
{
  image(ganon, x2, y2);
  if (x2>2200)
  {
    x2= -1000;
  }
  if (y2>1200)
  {
    y2= -650;
  }
}

void Zelda()
{
  image(zeld, x3, y3);
  if (x3>2200)
  {
    x3= -1000;
  }
  if (y3>1200)
  {
    y3= -650;
  }
}

void DarkLink()
{
  image(dlink, x4, y4);
  if (x4>2200)
  {
    x4= -1000;
  }
  if (y4>1200)
  {
    y4= -650;
  }
}


void Input()
{
  if (keyPressed)
  {
    if (key ==' ')
    {
      scene=1;
    }
    if (key== '\n')
    {
      Garrow.isAlive=true;
    }

    if (keyCode== SHIFT)
    {
      Arrow.isAlive=true;
    }

    if (key== '\t')
    {
      Zarrow.isAlive=true;
    }

    if (key== '\\')
    {
      Darrow.isAlive=true;
    }

    if (key =='w')
    {
      y = y -20;
    }

    if (key =='a')
    {
      x =x-20;
    }

    if (key =='s')
    {
      y = y +20;
    }

    if (key =='d')
    {
      x= x+20;
    }
    if (key =='t')
    {
      y2 = y2 -20;
    }

    if (key =='f')
    {
      x2 =x2-20;
    }

    if (key =='g')
    {
      y2 = y2 +20;
    }

    if (key =='h')
    {
      x2= x2+20;
    }
    if (key =='i')
    {
      y3 = y3 -20;
    }

    if (key =='j')
    {
      x3 =x3-20;
    }

    if (key =='k')
    {
      y3 = y3 +20;
    }

    if (key =='l')
    {
      x3= x3+20;
    }

    if (keyCode == UP)
    {
      y4 = y4 -20;
    }

    if (keyCode == DOWN)
    {

      y4 = y4 +20;
    }


    if (keyCode == LEFT)
    {
      x4 =x4-20;
    }
    if (keyCode == RIGHT)
    {
      x4= x4+20;
    }
  }
}

void Collision()
{
  if (x>2200)
  {
    x= -1000;
  }
  if (Arrow.isAlive==true)
  {
    if (Arrow.CheckCollision(x2, y2, h2, w2))
    {
      hp[1]--;
      Arrow.isAlive=false;
    }
    if (Arrow.CheckCollision(x3, y3, h2, w2))
    {
      hp[2]--;
      Arrow.isAlive=false;
    }
    if (Arrow.CheckCollision(x4, y4, h2, w2))
    {

      hp[3]--;
      Arrow.isAlive=false;
    }
  }
  if (Darrow.isAlive==true)
  {
    if (Darrow.CheckCollision(x, y, h2, w2))
    {

      hp[0]--;
      Darrow.isAlive=false;
    }
    if (Darrow.CheckCollision(x2, y2, h2, w2))
    {
      hp[1]--;
      Darrow.isAlive=false;
    }
    if (Darrow.CheckCollision(x3, y3, h2, w2))
    {

      hp[2]--;
      Darrow.isAlive=false;
    }
  }
  if (Zarrow.isAlive==true)
  {
    if (Zarrow.CheckCollision(x, y, h2, w2))
    {

      hp[0]--;
      Zarrow.isAlive=false;
    }
    if (Zarrow.CheckCollision(x2, y2, h2, w2))
    {
      hp[1]--;
      Zarrow.isAlive=false;
    }
    if (Zarrow.CheckCollision(x4, y4, h2, w2))
    {

      hp[3]--;
      Zarrow.isAlive=false;
    }
  }
  if (Garrow.isAlive==true)
  {

    if (Garrow.CheckCollision(x, y, h2, w2))
    {

      hp[0]--;
      Garrow.isAlive=false;
    }
    if (Garrow.CheckCollision(x3, y3, h2, w2))
    {

      hp[2]--;
      Garrow.isAlive=false;
    }
    if (Garrow.CheckCollision(x4, y4, h2, w2))
    {
      hp[3]--;
      Garrow.isAlive=false;
    }
  }
  if (dist(x, y, x2, y2)<50)
  {

    hp[0]--;
    hp[1]--;
    if (hp[0]<1)
    {
      vict = loadImage ("victory.jpg");
      gameOver=true;
    }

    if (hp[1]<1)
    {
      vict = loadImage ("victory.jpg");
      gameWin=true;
    }
  }

  if (dist(x, y, x3, y3)<50)
  {

    hp[0]--;
    hp[2]--;
    if (hp[0]<1)
    {
      vict = loadImage ("victory.jpg");
      gameOver=true;
    }

    if (hp[2]<1)
    {
      vict = loadImage ("victory.jpg");
      gameOver=true;
    }
  }
  if (dist(x2, y2, x4, y4)<50)
  {

    hp[1]--;
    hp[3]--;

    if (hp[1]<1)
    {
      vict = loadImage ("victory.jpg");
      gameWin=true;
    }
  }
  if (dist(x2, y2, x3, y3)<50)
  {
    if (hp[3]<1)
    {
      vict = loadImage ("victory.jpg");
      gameWin=true;
    }

    hp[1]--;
    hp[2]--;

    if (hp[1]<1)
    {
      vict = loadImage ("victory.jpg");
      gameWin=true;
    }
  }
  if (hp[2]<1)
  {
    vict = loadImage ("victory.jpg");
    gameOver=true;
  }

  if (dist(x3, y3, x4, y4)<50)
  {

    hp[2]--;
    hp[3]--;

    if (hp[2]<1)
    {
      vict = loadImage ("victory.jpg");
      gameOver=true;
    }



    if (hp[3]<1)
    {
      vict = loadImage ("victory.jpg");
      gameWin=true;
    }
  }
  if (dist(x, y, x4, y4)<50)
  {
    for (int i=0; i<HEALTH; i++)
    {
      hp[0]--;
      hp[3]--;
    }
    if (hp[0]<1)
    {
      vict = loadImage ("victory.jpg");
      gameOver=true;
    }

    if (hp[3]<1)
    {
      vict = loadImage ("victory.jpg");
      gameWin=true;
    }
  }
}