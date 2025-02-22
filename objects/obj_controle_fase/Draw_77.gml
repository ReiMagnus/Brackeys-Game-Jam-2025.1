//Disable alpha blending (we just want RGB from screen
gpu_set_blendenable(false);

if(pause) {

    surface_set_target(application_surface);
        if(surface_exists(pauseSurf)) {draw_surface(pauseSurf, 0, 0);}
        else { //Restore from buffer if we lost the surface
            pauseSurf = surface_create(resW, resH);
            buffer_set_surface(pauseSurfBuffer, pauseSurf, 0);
        }
    surface_reset_target();
    
}

if (gameOver != 1 && gameEnd != 1){
	if(keyboard_check_pressed(ord("P")) || gameOver == 0 || gameEnd == 0) {
    
	    if(!pause) { //Pause now

	        pause = true;
        
	        //deactivate everything other this instance
	        instance_deactivate_all(true);

	        pauseSurf = surface_create(resW, resH);
	        surface_set_target(pauseSurf);
	        draw_surface(application_surface, 0, 0);
	        surface_reset_target();
        
	        //Back up this surface to a buffer in case we lose it (screen focus, etc)
	        if(buffer_exists(pauseSurfBuffer)) {buffer_delete(pauseSurfBuffer);}
	        pauseSurfBuffer = buffer_create(resW*resH*4, buffer_fixed, 1);
	        buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
        
	    } else { //Unpause now
        
	        pause = false;
	        if(surface_exists(pauseSurf)) {surface_free(pauseSurf);}
	        if(buffer_exists(pauseSurfBuffer)) {buffer_delete(pauseSurfBuffer);}
	        instance_activate_all();
        
	    }
		if (gameOver == 0) { gameOver = 1 } 
		if (gameEnd == 0) { gameEnd = 1 } 
	}
}

//Enable alpha blending again
gpu_set_blendenable(true);
