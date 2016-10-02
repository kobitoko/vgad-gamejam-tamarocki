// Variables global
globalvar textDialogs;
globalvar daynight;
globalvar day;
globalvar food;
globalvar currentMusic;
globalvar mainfont;

//Dialogue variables
globalvar dialogueClick;
globalvar dialogueSummer;
globalvar dialogueFall;
globalvar dialogueWinter;
globalvar dialogueSpring;
globalvar dialogueDeath;

//Achievement tracking variables
globalvar feedClicks;
globalvar achieveClicks;
globalvar rockClicks;
globalvar sunClicks;
globalvar moonClicks;

global.textDialogs = ds_queue_create();
global.daynight = true;
global.day = 1;
global.food = 0;
global.currentMusic = snd_daytime;
global.mainfont = font1;

global.feedClicks = 0;
global.achieveClicks = 0;
global.rockClicks = 0;
global.sunClicks = 0;
global.moonClicks = 0;

global.dialogueClick[0] = "This is off to a rocky start...";
global.dialogueClick[1] = "Sometimes I feel like I take time for granite...";
global.dialogueClick[2] = "Do you ever feel like you're between a rock and a hard place?";
global.dialogueClick[3] = "It looks like your rock hasn't been polished in a few days. It might be time to make Rocki shine.";
global.dialogueClick[4] = "Rocki looks lonely. You should take Rocki for a walk.";

global.dialogueSummer[0] = "Ouch! That rock is hot!";
global.dialogueSummer[1] = "Rocki loves summer! Nobody dares touch him.";

global.dialogueFall[0] = "Rocki loves to watch as the treetops change from a uniform green to a variety of colours...";
global.dialogueFall[1] = "The leaves fall softly over Rocki's calm visage.";
global.dialogueFall[2] = "Gold...";

global.dialogueWinter[0] = "The end of all life. The end of a year...";
global.dialogueWinter[1] = "Winter is death.";
global.dialogueWinter[2] = "Rocki is cold to the touch, frozen yet still unbroken.";

global.dialogueSpring[0] = "Rocki loves the beginning of seasons.";
global.dialogueSpring[1] = "Thinking of beginnings makes Rocki hungry.";
global.dialogueSpring[2] = "A pleasant breeze sweeps over the hill as you lay your hand on your beloved companion.";

background_visible[2] = true;
background_alpha[2] = 0;
