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
globalvar time;
globalvar name;


global.textDialogs = ds_queue_create();
global.daynight = true;
global.day = 0;
global.food = 0;
global.currentMusic = snd_daytime;
global.mainfont = font1;
global.name = " ";

global.dialogueClick[0] = "This is off to a rocky start...";
global.dialogueClick[1] = "Sometimes I feel like I take time for granite...";
global.dialogueClick[2] = "Do you ever feel like you're between a rock and a hard place?";

global.seasons[0] = "Summer";
global.seasons[1] = "Autumn";
global.seasons[2] = "Winter";
global.seasons[3] = "Spring";

global.alpha = 0;
global.time = current_time;
