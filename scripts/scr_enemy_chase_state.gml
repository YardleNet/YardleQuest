/// scr_enemy_chase_state()
scr_check_for_player();
phy_position_x += sign(round(targetx - x))*spd;
phy_position_y += sign(round(targety - y))*spd;

