<<<<<<< HEAD
//0.74
state("DOSBox",  "0.74") {
    byte Scena : 0x193A1A0, 0x2D27;
    int isMoving : 0x193A1A0, 0x2958;
}

//0.74-3
state("DOSBox", "0.74-3") {
    byte Scena : 0x193C370, 0x2D27;
    int isMoving : 0x193C370, 0x2958;
}

//0.72
state("DOSBox", "0.72") {
    byte Scena : 0x18BB3C0, 0x2BB7;
    int isMoving : 0x18BB3C0, 0x27E8;
}

init
{
    switch (modules.First().ModuleMemorySize)
        {
            case 0x2068000: version = "0.74"; break;
            case 0x206D000: version = "0.74-3"; break;
            case 0x1FAE000: version = "0.72"; break;
            default: version = "Unknown!"; break;
        }
=======
//0.72
state("dosbox") {
      byte Scena : 0x18BB3C0, 0x2BB7;
      int isMoving : 0x18BB3C0, 0x27E8;
>>>>>>> 70f9835360b20e900873b92aa35ec494f24cd24e
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
<<<<<<< HEAD
}
=======
}
>>>>>>> 70f9835360b20e900873b92aa35ec494f24cd24e
