///@arg moveX
///@arg moveY

var moveX = argument0;
var moveY = argument1;

if place_meeting(x+moveX, y, o_solid)
{
	repeat abs(moveX)
	{
		if (!place_meeting(x+sign(moveX), y, o_solid)) { x += sign(moveX) } else { break; }
	}
	moveX = 0;
	click_x = false;
	click_y = false;
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
	image_index = 0;
}