import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Global Variables
Minim minim; //creates object to access all functions 
AudioPlayer song1; //creates a playlist
AudioMetaData SongMetaData1;


color black=#000000, purple=#7E24FF, resetWhite=255;
float xtitle, ytitle, titleWidth, titleHeight;
PFont titleFont;
//
void setup() 
{
  size (500, 400); //Landscape 
  //Be careful to include display orientation checker and display canvas checker
  minim = new Minim(this); //load from data directory, loadFile should also load from project folder, like loadImage *
  song1 = minim.loadFile("beatles.mp3"); //able to pass absolute path, file name & extenstion, and URL *
  SongMetaData1 = song1.getMetaData();
//Population
xtitle = width*1/4;
ytitle = height*0 ;
titleWidth = width*1/2;
titleHeight = height*1/10;
//
titleFont = createFont ("Harrington" , 55);



}//End setup
//
void draw() 
{
  if ( song1.isLooping() && song1.loopCount() !=-1) println("There are", song1.loopCount(), "loops left.");
  if ( song1.isLooping() && song1.loopCount() ==-1) println("Looping Infintley");
  if  ( song1.isPlaying() && !song1.isLooping() ) println("Play Once");
  println("Song Position", song1.position(), "Song Length", song1.length() );
  //
  background (black);
  rect (xtitle, ytitle, titleWidth, titleHeight);
  fill(purple); //Ink
  textAlign(CENTER, CENTER);
  textFont(titleFont, 30);
  text (SongMetaData1.title(), xtitle, ytitle, titleWidth, titleHeight);
  fill(resetWhite);
  //
}//End draw
//
void keyPressed() 
{
  //First Play Button
  //if ( key=='p' || key=='P') song1.play(); //Parameter is milli-seconds from start of audio file to start playing //play button
  //
  //Alternate Play Button, as a finite loop() && infinite loop()
  //Only press a number for this code below
  println(key);
  if ( key=='1') { //LOOP Function
    if (key=='1') println("Looping Once");
    String keystr = String.valueOf(key);
    println("Number of Repeats is", keystr);
    int loopNum = int(keystr);
    song1.loop(loopNum); //Parameter is Parameter is number of repeats
    //if
  }//End LOOP Functions
  if ( key=='i' || key=='I') song1.loop(); //Infinite Loop, no parameter OR -1
  if (key >= '2' || key=='0' )println ("I do not loop that much, press i for infinite loop");
  //
  if (key=='m' || key =='M') {//Mute Button
    if (song1.isMuted() ) {
      song1.unmute();
    } else {
      song1.mute();
    }
  }//End Mute Button
  //
  if (key=='f' || key=='F') song1.skip(1000); //skip forward 1 second (1000 miliseconds)
  if (key=='r' || key=='R') song1.skip(-1000); //skip backwards 1 second (1000 miliseconds);
  //
  if (key=='s' || key=='S') {//STOP
    if (song1.isPlaying ()) {
      song1.pause();
      song1.rewind();
    } else { //Song is not playing
      song1.rewind();
    }
  }//End STOP Button
  //
  if (key=='p' || key=='P') {//PAUSE Button
    if (song1.isPlaying() ) {
      song1.pause();
    } else if (song1.position() >= song1.length() - song1.length()*1/5) {
     song1.rewind();
      song1.play();
    } else {
      song1.play();
    }
  }//End PAUSE

  /*int loopNum3 = 2; //Local variable plays once and loops twice
   if ( key=='l' || key=='L') song1.loop(loopNum3); //Parameter is Parameter is number of repeats// loop button
   */
}//End keyPressed
//
void mousePressed() {
}//End mousePressed
//
//End MAIN Program
