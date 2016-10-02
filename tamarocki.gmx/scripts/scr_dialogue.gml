var i = irandom(array_length_1d(global.dialogueClick) - 1);
var currentDialogue = global.dialogueClick[i];
script_execute(scr_text , currentDialogue, obj_rock.x, obj_rock.y, 1);
