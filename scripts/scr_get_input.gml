///scr_get_input
//Arrow Keys Input
right_key = keyboard_check(ord('D'));
left_key = keyboard_check(ord('A'));
up_key = keyboard_check(ord('W'));
down_key = keyboard_check(ord('S'));
dash_key = keyboard_check(vk_shift);
attack_key = keyboard_check_pressed(ord('X'));

// Assign controller input
xaxis = (right_key - left_key);
yaxis = (down_key - up_key);

// Controller input
if (gamepad_is_connected(0)) 
{
    gamepad_set_axis_deadzone(0, .35);
    xaxis = gamepad_axis_value(0, gp_axislh);
    yaxis = gamepad_axis_value(0, gp_axislv);
    dash_key = gamepad_button_check(0, gp_shoulderlb);
    attack_key = gamepad_button_check(0, gp_shoulderrb);
}
