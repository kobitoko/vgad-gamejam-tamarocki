#define scr_text
// Enque the string, x and y pos, starting alpha.
ds_queue_enqueue(global.textDialogs, argument0, argument1, argument2, argument3);

#define scr_draw_text
// floatSpd = pixel per step
var floatSpd = argument0;
// how fast it fades per step
var fadeSpd = argument1;
// Dequeue the string, x and y pos, starting alpha
var queueSize = ds_queue_size(global.textDialogs);
for (var i=0; i<queueSize; i+=4) {
    // Retrieve all data from queue.
    var str = ds_queue_dequeue(global.textDialogs);
    var xVal = ds_queue_dequeue(global.textDialogs);
    var yVal = ds_queue_dequeue(global.textDialogs);
    var alpha = ds_queue_dequeue(global.textDialogs);
    // draw text
    if (global.daynight == true) {
        draw_set_colour(c_black);
    } else {
        draw_set_colour(c_white);
    }
    draw_set_font(font1);
    draw_set_alpha(alpha);
    draw_text_ext(xVal - (room_width - xVal - 50)/2, yVal, str, 20, room_width - xVal - 50);
    draw_set_font(global.mainfont);
    // reset alpha
    draw_set_alpha(1.0)
    // Do not requeue if alpha is equal or lower than the fadeSpd.
    if (alpha > fadeSpd) {
        ds_queue_enqueue(global.textDialogs, str, xVal, yVal-floatSpd, alpha-fadeSpd);
    }
}