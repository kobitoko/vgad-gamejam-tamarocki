var newRockIndex = argument0
var newRock = instance_create(room_height*0.5, -200, obj_rock_falling)
with(newRock) {
    newRock.image_index = newRockIndex;
}

