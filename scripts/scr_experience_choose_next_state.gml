/// scr_experience_choose_next_state()
if (alarm[0] <= 0) {
    state = choose(scr_experience_wander_state, scr_experience_idle_state);
    alarm[0] = room_speed;
    targetx = random(room_width);
    targety = random(room_height);
}
