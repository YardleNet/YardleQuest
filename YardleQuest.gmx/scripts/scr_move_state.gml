///Get player input
scr_get_input()

// Dash state
if (dash_key and obj_player_stats.sp >= DASH_COST) 
{
    state = scr_dash_state();
    alarm[0] = room_speed/30;
    obj_player_stats.sp -= DASH_COST;
    obj_player_stats.alarm[0] = room_speed;
}

// Attack state
if (attack_key and obj_player_stats.sp >= ATTACK_COST)  
{
    image_index = 0;
    obj_player_stats.sp -= ATTACK_COST;
    obj_player_stats.alarm[0] = room_speed;
    state = scr_attack_state;
}

// Get the player direction
dir = point_direction(0, 0, xaxis, yaxis);

// Get the player direction length and set speeds to 0 when idle
if (xaxis == 0 and yaxis == 0) 
{
    len = 0;

} 
else 
{
    len = spd;
    scr_get_face();// Get player direction
}


// Get the player movement speed (hspd/vspd)
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Set player movement speed
phy_position_x += hspd;
phy_position_y += vspd;

// Control the player sprite
image_speed = .5;// Player sprite animation speed
if (len == 0) image_index = 0;// If not moving set player image to (0)

// Faces the player sprite towards mouses (x/y)
facing = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y) div(45);
switch (facing){
  case 1:
  case 2:
    sprite_index = spr_player_up;
  break;
  case 3:
  case 4:
    sprite_index = spr_player_left;
  break;
  case 5:
  case 6:
    sprite_index = spr_player_down;
  break;
  default:
    sprite_index = spr_player_right;
}
/**
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
/**
