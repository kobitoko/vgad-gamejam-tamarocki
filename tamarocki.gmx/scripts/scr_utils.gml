#define scr_utils
// Nothing to do yet here.

#define scr_click
var device = 0;
var collided = false;

//ROCK
if (instance_exists(obj_rock) and device_mouse_check_button_pressed(device, mb_left)) {
    var colliders = collision_point(device_mouse_x(device), device_mouse_y(device),
        obj_rock, true, false);
    if (colliders == obj_rock.id) {
        collided = true;
        global.rockClicks++;
        
        if (rockType == 1) {
            //SUN ROCK
            effect_create_above(ef_flare, mouse_x, mouse_y, 1, c_orange);
            effect_create_above(ef_flare, mouse_x, mouse_y, 0, c_yellow);
        } else if (rockType == 2) {
            //MOON ROCK
            effect_create_above(ef_cloud, mouse_x, mouse_y, 0, c_white);
            effect_create_above(ef_cloud, mouse_x-10, mouse_y+5, 0, c_white);
            effect_create_above(ef_cloud, mouse_x+20, mouse_y-10, 0, c_white);
            effect_create_above(ef_smoke, mouse_x, mouse_y, 0, c_ltgray);
        }
        
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
        collided = true;
        obj_button_feed.image_index = 1;
    }
}
if (instance_exists(obj_button_feed) and device_mouse_check_button_released(device, mb_left)) {
    obj_button_feed.image_index = 0;
    var colliders = collision_point(device_mouse_x(device), device_mouse_y(device),
        obj_button_feed, true, false);
    if (colliders == obj_button_feed.id) {
        collided = true;
        //script_execute(scr_text ,"Thanks for the food...", obj_rock.x, obj_rock.y, 1);
        if(instance_number(obj_candy) <= 0) {
            global.feedClicks += 1;
            if(global.feedClicks == 20){
                global.achievementTitle = "Chipped Rock";
                global.achievementDesc = "Tried to feed "+global.name+" 20 times.";
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
        collided = true;
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

if ((not collided) and instance_exists(obj_nightsky) and device_mouse_check_button_pressed(device, mb_left)) {
    var colliders = collision_point(device_mouse_x(device), device_mouse_y(device),
        obj_nightsky, true, false);
    if (colliders == obj_nightsky.id) {
        //ON SKY
        if (global.daynight == true) {
            //DAY
            effect_create_above(ef_ring, mouse_x-1, mouse_y, 0, c_aqua);
            effect_create_above(ef_ring, mouse_x, mouse_y, 0, c_blue);
        } else {
            //NIGHT
            effect_create_above(ef_cloud, mouse_x, mouse_y, 0, c_silver);
            effect_create_above(ef_rain, mouse_x, mouse_y, 0, c_yellow);
        }
    } else {
        //CLICKED ON GROUND
        effect_create_above(ef_ring, mouse_x, mouse_y, 0, c_green);
        effect_create_above(ef_smokeup, mouse_x, mouse_y, 0, c_lime);
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
    if (global.rockType == 0) {
        if (not sound_isplaying(snd_daytime))
            script_execute(scr_playBgm, snd_daytime);
    } else if (global.rockType == 1) {
        if (not sound_isplaying(snd_sun_day))
            script_execute(scr_playBgm, snd_sun_day);
    } else if (global.rockType == 2) {
        if (not sound_isplaying(snd_moon_day))
            script_execute(scr_playBgm, snd_moon_day);
    } else if (global.rockType == 3) {
        if (not sound_isplaying(snd_chip_day))
            script_execute(scr_playBgm, snd_chip_day);
    } else if (global.rockType == 4) {
        if (not sound_isplaying(snd_cube_day))
            script_execute(scr_playBgm, snd_cube_day);
    } else if (global.rockType == 5) {
        if (not sound_isplaying(snd_rich_day))
            script_execute(scr_playBgm, snd_rich_day);
    } else if (global.rockType == 6) {
        if (not sound_isplaying(snd_invis_day))
            script_execute(scr_playBgm, snd_invis_day);
    } else if (global.rockType == 7) {
        if (not sound_isplaying(snd_ice_day))
            script_execute(scr_playBgm, snd_ice_day);
    } else if (global.rockType == 8) {
        if (not sound_isplaying(snd_real_day))
            script_execute(scr_playBgm, snd_real_day);
    }
} else {
    if (global.rockType == 0) {
        if (not sound_isplaying(snd_night))
            script_execute(scr_playBgm, snd_night);
    } else if (global.rockType == 1) {
        if (not sound_isplaying(snd_sun_night))
            script_execute(scr_playBgm, snd_sun_night);
    } else if (global.rockType == 2) {
        if (not sound_isplaying(snd_moon_night))
            script_execute(scr_playBgm, snd_moon_night);
    } else if (global.rockType == 3) {
        if (not sound_isplaying(snd_chip_night))
            script_execute(scr_playBgm, snd_chip_night);
    } else if (global.rockType == 4) {
        if (not sound_isplaying(snd_cube_night))
            script_execute(scr_playBgm, snd_cube_night);
    } else if (global.rockType == 5) {
        if (not sound_isplaying(snd_rich_night))
            script_execute(scr_playBgm, snd_rich_night);
    } else if (global.rockType == 6) {
        if (not sound_isplaying(snd_invis_night))
            script_execute(scr_playBgm, snd_invis_night);
    } else if (global.rockType == 7) {
        if (not sound_isplaying(snd_ice_night))
            script_execute(scr_playBgm, snd_ice_night);
    } else if (global.rockType == 8) {
        if (not sound_isplaying(snd_real_night))
            script_execute(scr_playBgm, snd_real_night);
    }
}