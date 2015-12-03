/// scr_enemy_wander_state()
scr_check_for_player();
phy_position_x += sign(round(targetx - x))*spd;
phy_position_y += sign(round(targety - y))*spd;
