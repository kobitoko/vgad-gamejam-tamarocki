var i = irandom(array_length_1d(global.dialogueClick) - 1);
var dialogueOfSeason = global.dialogueClick;
var j;
switch(global.day div 3)
{
    case 0:
        dialogueOfSeason = global.dialogueSummer;
        j = irandom(array_length_1d(global.dialogueSummer) - 1);
        break;
    case 1:
        dialogueOfSeason = global.dialogueFall;
        j = irandom(array_length_1d(global.dialogueFall) - 1);
        break;
    case 2:
        dialogueOfSeason = global.dialogueWinter;
        j = irandom(array_length_1d(global.dialogueWinter) - 1);
        break;
    case 3:
        dialogueOfSeason = global.dialogueSpring;
        j = irandom(array_length_1d(global.dialogueSpring) - 1);
        break;
        
    default:
        dialogueOfSeason = global.dialogueClick;
        break;
}

//j = irandom(array_length_1d(global.dialogueOfSeason) - 1);
var currentDialogue = global.dialogueClick[i];
if(irandom(1)){
    currentDialogue = dialogueOfSeason[j];
}
script_execute(scr_text , currentDialogue, obj_rock.x, obj_rock.y, 1);
