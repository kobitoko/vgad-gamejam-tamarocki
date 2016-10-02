if (device_mouse_check_button_pressed(0, mb_left)) {
    obj_rock.curr_state = 1;
    clicked = true;
    time = current_time;
}

if (clicked && current_time-time > 1000) {
    room_goto(1);
}
