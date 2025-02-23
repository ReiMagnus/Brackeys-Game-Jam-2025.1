
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



function play_music() {
    
    if(global.musica) {
        
        if(global.musica_atual != noone and audio_is_playing(global.musica_atual)) {audio_stop_sound(global.musica_atual);}
        
        switch(room) {
            case rm_Menu: global.musica_atual = audio_play_sound(music_fase, 10, true); break;
            case rm_Fase: /*global.musica_atual = audio_play_sound(music_fase, 10, true);*/ break;
        }
        
    } else {
        audio_stop_sound(global.musica_atual);
    }
    
}