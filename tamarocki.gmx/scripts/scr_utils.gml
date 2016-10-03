#define scr_utils
// Nothing to do yet here.

#define scr_click
var device = 0;
//ROCK
if (instance_exists(obj_rock) and device_mouse_check_button_pressed(device, mb_left)) {
    var colliders = collision_point(device_mouse_x(device), device_mouse_y(device),
        obj_rock, true, false);
    if (colliders == obj_rock.id) {
        global.rockClicks++;
        if(global.rockClicks == 100){
            global.achievementTitle = "Cube Rock";
            global.achievementDesc = "Click on "+global.name+" 100 times.";
            instance_create(obj_rock.x, obj_rock.y+200, obj_ui_toast);
            achievementsUnlocked[3] = true;
        }
        script_execute(scr_dialogue);
    }
}
//BUTTON FOR FEEDING
if (device_mouse_check_button(device, mb_left)) {
    var colliders = collision_point(device_mouse_x(device), device_mouse_y(device),
        obj_button_feed, true, false);
    if (colliders == obj_button_feed.id) {
        obj_button_feed.image_index = 1;
    }
}
if (instance_exists(obj_button_feed) and device_mouse_check_button_released(device, mb_left)) {
    obj_button_feed.image_index = 0;
    var colliders = collision_point(device_mouse_x(device), device_mouse_y(device),
        obj_button_feed, true, false);
    if (colliders == obj_button_feed.id) {
        //script_execute(scr_text ,"Thanks for the food...", obj_rock.x, obj_rock.y, 1);
        if(instance_number(obj_candy) <= 0) {
            if(global.feedClicks == 20){
                global.achievementTitle = "Chipped Rock";
                global.achievementDesc = "Try to feed "+global.name+" 20 times.";
                instance_create(obj_rock.x, obj_rock.y+200, obj_ui_toast);
                achievementsUnlocked[2] = true;
            }
            instance_create(room_width*0.5, room_height*0.9, obj_candy);
        }
    }
}
//SUN & MOON
if (instance_exists(obj_sun_moon) and device_mouse_check_button_pressed(device, mb_left)) {
    var colliders = collision_point(device_mouse_x(device), device_mouse_y(device),
        obj_sun_moon, true, false);
    if (colliders == obj_sun_moon.id) {
        if(global.daynight == true){
            effect_create_above(ef_flare, mouse_x, mouse_y, 1, c_orange);
            effect_create_above(ef_flare, mouse_x, mouse_y, 0, c_yellow);
            if(global.sunClickedToday == false){
                global.sunClicks++;
                global.sunClickedToday = true;
                if(global.sunClicks == 10){
                    global.achievementTitle = "Sun Rock";
                    global.achievementDesc = "Click on the Sun on 10 separate days.";
                    instance_create(obj_rock.x, obj_rock.y+200, obj_ui_toast);
                    global.achievementsUnlocked[0] = true;
                }
            }
        }else{
            effect_create_above(ef_cloud, mouse_x, mouse_y, 0, c_white);
            effect_create_above(ef_cloud, mouse_x-10, mouse_y+5, 0, c_white);
            effect_create_above(ef_cloud, mouse_x+20, mouse_y-10, 0, c_white);
            effect_create_above(ef_smoke, mouse_x, mouse_y, 0, c_ltgray);
            if(global.moonClickedToday == false){
                global.moonClicks++;
                global.moonClickedToday = true;
                if(global.moonClicks == 10){
                    global.achievementTitle = "Moon Rock";
                    global.achievementDesc = "Click on the Moon on 10 separate days.";
                    instance_create(obj_rock.x, obj_rock.y+200, obj_ui_toast);
                    global.achievementsUnlocked[1] = true;
                }
            }
        }
    }
}

#define scr_playBgm
// Argument0 has to be a sound object
var musicToPlay = argument0;
if (audio_is_playing(global.currentMusic))
    audio_stop_sound(global.currentMusic);
if (not audio_is_playing(argument0))
    global.currentMusic = argument0;
    audio_play_sound(argument0, 10, true);
#define scr_playDayNightBgm
if (global.daynight) {
    if (not sound_isplaying(snd_daytime))
        script_execute(scr_playBgm, snd_daytime);
} else {
    if (not sound_isplaying(snd_night))
        script_execute(scr_playBgm, snd_night);
}
