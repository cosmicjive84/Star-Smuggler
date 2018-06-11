
spd = 3;
facing = direction_f.right;

click_x = false;
click_y = false;
mouse_move = false;

enum player {
	idle,
	move
}

enum direction_f {
	right,
	up,
	left,
	down
}

p_sprite[player.move, direction_f.right] = s_player_right;
p_sprite[player.move, direction_f.up] = s_player_up;
p_sprite[player.move, direction_f.left] = s_player_left;
p_sprite[player.move, direction_f.down] = s_player_down;