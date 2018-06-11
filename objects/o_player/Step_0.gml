depth = -y;
image_speed = 0;
var animation_speed = .7;
var x_input = input.right - input.left;
var y_input = input.down - input.up;

var moveX = 0;
var moveY = 0;

//var input_dir = point_direction(0, 0, x_input, y_input);

if (input.l_click && !position_meeting(mouse_x, mouse_y, o_solid)) 
{
	click_x = mouse_x;
	click_y = mouse_y;
	mouse_move = true;
	var input_dir = point_direction(x, y, click_x, click_y);
	facing = round(input_dir/90);
	if facing == 4 {facing = 0;}
}

if mouse_move == false {

	if x_input == 0 && y_input == 0
	{
		image_index = 0;
	}
	else
	{
		var input_dir = point_direction(0, 0, x_input, y_input);
		facing = round(input_dir/90);
		if facing == 4 {facing = 0;}
		
		image_speed = animation_speed;
	
		if x_input != 0
		{
			//image_xscale = x_input;
			moveX = x_input*spd;
		}
		if moveX == 0 && y_input != 0
		{
			moveY = y_input*spd;
		}
	}
}

if click_x && click_y
{
	if distance_to_point(click_x, click_y) <= spd
	{
		speed = 0;
		click_x = false;
		click_y = false;
		mouse_move = false;
	}
//	else if collision_line( x, y, click_x, click_y, o_solid, false, false )
//	{
//		speed = 0;
//		click_x = false;
//		click_y = false;
//		mouse_move = false;	
//	}
	else
	{
		image_speed = animation_speed;
		//show_debug_message("Input_Dir: "+string(input_dir)+"Player Location: "+string(x)+" "+string(y))
		//move_towards_point(click_x, click_y, spd);
		moveX = lengthdir_x( spd, point_direction(x, y, click_x, click_y));
		moveY = lengthdir_y( spd, point_direction(x, y, click_x, click_y));
	}
}

sprite_index = p_sprite[player.move, facing];


// Check for collisions & Sign for accuracy


if place_meeting(x+moveX, y, o_solid)
{
	repeat abs(moveX)
	{
		if (!place_meeting(x+sign(moveX), y, o_solid)) { x += sign(moveX) } else { break; }
	}
	moveX = 0;
	click_x = false;
	click_y = false;
	mouse_move = false;
	image_index = 0;
	}
if place_meeting(x, y+moveY, o_solid)
{
	repeat abs(moveY)
	{
		if (!place_meeting(x, y+sign(moveY), o_solid)) { y += sign(moveX) } else { break; }
	}
	moveY = 0;
	click_y = false;
	click_x = false;
	mouse_move = false;
	image_index = 0;
}


x += moveX;
y += moveY;