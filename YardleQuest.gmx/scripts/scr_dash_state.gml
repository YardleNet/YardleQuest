/// scr_dash_state
image_speed = .5;
dir = face*90;
len = spd*1.5;

hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// Set player dash speed
phy_position_x += hspd;
phy_position_y += vspd;


// Create dash shadow effect
var dash = instance_create(x, y, obj_dash_effect);
dash.sprite_index = sprite_index;
dash.image_index = image_index;
