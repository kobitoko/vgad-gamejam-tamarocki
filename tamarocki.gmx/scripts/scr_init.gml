// Variables global
globalvar textDialogs;
globalvar daynight;
globalvar day;
globalvar food;
globalvar currentMusic;
globalvar mainfont;
globalvar init;

global.textDialogs = ds_queue_create();
global.daynight = true;
global.day = 1;
global.food = 0;
global.currentMusic = snd_daytime;
global.mainfont = font1;

global.init[0] = "This is off to a rocky start...";
global.init[1] = "Sometimes I feel like I take time for granite...";
global.init[2] = "Do you ever feel like you're between a rock and a hard place?";
