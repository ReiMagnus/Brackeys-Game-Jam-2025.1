
function play_sfx(_sfx) {
    
    if(global.sons) {
      
        if(audio_is_playing(_sfx)) { 
            // Assim para os sfx não se sobreporem 
            audio_stop_sound(_sfx);
            audio_play_sound(_sfx, 5, false);
        } else {
            audio_play_sound(_sfx, 5, false);
        }
        
    }
    
}