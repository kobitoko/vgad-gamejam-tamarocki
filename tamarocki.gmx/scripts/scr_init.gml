// Variables global
globalvar textDialogs;
globalvar daynight;
globalvar day;
globalvar food;
globalvar currentMusic;
globalvar mainfont;
globalvar seasons;
globalvar dialogueClick;
globalvar alpha;

globalvar rockType;
globalvar createRock;

//Achievement tracking variables
globalvar achievementsUnlocked;
globalvar feedClicks;
globalvar achieveClicks;
globalvar rockClicks;
globalvar sunClicks;
globalvar moonClicks;
globalvar sunClickedToday;
globalvar moonClickedToday;

for(var i = 0; i < 8; i++){
    achievementsUnlocked[i] = false;
}

global.textDialogs = ds_queue_create();
global.daynight = true;
global.day = 0;
global.food = 0;
global.currentMusic = snd_daytime;
global.mainfont = font1;

global.feedClicks = 0;
global.achieveClicks = 0;
global.rockClicks = 0;
global.sunClicks = 0;
global.moonClicks = 0;
global.sunClickedToday = false;
global.moonClickedToday = false;

global.dialogueClick[0] = "This is off to a rocky start...";
global.dialogueClick[1] = "Sometimes I feel like I take time for granite...";
global.dialogueClick[2] = "Do you ever feel like you're between a rock and a hard place?";
global.dialogueClick[3] = "It looks like your rock hasn't been polished in a few days. It might be time to make " + global.name + " shine.";
global.dialogueClick[4] = global.name + " looks lonely. You should take " + global.name + " for a walk.";

global.dialogueSummer[0] = "Ouch! That rock is hot!";
global.dialogueSummer[1] = global.name + " loves summer! Nobody dares touch him.";

global.dialogueFall[0] = global.name + " loves to watch as the treetops change from a uniform green to a variety of colours...";
global.dialogueFall[1] = "The leaves fall softly over " + global.name + "'s calm visage.";
global.dialogueFall[2] = "Gold...";

global.dialogueWinter[0] = "The end of all life. The end of a year...";
global.dialogueWinter[1] = "Winter is death.";
global.dialogueWinter[2] = global.name + " is cold to the touch, frozen yet still unbroken.";
global.dialogueSpring[0] = global.name + " loves the beginning of seasons.";
global.dialogueSpring[1] = "Thinking of beginnings makes " + global.name + " hungry.";
global.dialogueSpring[2] = "A pleasant breeze sweeps over the hill as you lay your hand on your beloved companion" + global.name + ".";

global.seasons[0] = "Summer";
global.seasons[1] = "Autumn";
global.seasons[2] = "Winter";
global.seasons[3] = "Spring";

global.alpha = 0;

global.createRock = false;
global.rockType = 0;
global.time = current_time;
