/// scr_move_state
scr_get_input()

// Attack state
if (attack_key) 
{
    image_index = 0;
    state = scr_attack_state;
}

// Get the arrow direction
dir = point_direction(0, 0, xaxis, yaxis);

// Get the arrow length
if (xaxis == 0 and yaxis == 0) 
{
    len = 0;

} 
else 
{
    len = spd;
    scr_get_face();
}

// Get the hspd and vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Dash state
if (dash_key and obj_player_stats.stamina >= DASH_COST) 
{
    state = scr_dash_state();
    alarm[0] = room_speed/30;
    obj_player_stats.stamina -= DASH_COST;
    obj_player_stats.alarm[0] = room_speed;
  
}

// Horizontal collisions
if (grid_place_meeting(x+hspd, y)) {
    while (!grid_place_meeting(x+sign(hspd), y)) {
        x+=sign(hspd);
    }
    hspd = 0;
}

// Vertical collisions
if (grid_place_meeting(x, y+vspd)) {
    while (!grid_place_meeting(x, y+sign(vspd))) {
        y+=sign(vspd);
    }
    vspd = 0;
} else {

// Move
phy_position_x += hspd;
phy_position_y += vspd;
}
// Control the sprite
image_speed = .5;
if (len == 0) image_index = 0;

switch (face)
{
    case RIGHT:
        sprite_index = spr_player_right;
        break;
    
    case LEFT:
        sprite_index = spr_player_left;
        break;
        
    case UP:
        sprite_index = spr_player_up;
        break;
        
    case DOWN:
        sprite_index = spr_player_down;
        break;
}
