#define scr_utils
// Nothing to do yet here.

#define scr_click
var device = 0;
//ROCK
if (device_mouse_check_button_pressed(device, mb_left)) {
    var colliders = collision_point(device_mouse_x(device), device_mouse_y(device),
        obj_rock, true, false);
    if (colliders == obj_rock.id) {
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
if (device_mouse_check_button_released(device, mb_left)) {
    obj_button_feed.image_index = 0;
    var colliders = collision_point(device_mouse_x(device), device_mouse_y(device),
        obj_button_feed, true, false);
    if (colliders == obj_button_feed.id) {
        //script_execute(scr_text ,"Thanks for the food...", obj_rock.x, obj_rock.y, 1);
        if(not object_exists(obj_candy)) {
            instance_create(device_mouse_x(device), device_mouse_y(device), obj_candy);
        }
    }
}
// BUTTON FOR ACHIEVEMENTS
if (device_mouse_check_button(device, mb_left)) {
    var colliders = collision_point(device_mouse_x(device), device_mouse_y(device),
        obj_button_chieves, true, false);
    if (colliders == obj_button_chieves.id) {
        obj_button_chieves.image_index = 1;
    }
}
if (device_mouse_check_button_released(device, mb_left)) {
    obj_button_chieves.image_index = 0;
    var colliders = collision_point(device_mouse_x(device), device_mouse_y(device),
        obj_button_chieves, true, false);
    if (colliders == obj_button_chieves.id) {
        //script_execute(scr_text ,"Thanks for the food...", obj_rock.x, obj_rock.y, 1);
        if(not object_exists(obj_candy)) {
            instance_create(device_mouse_x(device), device_mouse_y(device), obj_candy);
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