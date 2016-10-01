var device = 0;
if (device_mouse_check_button_pressed(device, mb_left)) {
    var colliders = collision_point(device_mouse_x(device), device_mouse_y(device), obj_rock, true, false);
    if (colliders == obj_rock.id) {
        // Test if click actually works
        obj_rock.x +=10;
    }
}

