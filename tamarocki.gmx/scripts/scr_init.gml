// Variables global
globalvar textDialogs;
globalvar daynight;
globalvar day;
globalvar food;
globalvar currentMusic;
globalvar mainfont;
globalvar dialogueClick;

global.textDialogs = ds_queue_create();
global.daynight = true;
global.day = 1;
global.food = 0;
global.currentMusic = snd_daytime;
global.mainfont = font1;

global.dialogueClick[0] = "This is off to a rocky start...";
global.dialogueClick[1] = "Sometimes I feel like I take time for granite...";
global.dialogueClick[2] = "Do you ever feel like you're between a rock and a hard place?";

background_visible[2] = true;
background_alpha[2] = 0;
