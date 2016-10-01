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
    var colliders = collision_point(device_mouse_x(device), device_mouse_y(device),
        obj_button, true, false);
    if (colliders == obj_button.id) {
        script_execute(scr_text ,"Thanks for the food...", obj_rock.x, obj_rock.y, 1);
    }
}

#define scr_master_step
if (not obj_button.image_index == 0) {
    obj_button.image_index = 0;
}
