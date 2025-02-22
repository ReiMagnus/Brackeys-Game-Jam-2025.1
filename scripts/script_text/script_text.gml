function draw_text_transformed_outlined(x, y, outline_color, string_color, string_, x_scale, y_scale){
	var xx,yy;  
	xx = argument[0];  
	yy = argument[1];  
  
	//Outline  
	draw_set_color(argument[2]);  
	draw_text_transformed(xx+1, yy+1, argument[4], argument[5], argument[6], 0);  
	draw_text_transformed(xx-1, yy-1, argument[4], argument[5], argument[6], 0);
	draw_text_transformed(xx,   yy+1, argument[4], argument[5], argument[6], 0); 
	draw_text_transformed(xx+1,   yy, argument[4], argument[5], argument[6], 0); 
	draw_text_transformed(xx,   yy-1, argument[4], argument[5], argument[6], 0); 
	draw_text_transformed(xx-1,   yy, argument[4], argument[5], argument[6], 0);
	draw_text_transformed(xx-1, yy+1, argument[4], argument[5], argument[6], 0);
	draw_text_transformed(xx+1, yy-1, argument[4], argument[5], argument[6], 0);
  
	//Text  
	draw_set_color(argument[3]);  
	draw_text_transformed(xx, yy, argument[4], argument[5], argument[6], 0);
}
