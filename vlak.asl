//0.72
state("dosbox") {
      byte Scena : 0x18BB3C0, 0x2BB7;
      int isMoving : 0x18BB3C0, 0x27E8;
}

startup {
    settings.Add("ILStart", false, "Start timer in every level");
}

start {
    //start timer in 1st level for run
    if (current.Scena == 1 && old.isMoving != current.isMoving && old.isMoving == 200)  {
        return true; 
    }
 
    //start timer in every level (if setting is true)
    if (settings["ILStart"]){
        if (old.isMoving != current.isMoving && old.isMoving == 200) {                
            return true;
        }
    }
} 

split {
    //split after every level
    if ( old.Scena != current.Scena && current.Scena == old.Scena+1 ) {
        return true;
    }

    //final split
    if ( old.Scena != current.Scena && old.Scena == 50 && current.Scena == 1) {
        return true;
    }
}

reset {    
    //reset when player jump to 1 level, but not from last (it´s run end split)
    if (old.Scena != 50 && old.Scena != current.Scena &&  current.Scena == 1) {
        return true;
    }
}
