#define scr_master_step
// Nothing to do yet here.

#define scr_click
var device = 0;
if (device_mouse_check_button_pressed(device, mb_left)) {
    var colliders = collision_point(device_mouse_x(device), device_mouse_y(device),
        obj_rock, true, false);
    if (colliders == obj_rock.id) {
        script_execute(scr_text ,"Hello there~!", obj_rock.x, obj_rock.y, 1);
    }
}
if (device_mouse_check_button(device, mb_left)) {
    var colliders = collision_point(device_mouse_x(device), device_mouse_y(device),
        obj_button, true, false);
    if (colliders == obj_button.id) {
        obj_button.image_index = 1;
    }
}
if (device_mouse_check_button_released(device, mb_left)) {
    obj_button.image_index = 0;
    var colliders = collision_point(device_mouse_x(device), device_mouse_y(device),
        obj_button, true, false);
    if (colliders == obj_button.id) {
        script_execute(scr_text ,"Thanks for the food...", obj_rock.x, obj_rock.y, 1);
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