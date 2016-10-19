COMPILER_OPTIONS _extended_conditions;

PROGRAM Bubble_Bobble;

//Bubble bobble remake
//Written By: Paul E Darby
//Using: DIV 2 Games Studio
//Graphics: Paul E Darby
//2003-2004

//screen dimentions
//28 blocks across - 16 pixels + 2x32 blocks at each side
//26 blocks down - 16 pixels + 32 unseen write to area
//making a display area of 480x448
//screen resolution of 640x480
//16MB memory and disc space needed

CONST
//GAME DATA FILES
    game_h  = "\bubdiv\gamedata\hi_lev.dat";  //Hiscore and level reached
    game_c  = "\bubdiv\gamedata\count.dat";   //Game Special Item Counters
    game_k  = "\bubdiv\gamedata\keys.dat";    //game player keys
    game_s  = "\bubdiv\gamedata\settings.dat";//game settings

//Level and Baddie Data Locations and Names
    level_n = "\bubdiv\gamedata\level1.dat";
    level_e = "\bubdiv\gamedata\level2.dat";
    bad_n   = "\bubdiv\gamedata\Nasties1.dat";
    bad_e   = "\bubdiv\gamedata\Nasties2.dat";
//Hardness maps
    p_map1 = "\bubdiv\fpg\levplat1.map";
    p_map2 = "\bubdiv\fpg\levplat2.map";
    p_bub1 = "\bubdiv\fpg\levbub1.map";
    p_bub2 = "\bubdiv\fpg\levbub2.map";


//GRAPHIC FILE LOCATION CONSTANTS
    blocksfloc = "\bubdiv\fpg\bb_block.fpg";
    platfloc   = "\bubdiv\fpg\bb_plbub.fpg";
    sprfloc    = "\bubdiv\fpg\bb_spr.fpg";
    sprfloc2   = "\bubdiv\fpg\itemsfoo.fpg";
    sprfloc3   = "\bubdiv\fpg\titles.fpg";
//Palette
    palfloc    = "\bubdiv\bbob.pal";    //for the game and title screen
//Fonts
    silverfnt  = "\bubdiv\fonts\silver.fnt";
    redfnt     = "\bubdiv\fonts\red.fnt";
    bluefnt    = "\bubdiv\fonts\blue.fnt";
    goldfnt    = "\bubdiv\fonts\gold.fnt";
    grnfnt     = "\bubdiv\fonts\green.fnt";
    numfnt     = "\bubdiv\fonts\numbers.fnt";
    G_potfnt   = "\bubdiv\fonts\p_green.fnt";
    B_potfnt   = "\bubdiv\fonts\p_blue.fnt";
    levfnt     = "\bubdiv\fonts\lev.fnt"; //level screen
    editfnt    = "\bubdiv\fonts\editor.fnt";

    n_sounds  = 48; //to load
    n_effects = 25; //in sound array handler
    n_music   = 8;

//pri_1
    effect1   = "\bubdiv\sounds\music\bb_start.wav";
    effect2   = "\bubdiv\sounds\music\bb_mus.wav";
    effect3   = "\bubdiv\sounds\music\bb_fast.wav";
    effect4   = "\bubdiv\sounds\music\sroom.wav";
    effect5   = "\bubdiv\sounds\effects\clock.wav";
    effect6   = "\bubdiv\sounds\music\hurry.wav";
    effect7   = "\bubdiv\sounds\music\skel2.wav";
    effect8   = "\bubdiv\sounds\music\Hi_Music.wav";
    effect9   = "\bubdiv\sounds\music\Hi_end.wav";
    effect10  = "\bubdiv\sounds\music\Comet.wav";
    effect11  = "\bubdiv\sounds\music\BossMus.wav";
    effect12  = "\bubdiv\sounds\music\complete.wav";
    effect13  = "\bubdiv\sounds\music\extend.wav";
    effect14  = "\bubdiv\sounds\music\extend2.wav";
    effect15  = "\bubdiv\sounds\music\potion2.wav";
    effect16  = "\bubdiv\sounds\effects\wcross.wav";
    effect17  = "\bubdiv\sounds\effects\explos.wav";
//pri 2
    effect18  = "\bubdiv\sounds\effects\firesph.wav";
    effect19  = "\bubdiv\sounds\effects\lning2.wav";
    effect20  = "\bubdiv\sounds\effects\boom.wav";
    effect21  = "\bubdiv\sounds\effects\bell.wav";
    effect22  = "\bubdiv\sounds\effects\bigfood.wav";
    effect23  = "\bubdiv\sounds\effects\laugh1.wav";
    effect24  = "\bubdiv\sounds\effects\laugh2.wav";
    effect25  = "\bubdiv\sounds\effects\slurping.wav";
    effect26  = "\bubdiv\sounds\effects\burp.wav";
//pri 4
    effect27  = "\bubdiv\sounds\music\poweron.wav";
    effect28  = "\bubdiv\sounds\effects\Bub3.wav";
    effect29  = "\bubdiv\sounds\effects\Bub2.wav";
    effect30  = "\bubdiv\sounds\effects\Food.wav";
    effect31  = "\bubdiv\sounds\effects\jump1.wav";
    effect32  = "\bubdiv\sounds\effects\multi.wav";
    effect33  = "\bubdiv\sounds\effects\multfood.wav";
    effect34  = "\bubdiv\sounds\effects\Item.wav";
    effect35  = "\bubdiv\sounds\effects\wpop.wav";
    effect36  = "\bubdiv\sounds\effects\Die.wav";
    effect37  = "\bubdiv\sounds\effects\collect.wav";
    effect38  = "\bubdiv\sounds\effects\fireball.wav";
    effect39  = "\bubdiv\sounds\effects\firedie.wav";
    effect40  = "\bubdiv\sounds\effects\lning1.wav";
    effect41  = "\bubdiv\sounds\effects\rock.wav";
    effect42  = "\bubdiv\sounds\effects\laser.wav";
    effect43  = "\bubdiv\sounds\effects\Botchuck.wav";
    effect44  = "\bubdiv\sounds\effects\Bothit.wav";
    effect45  = "\bubdiv\sounds\effects\Boing.wav";
    effect46  = "\bubdiv\sounds\effects\coin.wav";
//end of game effects
    effect47  = "\bubdiv\sounds\effects\glass.wav";
    effect48  = "\bubdiv\sounds\effects\multinew.wav";

//sound array ids
//used to trigger the sound from the sound_ids store
//each one is a cell in the array
    e_none      =99;

    e_bbstart  = 0;
    e_normal   = 1;
    e_fast     = 2;
    e_sroom    = 3;
    e_clock    = 4;
    e_hurry    = 5;
    e_skel     = 6;
    e_hisc     = 7;
    e_gameover = 8;
    e_comet    = 9;
    e_boss     = 10;
    e_complete = 11; //End
    e_extend   = 12;
    e_extend2  = 13;
    e_potion   = 14; //Next two triggers use the same sample
    e_heart    = 14;
    e_wcross   = 15;
    e_boom     = 16;

//pri2
    e_firesph  = 17;
    e_lning2   = 18;
    e_explos   = 19;
    e_bell     = 20;
//pri3
    e_bigfood  = 21;
    e_laugh1   = 22;
    e_laugh2   = 23;
    e_slurp    = 24;
    e_burp     = 25;
//pri4
    e_life     = 26;
    e_bubble   = 27;
    e_popn     = 28;
    e_food     = 29;
    e_jump     = 30;
    e_popmulti = 31;
    e_popfood  = 32;
    e_item     = 33;
    e_wpop     = 34;
    e_Die      = 35;
    e_collect  = 36;
    e_fireball = 37;
    e_firedie  = 38;
    e_lning1   = 39;
    e_rock     = 40;
    e_laser    = 41;
    e_Botchuck = 42;
    e_Bothit   = 43;
    e_Boing    = 44;
    e_coin     = 45; //46
    e_glass    = 46;
    e_multinew = 47;

//Effect channel to use
    pri_1 = 1;
    pri_2 = 2;
    pri_3 = 3;

//stop what samples or music/mod
    stop_none    = 0;
//    stop_effects = 1;
    stop_music   = 2;
    stop_all     = 3;
//music song effects selection
    sel_effects = 0; //not used
    sel_music   = 1;
    sel_song    = 2;

//MODS
    song1 = 1; //which song selected
    song2 = 2;

    n_mod = 2; //number of song modules

    mod1 = "\bubdiv\sounds\songs\Bbobble.mod";
    mod2 = "\bubdiv\sounds\songs\remix2.mod";

//Logic
    Yes = 1;
    No  = 0;

    Face_Left  = 1;  //used by all
    Face_Right = 2;
    Face_Up    = 1; //Used by Diag Sprites
    Face_Down  = 2;
//Save Games
    instr1    = "\bubdiv\gamedata\instr.dat";
    dem_dino1 = "\bubdiv\gamedata\demo_d1_1.dat";
    dem_dino2 = "\bubdiv\gamedata\demo_d2_1.dat";
    extend_d1 = "\bubdiv\gamedata\extend_1.dat";
    extend_d2 = "\bubdiv\gamedata\extend_2.dat";

//  End Game Scroll text in seconds to scroll for
    stext_secs = 32;

//ANIMATION CONSTANTS
    grpclr_block  = 4;
    grpclr_secret = 3;
    grpclr_end    = 5;

//Dino Array Anims
    b_offset = 30;     //blue offset to player2s graphics - all dino array frames apart from below
    b_offset_fire = 8; //for the torched graphic blue
    b_offset_board = 10; //blue offset to walkon with board anim

    bub_pink = 132;    //pink bubbles
    bub_red  = 135;    //red
    bub_pop  = 199;    //pop anim outline of bubble
    bub_pop2 = 163;    //pop flashing text
    bomb_anim = 677;   //bomb item
    bub_fire  = 740;   //Fireball Bubble

//Heart alternate frames
    hrt_frm1 = 136;
    hrt_frm2 = 154;

//heart dino orange, add to anim to get flash orange frame
    hrt_dino1 = 58;
    hrt_dino2 = 28;

//EXTEND bubbles start
    extend = 156;
    ext_animtime = 300; //Anim time of all extend collected

//EXTEND Room graphics
    e_bubble_big = 648;
    e_bubble_pop = 654;
    e_star = 646;
    e_twinkle = 636;
    e_letters = 638;
    e_nice = 644;
//Player Detection delay for monsters to look where the dino is on screen

    det_del_norm  = 150;
    det_del_angry = 100;

//Comet
    Comet_gph = 660;

//Tiara Stars
    T_Stars = 690;
    T_Stars_Frms = 7;

//necklace star pinball
    N_Star_Pinball = 698;
    N_Star_P_Frms  = 6;

//Big lightning
    BL_Graph  = 201;
    BL_Frames = 4;

//12 frames in all
//3 green, blue, pink, red
//8 trap bubble types
    trap_bubbles = 500;
    dino_trap_bubbles = 779;

//for calling the bubble sprite routine
    extrbub  = 0;
    specbub  = 1;
    trapbub  = 2;
    normbub  = 3;
    firebub  = 4;
    dinobub  = 5;
//for calling bubble sprite bubatt
    bubfire = 0;
    bubwater = 1;
    bublight = 2;
//for Altering players bubbles

//none for secret room and heart item
//normal bubbles
//lightning
//fire
//water
//extend
    blow_none = 1;   //no bubbles for this level
    blow_normal = 2; //normal bubbles
    blow_lightn = 3; //lightning bubbles
    blow_water  = 4; //water bubbles
    blow_fire   = 5; //fire bubbles
    blow_extend = 6; //extend bubbles
    blow_player = 7; //traps the other player in the start bubble

    dis_star = 195; //star dissapear
    player_flash = 57; //clear graphic

    player_eggs       = 614; //green dino 5 frames then blue dino eggs
    player_eggs_blank = 624; //for 1 life, none displayed on screen

//Water animation frames
    water_anim   = 166;
    water_aleft  = 165;
    water_aright = 167;
    water_ldown  = 168;
    water_rdown  = 170;
    water_top    = 172;
    water_detect = 687;
//water flood
    flood_anim = 265;
    flood_grp  = 269;

//Fire animation frames
    fire_drop = 174;
    fire_rage = 177;
    fire_die  = 180;
    fire_diend= 188;

//Lightning animation frames
    lning_main = 189;
    lning_zzap = 192;
    lning_boss = 116;

//Enermy fire frames
    mighta_rock = 600;
    mighta_dis  = 601;
    fireball    = 605;
    invaderzzap = 607;
    invaderstar = 609;
    drunkbottle = 611;

//Point display frames
    greenstart = 200;
    greenbig   = 237;
    greenfruit = 243;
    pointsadd  = 100; //what to add to do the blue ones

//Food - see structs for others
    norm_food = 17;
    trap_food = 1;
    diam_food = 88;

//Hurry up frame
    hurryfrm    = 612;
//Bell Animation
    Bell_frame = 685;

//Secret room
    s_room_scr   = 210;
    s_room_door  = 230;
    s_room_exit  = 253;
    s_room_torch = 251;
    s_room_skel  = 376;

//Special weapons graphics
    spw_lan_star     = 647;
    spw_lan_fireball = 205;

//Help ingame boss sprite
    help_gph = 114;
    trapped_gph = 94;

//potion end total display
    pot_500 = 363;
    pot_perfect = 251;
    pot_badd = 100;

//END LEVEL/BOSS graphic
    boss_norm    = 122;
    boss_hitdie  = 128;
    boss_angry   = 126;
    boss_bubbled = 129;

    end_cracks = 800;
    end_blocks = 824;

    end_heartbig = 656;
    end_heartsml = 657;
    end_happy    = 659;
    end_million  = 658;

    end_disolve  = 831;
    //scr_Stars - stars background

//GF end game graphics
    gf_green_break = 661;
    gf_break_add = 3;
    gr_man      = 767;
    gr_girl     = 768;
    gf_together = 770;
    bl_add = 6;        //get other player graphics by adding this

//Level Screen
    lv_ban     = 18;  //Banners - Green, Blue+1
    lv_gf      = 20;  //Girlfriends
    lv_bub     = 22;  //Dancing Bub - Green
    lv_bob     = 24;  //Dancing Bob - Blue
    lv_bub_bar = 26;  //Green bar for Bub
    lv_bob_bar = 28;  //Blue  bar for Bub
    lv_bar_hi  = 2;   //Magenta max for player bar
    Lev_Clear100 = 16; //Clear 100
    Lev_Reached_Gph = 30; //Level Reached Screen

//for effect bubbler routines
//NEW
    coke_bub = 133;
    coke_frms = 15;

//colour bubble spitter for hiscore table
    rbub_white  = 1;
    rbub_random = 2;
    rbub_strobe = 3;


//GAME SETUP AND ITTERATION CONSTANTS
//Keys or Joystick
    Use_Keys = 0;
    Use_Joy  = 1;

//Hiscore
    hisc_items = 5;
    xstpos = 5;    //hi score table starting positions
    ystpos = 12;

    xst2 = 11;
    yst2 = 9;

    hfontxsize = 16;  //xsize of font
    hfontysize = 10; //ysize of font
    chr_rub = "<";
    chr_end = ">";
    yspacing  = hfontysize*2;
    //xadd = yspacing*5;
    hisc_terminator = 999;
    num_to_enter = 3;
    block_res = 16;

    txt_a_size = 50;

    B_Potion_Dis = 0; //Display to screen
    B_Potion_Scr = 1; //On screen
    B_Potion_Col = 2; //Collected by the player

//game level types
    lv_title    = 1;
    lv_redefine = 2;
    lv_joystick = 2;
    lv_options  = 3;
    lv_cheat    = 4;
    lv_show_k   = 5;
    lv_quit     = 6;
    lv_credits  = 7;
    lv_instr    = 8;
    lv_demo     = 9;
    lv_normal   = 10;
    lv_extend   = 11;
    lv_secret   = 12;
    lv_potion   = 13;
    lv_boss     = 14;
    lv_end      = 15;

//Games States
    gs_start_adv_level  = 1;
    gs_adv_level        = 2;
    gs_level_reached    = 3;
    gs_level_anims      = 4;
    gs_level_anims_done = 3; //Same as level reached to set the level up once the big bosses have gone off the screen
    gs_level_setup      = 5;
    gs_level_start      = 6;
    gs_level_go         = 7;
    gs_pause_game       = 8;

    gs_level_completed  = 9;
    gs_level_next_timer = 10;

    gs_comp_crack       = 11;
    gs_comp_girlf       = 12;
    gs_comp_dino_mv     = 13;
    gs_comp_human       = 14;
    gs_comp_kiss        = 15;
    gs_comp_roof        = 16;
    gs_comp_comet       = 17;
    gs_comp_buboff      = 18;

    gs_comp_endscreen   = 20;

    gs_completed        = 21;
    gs_game_over        = 22;
    gs_exit             = 23;

//Title screen
    t_nothing        = 255;
    t_next           = 99;  //goto next screen

    t_start_prog     = 0;
    t_title_main     = 1;
    t_insert_coin    = 2;

    t_demo_instr     = 3;
    t_demo_level     = 4;
    t_hiscre_dis     = 5;
    t_lev_reachd     = 6;

    t_options        = 7;
    t_cheat          = 8;
    t_redefine_k     = 9;
    t_joystick       = 10;
    t_game_keys      = 11;

    t_start_game     = 12;

    t_hiscre_ent     = 13;
    t_lev_reachd2    = 14;
    t_game_over      = 15;

    t_exit_prog      = 16;

//Text Types
    t_norm   = 0;
    t_flash  = 1;
    t_scroll = 2;

//Auto Movement of Dinos for Demo and Extend Levels
    mv_wait  = 0;
    mv_left  = 1;
    mv_right = 2;
    mv_jump  = 3;
    mv_fire  = 4;
    mv_exit  = 5;     //exit the auto play
    no_key_moves = 5; //number of keys which player can press

    bub_TL = 6;
    bub_TR = 7;
    bub_BL = 8;
    bub_BR = 9;

//Font type for array
    f_silver = 1;
    f_gold   = 2;
    f_green  = 3;
    f_red    = 4;
    f_blue   = 5;
    //only used by the scroll text routine
    l_feed   = 9; //line feed no
    t_end  = 10;  //end of scrolling text

//Recording logic
    Rec_Free  = 0;
    Rec_Doing = 1;

//Random bubble next = 2.7 secs
    time_rnd_bub = 270;

//times in seconds for these to be displayed
    time_food  = 5;
    time_item  = 10;

//initial game hardness level
    game_vhard = 14;
    game_hard  = 10;
    game_norm  = 7;
    game_easy  = 4;

//Screen exit status
    s_ext_closed = 1;   //colours from the bubble map make up the logic
    s_ext_open_U = 2;
    s_ext_open_D = 3;

    Which_ex_at_Top = 1; //Which exit has the bubble gone through - used in bubble sprite and Dino
    Which_ex_at_Bot = 2;

//Items storage array
    num_items   = 63; //number of items setup in items array - to use in the game
    n_hs_cheats = 13; //number of hiscore cheat codes

//Bobble Tables
    num_bob = 52;   //number of elements in the bobble table
    num_bob2 = 91;  //number of elements in the circular bobble table

//Shake screen array
    num_shk = 64;   //number in shake screen array

//Kill Dino type
    Kill_D_norm    = 1;
    Kill_D_FireInv = 2;

//Stop Game
    stop_nothing    = 0;
    stop_heart      = 1;
    stop_monsters   = 2;
    stop_everything = 3;

//Monsters
    mon_norm  = 0;
    mon_angry = 1;
    mon_heart = 2;
    mon_bossbubb = 2; //used for the boss when bubbled up

//Bubble movement
//hardness map colour compararison
    hd_num   = 8; //alter this for add more colours to find array in bubbler
//(bubbler)for detecting colours on hardness maps
    hd_bob_cir = 8;
    hd_bob_lr  = 7;
    hd_bob_ud  = 6;
    hd_left  = 4;
    hd_right = 5;
    hd_up    = 2;
    hd_down  = 3;
    hd_stop  = 1;
    hd_kill  = 1;

//for last bubble movements
    lst_up = 1;
    lst_dn = 2;
    lst_lf = 1;
    lst_rt = 2;

//number of colour blocks on the platform hardness map
    blocks_hd1 = 1; //normal plat no bubbles drift up
    blocks_hd2 = 2; //bubbles hit and drift up
    blocks_hd3 = 3; //invisible
    blocks_hd4 = 4; //invisible fall through blocks

//same as above for bubble movement
    b_up = 2;
    b_dn = 3;
    b_lf = 4;
    b_rt = 5;

//for Food process
    fd_norm = 1;  //normal level food
    fd_trap = 2;  //trap food mulitpler val in sprid
    fd_big  = 3;  //candy cane food 700 points
    fd_diam = 4;  //diamonds from killing monsters
    fd_mat1 = 5;  //score match1
    fd_mat2 = 6;  //score match2
    fd_fall = 7;  //levels with 5 in them mostly 700 points
    fd_hrt  = 8;  //food items heart
    fd_tres = 9;  //treasure room diamonds 10,000 points

//Spec weapon go
    spec_go_tiara   = 1;
    spec_go_pinball = 2;
    spec_go_light   = 3;

//monster diamonds kill values to pass to the monster kill routine
    mkill_trap         = 1;
    mkill_heart        = 2;
    mkill_do_nothing   = 3;
    mkill_just_monster = 4;
    mkill_necklace     = 10;
    mkill_tiara        = 10;
    mkill_w_cr_bubbled = 10;
    mkill_water_cross  = 11;
    mkill_water_bubble = 11;
    mkill_lning_bubble = 12;
    mkill_lning_cross  = 12;
    mkill_firebubble   = 13;
    mkill_fireball     = 13;
    mkill_purp_lantern = 13;
    mkill_bomb         = 14;
    mkill_book         = 12;

//Book Explosion frames
//5 explosions, 6 frames each
//colours Red, orange, green, blue, purple
    book_st_frm  = 704; //Red
    book_frms    = 6; //number of frames
    book_exp_num = 5; //number of them

//Candy canes food
    big_food = 82;

//00, 10 lowest 10 items of the food
    food_match2 = 17;

//Falling food
//type of falling food to do
    ffall_t_level   = 1;
    ffall_t_ccane   = 2;
    ffall_t_score1  = 3;
    ffall_t_score2  = 4;

//Rings
//rings to do power ups ultra score for moving and blowing bubbles
    sp_ring_purple = 1;
    sp_ring_red    = 2;
    sp_ring_blue   = 3;
    sp_ring_all    = 4;

//Potion
    vs_graph = 354;

//INTRO
    intro_screen = 16;    //the star scape graphic - in Titles FPG
    intro_text = 52;     //text for the screen
    intro_bubbles = 100; //clear intro bubble graphic
    rainbow_bubbles = 734; //clear intro bubble graphic

    intro_delay1 = 830;                //8.3 Seconds
    intro_rotate_delay = 5;              //rotate_palette delay

//Boss
    boss_init_health = 100;
    pot_def_time = 30; //Potion Time

//button types
    bt_click_once = 1; //increases a var once
    bt_click_hold = 2; //increases a var as long as its held down
    bt_toggle     = 3; //toggles part of a group
    bt_group      = 4; //part of larger group
//    bt_click_win  = 5; //opens a window

//button graphics
    bg_blank      = 0;
    bg_l_arrow    = 1;
    bg_r_arrow    = 2;
    bg_P1         = 3;
    bg_P2         = 4;

//button events
    but_Backgrounds = 0;
    but_Frame_Dn    = 1; //Frame rate down
    but_Frame_Up    = 2; //Frame rate up
    but_Skip_Dn     = 3; //Frame skip down
    but_Skip_Up     = 4; //Frame skip down
    but_Levels      = 5; //Level normal extend
    but_Diff_set    = 6; //Difficulty setting
    but_Extra_Lives = 7; //Extra life setting
    but_Rest_Hi     = 8; //Hiscore reset
    but_clr_items   = 9; //Item counters clear
    but_reset_keys  = 10;//Player keys reset
    but_reset_all   = 11;//Resets everything to defaults
    but_lives_Dn    = 12;//Lives to start 1-5 def 3
    but_lives_Up    = 13;
    but_Credits_Dn  = 14;//Credits available
    but_Credits_Up  = 15;
    but_level_dn    = 16;//Start level
    but_level_up    = 17;
    but_cheat_reset = 18;//clear all cheats
    but_cheat_screen= 19;
    but_invince_P1  = 20; //invincible
    but_invince_P2  = 21;
    but_lives_P1    = 22; //infinite lives
    but_lives_P2    = 23;
    but_autofire_P1 = 24; //Auto fire on
    but_autofire_P2 = 25;
    but_power_P1    = 26; //keep powerups
    but_power_P2    = 27;
    but_alwaysSR    = 28; //can go in secret room
    but_itemkey     = 29; //cheat item key on
    but_extraitems  = 30; //extra items on/off
    but_level_umb   = 31; //level umbrella
    but_potion_Dn   = 32; //Potion time
    but_potion_Up   = 33;
    but_maxbub_Dn   = 34; //Bubbles on screen
    but_maxbub_Up   = 35;
    but_boss_Dn     = 36; //Boss health
    but_boss_Up     = 37;
    but_fireBub     = 38; //fire bubble freq
    but_Trap_Dino   = 39; //trap other player

//SCREEN SETUP AND SPRITE CONSTANTS
//Graphics Priority
//  + deeper  - infront
    pri_player  =  40;
    pri_hurry_up= -40;
    pri_flood   =  50; //water priority
    pri_water   =  20;
    pri_water2  =  40; //water detection priority
    pri_border  = -50;
    pri_nasties = -20;
    pri_fire    = -4;
    pri_items   = -5;
    pri_bubbleb =  45;
    pri_bubbles = -20;
    pri_potion  = -256;
    pri_doors   =  50;
    pri_tit = -100;
    pri_banners  = 11;
    pri_clear100 = 0;

    pri_endwrit = 40;
    pri_endcomet= 45;

    pri_gf      = 50;
    pri_disolve = 60;

    pri_score   = -257;
    pri_effects = -10;

//Hardness map locations
    plat_start = 1;
    bub_start  = 2;

    secret_plat   = 901; //secret room hardness map
    demo_plat     = 902; //demo screen hardness map
    extend_plat   = 904; //extend room hardness map

//which levels to do
    lev_normal = 1;
    lev_extend = 2;

//  One off levels uses Extend_Demo_Level process instead of Next Level
    Ext_Level = 1;
    Dmo_Level = 2;

//screen graphics buffer
    scr_graf    = 990;
    scr_bgrd    = 991;

    bground_intr = 400; //graphic to do instruction background

    bgrounds    = 402; //graphics to do backgrounds
    bgroundnone = 270; //blank to do no backgrounds - options no backgrounds

//Put Screens
    scr_Stars   = 840; //Stars Start of game

//where to place the backgrounds once the screen is drawn
    scr_bgrd1 = 0;
    scr_bgrd2 = 465;

    sml_xloc = 44; //small blocks startin pos on screen
    sml_yloc = 12;

    sml_xloc2 = 44+8; //small Shadow blocks startin pos on screen
    sml_yloc2 = -10;

    big_xloc = 20 ; //big blocks top right
    big_yloc = 16;

    clipx = -4; //screen clipper location

    blocksdown = 13; //number down the screen
    blocknew = 32;   //when to put a new block
    num_levels = 100; //number of levels done

    act_sm_loc = 10; //where the gfx blocks start from
    act_bg_loc = 11; //big side blocks
    scr_clearer = 4; //screen clearer green block

    ext_sm_loc = 6;  //extend screen blocks
    dmo_sm_loc = 8;  //demo screen blocks

    blocks_acr = 28;
    blocks_dwn = 26;
    bl_even_line = 16; //location of even draw line
    block_res = 16;    //resolution of blocks on screen in pixels
    plt_hrd = 800;     //platform hardnes map loc
    bub_hrd = 801;     //bubble hardness map loc

//Resize map locations
//small maps resized to a full size screen hardness map
//used in Next_level, Demo_level, Secret Room and Extend screen
    Resize_x = 332;
    Resize_y = 256;
    Resize_amt = 1600; //map 1 pixel = 16 onscreen so resize by 1600

//Start pos
    x_def = 108;
    y_def = 54;
    y_def2 = 64;

//Screen Fall Through
    y_b_loop = 480; //loop nasties/dinos when past this y loc
    y_bt = 22;      //loop up to this

//screen text location start
    x_txt_st = 60;
    y_txt_st = 10;

//dino eggs position
    d_egg_x1 = x_def-16;
    d_egg_x2 = x_def  + (26*block_res);
    d_egg_y  = y_def2 + (24*block_res);

    prop_y = 208; //for adjusting coords of data of monsters/food/items

//Middle of the screen

//intro anims start positions
    x_p1_intro = x_def + (block_res*5); //player 1 intro coords
    x_p2_intro = x_def + (block_res*21); //player 2 intro coords
    y_intro = y_def + (block_res*12);

    x_pl1 = x_def + block_res;     //player 1 start coords
    x_pl2 = x_def + (block_res*25);//player 2 start coords
    y_pl  = y_def + (block_res*23); //same for both players

//Dino enter coin dino board start locs
    x_p1_board = x_def  + (block_res*32); //player 1 intro coords
    x_p2_board = x_def  - (block_res*6); //player 2 intro coords
    y_board    = y_def2 + (block_res*22)-1;

//End/Boss level
    x_p1_gf = x_p1_intro-16;
    x_p2_gf = x_p2_intro+16;
    y_gf = y_intro-108;

//For Caclulating angles for bubbles and boss bottles
    k = 1000;

//skel start
    x_sk1  = x_def + block_res;     //skel coords
    x_sk2  = x_def + (block_res*25);//player 2 start coords
    y_ska  = y_def2 + block_res;
    y_skb  = y_def2 + (block_res*22);

//tiara stars left right screen stop randomiser values for x
    x_tiara_l  = x_def - (block_res*2); //for randomising start pos of stars
    x_tiara_r  = x_def + (block_res*27);//for randomising start pos of stars

//Bell positions
    bell1_x = 84;
    bell2_x = 84 + (block_res*29);
    bell_y  = 28;

//extend bubble display locs
    x_bplr1 = x_def - 33;
    x_bplr2 = x_def + (28 * 16);
    y_bplr  = y_def + (5 * 32)  - 33;

//bubble screen bounds
    y_up_stop = -48;
    y_dn_stop = 512;
    x_scr_middle = x_def + (block_res*13);
    y_scr_middle = y_def + (block_res*12);

//y block det for repeating end of screen so bubbles drift down up when off
//the drawn area
    y_up_block = 0;   //dinos
    y_up_block2 = 64; //bubbles
    y_dn_block = 398+64;

    x_bub_start = x_def;//238;
//    x_bubrt_start = 397;

    y_bub_startT = -20;
    y_bub_startB = 480;

//where to repeat from
    y_up_start = -100;
    y_dn_start = 460;

//baddie x fire bounds - stop firing when too close to side of screen
    x_side1 = 143; //x start 111
    x_side2 = 460;
//x screen bounds
    xpos_l = 106;
    xpos_r = 517;

//fall top block
    topblock = 62;

//hurry stop pos
    stop_at_y = y_def + 208;
    next_sec = 7; //seconds before next level auto advances

//boss start locs
    xhelp_l = x_def + (block_res*6);
    yhelp_l = y_def + (block_res*24);
    xboss_l = xhelp_l - (block_res*2);
    yboss_l = yhelp_l + (block_res);
    xtrapped_l_1 = xboss_l;
    ytrapped_l_1 = yboss_l + (block_res*3);
    xhelp_r = xhelp_l + (block_res*9);
    yhelp_r = yhelp_l;
    xboss_r = xboss_l + (block_res*18)+6;
    yboss_r = yboss_l;
    xtrapped_r_1 = xtrapped_l_1 + (block_res*18)+6;
    ytrapped_r_1 = ytrapped_l_1;

//Potion
    x_vs = x_def + (block_res*13)+8;
    y_vs = y_def + (block_res*1);

    x_time = x_def + (block_res*9)+8;
    y_time = y_def + (block_res*4);

    x_timer = x_vs + (block_res*14);
    y_timer = y_def + (block_res*4);

    x_pl1_sc = x_def + (block_res*12)+8;
    x_pl2_sc = x_def + (block_res*16)+8;
    y_pl_sc = y_def + 15;

//end totals
    x_pot1_sc = x_def + (block_res*11); //TEXT locs
    x_pot2_add = block_res*14;          //to locate the blue players totals on screen
    y_pot_sc = y_def + (block_res*26);

    x_pot500 = x_def + (block_res*1);  //graphic 500x
    y_pot500 = y_def + (block_res*25)+2;

    y_pot_stop_loc1 = 224;
    y_pot_stop_loc2 = 224;
    y_pot_add = 2;

//potion food locs
    x_pot_st = x_def + (block_res*1);
    y_pot_st = y_def2 + block_res;

    pot_num_x = 13; //number across
    pot_num_y = 10; //number down

//Potion platform sprite detection start blocks
    x_pot_det = 6;
    y_pot_det = 5;

//Secret Room
    x_torch_l = x_def;
    x_torch_r = x_def + (block_res*26);
    y_torch = y_def + block_res +10;

    y_pl_sr = y_def + (block_res*14); //same for both players

//Door_locs
    x_door1 = 108 + (block_res*13);
    y_door1 = 51 + (block_res*16);

    x_door2 = 106 + (block_res*13);
    y_door2 = 48 + (block_res*24);

//Diamond locations
    x_dsr_st = 163;
    y_dsr_st1 = 127;
    y_dsr_st2 = y_def2-1 + (block_res*10);

    x_dsr_right = x_dsr_st + (block_res*7);
    x_dsr_right2 = x_def+4 + (block_res*13);
    x_dsr_right3 = x_def+4 + (block_res*9);

    y_next_lev1 = (block_res*3);  //next platform top platforms
    y_next_lev2 = block_res*14;   //bottom platform
//Extend Screen
    x_pl2_extend = x_def + block_res;     //player 1 start coords
    x_pl1_extend = x_def + (block_res*25);//player 2 start coords
    y_pl_extend  = y_def + block_res; //same for both players

    x_nice = x_def + block_res*13;
    y_nice = y_def + (block_res*8)+8;
    y_nice_star = y_def + (block_res*5);

//End of Game
    y_million = y_def + (block_res*5);
    x_happy1 = x_def + (block_res*4);
    x_happy2 = x_def + (block_res*22);
    y_happy  = y_def + (block_res*14);

    x_heart1 = x_def + (block_res*4)+8;
    x_heart2 = x_def + (block_res*22)+8;
    y_heart  = y_def + (block_res*20);
//LEVEL REACHED LOCS
//locations for the level counters on the level reached screen
    x_ban_lev1 = 255;               //the banner with a arrow pointing to where we reached
    x_ban_lev2 = x_ban_lev1+129;
    y_ban_lev  = 87;

    x_txt_lev1 = 145;               //the text of the counter on the banner
    x_txt_lev2 = x_txt_lev1+404;
    y_txt_lev  = 104;

    x_comp_all1 = 117;    //Where to place the Magenta Clear 100 sprite
    x_comp_all2 = 523;
    y_comp_all  = 421;
//Options Screen

//Mouse
    Mouse_gph = 214;
    b_bl_size = 16;

GLOBAL
    pal[255]; //palette to destroy 255 gets 000 to 255; if 000 put in
    drawloc;  //fore screen draw location
    drawloc2; //background screen draw location
    sm_block_grf;
    bg_block_grf;
    noscrolldraw; //to not scroll the first screen or after a extend or for/after a treasure room
                  //False = Scroll, True = No Scroll

//Use Keys or Joystick
    player_keys_joy[1];
    player_joy_jump[1]; //Joy Up or button 1-4
    player_joy_fire[1]; //1-4

//Save Game Settings from here
    frm_rate;        //Game frame rate
    frm_skip;        //Game frame skip
    game_diff_value; //game difficulty value 0 to 30
    game_diff;       //actual level 1 to 4, 1 - easy 4 - hard
    life_set;        //0-3 when lives are awarded 0- 20k, 1-30k - used by an array holding compare values
    do_bgrounds;     //do graphics on the background? - options can set to have none
    do_levels;       //which to run normal or Extended
    Start_lives;     //Lives player starts with

    default_song;    //default song mod to play

//timers
    level_timer;     //in seconds the level has been going for
    level_timer2;    //seconds for a the bubble delays
    level_next;      //0 if level still going, gets level timer +n seconds for next level advance
    heart_timer;     //when level timer reachs this stop heart item effect
    titles_timer;    //for main screen and intro screen

    level_anims;     //level anims going?
    level_food;      //has the food been displayed yet - reset of level timer when player gets killed
    level_items;     //or item?
    level_hurry;     //in seconds when hurry to appear reset when player dies
    level_skel;      //same as above for when skel to appear
    level_advance;   //number to advance by 1 or 3=orange, 5=red, 7=purple, gold = to level 70
    start_level;     //level the game starts at

    next_insert;     //insert coint animation level to run animation next, so it doesnt appear every level

    level_next_go;   //do advance to next level now
    level_stop_what; //everything, clock=nasties, heart nasties blue
    dest_level;      //level to goto, used by screen draw and to check for ingame bosses
    level_type;      //what level? normal,boss,secret room, potion
    game_state;      //what the game is doing

    boss_set_health; //start health of boss - end of game
    sr_player_died;  //player died in the secret room, player_died doesnt work level events changes it before it can exit the room
    kill_secret_eff; //to kill off the pinball and star sprites in the secret room
    cheat_mode;      //Cheat mode on, will allow player to get into cheat screen from options screen
    extra_items;     //do extra items
    lev_multi;       //multi pop of 3 done on last level T/F
    missed_multi;    //4 levels without multi set extra item - trap all monsters
    fire_bubble_go;  //Fire bubble item collected
    item_key;        //F10 disabled for get items
    int_FB_val;      //initial firebubble rand value, used to access fb set random array

    alwaysSR;        //always go in secret room

//Max level reached today - See bubbob array
    Credits;      //Credits entered
    Coins_Avial;  //Coins Available to play in one game
    Start_coins;  //Coins to restore when game ends
    ffall_level;  //global variable to check when a bubble pops at the end of a level
    ff_sprid;     //id of the sprite
    ffall_type;   //type of falling food

//Intro
    intro_finished;  //intro animation done T/F
    player_st1;      //Title Screen player 1 start T/F
    player_st2;      //player 2

//Level food display flags/times
    last_completed_time; //time completed - when last nastie killed
    last_hurry;          //hurry on last level?
    last_skel;           //skel on last level?
    last_umb;            //umbrella on last level?
    this_hurry;          //hurry on this level
    this_skel;           //skel on this level
    this_umb;            //umbrella on this level
    players_on_screen;   //number of players on screen

    spec_weapon_go;      //used to detect a special weapon if its on screen, in the nastie sprites
    item_num;            //item to do
    secret_total;        //number of Diamonds left on secret room
    secret_num;          //secret room number 1..3

    act_hurry;           //actual time + level timer
    act_skel;            //when dies does the above

    boss_health;         //health of end game boss

    num_baddies;         //total number of baddies for the level
    got_crystal_ball;    //makes items appear faster = food time
    got_bell;            //rings a bell when a special item will appear
    got_crayon;          //next 5 levels are all potions

    player_died;     //one of the players has died after anim nasties to normal
    game_died;       //for secret rooms see alwaysSR - to turn this off
    heart_finished;  //to set baddies back to normal
    auto_item;       //makes autofire item appear twice if 2 players on screen
    fireball_deadly; //player can be killed by the other player
    trap_player;     //can trap other player
    got_extend;      //got a extend level

    pl_died_skhurry; //this to get rid of skel and hurry straight away

    scrollcount;  //used to scroll the screen, by one screen length once its drawn
    scrollspeed;  //speed to do scroll at
    lastdrawloc;  //for doing the water flood, gets the last scroll draw location when the screen is draw
//Recording of the players movements
    stop_recording;

//File pointers
    blocksfile;   //graphics file of blocks and screen scroll buffers
    platdata;     //platform graphics data
    hardness;     //hardness blocks file pointer
    sprites;      //sprites file pointer
    fooditems;    //food and items file pointer
    titlesfile;   //Title screen file pointer also holds big baddies
    plat_map;     //platform hardness map file id
    bubble_map;   //bubble harness map file id

//FONT File pointers
    font_s;       //silver
    font_r;       //red
    font_b;       //blue
    font_g;       //gold
    font_gr;      //green
    font_n;       //numbers for level
    font_pg;      //potion totals font = green
    font_pb;      //potion totals font = blue
    font_lev;
    font_ed;    //Options screen font

//bubbles
    max_bubs;      //total bubbles allowed on screen
    Next_Rnd_Time; //in hundreths how long till next random bubble
    rnd_interval;   //special random loop count before doing a normal bubble
    bubble_time;   //trap bubbles time from level array
    bubble_trans;  //bubbles translucent? (See through)
    bubble_rate;   //rate to base pixel and frame rate on
    bubble_speed;  //pixel bubbles speed
    bubble_frame;  //frame delay on the bubbles
    Bub_add;       //for speed adjust
    bubble_alldie; //kill all the bubbles end of level!!
    exits_count;

    total_bubs; //total allowed on the screen
    numfire;    //number allowed on screen set by the level array in act level setup
    numwater;
    numlight;
                    //bubbles on the screen
    count_water;    //water bubbles
    count_fire;     //fire bubbles
    count_light;    //light bubbles
    count_extra;    //extend
    last_lev_extra; //total monsters multi popped
    extend_popped;

    fire_bubble_rnd; //random fire bubbles max val 1 in n  2 to 4096 default

//Multi arrays
    m_array1[7];  //holds ids of the trap bubble sprites
    m_array2[7];
    m_add[2];     //get true if a new value has been added to arrays above
    m_score[2];   //last score value

//animated extend bubbles
    anim_x_plr1;
    anim_x_plr2;
    anim_x_p1tme; //time to anim end and extend screen
    anim_x_p2tme;

//Baddies
    baddie_what;   //norm angry blue make all baddies angry or blue
    baddie_stop;   //stop em moving
    baddie_alldie; //kill all of them
    bad_speed;
    bad_speed2;    //angry speed
    bad_on_screen;   //number on screen
//Water flow
    num_water;

//Ready Text pointers
    Ready1;
    Ready2;
    Ready3;

    cur_level;    //level we are drawing level+1
    act_level;    //actual level use for everything else
    potion_time;

//SOUND variables
    m_selector;  //effects, music, song
    do_music;    //true false
    do_song;     //1 bubble mod, 2 remix
    id_song;     //current song id
    song_ids[1]; //song ids 2 of
    stop_sounds; //music, effects, all

//potions
    plr1_score;
    plr2_score;
//level no text
    lev_txt;

//test variables
    test;
    test2;
    test3;
    test4;
    test5;
    test6;
    test7;
    test8;
    test9;
    test10;

    count; //used on setting up the pallette and other loops

//When the bubble loops the program checks to see where it can loop
//the bubble to
//Checks in this order:
//closest one on the current Y plane
//directly above or below
//exit diagonaly across

//Otherwise it kills the bubble
//Exits
//0 = Top left
//1 = Top Right
//2 = Bottom Left
//3 = Bottom Right
STRUCT Exit_Scan[3]
   check1;
   check2;
   check3;
END =    //Exit           Check1    Check2    Check3       Kill
1,2,3,   //Top Left     - Top Rgt   Bot Lft   Bot Rgt
0,3,2,   //Top Right    - Top Lft   Bot Rt    Bot Lft
3,0,1,   //Bottom Left  - Bot Rgt   Top Lft   Top Rgt
2,1,0;   //Bottom Right - Bot Lft   Top Rgt   Top Lft

//exits open on the screen for bubbles coming in
STRUCT exits_open[3]
    ex_status;  //1 = closed, 2 = up 3 = down
    ex_st;    //exit start pos
    ex_end;   //exit end pos
    ex_size;  //in blocks - 4 for normal exit
END

exit_rnd_open[3]; //for actual exit numbers to randomise bubbles to


//Sound array stores
    sound_ids[n_sounds]; //holds the ids of the sounds loaded
    s_trigger[n_sounds]; //triggers for the effects
    doing_effect [4];    //effect number playing
    using_channel[4];    //channels used by the effects
//    new_effect[4];       //new effect triggered

    channels_taken; //this keeps track of how many of the 16 channels are taken
    music_id;       // music1, music2 playing
    music_chan;     //used to check the music is playing

//Have priorities on the sounds so the program wont
//stop the music when a lot of effects are triggered to play
STRUCT effects[n_effects]
    loop_wav;      //when it is played, is this sound looped?
    stop_what;     //stop music all effects?
    onstop_effect; //when sound has been stoped or finished trigger this sound
    priority;      //music, big effects - items, then general effects
    stop_effect;   //sound process checks this to see if it needs stopping
    music_off;     //play this sound if music is off?
    do_song_eff;   //do this effect for
END =
No , stop_none , e_normal  , pri_1,0, No, No,  //e_bbstart music
Yes, stop_music, e_fast    , pri_1,0, No, No,  //normal in game
Yes, stop_music, e_normal  , pri_1,0, No, No,  //fast in game
Yes, stop_music, e_normal  , pri_1,0, No, Yes, //secret room
Yes, stop_music, e_normal  , pri_1,0, Yes,Yes, //clock

No,  stop_music, e_fast    , pri_1,0, Yes,Yes, //hurry up sound
No , stop_music, e_fast    , pri_1,0, Yes,Yes, //skel
Yes, stop_all  , e_gameover, pri_1,0, Yes,Yes, //hi score music
No , stop_music, e_none    , pri_1,0, Yes,Yes, //game over display
No , stop_none , e_none    , pri_1,0, Yes,Yes, //Comet

Yes, stop_music, e_none    , pri_1,0, No, Yes, //boss music
Yes, stop_all  , e_normal  , pri_1,0, Yes,Yes, //End Jingle Music
Yes, stop_all  , e_extend2 , pri_1,0, No, Yes, //extend anim sound
No,  stop_music, e_potion  , pri_1,0, No, Yes, //extend screen music start plays potion music after
Yes, stop_music, e_normal  , pri_1,0, No, Yes, //potion music

No,  stop_music , e_none  , pri_2,0, Yes, Yes, //Boom
No,  stop_music, e_none   , pri_2,0, Yes, Yes, //Water cross
No,  stop_none , e_none   , pri_2,0, Yes, Yes, //Fire sphere
No,  stop_none , e_none   , pri_2,0, Yes, Yes, //Lightning Big
No,  stop_none , e_none   , pri_2,0, Yes, Yes, //teapot boom
No,  stop_none , e_none   , pri_2,0, Yes, Yes, //bell item
No,  stop_none , e_none   , pri_2,0, Yes, Yes, //bigfood
No,  stop_none , e_none   , pri_2,0, Yes, Yes, //bigfood laugh
No,  stop_none , e_none   , pri_2,0, Yes, Yes, //bigfood laugh2
No,  stop_none , e_none   , pri_2,0, Yes, Yes, //bigfood slurp
No,  stop_none , e_none   , pri_2,0, Yes, Yes; //bigfood burp

//pri 3 gives an error

//Sound File array - has the path and filename
effect_files[n_sounds-1]=
effect1,effect2,effect3,effect4,effect5,effect6,effect7,effect8,effect9,effect10,
effect11,effect12,effect13,effect14,effect15,effect16,effect17,effect18,effect19,effect20,
effect21,effect22,effect23,effect24,effect25,effect26,effect27,effect28,effect29,effect30,
effect31,effect32,effect33,effect34,effect35,effect36,effect37,effect38,effect39,effect40,
effect41,effect42,effect43,effect44,effect45,effect46,effect47,effect48;

song_files[n_mod-1] =
mod1, mod2;

//multi score;
multi_score[6] =
1000, 2000, 4000, 8000, 16000, 32000, 64000;

//for popping trap bubbles and walking into enermies with a heart
food_pop[7]=
500,1000,2000,3000,4000,5000,6000,7000;

//potion food
STRUCT potion_food[4]
   gph;
   frames;
END =
365, 1,
371, 4,
366, 1,
375, 8,
367, 4
;
//heart baddie id correction
heart_cor[7]=
1,3,6,5,2,4,8,7;

//points for normal food
food_points[59] =
10,20,30,40,50,60,70,80,90,
100,150,200,250,300,350,400,450,500,
550,600,650,700,750,800,850,900,950,
1000,1000,1000,
2000,2000,2000,2000,
3000,3000,3000,3000,
4000,4000,4000,4000,
5000,5000,5000,5000,
6000,6000,6000,
7000,7000,7000,
8000,8000,8000,8000,
9000,9000,
10000,10000;

//score for falling big food and massive diamonds
big_food_score[11]=
10000,10000,20000,20000,30000,30000,40000,50000,60000,70000,80000;

//graphics for falling big candy canes and chest diamonds
big_food2[11]=
50,51,4,2,37,38,81,80,79,78,77;

//graphics for falling food - 16 of
food_falling[15] =
8,39,9,37,10,45,11,27,42,58,57,12,13,14,15,16;

//level numbers which have falling food
level_falling[15] =
1,5,10,15,20,25,30,35,40,45,50,85,86,92,93,94;

//abcdd0
food_match1[9]=
46,44,48,49,50,51,58,47,43,38;

//for next level fooditems
skel_food[15]  = 0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5;
hurry_food[15] = 10,11,12,13,14,15,16,17,18,19,10,11,12,13,14,15;
umb_food[15]   = 1,4,7,10,13,16,19,22,25,28,32,35,38,41,44,47;

//killing monsters with items/item effects/special bubbles
small_diamonds[5]=
81,78,80,79,77;

//Fire bubble random in 1 in then
f_bubble_rndval[11]=
2,4,8,16,32,64,128,256,512,1024,2048,4096;

//Extend random items to place on the screen background
STRUCT Extend_items[5]
   s_item_no;
   e_item_no;
END=
271,275,
276,281,
282,287,
288,290,
291,296,
297,301;

//Extra life at
STRUCT Extra_lives[3]
    first;
    second;
    thrid;
END=
20000, 80000,300000,
30000,100000,400000,
40000,200000,500000,
50000,250000,500000;

Secret_R_Done[4]; //Secret room displayed?
bosspotion[1];    //Boss potions

Joy_Text[4] =
"JOYSTICK UP", "BUTTON 1", "BUTTON 2", "BUTTON 3", "BUTTON 4";

Game_diff_Text[3]=
"Easy", "Normal", "Hard", "Very Hard";

//ITEMS Collected
STRUCT spec_Items[num_items]
    grf_id;        //graphics id
    points;        //score for item
    item_l_VHard;  //levels in the game change if you do better or worse
    item_l_Hard;
    item_l_Easy;
    item_l_Normal;
    counter;       //compare on this counter id, clear if collected
    on_col_inc_id; //on collection increase this counter id
END=                    //ITEM               REASON
95,100,35,35,35,35,0,17,  //0 magenta_sweet    - bubbles blown
94,100,35,35,35,35,0,15,  //1 blue_sweet       - empty popped
93,100,35,35,35,35,0,16,  //2 range_sweet     - jumped up
96,100,15,15,15,15,0,0,   //3 shoes            - distance run
131,200,15,15,15,15,0,24, //4 clock            - lightning bubbles popped
132,200,19,16,10,13,0,0,  //5 bomb             - fire bubbles popped
97,200,15,15,15,15,0,0,   //6 orange_umb       - water bubbles popped - 3 levels advance
98,200,20,20,20,20,0,0,   //7 red_umb          - water bubbles popped - 5 levels advance
99,200,25,25,25,25,0,0,   //8 purple_umb       - water bubbles popped - 7 levels advance
121,300,15,15,15,15,0,0,  //9 orange_potion    - wrap arounds - Potions

122,300,16,16,16,16,0,0,  //10 red_potion       - wrap arounds
123,300,17,17,17,17,0,0,  //11 green_potion     - wrap arounds
124,300,18,18,18,18,0,0,  //12 rainbow_potion   - wrap arounds
125,300,19,19,19,19,0,0,  //13 cyan_potion      - wrap arounds
136,3000,65,60,50,55,0,0, //14 flash_heart      - dead nasty fruit eaten
102,1000,3,3,3,3,0,0,     //15 cyan_ring        - blue sweets eaten
100,1000,3,3,3,3,0,0,     //16 purple_ring      - orange sweets eaten
101,1000,3,3,3,3,0,0,     //17 red_ring         - magenta sweets eaten
107,3000,13,12,10,12,0,32,//18 blue_cross       - special items eaten
108,3000,18,16,10,14,0,33,//19 yellow_cross     - food eaten
109,3000,7,6,4,5,0,0,     //20 red_cross        - monsters drowned by water bubbles water
104,2000,5,5,5,5,0,0,     //21 cyan_latern      - times P1 has joined a running game
106,2000,5,5,5,5,0,0,     //22 red_latern       - times P2 has joined a running game
103,2000,2,2,1,1,0,31,    //23 purple_latern    - umbrellas collected
105,2000,4,3,1,2,0,0,     //24 yellow_latern    - clocks collected
134,3000,16,14,10,13,0,30,//25 book             - monsters killed by fire bubble
135,3000,16,14,10,13,0,0, //26 star_tiara       - monsters killed by lightning bubble
138,5000,30,25,15,20,0,0, //27 red_necklace     - games started 2 player games count as 2
137,4000,30,25,15,20,0,0, //28 purple_necklace  - levels started
120,1000,1,1,1,1,0,0,     //29 purple_treasure  - game completed

119,1000,3,3,3,3,0,0,     //30 orange_treasure  - books collected
118,1000,3,3,3,3,0,0,     //31 red_treasure     - purple lanterns collected
117,1000,3,3,3,3,0,0,     //32 blue_treasure    - water crosses collected
116,1000,3,3,3,3,0,0,     //33 silver_treasure  - yellow crosses collected
115,500,3,3,3,3,0,0,      //34 lblue candy cane - D number of bubbles popped
114,500,3,3,3,3,0,0,      //35 yellow           - N
113,500,3,3,3,3,0,0,      //36 red              - E -green
112,500,3,3,3,3,0,0,      //37 Orange           - T
111,500,3,3,3,3,0,0,      //38 brown_cane       - X
110,500,3,3,3,3,0,0,      //39 blue_cane        - E -red

133,1000,14,13,8,10,0,0,  //40 bell             - times hurry ups has run
139,5000,1,1,1,1,0,0,     //41 crystal ball     - got a crown
140,100,1,1,1,1,0,0,      //42 crayon           - started 777 levels
143,10,20,25,30,27,0,0,   //43 skull            - skel has come +2 if he catches you
141,1000,1,1,1,1,0,0,     //44 treasure room door20 - level 20 without loosing a life
141,1000,1,1,1,1,0,0,     //45 treasure room door30 - level 30 without loosing a life
141,1000,1,1,1,1,0,0,     //46 treasure room door40 - level 40 without loosing a life
142,3000,1,1,1,1,0,0,     //47 warpto70             - level 49 - level advance

151,250,1,1,1,1,0,0,      //48 chilli        - FIR highscore table - fireball deadly
149,10, 1,1,1,1,0,0,      //49 octopus       - BOS highscore table - easy kill boss
157,1000,1,1,1,1,0,0,     //50 grey umbrella - DOC highscore table - goto any level
152,1000,1,1,1,1,0,0,     //51 glue          - PLR highscore table - trap other player
155,500 ,1,1,1,1,0,0,     //52 lager         - PED highscore table - Do Extra items
150,250 ,1,1,1,1,0,0,     //53 Pink Flamingo - S.B highscore table - cheat mode on
144,10,1,1,1,1,0,0,       //54 Lightning potion - Boss Level - ZAP highscore table
145,100,1,1,1,1,0,0,      //55 Joystick - DIB (Autofire) - appears on 2 levels
153,300,4,8,2,3,0,0,      //56 Trapped Nasties no >=3 multipop for 3 levels
146,500,1,1,1,1,0,0,      //57 Water potion  - WAT highscore table
147,500,1,1,1,1,0,0,      //58 Fire potion   - HOT highscore table
159,750,20,10,3,6,0,0,    //59 Fire bubble - killed by monster or dino fireball
158,450,15,20,5,10,0,0,   //60 Missing extend letters - no extend bubbles collected on the level
160,650,12,18,3,6,0,0,    //61 Disguise -    - KWK highscore table - invinciblity
148,850,8,10,4,6,0,0,     //62 Superman      - TEE highscore table  All powerups,invincible - other player always collects powerups
170,100,1,1,1,1,0,0;      //63 Yellow shoes  - WIZ highscore table - superfast shoes

//To check the hiscore table for cheats
STRUCT HiSc_Cheats[n_hs_cheats]
   string comptxt;
   item_num;
END=
"ALS",99,  //make it run extra levels - dont do item
"BOS",49, //Easy kill boss
"PLR",51, //trap other player in a bubble
"DOC",50, //goto any level
"S.B",53, //cheat mode
"PED",52, //extra items
"FIR",48, //fire ball deadly
"WAT",57, //Blow Water bubbles
"HOT",58, //Blow Fire bubbles
"ZAP",54, //Blow Lightning bubbles
"DIB",55, //Auto fire
"KWK",61, //Invincible
"TEE",62, //All powerups+keep when died
"WIZ",63; //ultimate shoes item

//For cheat F10 item key
spec_Items_names[num_items]=
"Magenta sweet","Blue Sweet","Yellow Sweet","Red Shoes","Clock","Bomb","Orange Umbrella","Red Umbrella","Purple Umbrella",
"Orange Potion","Red Potion","Green Potion","Rainbow Potion","Cyan Potion","Heart","Blue Ring","Puple Ring","Red Ring",
"Blue Cross","Yellow Cross","Red Cross","Cyan Latern","Red Latern","Purple Latern","Yellow Latern","Book","Star Tiara",
"Red Necklace","Purple Necklace","Purple Treasure","Orange Treasure","Red Treasure","Blue Treasure","Silver Treasure",
"Light Blue Candy Cane","Yellow Candy Cane","Red Candy Cane","Orange Candy Cane","Brown Candy Cane","Blue Candy Cane",
"Bell","Crystal Ball","Crayon","Skull","Treasure Room Level 20","Treasure Room Level 30","Treasure Room Level 40",
"Treasure Room Level 49","Chilli","Octopus","Level Umbrella","Trap Dinos","Extra Items","Cheat Mode On",
"Lightning Potion","Joystick","Trap Nasties","Water Potion","Fire Potion","Fire Bubble","Missing Extend Letters",
"Invincible","Superman","Super Shoes";

//Key presses - true or false gets set when user def keys get hit
//these are used by the dino (man)process to control the player
//also used by the autoplay routine to replay player moves
STRUCT keys_pressed[1]
    pl_left;
    pl_right;
    pl_fire;
    pl_jump;
END

//Temporary keys buffer for redefine keys screen
STRUCT userdefkeys_temp[1]
    pl_l;         //left
    pl_r;         //right
    pl_f;         //fire
    pl_j;         //jump
END;

//Default Keys used to control the players in the game
STRUCT userdefkeys[1]
    pl_l;         //left
    pl_r;         //right
    pl_f;         //fire
    pl_j;         //jump
END =
_left, _right, _alt, _control,
_a, _s, _n, _m;

//Default Keys used to control the players in the game
STRUCT Restore_userdefkeys[1]
    pl_l;         //left
    pl_r;         //right
    pl_f;         //fire
    pl_j;         //jump
END =
_left, _right, _alt, _control,
_a, _s, _n, _m;


key_dis[3] = "LEFT", "RIGHT", "JUMP", "FIRE";
key_dis_ids[7]; //To display keys pressed to screen in  the redefine keys

//For Displaying keys to screen in the redefine keys screen
keynames[]="ESC","1","2","3","4","5","6","7","8","9","0","-","+"
          ,"BACKSPACE","TAB","Q","W","E","R","T","Y","U","I","O","P","[","]","ENTER"
          ,"CTRL","A","S","D","F","G","H","J","K","L",";","'","`","L SHIFT","~"
          ,"Z","X","C","V","B","N","M",",",".","/","R SHIFT","PRINT SCRN"
          ,"ALT","SPACE","CAPS LOCK"
          ,"F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","NUM LOCK","SCR LOCK"
          ,"HOME","U CURSOR","PG UP","NUMPAD -","L CURSOR","NUMPAD 5","R CURSOR","NUMPAD +","END"
          ,"D CURSOR","PAGE DOWN","INS","DELETE","?","?","\";

//For Displaying key moves to screen for debuging player record
move_dis[6] =
"Wait",
"Left",
"Right",
"Jump",
"Fire",
"Exit";

//Auto Movement of Dinos for Demo and Extend Levels
//    mv_wait  = 0;
//    mv_left  = 1;
//    mv_right = 2;
//    mv_jump  = 3;
//    mv_fire  = 4;
//    mv_exit  = 5; //exit the auto play

//used for seeing where the autoplayers are for the instr level and extend screens
auto_loc1;
auto_loc2;

STRUCT autoplay1[100];
   arr_ind_loc;
   time_on;
   key_pressed;
   time_off;
END;

STRUCT autoplay2[100];
   arr_ind_loc;
   time_on;
   key_pressed;
   time_off;
END;


//EXTEND bubbles collected
STRUCT bubextend[1]
       collected[5];
END

//dino animation frames
STRUCT bubanim[16]
      a_start;
      a_end;
      a_del;
END =
1,2,10,    //0 start bubble
4,5,30,    //1 stop
6,9,15,    //2 walk
10,15,1,   //3 bubble
16,16,20,  //4 jumpup
17,18,20,  //5 jump down
19,19,15,  //6 push into frame
20,20,20,  //7 die and fire hurt frame
21,24,20,  //8 die
25,26,40,  //9 bub dance
78,85,10,  //10 Fireball and Invader laser Die
27,28,10,  //11 1P Button
29,30,10,  //12 Thank you
747,748,15,//13 ICoin_walkon
749,752,10,//14 ICoin_Turn
753,754,10,//15 ICoin_pointup
755,756,15;//16 ICoin_walkoff

//badspeed
//<1-9 = 1
// 10 = 2;
//
STRUCT levels[num_levels]
    hurry_time;   //hurry up time
    bubba_time;   //seconds after hurry time when skel/bubba appears
    itemx;        //items which do stuff
    itemy;
    foodx;        //food items
    foody;
    baddie_speed; //speed 1-7, 7 been bloody fast
    bubbled_time; //total time trapped in seconds
    bub_speed;    //speed of bubbles
    badnum;       //number of baddies
    water;        //bubbles allowed on the level
    fire;
    light;
END;

STRUCT baddies_instr[9]
    mtype;
    mdelay;
    mx;
    my;
    dir;
END =
1,1,120,144,1,
1,1,152,96,1,
1,1,168,96,1,
1,1,184,96,1,
3,11,32,184,2,
3,21,64,184,2,
3,41,128,184,2,
3,51,156,184,2;

STRUCT baddies[num_levels*7]
    mtype;
    mdelay;
    mx;
    my;
    dir;
END;

//Baddie animation frame locations
STRUCT baddie_anims[11]
       num_frames;
       astart;
       die;
END =
2,400,402,    //bubba/skel
4,300,312,    //zen chan
2,413,419,    //mighta
2,406,412,    //bubba
4,440,452,    //pulpul
3,453,461,    //banabou
4,427,439,    //hairy monster
4,463,475,    //superdrunk
2,420,426,    //invader
2,476,402,    //secret room ghosts
2,478,402,    //room2 ghost
2,480,402     //room3 ghost
;


//main characters bub and bob storage
STRUCT bubbob[1]
    lives;
    score;
    bubfast;      //Bubbles fast
    bublong;      //bubbles long range
    bubrapid;     //bubbles rapid
    bubtimer;     //timer till next bubble
    bubkey;       //bubble key
    bubrel;       //bubble key release
    shoes;        //run fast
    special_fireball; //fireball counter 16
    special_fbcount;  //red fire bubble level count
    special_rings;
    matchind;         //score match number 0 to 9
    scorematched;     //true false matched to aa0
    sprite_id;
    water_id;
    bubbled;       //player bubbled up T/F
    bubble_type;   //disable, normal, special bubbles = blow bubbles
    level_reached; //for the level reached screen
    autofire;      //autofire for player T/F
    invincible;    //cant be killed      T/F
    superman;      //keep all powerups when died T/F
    inf_lives;     //infinite lives on T/F
END


//to hold where bubble anims are Green, Blue
STRUCT blow_bubbles[1]
    Blow;
    Full;
END = 101,111,119,129;

//Holds the special effect bubbles for each player green,blue
STRUCT special_bubbles[1]
    water;
    fire;
    lightning;
END =
138,144,150,
141,147,153;

STRUCT jumpup[7]
    vel;
    grav;
    vel_dec;
END =
-48,10,1,
-62,10,2,
-80,10,3,
-120,20,4,
-120,10,8,  //speed 5
-120,10,8,
-140,10,10;

STRUCT jumpacross[7] //jump across 6 blocks
    vel;
    grav;
    vel_dec;
END =
-100,50,1,
-60,20,2,
-80,30,3,
-60,20,4,
-60,10,5,    //speed 5
-60,10,6,
-60,10,7;   //speed 7 max

//Table to shake the screen
shaketable[num_shk] =
-8,-8,-8,-8,
-8,-8,-8,-8,
8,8,8,8,
8,8,8,8,
-8,-8,-8,-8,
8,8,8,8,
-6,-6,-6,-6,
-6,-6,-6,-6,
6,6,6,6,
6,6,6,6,
-4,-4,-4,-4,
-4,-4,-4,-4,
4,4,4,4,
4,4,4,4,
-2,-2,-2,-2,
2,2,2,2;

//Table to do bobbling of bubbles
bobbletable[num_bob] =
1,0,0,   //x or y plane add
1,0,
1,0,
1,1,0,
1,1,1,
1,1,1,
1,1,0,
1,0,
1,0,
1,0,0,

-1,0,0,  //x or y plane subtract
-1,0,
-1,0,
-1,-1,0,
-1,-1,-1,
-1,-1,-1,
-1,-1,0,
-1,0,
-1,0,
-1,0,0;


//for circular bobbles
//y circular movement x uses above table
bobbletable2[num_bob2] =
1,1,1,
1,1,0,
1,0,
1,0,
1,0,0,

-1,0,0,
-1,0,
-1,0,
-1,-1,0,
-1,-1,-1,
-1,-1,-1,
-1,-1,0,
-1,0,
-1,0,
-1,0,0,

1,0,0,
1,0,
1,0,
1,1,0,
1,1,1
;

   txt_onscr; //text lines on the screen
   updating_text; //set to TRUE if the above is been recaculated after a deletion

STRUCT Text_on_Scr[txt_a_size]
   Text_Id; //id returned when its written to the screen
   arr_loc; //to delete until line break
   txt_x;
   txt_y;
END

//GAME TEXT
//    f_silver = 1;
//    f_gold   = 2;
//    f_green  = 3;
//    f_red    = 4;
//    f_blue   = 5;

STRUCT Txt_on_off[50]
   Lines_On;  //start position in the array below to do
   Lines_Off; //lines to delete when next text is displayed
END =
0,1,
3,0,
5,6,
9,3,
10,10,
14,10,
16,0,  //6  Press 1player button
18,17, //7  when more than 1 coin
19,0,  //8  1st bonus 2nd bonus
22,0,  //9  DIBSOFT
23,22, //10 Original code graphics by
25,23, //11 From the orignal arcade game by
26,25, //12 Dev using
27,26, //13 123 keys
30,27, //R J
32,30; //F9 F10 ESC

STRUCT Game_Text[50]
   txt_x;        //measured in blocks not pixels
   txt_y;
   txt_font;     //tatio font to display see above for logic, not the file pointer!
   txt_text;     //string of text to display
   txt_linefeed; //do a linefeed, this set to true it will do the next text in this array
END =
4,6,f_red,     "BASIC SKILL . . .", TRUE,             // 0
3,8,f_silver,  "TRAP ENERMIES INSIDE",TRUE,           // 1
3,10,f_silver, "BUBBLES.", FALSE,                     // 2

3,8,f_silver, "BURST BUBBLES WITH YOUR", TRUE,        // 3
3,10,f_silver, "HORNS OR FINS", FALSE,                // 4

4,6,f_gold,    "ADVANCED SKILL . . .", TRUE,          // 5
3,8,f_silver,  "HIGHER POINTS ARE SCORED", TRUE,      // 6
3,10,f_silver, "WHEN BURSTING SEVERAL", TRUE,         // 7
3,12,f_silver, "BUBBLES AT THE SAME TIME", FALSE,     // 8

3,8,f_silver,  "YOU CAN JUMP OVER BUBBLES",FALSE,     // 9

4,6,f_blue,    "SPECIAL ITEMS . . .", TRUE,           //10
3,8,f_silver,  "COLLECT ITEMS FOR DINO", TRUE,        //11
3,10,f_silver, "POWER-UPS/HELP OR FOR KILLING", TRUE, //12
3,12,f_silver, "ALL THE ENERMIES ON SCREEN!", FALSE,  //13

3,8,f_silver,  "ONE STAGE IS CLEARED WHEN ALL", TRUE, //14
3,10,f_silver, "ENERMIES ARE DESTROYED", FALSE,

14,5,f_silver,  "PUSH", TRUE,            //16
7,7,f_silver,  "1  PLAYER  BUTTON  ONLY", FALSE,   //17
7,7,f_silver,  "1  OR  2  PLAYER  BUTTONS", FALSE,  //18

5,11,f_silver,  "1ST  BONUS  FOR                      PTS.", TRUE,  //19
5,13,f_silver,  "2ND  BONUS  FOR                      PTS.", TRUE,
10,15,f_silver, "AND  MYSTERY  ! ? . . .", FALSE,

10,22,f_silver,  "$ DIBSOFT 2004", FALSE,            //22
5,19,f_silver,  "ORIGINAL CODE AND GRAPHICS", TRUE,  //23
11,21,f_silver, "BY PAUL DARBY", FALSE,    //24

6,19,f_silver,  "ORIGINAL ARCADE GAME BY", FALSE,//25
9,19,f_silver,  "DEVELOPED USING", FALSE,       //26

8,19,f_silver,  "1 .... 1 PLAYER  START", TRUE, //27
8,21,f_silver,  "2 .... 2 PLAYER  START", TRUE, //28
8,23,f_silver,  "3 .... ENTER  COIN", FALSE,     //29

8,19,f_silver,  "R .... REDEFINE  KEYS", TRUE,    //30
8,21,f_silver,  "F5 .... JOYSTICK  SELECT", FALSE, //31

6,19,f_silver,  "K      .... VIEW  GAME  KEYS", TRUE, //32
6,21,f_silver,  "F10 .... OPTIONS  SCREEN", TRUE,   //33
6,23,f_silver,  "Q      .... QUIT  GAME/PROGRAM", FALSE //34
;


// FROM THE ARCADES
// A TRIBUTE TO THE TAITO CLASSIC
sc_txt_num; //used to call the scroller with how many lines are on screen

STRUCT Scroll_info[30]
    txt_id;
    txt_x;
    txt_y;
END

STRUCT Scroll_Txt[30]
    txt_x;
    txt_fnt;
    txt_text;
    txt_line_feed;
END =
9, f_red, "CONGRATULATIONS  !", TRUE,
1,  l_feed, " ", TRUE,
5, f_gold,"NOW YOU HAVE FOUND THE MOST", TRUE,
4, f_gold,"IMPORTANT MAGIC IN THE WORLD.", TRUE,
2,  l_feed, " ", TRUE,
5, f_silver,"IT'S", FALSE,
9, f_red,"LOVE", FALSE,
14, f_silver,"AND", FALSE,
18, f_red,"FRIENDSHIP", TRUE,
2,  l_feed, " ", TRUE,
6, f_silver, "WELL DONE ON COMPLETING", TRUE,
10, f_red,    " BUBBLE BOBBLE", TRUE,
2,  l_feed, " ", TRUE,
3, f_gold,"ENTER INTO THE HIGH SCORE TABLE", TRUE,
3, f_blue,"S . B", FALSE,
7, f_silver,"TO ACCESS THE CHEAT MODE !", TRUE,
//1,  l_feed, " ", TRUE,
4, f_silver,"THEN GOTO THE OPTIONS SCREEN", TRUE,
5, f_silver,"TO ACCESS THE CHEAT SCREEN", TRUE,
1,  l_feed, " ", TRUE,
0, f_green,"FOR THE OTHER CODES, ENTER THE SECRET",TRUE,
4, f_green,"ROOMS AND DECODE THE WRITING",TRUE,
1,  l_feed, " ", TRUE,
2, f_red,"PLAY AGAINST A FRIEND FOR MORE FUN !",TRUE,
3,  l_feed, " ", TRUE,
4, f_gold,"WRITTEN BY PAUL DARBY IN 2004", TRUE,
3,  t_end, " ", TRUE
;



//Max level reached today - Updated when level screen called
    lev_today; //max level reached today

//Hicore Chars, Player can select any of these
    STRING hisc_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ.!?%@<>";

    hi_chars[50]; //This gets the char numbers
    hi_many;   //end of array of chars the user can cycle through
    txt_rub;   //chr number to rub characters out
    txt_end;   //end char - user cant enter any more
    Hi1_enter; //Player 1 has got a High score
    Hi2_enter; //Player 2 has got a High Score

    hs_placings [4] = "5TH", "4TH", "3RD", "2ND", "1ST";

//Next screen the current title screen will loop to
Titles_Nextscreen[]=
//Main titles loop
   t_next,        //t_start_prog 0
   t_next,        //t_title_main 1
   t_next,        //Insert Coin  2
   t_next,        //t_demo_instr 3
   t_next,        //t_demo_level 4
   t_next,        //t_hiscre_dis 5
   t_title_main,  //t_lev_reachd 6

   t_title_main,   //t_options    7
   t_options,      //t_cheat
   t_title_main,   //t_redefine_k
   t_title_main,   //t_joysick
   t_title_main,   //t_ingame_keys
   t_hiscre_ent,   //t_start_game
   t_lev_reachd2,  //t_hiscre_ent
   t_game_over,    //t_lev_reachd
   t_title_main,   //t_game_over
   t_title_main;   //Exit program

   cur_tscreen; //current title screen
   tscreen_adv; //When set to true it advances to the next title screen

   tscreen_done_anim;       //anims to finish before moving on
   tscreen_done_anim_count; //anims finished count

//These are loaded when game runs and saved when game exits
//Hiscore table
//level reached - pl1 pl2
//Hiscore

STRUCT hs_table [hisc_items]
    STRING h_name;
    h_score;
    h_level;
END =
    "PED", 10000, 1,
    "S.B", 20000, 2,
    "ALS", 30000, 3,
    "N.M", 40000, 4,
    "DIB", 50000, 5;

    level_max[1]; //maximum level reached today - gets saved with the hiscore table
    Hi_score;     //high score value

//Used to reset the above
STRUCT Def_hs_table [hisc_items]
    STRING h_name;
    h_score;
    h_level;
END =
    "PED", 10000, 1,
    "S.B", 20000, 2,
    "ALS", 30000, 3,
    "N.M", 40000, 4,
    "DIB", 50000, 5;

STRUCT buttons[50] //[but_scr]
  x_loc;
  y_loc;
  b_event; //event to do when the button is pressed
  b_graph; //grahic for the button
  b_type;  //type - click once, toggle, group
  b_group;
  key_p;
END =
90,92, but_Backgrounds, bg_blank, bt_click_once, 0 , _b,            //Backgrounds
74,94+b_bl_size, but_Frame_Dn, bg_l_arrow, bt_click_hold, 0 , _f,   //Frame Rate
90,94+b_bl_size, but_Frame_Up, bg_r_arrow, bt_click_hold, 0 , _g,
74,96+2*b_bl_size, but_Skip_Dn, bg_l_arrow, bt_click_hold, 0 , _s,             //Frame Skip
90,96+2*b_bl_size, but_Skip_Up, bg_r_arrow, bt_click_hold, 0 , _d,
90,98+3*b_bl_size, but_levels, bg_blank, bt_click_once, 0 , _l,       //Levels to do
90,104+6*b_bl_size, but_Diff_set, bg_blank, bt_click_once, 0 , 0,    //Difficulty
90,106+7*b_bl_size, but_Extra_Lives, bg_blank, bt_click_once, 0 , 0, //Lives at
74, 108+8*b_bl_size, but_lives_Dn, bg_l_arrow, bt_click_hold, 0 , 0,           //start lives
90,108+8*b_bl_size, but_lives_Up, bg_r_arrow, bt_click_hold, 0 , 0,
90,114+11*b_bl_size, but_Rest_Hi, bg_blank, bt_click_once, 0 , 0,    //Reset Hiscore table
90,116+12*b_bl_size, but_clr_items, bg_blank, bt_click_once, 0 , 0,  //Clear Item counters
90,118+13*b_bl_size, but_reset_keys, bg_blank, bt_click_once, 0 , 0, //Reset Player Keys
90,120+14*b_bl_size, but_reset_all, bg_blank, bt_click_once, 0 , 0,    //Reset To Defaults
90,122+15*b_bl_size, but_cheat_reset, bg_blank, bt_click_once, 0 , 0,  //Reset cheats
90,124+16*b_bl_size, but_cheat_screen, bg_blank, bt_click_once, 0 , 0, //cheat screen
74, 100+4*b_bl_size, but_level_dn, bg_l_arrow, bt_click_hold, 0 , 0,   //start level
90,100+4*b_bl_size, but_level_up, bg_r_arrow, bt_click_hold, 0 , 0,
74, 110+9*b_bl_size, but_Credits_Dn, bg_l_arrow, bt_click_hold, 0 , 0, //credits
90 ,110+9*b_bl_size, but_Credits_up, bg_r_arrow, bt_click_hold, 0 , 0,

//cheat screen
56,93, but_invince_P1, bg_P1, bt_click_once, 0 , 0,           //inv
80,93, but_invince_P2, bg_P2, bt_click_once, 0 , 0,
56,93+18, but_lives_P1, bg_P1, bt_click_once, 0 , 0,          //lives
80,93+18, but_lives_P2, bg_P2, bt_click_once, 0 , 0,
56,93+(18*2), but_autofire_P1, bg_P1, bt_click_once, 0 , 0,   //autofire
80,93+(18*2), but_autofire_P2, bg_P2, bt_click_once, 0 , 0,
56,93+(18*3), but_power_P1, bg_P1, bt_click_once, 0 , 0,      //keep power ups
80,93+(18*3), but_power_P2, bg_P2, bt_click_once, 0 , 0,
88,93+(18*4), but_alwaysSR, bg_blank, bt_click_once, 0 , 0,   //SR
88,93+(18*5), but_itemkey, bg_blank, bt_click_once, 0 , 0,    //item key
88,93+(18*6), but_extraitems, bg_blank, bt_click_once, 0 , 0, //extra items
88,93+(18*7), but_level_umb, bg_blank, bt_click_once, 0 , 0,  //grey umb
74,93+(18*8), but_potion_Dn, bg_l_arrow, bt_click_hold, 0 , 0,//potion timer
90,93+(18*8), but_potion_up, bg_r_arrow, bt_click_hold, 0 , 0,

74,93+(18*9), but_maxbub_Dn, bg_l_arrow, bt_click_hold, 0 , 0,//bubbles on screen
90,93+(18*9), but_maxbub_up, bg_r_arrow, bt_click_hold, 0 , 0,

74,93+(18*10), but_boss_Dn, bg_l_arrow, bt_click_hold, 0 , 0,//boss time
90,93+(18*10), but_boss_up, bg_r_arrow, bt_click_hold, 0 , 0,
88,93+(18*11), but_fireBub, bg_blank, bt_click_once, 0 , 0,  //firebubble
88,93+(18*12), but_Trap_Dino, bg_blank, bt_click_once, 0 , 0,  //trap other player
;

button_gfx[4]= //[num_buttons] =
215,  //blank
218,  //left arrow
221,  //right arrow
224,  //P1
227   //P2
;


//option screen text updates
Opt_scr_update[50];


LOCAL        //all these are used by the main and processes running into them
    xpos;
    ypos;
    xmov;     //mov x local variable
    ymov;
    xstop;    //stop x move
    ystop;    //stop y move
    yumov;    //up - not used for main sprites just for bubbles
    ydmov;    //block below man
    fall;     //dino baddie falling?
    jump;     //dino baddie jumping?
    jmov;     //jump left right automove switch
    facing;   //which way sprite is facing
    kill;     //to kill bubbles/man/nasties
    inv;      //player invunrable
    lastmov;  //bubbles last movement

    xinertia; //to push bubbles or the players around
    yinertia;
    bobble;   //for bobbling bubble around when movement has stopped
    who;      //whos pushing me
    platabove;//platform above baddie
    nonebelow;//baddie reached edge of a platform
    badnum;   //for different baddies/bubbles sub programs(missle) behave differently
              //also for Trap Bubbles
    man_speed;//movement speed for dino and baddies
    angry;    //used to make one baddie angry 'Baddie what' does all of them

    multi;    //used by the trap bubbles for pop fruit types 1-7
    multiplr; //plr number
    popid;    //dino who popped this bubble
    ani_finish;  //for anim2 process increases father local of this var

    //For Option/cheat screen buttons
    b_clicked;
    b_selected;

PRIVATE
   the_id;
BEGIN
   Set_Mode (m640x480);              //Screen Res
   frm_rate = 60;
   frm_skip = 0;
//Load Graphics
   blocksfile = Load_fpg(blocksfloc); //blocks graphics + screen area
   platdata   = Load_fpg(platfloc);   //platform graphics data
   sprites    = Load_fpg(sprfloc);    //sprite data
   fooditems  = Load_fpg(sprfloc2);   //Items food graphics
   titlesfile = Load_fpg(sprfloc3);   //Title screen graphics

//Load Bubble Bobble Pallette
   Load_Pal (palfloc);

   Load_Sounds(); //load all the Wavs and Songs

//load fonts
   font_s     = Load_fnt(silverfnt);  //silver font load
   font_r     = Load_fnt(redfnt);     //red font load
   font_b     = Load_fnt(bluefnt);    //blue font load
   font_g     = Load_fnt(goldfnt);    //gold font load
   font_gr    = Load_fnt(grnfnt);     //green font
   font_n     = Load_fnt(numfnt);     //numbers for level
   font_pg    = Load_fnt(G_potfnt);   //potion totals fonts
   font_pb    = Load_fnt(B_potfnt);
   font_lev   = Load_fnt(levfnt);     //level reached font
   font_ed    = Load_fnt(editfnt);      //Editor font - Options Screen

   Setupchars(); //High score chars setup
//Load game data
   Load (game_h, OFFSET hs_table);   //Load HiScore Table, Level Reached, Level Max
   Load (game_c, OFFSET spec_Items); //Load Game Counters
//   load (game_k, OFFSET userdefkeys);//Load Game Keys

   Start_coins = 20;            //Coins available to play 1 continous game
   Start_lives = 3;             //Lives player starts with
   life_set = 0;                //lives awarded difficulty
   game_diff_value = game_norm; //game difficulty initial value
   Game_difficulty();           //set game difficulty

//DISPLAY BACKGROUNDS
   do_bgrounds = TRUE;          //graphics behind the screen on scroll plane 2
   do_levels = lev_normal;      //levels normal

   IF (key(_r) == FALSE) //Game reset on execute in case someone has screwed up the settings totally
       //Game Settings load
       Load (game_s, OFFSET frm_rate);
   END

   Set_FPS(frm_rate, frm_skip); //Frames per second


//Do Pallette swapping buffer setup
//when the pallette is swapped will clear the screen using this colour
   FOR (count = 0; count <= 255; count++)
        pal[count] = count;
   END
//Used to clear the screen
   pal[255] = 0; //set colour 255 as the blank clear screen colour

   Coins_Avial = Start_coins;   //Coins Available to play in one game

   bubbob[0].level_reached = 1; //default value for the level reached screen
   bubbob[1].level_reached = 1; //else it has level 0

   max_bubs = 16;               //Max Bubbles on screen
   potion_time = pot_def_time;  //potion level time default 30 seconds
   start_level = 1;             //level the game starts at
//   do_levels = lev_extend;      //levels extended

   int_FB_val = 10;             //Fire bubble value
   boss_set_health = boss_init_health;  //100 hits to kill boss
   Next_Rnd_Time = time_rnd_bub;        //2.7 secs for next random bubble

//Random Fire bubble, Random 1 in then ->
   fire_bubble_rnd = f_bubble_rndval[int_FB_val]; //2,4,8,16,32,64,128,256,512,1024,2048,4096;

//DELETE THESE
//    extra_items = TRUE;
    cheat_mode = TRUE;

   do_music = TRUE;             //do music on game
//   do_song = song1;
   default_song = song2;

   Sound_process(); //processes the sound triggers playing songs or wavs also stopping them

//Timer start
   Timer_process(); // for animations and bubble anims
   Do_keys();

//**LOAD LEVELS**
   Load_levels();
   Test_Info();   //Test debug counters

//   cur_tscreen = t_start_game;
//   Main_Logic();

   tscreen_adv = TRUE;

   LOOP

    IF (tscreen_adv == TRUE)
        IF (Titles_Nextscreen[cur_tscreen] == t_next)
            cur_tscreen++; //main screens loop
        ELSE
            cur_tscreen = Titles_Nextscreen[cur_tscreen]; //jump/go back to previous screen
        END
       Main_Logic(); //Goto next screen in the game
    END
      FRAME;
   END
   //Quit Program done in quit program fuction
   //let_me_alone();

   //exit("Game finished",0);
END



//Can Select any item to appear
PROCESS Cheat_Key_F10()
PRIVATE
   select_ids[3];
   time_3;
   time_4;
   d_time;
   item_ind; //display level
   c_loop;
BEGIN

   select_ids[0] = write(font_ed,ret_xtext(10),ret_ytext(5),3,"Select Item:");
   select_ids[1] = write(font_ed,ret_xtext(10),ret_ytext(6),3,"Cursor LR, Space To Finish");
   select_ids[2] = write_int(font_ed,ret_xtext(15)-8,ret_ytext(5),3, &item_ind);
   select_ids[3] = write(font_ed,ret_xtext(16),ret_ytext(5),3, spec_Items_names[item_ind]);

   //Store timers for level/game and bubble delays
   time_3 = timer[3];
   time_4 = timer[4];

//Level events to sleep
   Signal (type Level_Events, s_sleep);
   Signal (type Food, s_freeze);
   Signal (type Item, s_freeze);

//stop all the sprites
   level_stop_what = stop_everything;
//Wait until space is pressed
   LOOP
   d_time++;
     IF (d_time > 5)
         d_time = 0;
        //decrease level
        IF (key(_left) == TRUE AND item_ind > 0)
           item_ind--;
           Delete_text(select_ids[2]);
           Delete_text(select_ids[3]);
           select_ids[2] = write_int(font_ed,ret_xtext(15)-8,ret_ytext(5),3, &item_ind);
           select_ids[3] = write(font_ed,ret_xtext(16),ret_ytext(5),3, spec_Items_names[item_ind]);
        END

        //increase level
        IF (key(_right) == TRUE AND item_ind <= num_items)
           item_ind++;
           Delete_text(select_ids[2]);
           Delete_text(select_ids[3]);
           select_ids[2] = write_int(font_ed,ret_xtext(15)-8,ret_ytext(5),3, &item_ind);
           select_ids[3] = write(font_ed,ret_xtext(16),ret_ytext(5),3, spec_Items_names[item_ind]);
        END
    END
        //pressed fire so now quit loop and goto the level selected by the player
        IF (key(_space) == TRUE)
            BREAK;
        END

      FRAME;

   END

   FOR (c_loop = 0; c_loop <= 3; c_loop++)
      Delete_text(select_ids[c_loop]);
   END

//restore timers
   timer[3] = time_3;
   timer[4] = time_4;
//wake up level events
   Signal (type Level_Events, s_wakeup);
   Signal (type Food, s_wakeup);
   Signal (type Item, s_wakeup);

   Item (ret_adjustedx2(levels[act_level-1].itemx), ret_adjustedy2(levels[act_level-1].itemy), item_ind);

//start moving all the sprites again
   level_stop_what = stop_nothing;

END


PROCESS Pause_Game()
PRIVATE
   pause_id;
   time_3;
   time_4;
   d_time;
   show;
BEGIN


   IF (get_id (type Pause_game)) RETURN; END

   //Text to screen GAME PAUSED
   pause_id = write(font_s,ret_xtext(16),ret_ytext(13),4,"GAME PAUSED");

   //Store timers for level/game and bubble delays
   time_3 = timer[3];
   time_4 = timer[4];

//Level events to sleep
   Signal (type Level_Events, s_sleep);
   Signal (type Food, s_freeze);
   Signal (type Item, s_freeze);

//stop all the sprites
   level_stop_what = stop_everything;
//Wait until space is pressed
   LOOP
      d_time++;
      IF (d_time >10)
         show++;
         d_time = 0;
         IF (show >1) show = 0; END

         SWITCH(show)
            CASE 0:
                pause_id = write(font_r,ret_xtext(16),ret_ytext(13),4,"GAME PAUSED");
            END
            CASE 1:
                pause_id = write(font_g,ret_xtext(16),ret_ytext(13),4,"GAME PAUSED");
            END
         END

      END

      IF (key(_space)) BREAK; END
      FRAME;
   END

   Delete_text(pause_id);
//restore timers
   timer[3] = time_3;
   timer[4] = time_4;
//wake up level events
   Signal (type Level_Events, s_wakeup);
   Signal (type Food, s_wakeup);
   Signal (type Item, s_wakeup);
//start moving all the sprites again
   level_stop_what = stop_nothing;

END


//Dino enter coin dino board
//Will do press 1P 2P if coins have been entered
PROCESS Enter_Coin_Dino()
PRIVATE
    an_delay;
    st_frm; //Start Frame - to loop anim
    maxfrm; //Max Frame
    gfxnum; //current graphic to Display
    g_ind; //current grpahic compares with below to see if it needs changing
    n_ind; //new graphic index
    gfxadd;  //this gets the add to locate the dino blue graphics
    dino_id; //used to find current player on the screen
    alive;   // 0 none, 1=player1 2= player2

    a_m_count;
    a_m_change;

    Credits_last;

BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;

    x = x_p2_board;
    y = y_board;
//    z = zpri;

    n_ind = 13; //New anim index

    //Find Which Dino is not alive
    dino_id = get_id (type Man);
    alive = Ret_dino_player(dino_id);

    IF (alive == 0 OR players_on_screen == 2 OR next_insert > cur_level ) RETURN; END // Error check incase players are all dead

    next_insert = cur_level + 4; //only do animation every 4 levels

    xmov = 2; //Green dino - blue alive only

    //Need to do the other players dino anim
    //Green Alive
    //BLUE
    IF (alive == 1) //player 2 is not alive so do his enter coin anim, add to graphics to get his animation
        gfxadd = b_offset_board; //blue offset to walkon with board anim
        x = x_p1_board;
        xmov = -2;
    END

    IF (Credits > 0)
        IF (alive == 1) //player 2 is not alive so do his enter coin anim, add to graphics to get his animation
           x = 442;
        ELSE
           x = 190;
        END
    END

  REPEAT

    IF (Credits_last <> Credits AND g_ind >= 12)
        Credits_last = Credits;
        n_ind = 11;
        x = 190;
        IF (alive == 1) //player 2 is not alive so do his enter coin anim, add to graphics to get his animation
            x = 442;
            gfxadd = b_offset+1; //change to normal graphic offset
        END

        a_m_count =0;
    END

    an_delay++;

    IF (g_ind <> n_ind) //current anim grap index is diff to new grap index
         g_ind = n_ind;
         st_frm = bubanim[g_ind].a_start + gfxadd; //new start anim frame
         maxfrm = bubanim[g_ind].a_end + gfxadd;   //to this anim frame
         gfxnum = st_frm; //load graphic counter
         an_delay = 99;   //force reload animation
    END

    IF (an_delay >= bubanim[g_ind].a_del) //Check to see if the frame needs changing
        an_delay = 0;
        gfxnum++;
        IF (gfxnum > bubanim[g_ind].a_end + gfxadd)
            gfxnum = bubanim[g_ind].a_start + gfxadd;
        END
    END

    GRAPH = gfxnum;

    a_m_count++;

    SWITCH (g_ind)
        CASE 11:
           IF (a_m_count > 200) //Press 1P 2P Button
              kill = TRUE;
           END
        IF (players_on_screen != 1)
           n_ind = 12;
           a_m_count = 0;
        END
        END
        CASE 12:              //Thank You
           IF (a_m_count >150)
              kill = TRUE;
           END
        END

        CASE 13: //Walk on
            IF (a_m_count < 90)
            x += xmov;
            ELSE
            xmov = NEG xmov;
            n_ind = 14;
            a_m_count =0;
            END
        END
        CASE 14: //Turn Board
           IF (a_m_count >25)
               n_ind = 15;
               a_m_count = 0;
           END
        END
        CASE 15: //Point up

           IF (a_m_count >200)
              n_ind = 16;
              a_m_count = 0;
           END

        END

        CASE 16: //Walk off
            IF (a_m_count < 90)
                x += xmov;
            ELSE
               kill = TRUE; //Off screen so kill
            END
        END

    END //Switch

    FRAME;

  UNTIL (kill == TRUE OR level_next != 0 OR game_state == gs_adv_level)
END



//Resets the HiScore Table, level Reached and Hiscore
PROCESS Reset_Hiscore()
PRIVATE
    l_count;
BEGIN
    //Reset all the values to the default hiscore table
    FOR (l_count = 0; l_count < 5; l_count++)
        hs_table[l_count].h_name = Def_hs_table[l_count].h_name;
        hs_table[l_count].h_score = Def_hs_table[l_count].h_score;
        hs_table[l_count].h_level = Def_hs_table[l_count].h_level;
    END

    Hi_score = 50000; //Display Hiscore will be updated in level_events process

    level_max[0] = 1;
    level_max[1] = 1;
END


//Reset the game counters for special items
PROCESS Reset_Counters()
PRIVATE
    l_count;
BEGIN
    FOR (l_count = 0; l_count <= num_items; l_count++)
        spec_Items[l_count].counter = 0;
    END
END

//Saves the Hiscore table, level reached and game counters
PROCESS Save_Hiscore()
BEGIN
   Save (game_h, OFFSET hs_table, SIZEOF(hs_table) + SIZEOF (level_max) + 1); //Save Hiscore Table, Level max, Hiscore
   Save (game_c, OFFSET spec_Items, SIZEOF(spec_Items));
END

//Does the keys for the game
PROCESS Do_keys()
PRIVATE
     plr;
     last_m;   //last music selection if different change the music
     joyJF[4]; //for Joysticks Jump and Fire
BEGIN
   timer[0] = 0; //For delaying key reads

//userdefkeys - array of user defined keys
//keypressed - array used to control the dinos
   LOOP
    FOR (plr = 0; plr <= 1; plr ++)
      //USE Keys
      IF (player_keys_joy[plr] == Use_Keys)

        //Left
        IF (key (userdefkeys[plr].pl_l))
            keys_pressed[plr].pl_left = TRUE;
        ELSE
            keys_pressed[plr].pl_left = FALSE;
        END

        //Right
        IF (key (userdefkeys[plr].pl_r))
            keys_pressed[plr].pl_right = TRUE;
        ELSE
            keys_pressed[plr].pl_right = FALSE;
        END

        //Jump
        IF (key (userdefkeys[plr].pl_j))
            keys_pressed[plr].pl_jump = TRUE;
        ELSE
            keys_pressed[plr].pl_jump = FALSE;
        END

        //Fire
        IF (bubbob[plr].autofire == FALSE)

            IF (key (userdefkeys[plr].pl_f))
                keys_pressed[plr].pl_fire = TRUE;
            ELSE
                keys_pressed[plr].pl_fire = FALSE;
                bubbob[plr].bubrel = TRUE;
            END

            IF (bubbob[plr].bubrel == TRUE AND keys_pressed[plr].pl_fire == TRUE)
                bubbob[plr].bubkey = TRUE;
                bubbob[plr].bubrel = FALSE;
            END
         ELSE  //Do Autofire
            IF (key (userdefkeys[plr].pl_f))
                keys_pressed[plr].pl_fire = TRUE;
                bubbob[plr].bubkey = TRUE;
            ELSE
                keys_pressed[plr].pl_fire = FALSE;
                bubbob[plr].bubrel = TRUE;
                bubbob[plr].bubkey = FALSE;
            END
         END

      ELSE //Use Joystick
        IF (level_type != lv_joystick)

        //Left
        IF (joy.left)
            keys_pressed[plr].pl_left = TRUE;
        ELSE
            keys_pressed[plr].pl_left = FALSE;
        END

        //Right
        IF (joy.right)
            keys_pressed[plr].pl_right = TRUE;
        ELSE
            keys_pressed[plr].pl_right = FALSE;
        END

        joyJF[0] = joy.up;
        joyJF[1] = joy.button1;
        joyJF[2] = joy.button2;
        joyJF[3] = joy.button3;
        joyJF[4] = joy.button4;

//        player_joy_jump[plr]; //Joy Up 0 or button 1-4
//        player_joy_fire[plr]; //1-4

        //Jump
        IF (joyJF[player_joy_jump[plr]])  //joystick up but 1-4 then which joystick up but1-4
            keys_pressed[plr].pl_jump = TRUE;
        ELSE
            keys_pressed[plr].pl_jump = FALSE;
        END

        //Fire
        IF (bubbob[plr].autofire == FALSE)
            IF (joyJF[player_joy_fire[plr]])
                keys_pressed[plr].pl_fire = TRUE;
            ELSE
                keys_pressed[plr].pl_fire = FALSE;
                bubbob[plr].bubrel = TRUE;
            END

            IF (bubbob[plr].bubrel == TRUE AND keys_pressed[plr].pl_fire == TRUE)
                bubbob[plr].bubkey = TRUE;
                bubbob[plr].bubrel = FALSE;
            END
         ELSE  //Auto fire
            IF (joyJF[player_joy_fire[plr]])
                keys_pressed[plr].pl_fire = TRUE;
                bubbob[plr].bubkey = TRUE;
            ELSE
                keys_pressed[plr].pl_fire = FALSE;
                bubbob[plr].bubrel = TRUE;
                bubbob[plr].bubkey = FALSE;
            END

         END
        END
      END

    END //Player Keys Loop

  IF (timer[0] > 30)            //For delaying key reads
      timer [0] = 0;

    IF (key(_3))
       IF (Coins_Avial > 0)
       s_trigger[e_coin] = TRUE; //trigger coin sound

       Coins_Avial--;
       Credits++;
       END
    END

    IF (level_type == lv_title)
        IF (key(_1) AND Credits > 0 AND player_st1 == FALSE)
            Credits --; //Use Up a coin
            player_st1 = TRUE;
        END
        IF (key(_2) AND Credits > 0 AND player_st2 == FALSE)
            Credits --; //Use Up a coin
            player_st2 = TRUE;
        END

        //Start the game
        IF (player_st1 == TRUE OR player_st2 == TRUE)
            cur_tscreen = t_start_game;
            Main_logic();
        END

        IF (cur_tscreen == t_title_main)
            IF (key(_q))   //Quit Program
                cur_tscreen = t_exit_prog;
                Main_logic();
            END

            IF (key(_r)) //Redefine Keys
                cur_tscreen = t_redefine_k;
                Main_logic();
            END

            IF (key(_F5)) //Joystick
                cur_tscreen = t_joystick;
                Main_logic();
            END

            IF (key(_F10)) //
                cur_tscreen = t_options;
                Main_logic();
            END

            IF (key(_k)) //View ingame keys
                cur_tscreen = t_game_keys;
                Main_logic();
            END

        END
    END

IF (level_type == lv_normal OR level_type ==lv_boss AND game_state == gs_level_go)
//Player join running game
    IF (key(_1) AND bubbob[0].sprite_id == 0 AND Credits > 0)
        Credits --; //Use Up a coin
        Player_join_game(0);
    END

    IF (key(_2) AND bubbob[1].sprite_id == 0 AND Credits > 0)
        Credits --; //Use Up a coin
        Player_join_game(1);
    END

    IF (key (_5))
        bubble_trans = NOT bubble_trans;
    END

    IF (key(_F8))
       Pause_Game();
    END

    //Get item cheat
    IF (key(_F10) AND item_key == TRUE)
       Cheat_Key_F10();
    END

END

//Music
   IF (key (_f1))
      IF (do_music == TRUE)
           do_music = FALSE;
           Music_stop();
      ELSE
           do_music = TRUE;
           Music_start();
      END
   END

   //Song On/Off
   IF (key (_f2))

      IF (do_music == TRUE)
          Music_stop();
      END
      do_music = FALSE;

      IF (do_song != 0)
         Stop_song();
         do_song = 0;
      ELSE
         do_song = default_song;
         Song_start();
      END
   END//F2


   //song select
   IF(key(_f3))
      IF (do_music == TRUE)
           Music_stop();
      END

      do_music = FALSE;

      IF (is_playing_song() == Yes)
        Stop_song();
      END
         IF(do_song == song1)  //swap to other song module
            do_song = song2;
            default_song = song2; //for when user stops it then selects play song
         ELSE
            do_song = song1;
            default_song = song1; //for when user stops it then selects play song
         END

        //play the song
        id_song = song_ids[do_song-1];
        Song (song_ids[do_song-1]);
      //END

   END //f3

END //timer delay

   FRAME;
   END //do keys loop



END  //Do Keys

PROCESS Load_Sounds()
PRIVATE
    scount;
BEGIN

    //load all the sound effects into memory
    FOR (scount = 0; scount < n_effects+1; scount++)
        sound_ids[scount] = load_wav(effect_files[scount],effects[scount]);
    END

    //load the sound effects into memory
    FOR (scount = n_effects+1; scount < n_sounds; scount++)
        sound_ids[scount] = load_wav(effect_files[scount],0); //load with no loop on sound effects
    END

//load songs
    song_ids[0] = load_song(song_files[0],1);
    song_ids[1] = load_song(song_files[1],1);

//start song if selected
    IF (do_song != 0)
        id_song = song_ids[do_song-1];
        song (song_ids[do_song-1]);
    END

END

PROCESS Song_Stop()
BEGIN
    do_song = 0;
    IF (is_playing_song() == Yes)
        stop_song();
    END
END

PROCESS Music_Stop()
PRIVATE
   e_chan;
BEGIN
   do_music = FALSE;

   e_chan = using_channel[pri_1];
   IF (is_playing_sound (e_chan) == Yes AND e_chan !=0)
       stop_sound (e_chan);
   END
END

PROCESS Song_Start()
BEGIN
     IF (is_playing_song() == No)
          song (id_song);
     END
END

PROCESS Music_Start()
PRIVATE
      w_effect;
BEGIN
      do_music = TRUE;

      s_trigger[e_normal] = FALSE;
      s_trigger[e_fast]   = FALSE;

      SWITCH (level_type)
         CASE lv_secret:
            s_trigger[e_sroom] = TRUE;
         END
         CASE lv_potion:
         END

         CASE lv_extend:
             s_trigger[e_extend2] = TRUE;
         END
         CASE lv_boss:
             s_trigger[e_boss] = TRUE;
         END

         DEFAULT: //normal, clock, heart
            IF (get_id(type clock))
               s_trigger[e_clock] = TRUE;
               RETURN;
            END

            IF (get_id(type heart))
               s_trigger[e_heart] = TRUE;
               RETURN;
            END

            IF (level_timer > act_hurry)
               s_trigger[e_fast] = TRUE;
            ELSE
               s_trigger[e_normal] = TRUE;
            END

         END
      END

      //doing_effect[0] = 0;
END


PROCESS Sound_process();
PRIVATE
    scount;
    num_taken;
    num_left;
    effect_id;
    eff_channel;
    search_pri;  //search though array real priority
    cur_pri;     //current loop priority
    cur_eff;     //current effect the chan/pri is playing
    lcount;
    song_pos; //for restarting the music
    m_off_do_sound; //do the sound even if music is off
BEGIN

  LOOP
   stop_sounds = stop_none;

//check how many sound channels are been used currently
//this is to stop the music from stopping when div runs out of channels
//eg multipop of all bubbles on the screen will do this
    num_left = 16;
    FOR (scount = 16; scount < 31; scount++)
        IF (is_playing_sound(scount)== Yes)
            num_left--;
        END
    END

    scount = 0;  //initialise search counter for new music effect
    search_pri = effects[scount].priority;
    cur_pri = 1;


  REPEAT //all priority channels loop 1-3

    cur_eff = doing_effect[search_pri]; //get current effect number
    effect_id = effects[cur_eff].onstop_effect;
    eff_channel = using_channel[search_pri]; //get effect id playing

    // Check for stop effect trigger - Trigger new Sound if this one is set to stop
    IF (effects[cur_eff].stop_effect == TRUE)
        s_trigger[effect_id] = TRUE;           //Trigger new sound
        effects[cur_eff].stop_effect = FALSE;

        IF (is_playing_sound (eff_channel) == Yes AND eff_channel !=0) //Stop the sound playing
            stop_sound (eff_channel);
        END
    END

    //Check sound is not playing
    //then do new sound now it has stopped
    IF (eff_channel != 0 AND is_playing_sound (eff_channel) == No AND effect_id != e_none)

        m_off_do_sound = effects[effect_id].music_off;//do_new sound when music is off

        //SONG
        IF (do_song != 0)
              s_trigger[effect_id] = TRUE; //trigger all new effects

              IF (effect_id <= e_fast)
                 IF (is_playing_song() == No)
                      song (id_song);
                      set_song_pos(song_pos);
                 END
                 doing_effect[search_pri] = effect_id;
                 s_trigger = FALSE; //Clear as will play normal music
              ELSE
              //e_skel, e_hurry, e_extend, e_extend2, e_potion, e_sroom:
                s_trigger[effect_id] = TRUE; //trigger all new effects

                IF (stop_sounds >= stop_music) //stop music, stop all
                    IF (is_playing_song() == Yes)
                        song_pos = get_song_pos(); //for restarting the music
                        stop_song();
                    END
                END
              END
        ELSE
            IF (do_music == TRUE) //doing music?
                s_trigger[effect_id] = TRUE; //trigger all new effects
            ELSE
                IF (m_off_do_sound == Yes) //Ok to do the effect
                    s_trigger[effect_id] = TRUE; //Trigger new effect
                ELSE
                    s_trigger[effect_id] = FALSE; //Clear Trigger effect - norm, fast, secret, potion etc
                END
            END
        END
    END //Sound not playing trigger new one on finished


//    search_pri = effects[scount].priority;
    REPEAT //One channel loop
        search_pri = effects[scount].priority;

        //Check Sound Trigger for new musical effect or music
        IF (s_trigger[scount] == TRUE)
            //Check music on, or music false and music_off overide set for this sound
//SONG
          IF (do_song != 0)
            //effects[scount].do_song_eff == Yes)
            //Stop music/effects
            doing_effect[search_pri] = scount; //new effect number
            s_trigger[scount] = FALSE;         //clear trigger for this effect
            cur_eff = scount;

            //Stop all sounds?
            stop_sounds = effects[cur_eff].stop_what;

            IF (stop_sounds == stop_all)
                FOR (lcount = 16; lcount < 31; lcount++)
                    IF (is_playing_sound (lcount) == Yes)
                        stop_sound (lcount);
                    END
                END

            END

           IF (stop_sounds >= stop_music AND effects[scount].do_song_eff == Yes)
              IF (is_playing_song() == Yes)
                  song_pos = get_song_pos(); //for restarting the music
                  stop_song();
               END
           END

            //If a sound is playing, Stop the sound using this sound channel
            IF (is_playing_sound (eff_channel) == Yes AND eff_channel !=0)
                stop_sound (eff_channel);
            END

            IF (effects[scount].do_song_eff == No)
               IF (is_playing_song() == No)
                   song (id_song);
                   set_song_pos(song_pos);
               END
               doing_effect[search_pri] = effect_id;
               s_trigger[scount] = FALSE; //Clear Trigger effect - norm, fast, secret, potion etc
            ELSE
            //END

         //Play sound
            SWITCH(scount) //check current sound number
                CASE e_firesph, e_lning2, e_explos: //different pitches for these samples
                    using_channel[cur_pri] = sound(sound_ids[scount], 256,rand (200,256));
                END
                DEFAULT:         //play at normal pitch
                    using_channel[cur_pri] = sound(sound_ids[scount], 256,256);
                END
            END
            num_left--;        //number of channels left - 1
            END


          //END //Check Sound Trigger - SONG
        ELSE
//MUSIC
///*
          IF ((do_music == TRUE) OR
             (do_music == FALSE AND effects[scount].music_off == Yes))
            //Stop music/effects
            doing_effect[search_pri] = scount; //new effect number
            s_trigger[scount] = FALSE;         //clear trigger for this effect
            cur_eff = scount;


            //Stop all sounds?
            stop_sounds = effects[cur_eff].stop_what;
            IF (stop_sounds == stop_all)
                FOR (lcount = 16; lcount < 31; lcount++)
                    IF (is_playing_sound (lcount) == Yes)
                        stop_sound (lcount);
                    END
                END
            END

            //If a sound is playing, Stop the sound using this sound channel
            IF (is_playing_sound (eff_channel) == Yes AND eff_channel !=0)
                stop_sound (eff_channel);
            END

         //Play sound
            SWITCH(scount) //check current sound number
                CASE e_firesph, e_lning2, e_explos: //different pitches for these samples
                    using_channel[cur_pri] = sound(sound_ids[scount], 256,rand (200,256));
                END
                DEFAULT:         //play at normal pitch
                    using_channel[cur_pri] = sound(sound_ids[scount], 256,256);
                END
            END
            num_left--;        //number of channels left - 1

          END //Check Sound Trigger - Music

//*/    END
        END

        END //Check music on, or music false and music_off overide set for this sound

        scount++; //increase index count
        //will quit the loop once weve hit next effectchan/priority
    UNTIL (search_pri > cur_pri OR scount > n_effects)

    cur_pri ++;

  UNTIL (scount > n_effects) //effect channel loop
//End process new sounds


//start from trigger position
    scount = e_life;
//Rest of Sounds
    REPEAT
      IF (s_trigger[scount] == TRUE) //triggers for the effects

      SWITCH(scount) //check current sound number
         CASE e_rock, e_lning1,e_laser,
              e_Bothit, e_Boing:
            sound(sound_ids[scount], 200,rand (200,256)); //different pitches for these samples
         END

         DEFAULT:   //play at normal pitch
            sound(sound_ids[scount], 200,256);
         END
      END
         s_trigger[scount] = FALSE; //clear sound trigger or sound will play loads of times
         num_left--;        //number of channels left - 1
      END
      scount++;
    UNTIL (scount >= n_sounds OR num_left <= 0)

    FRAME;

  END
END

PROCESS Init_Game()
BEGIN

//Scroll Plane Start - screen display area of 480x448
   Define_region(1,60,0,518,464);   //scrolling play area region definition Region = 1
   Start_scroll (0, blocksfile, scr_graf, scr_bgrd, 1 , 10); //set up the games scrollplace (Vert Circular 2 screens)
   restore_type = complete_restore;
//done later as we want the scrollplane to be refreshed first
//   restore_type = no_restore;       //speeds the game up conciderably

   scroll.y0 -= 2; //adjustment as main title's scrollplane messes this one up
   scroll.y1 -= 1;

//INIT GAME
   next_insert = 0; //only display dino board,

   bubble_trans = FALSE;   //bubbles see through? = 4
   last_lev_extra = 0;     //last level multi pop highest  2 = trap 3 = trap * players
   last_hurry = FALSE;     //hurry on last level?
   last_skel  = FALSE;     //skel on last level?
   last_umb   = FALSE;     //last level umbrella?
   this_hurry = FALSE;     //hurry on this level?
   this_skel  = FALSE;     //skel on this level?
   this_umb   = FALSE;     //umbrella on this level?
   got_crystal_ball = FALSE;  //make food and items appear straight away
   got_crayon = 0;            //makes 5 potions appear
   got_bell = FALSE;          //do animation if there is a special item to be done
   game_died = FALSE;
   fireball_deadly = FALSE; //player can be killed by the other player
   fire_bubble_go = FALSE;  //Fire bubble item collected
   got_extend = FALSE;      //got a extend level

   lev_multi = FALSE;       //multi pop of 3 done on last level T/F
   missed_multi = 0;        //4 levels without multi set extra item - trap all monsters

   Secret_R_Done[0] = FALSE; //Secret room displayed?
   Secret_R_Done[1] = FALSE; //Secret room displayed?
   Secret_R_Done[2] = FALSE; //Secret room displayed?
   Secret_R_Done[3] = FALSE; //Secret room displayed?

   spec_Items[44].counter = 0; //Clear the secret room items or will do a secret room on level 1
   spec_Items[45].counter = 0;
   spec_Items[46].counter = 0;
   spec_Items[47].counter = 0;

   bubbob[0].bubble_type = blow_normal; //make dinos blow normal bubbles
   bubbob[1].bubble_type = blow_normal;

   bubbob[0].score = 0; //to stop hiscore errors
   bubbob[1].score = 0;

   Game_difficulty();       //set game difficulty
   players_on_screen = 0;   //number of players on screen

   level_next_go = FALSE;  //initialise advance level
   noscrolldraw = TRUE;    //draws the screen in one go - for extend and secret room

//****START LEVEL*****
   cur_level = start_level;  //draw screen level counter
   act_level = cur_level-1;  //actual level for sprites etc


//Adjustment of the scroll plane so it is displayed correctly
//If we start on a even level adjust the scroll plane so it is displayed correctly
   IF ((cur_level MOD 2) == 0) //gives zero if on a even level
       scroll.y0 += 464;
       scroll.y1 += 464;
   END
   drawloc2 = 80;    //Background starts at the same place

END

PROCESS Game_loop()
BEGIN

  level_type = lv_normal; //Normal level

/*
//Games intro animation
  intro_finished = FALSE; //made true by the intro process when it finishes
  Do_Intro_Screen(); //the amount of players currently starting the game will be checked with "players_joining"
                     //when a player presses the start button it will be checked with the above procedure
  REPEAT
        IF (key(_1) AND Credits > 0 AND player_st1 == FALSE)
            Credits --; //Use Up a coin
            player_st1 = TRUE;
        END
        IF (key(_2) AND Credits > 0 AND player_st2 == FALSE)
            Credits --; //Use Up a coin
            player_st2 = TRUE;
        END
     FRAME;
  UNTIL (intro_finished == TRUE) //its finished with the start animation (clear bubbles dinos etc)
*/

//  Test_Info();

  Init_Game();      //Initialise game counters, setup scrollplane
  Score_Displays(); //Score Text

  fade_on();    //fade the screen ON
  FRAME;
  game_state = gs_start_adv_level;

  IF (player_st1 == TRUE)
    Player_Join_Game(0);
  END

  IF (player_st2 == TRUE)
    Player_Join_Game(1);
  END

  player_st1 = FALSE;
  player_st2 = FALSE;
  restore_type = no_restore;       //speeds the game up conciderably

  Level_Events();

REPEAT //GAME LOOP

  IF (game_state == gs_start_adv_level)
      Next_Level();    //draw the screen
  END

  IF (game_state == gs_level_reached) //or gs_level_anims_done - has the same value
      game_state = gs_level_setup; //set game state to setting the level up
      IF (act_level == 100)
         level_type = lv_boss;
      END
         Act_Level_Setup();
  END

  IF (game_state == gs_level_go)
     Checkxbub(); //EXTEND bubble collection
  END

  FRAME;

UNTIL ((key(_esc) AND game_state == gs_level_go AND level_type == lv_normal) OR players_on_screen <=0) //only quit if level is go and not advancing etc
//END OF GAME LOOP
   Game_End_Reset();

END

PROCESS Game_End_Reset()
BEGIN
   baddie_alldie = mkill_do_nothing; //kill all baddie processes
   bubble_alldie = TRUE;             //kill all bubbles
   Signal (type bubble_sprite, s_kill);

   level_next = 20;

   //water/fire/lightning die
   //special item effect die

   IF (Key(_esc)) //kill dinos if esc key pressed
       bubbob[0].lives = 0;
       bubbob[1].lives = 0;
   END

   level_type = lv_end;  //extend bubble die
   game_state = gs_exit; //gets rid of level events

   delete_text(lev_txt); //delete level number
   stop_scroll(0);
   restore_type = complete_restore;

   tscreen_adv = TRUE; //When set to true it advances to the next title screen, and so goes to the main titles

   Coins_Avial = Start_coins;  //Coins Available to play in one game
   FRAME;

END

PROCESS Main_Logic()
BEGIN
    tscreen_adv = FALSE;
    fade_off();
    delete_text(all_text);
    score_displays();

    //Advance to next screen or jump to another screen

    SWITCH (cur_tscreen)
       CASE t_title_main:
          Signal (type optionscr_bubbles, s_kill);
          level_type = lv_title;
          Do_Main_Title();
          write(font_s,ret_xtext(21),ret_ytext2(25) ,3,"CREDITS:");
          write_int(font_s,ret_xtext(29)-8,ret_ytext2(25) , 3,&Credits);
       END

       CASE t_insert_coin:
          Stop_scroll(0);
          Signal (type Scroll_bubbles, s_kill);
          Signal (type full_bubble, s_kill);
          Signal (type pop_bubbles, s_kill);
          Signal (type bubble_stream, s_kill);
          Signal (type rand_pop_bubs, s_kill);

          write(font_s,ret_xtext(16),ret_ytext(13),4,"INSERT COIN");
          Auto_adv_after(2);
          fade_on();
          FRAME(500);
       END

       CASE t_demo_instr:        //Intruction level
          Instruction_Level();
          write(font_s,ret_xtext(21),ret_ytext2(25) ,3,"CREDITS:");
          write_int(font_s,ret_xtext(29)-8,ret_ytext2(25) , 3,&Credits);
       END

       CASE t_demo_level:        //Demo levels
            //write(font_r,ret_xtext(16),ret_ytext(13),4,"GAME OVER");
            //fade_on();
            tscreen_adv = TRUE;
       END

       CASE t_hiscre_dis: //Display scores only no enter player score
            IF (credits > 0)
                tscreen_adv = TRUE; //When set to true it advances to the next title screen, and so goes to the main titles
                cur_tscreen = t_start_prog;
            ELSE
                dis_non_enter_score();
            END
       END

       CASE t_options:
            Stop_scroll(0);
            Options_Screen(); //Allows the user to Change the settings of the game
       END

       CASE t_cheat:
            Cheat_Screen();
       END

       CASE t_redefine_k:  //Redefine keys/joystick select
           Redefine_Keys();
       END

       CASE t_joystick:    //Joystick Selection Screen
           Joystick_Select();
       END

       CASE t_game_keys: //View Game Keys
           Show_Keys();
       END

       CASE t_start_game:  //start the game
            Game_loop();
       END

       CASE t_hiscre_ent:
            Check_score(); //Enter Score Screen for player 1 and 2 else just display score table
       END

       CASE t_lev_reachd,t_lev_reachd2:
            Level_Reached_adv(); //Level Reached
       END

       CASE t_game_over:
            Signal (type Bubble_Field, s_kill);
            Signal (type Bubble_Spitter_2, s_kill);
            Save_Hiscore();
            write(font_s,ret_xtext(16),ret_ytext(13),4,"GAME OVER");
            s_trigger[e_gameover] = TRUE;
            fade_on();
            auto_adv_after(2);
       END

       CASE t_exit_prog:
            Write(font_s,ret_xtext(16),ret_ytext(13),4,"QUIT BUBBLE BOBBLE Y/N ?");
            Quit_game();
            Fade_on();
       END

    END

END
PROCESS Show_Keys();
PRIVATE
    x_loc;
    y_loc;
BEGIN
    Write(font_g,ret_xtext(16),ret_ytext(3),4,"@@@ GAME KEYS INFORMATION@@@");
    level_type = lv_show_k;
    x_loc = ret_xtext(3);
    y_loc = ret_ytext(5);
    Stop_scroll(0);

    FRAME;

    Write(font_ed, x_loc, y_loc,3,"Title Screen Keys");
    y_loc += 32;
    Write(font_ed, x_loc, y_loc,3,"1    1  Player Start");
    y_loc += 32;
    Write(font_ed, x_loc, y_loc,3,"2   2  Player Start");
    y_loc += 32;
    Write(font_ed, x_loc, y_loc,3,"3    Enter Coin");
    y_loc += 32;
    Write(font_ed, x_loc, y_loc,3,"J    Select Joystick");
    y_loc += 32;
    Write(font_ed, x_loc, y_loc,3,"K    Show Program Keys");
    y_loc += 32;
    Write(font_ed, x_loc, y_loc,3,"R    Redefine Keys");
    y_loc += 32;
    Write(font_ed, x_loc, y_loc,3,"Q    Quit Program");

    y_loc += 32;
    Write(font_ed, x_loc, y_loc,3,"F10  Options Screen");

    x_loc = ret_xtext(18);
    y_loc = ret_ytext(5);

    Write(font_ed, x_loc, y_loc,3,"In Game Keys");
    y_loc += 32;
    Write(font_ed, x_loc, y_loc,3,"Esc  Quit Game");
    y_loc += 32;
    Write(font_ed, x_loc, y_loc,3,"F1   Music On/Off");
    y_loc += 32;
    Write(font_ed, x_loc, y_loc,3,"F2   Song On/Off");
    y_loc += 32;
    Write(font_ed, x_loc, y_loc,3,"F3   Choose Song");
    y_loc += 32;
    Write(font_ed, x_loc, y_loc,3,"F8   Pause Game/Space Restart");
    y_loc += 32;
    Write(font_ed, x_loc, y_loc,3,"5    Translucent Bubbles");
    y_loc += 32;
    Write(font_ed, x_loc, y_loc,3,"See Redefine Keys for Player 1's and 2's Keys");

    Fade_On();
    LOOP
        IF (Key(_esc))
            BREAK;
        END
    FRAME;
    END

    tscreen_adv = TRUE; //back to options screen


END


PROCESS Joystick_Select()
PRIVATE
    kj_dis1_id; //Text id of keys joystick text
    kj_dis2_id;

    joy_disJF1_id[4];
    joy_disJF2_id[4];

    pl1_new;
    pl2_new;
    cl_loop;
BEGIN
    //Initialise Joystick to default button 1
    IF (player_joy_fire[0] == 0)
        player_joy_fire[0] = 1; //PL1
        player_joy_fire[1] = 1; //PL2
    END
    Stop_scroll(0);

    FRAME;
    level_type = lv_joystick;

    Write(font_g,ret_xtext(16),ret_ytext(3),4,"@@@ JOYSTICK/KEYS SELECT @@@");
    Write(font_gr,ret_xtext(3),ret_ytext(5),3,"PLAYER 1");
    Write(font_b,ret_xtext(24),ret_ytext(5),4,"PLAYER 2");

    Write(font_s,ret_xtext(0),ret_ytext(23),3,"1 AND 2  SELECT  KEYS/JOYSTICK");
    Write(font_s,ret_xtext(0),ret_ytext(24),3,"F AND J  CHANGES  BUTTONS  ON  JOYSTICK");

    IF (player_keys_joy[0] == Use_Keys)
        kj_dis1_id = Write(font_s,ret_xtext(3),ret_ytext(7),3, "KEYBOARD");
    ELSE
        kj_dis1_id = Write(font_s,ret_xtext(3),ret_ytext(7),3, "JOYSTICK");
        joy_disJF1_id[0] = Write(font_s,ret_xtext(3),ret_ytext(7),3, "JUMP:");
        joy_disJF1_id[1] = Write(font_s,ret_xtext(3),ret_ytext(7),3, "FIRE:");
    END

    IF (player_keys_joy[1] == Use_Keys)
        kj_dis2_id = Write(font_s,ret_xtext(20),ret_ytext(7),3,"KEYBOARD");
    ELSE
        kj_dis2_id = Write(font_s,ret_xtext(20),ret_ytext(7),3,"JOYSTICK");
        joy_disJF2_id[0] = Write(font_s,ret_xtext(3),ret_ytext(7),3, "JUMP:");
        joy_disJF2_id[1] = Write(font_s,ret_xtext(3),ret_ytext(7),3, "FIRE:");
    END

    Fade_On();

//   player1_keys_joy = Use_Keys;
//   player2_keys_joy = Use_Keys;
//   Use_Keys = 0;
//   Use_Joy  = 1;

//    player_joy_jump[1]; //Joy Up or button 1-4
//    player_joy_fire[1]; //1-4
//Joy_Text[4] =
//"JOYSTICK UP", "BUTTON 1", "BUTTON 2", "BUTTON 3", "BUTTON 4";

    LOOP
        IF (key (_1))
            IF (player_keys_joy[0] == Use_Keys)
                player_keys_joy[0] = Use_Joy;

                IF (player_keys_joy[1] == Use_Joy) //Switch player 2 back to keys as this player is using the joysitck
                    player_keys_joy[1] = Use_Keys;
                    pl2_new = TRUE;
                END
            ELSE
                player_keys_joy[0] = Use_Keys;
            END
            pl1_new = TRUE;
        END

        IF (key (_2))
            IF (player_keys_joy[1] == Use_Keys)
                player_keys_joy[1] = Use_Joy;

                IF (player_keys_joy[0] == Use_Joy) //Switch player 1 back to keys as this player is using the joysitck
                    player_keys_joy[0] = Use_Keys;
                    pl1_new = TRUE;
                END
            ELSE
                player_keys_joy[1] = Use_Keys;
            END
            pl2_new = TRUE;

        END


        //J change joystick jump button
        IF (key (_J))
            IF (player_keys_joy[0] == Use_Joy)
                player_joy_jump[0]++;
                IF (player_joy_jump[0] > 4)
                    player_joy_jump[0] = 0;
                END
                Delete_text(joy_disJF1_id[2]);
                joy_disJF1_id[2] = Write(font_s,ret_xtext(8),ret_ytext(9),3, Joy_Text[player_joy_jump[0]] );
            END

            IF (player_keys_joy[1] == Use_Joy)
                player_joy_jump[1]++;
                IF (player_joy_jump[1] > 4)
                    player_joy_jump[1] = 0;
                END
                Delete_text(joy_disJF2_id[2]);
                joy_disJF2_id[2] = Write(font_s,ret_xtext(25),ret_ytext(9),3, Joy_Text[player_joy_jump[1]] );
            END
        END

        //B Change bubble button
        IF (key (_F))
            IF (player_keys_joy[0] == Use_Joy) //Player 1 Change Fire button
                player_joy_fire[0]++;
                IF (player_joy_fire[0] > 4)
                    player_joy_fire[0] = 1;
                END
                Delete_text(joy_disJF1_id[3]);
                joy_disJF1_id[3] = Write(font_s,ret_xtext(8),ret_ytext(10),3, Joy_Text[player_joy_fire[0]]);
            END
            IF (player_keys_joy[1] == Use_Joy) //Player 2 Change Fire button
                player_joy_fire[1]++;
                IF (player_joy_fire[1] > 4)
                    player_joy_fire[1] = 1;
                END
                Delete_text(joy_disJF2_id[3]);
                joy_disJF2_id[3] = Write(font_s,ret_xtext(25),ret_ytext(10),3, Joy_Text[player_joy_fire[1]]);
            END
        END

        IF (pl1_new == TRUE)
            pl1_new = FALSE; //update pl1 to false
            delete_text(kj_dis1_id);
            IF (player_keys_joy[0] == Use_Keys)

                IF (joy_disJF1_id[0] != 0) //Remove the joystick button display info
                   FOR (cl_loop = 0; cl_loop < 4; cl_loop++)
                       delete_text(joy_disJF1_id[cl_loop]);
                       joy_disJF1_id[cl_loop] = 0;
                   END
                END

                kj_dis1_id = Write(font_s,ret_xtext(3),ret_ytext(7),3, "KEYBOARD");
            ELSE
                kj_dis1_id = Write(font_s,ret_xtext(3),ret_ytext(7),3, "JOYSTICK");
                joy_disJF1_id[0] = Write(font_s,ret_xtext(3),ret_ytext(9),3, "JUMP:");
                joy_disJF1_id[1] = Write(font_s,ret_xtext(3),ret_ytext(10),3, "FIRE:");
                joy_disJF1_id[2] = Write(font_s,ret_xtext(8),ret_ytext(9),3, Joy_Text[player_joy_jump[0]] );
                joy_disJF1_id[3] = Write(font_s,ret_xtext(8),ret_ytext(10),3, Joy_Text[player_joy_fire[0]] );
            END
        END

        IF (pl2_new == TRUE)
            pl2_new = FALSE; //update pl2 to false
            delete_text(kj_dis2_id);
            IF (player_keys_joy[1] == Use_Keys)

                IF (joy_disJF2_id[0] != 0) //Remove the joystick button display info
                   FOR (cl_loop = 0; cl_loop < 4; cl_loop++)
                       delete_text(joy_disJF2_id[cl_loop]);
                       joy_disJF2_id[cl_loop] = 0;
                   END
                END

                kj_dis2_id = Write(font_s,ret_xtext(20),ret_ytext(7),3, "KEYBOARD");
            ELSE
                kj_dis2_id = Write(font_s,ret_xtext(20),ret_ytext(7),3, "JOYSTICK");
                joy_disJF2_id[0] = Write(font_s,ret_xtext(20),ret_ytext(9),3, "JUMP:");
                joy_disJF2_id[1] = Write(font_s,ret_xtext(20),ret_ytext(10),3, "FIRE:");
                joy_disJF2_id[2] = Write(font_s,ret_xtext(25),ret_ytext(9),3, Joy_Text[player_joy_jump[1]] );
                joy_disJF2_id[3] = Write(font_s,ret_xtext(25),ret_ytext(10),3, Joy_Text[player_joy_fire[1]] );
            END
        END


        IF (Key(_esc))
            BREAK;
        END
    FRAME(1000);
    END

    tscreen_adv = TRUE;

END

PROCESS Mouse_Pointer()
BEGIN
   file = sprites;
   GRAPH = mouse_gph;
   z = -512;

   LOOP
      x = mouse.x;
      y = mouse.y;
      IF (level_type != lv_options AND level_type != lv_cheat) BREAK; END

      FRAME;
   END
END

PROCESS Cheat_Screen()
PRIVATE
    b_loop;
BEGIN
    signal (type Button_Tog, s_kill);
    signal (type Button_norm, s_kill);

    level_type = lv_cheat;

    FRAME;
    Rand_Pop_Bubs(20,10,40, lv_cheat);  //rand freq, rand start delay ,end delay
    Rand_Pop_Bubs(10,40,80, lv_cheat);  //rand freq, rand start delay ,end delay

//    level_type = lv_cheat;
    //level_type = lv_options;

    Mouse_Pointer();

//invincible
    IF (bubbob[0].invincible == TRUE)
         Button_Tog(20, TRUE);
    ELSE
         Button_Tog(20, FALSE);
    END
    IF (bubbob[1].invincible == TRUE)
         Button_Tog(21, TRUE);
    ELSE
         Button_Tog(21, FALSE);
    END
//infinite lives on T/F
    IF (bubbob[0].inf_lives == FALSE)
        Button_Tog(22, FALSE);
    ELSE
        Button_Tog(22, TRUE);
    END
    IF (bubbob[1].inf_lives == FALSE)
        Button_Tog(23, FALSE);
    ELSE
        Button_Tog(23, TRUE);
    END
//auto fire
    IF (bubbob[0].autofire == FALSE)
        Button_Tog(24, FALSE);
    ELSE
        Button_Tog(24, TRUE);
    END
    IF (bubbob[1].autofire == FALSE)
        Button_Tog(25, FALSE);
    ELSE
        Button_Tog(25, TRUE);
    END
//keep powerups
    IF (bubbob[0].superman == FALSE)
        Button_Tog(26, FALSE);
    ELSE
        Button_Tog(26, TRUE);
    END
    IF (bubbob[1].superman == FALSE)
        Button_Tog(27, FALSE);
    ELSE
        Button_Tog(27, TRUE);
    END

    FOR (b_loop = 28; b_loop <= 39; b_loop++)
        Button_norm(b_loop);
    END


    Write(font_g,ret_xtext(16),ret_ytext(3),4,"@@@ CHEAT SCREEN @@@");

    Write(font_ed, ret_xtext(3),ret_ytext(5),3,"Invincibility");
    Write(font_ed, ret_xtext(3),ret_ytext(6),3,"Inifinite Lives");
    Write(font_ed, ret_xtext(3),ret_ytext(7),3,"Auto Fire");
    Write(font_ed, ret_xtext(3),ret_ytext(8),3,"Always Keep Power Ups");
    Write(font_ed, ret_xtext(3),ret_ytext(9),3,"Always Secret Room:");
    Write(font_ed, ret_xtext(3),ret_ytext(10),3,"Get Item Key:");
    Write(font_ed, ret_xtext(3),ret_ytext(11),3,"Extra Items:");
    Write(font_ed, ret_xtext(3),ret_ytext(12),3,"Level Umbrella:");
    Write(font_ed, ret_xtext(3),ret_ytext(13),3,"Potion Time:");
    Write_int(font_ed, ret_xtext(8),ret_ytext(13),3, &potion_time);
    Write(font_ed, ret_xtext(3),ret_ytext(14),3,"Max Bubbles on Screen:");
    Write_int(font_ed, ret_xtext(12),ret_ytext(14),3, &max_bubs);
    Write(font_ed, ret_xtext(3),ret_ytext(15),3,"Hits To Kill Boss:");
    Write_int(font_ed, ret_xtext(10)-8,ret_ytext(15),3, &boss_set_health);
    Write(font_ed, ret_xtext(3),ret_ytext(16),3,"Fire Bubble Freq  1  In");
    Write_int(font_ed, ret_xtext(11),ret_ytext(16),3, &fire_bubble_rnd);
    Write(font_ed, ret_xtext(3),ret_ytext(17),3,"Trap Other Players:");

    IF (trap_player == FALSE)     //can trap other player in a bubble like a nastie.
        Write(font_ed, ret_xtext(11)-8,ret_ytext(17),3,"No");
    ELSE
        Write(font_ed, ret_xtext(11)-8,ret_ytext(17),3,"Yes");
    END



    IF (extra_items = FALSE)
        Write(font_ed, ret_xtext(8),ret_ytext(11),3,"On");
    ELSE
        Write(font_ed, ret_xtext(8),ret_ytext(11),3,"Off");
    END

    IF (alwaysSR == FALSE)
        Write(font_ed, ret_xtext(11)+8,ret_ytext(9),3,"No");
    ELSE
        Write(font_ed, ret_xtext(11)+8,ret_ytext(9),3,"Yes");
    END

    IF (item_key == FALSE)
        Write(font_ed, ret_xtext(8)+8,ret_ytext(10),3,"Off");
    ELSE
        Write(font_ed, ret_xtext(8)+8,ret_ytext(10),3,"On");
    END

    IF (spec_items[50].counter == 0)
        Write(font_ed, ret_xtext(9),ret_ytext(12),3,"Off");
    ELSE
        Write(font_ed, ret_xtext(9),ret_ytext(12),3,"On");
    END


    Fade_On();
    LOOP
        IF (Key(_esc))
            BREAK;
        END
    FRAME;
    END

    signal (type Button_Tog, s_kill);
    signal (type Button_norm, s_kill);

    tscreen_adv = TRUE; //back to options screen
END

PROCESS Options_Screen()
PRIVATE
    b_loop;


BEGIN
    FRAME;
    level_type = lv_options;
    put(blocksfile, scr_Stars, 320, 240); //Blocks FPG
    Rand_Pop_Bubs(20,20,80, lv_options);  //rand freq, rand start delay ,end delay
    Rand_Pop_Bubs(10,80,120, lv_options);  //rand freq, rand start delay ,end delay

    Mouse_Pointer();

    FOR (b_loop = 0; b_loop <= 14; b_loop++)
        Button_norm(b_loop);
    END


    IF (cheat_mode == TRUE)
        FOR (b_loop = 15; b_loop <= 19; b_loop++)
            Button_norm(b_loop);
        END
    END

    Write(font_g,ret_xtext(16),ret_ytext(3),4,"@@@ OPTIONS SCREEN @@@");

    Write(font_ed, ret_xtext(3),ret_ytext(5),3,"Backgrounds:");

    Write(font_ed, ret_xtext(3),ret_ytext(6),3,"Frame Rate :");
    Write_int(font_ed, ret_xtext(8),ret_ytext(6),3,&frm_rate);
    Write(font_ed, ret_xtext(3),ret_ytext(7),3,"Frame Skip :");
    Write_int(font_ed, ret_xtext(8),ret_ytext(7),3,&frm_skip);
    Write(font_ed, ret_xtext(3),ret_ytext(8),3,"Level Type:");
    Write(font_ed, ret_xtext(3),ret_ytext(9),3,"Start Level:");
    Write_int(font_ed,ret_xtext(8)-8,ret_ytext(9) ,3,&start_level);
    Write(font_ed, ret_xtext(3),ret_ytext(11),3,"Difficulty Setting:");
    Write(font_ed, ret_xtext(10),ret_ytext(11),3,Game_diff_Text[game_diff-1]);
    Write(font_ed, ret_xtext(3),ret_ytext(12),3,"Extra Lifes at:");
    Write_int(font_ed,ret_xtext(9)-8,ret_ytext(12) ,3,&Extra_lives[life_set].first);
    Write_int(font_ed,ret_xtext(12)-8,ret_ytext(12) ,3,&Extra_lives[life_set].second);
    Write_int(font_ed,ret_xtext(15),ret_ytext(12) ,3,&Extra_lives[life_set].thrid);
    Write(font_ed, ret_xtext(3),ret_ytext(13),3,"Lives per Coin:");
    Write_int(font_ed,ret_xtext(9)-8,ret_ytext(13) ,3,&Start_lives);
    Write(font_ed, ret_xtext(3),ret_ytext(14),3,"Coins Avail:");
    Write_int(font_ed,ret_xtext(8)-8,ret_ytext(14) ,3,&Start_coins);
    Write(font_ed, ret_xtext(3),ret_ytext(16),3,"Reset the High Score Table");
    Write(font_ed, ret_xtext(3),ret_ytext(17),3,"Clear Item Counters");
    Write(font_ed, ret_xtext(3),ret_ytext(18),3,"Reset Player Keys");
    Write(font_ed, ret_xtext(3),ret_ytext(19),3,"Reset Everything to Defaults");
    Write(font_ed, ret_xtext(3),ret_ytext(20),3,"Clear Cheats");

    IF (cheat_mode == TRUE)
        Write(font_ed, ret_xtext(3),ret_ytext(21),3,"Cheat Screen");
    END

    IF (do_levels == lev_normal)  //levels normal
        Write(font_ed, ret_xtext(8)-8,ret_ytext(8),3,"Original");
    ELSE
        Write(font_ed, ret_xtext(8)-8,ret_ytext(8),3,"New Levels");
    END

    IF (do_bgrounds == TRUE)   //graphics behind the screen on scroll plane 2
        Write(font_ed, ret_xtext(8)+8,ret_ytext(5),3,"On");
    ELSE
        Write(font_ed, ret_xtext(8)+8,ret_ytext(5),3,"Off");
    END

    Fade_On();
    LOOP
        IF (Key(_esc))
            BREAK;
        END
    FRAME;
    END

    signal (type Button_Tog, s_kill);
    signal (type Button_norm, s_kill);

    Set_FPS(frm_rate, frm_skip); //Frames per second
    Save (game_s, OFFSET frm_rate, 8); //Save Settings

    tscreen_adv = TRUE;
    level_type = lv_title;
END

PROCESS Save_Keys() //Save User Def Keys
BEGIN
    Save (game_k, OFFSET userdefkeys, SIZEOF (userdefkeys));//Load Game Keys
END

PROCESS Redefine_Keys()
PRIVATE
    Text_id1;
    Text_id2;
    Text_id3;
    Text_id4;

    plr;
    key_to_rec;  //what key to record from player
    scan_key;    //key pressed by user
    last_key_rec;

    accept_keys; //keep the new keys
    exit_enter;  //Exit enter keys loop
    keys_changed; //to prompt the user on exit if any of the keys have changed, do they wish to save

BEGIN
    FRAME;
    level_type = lv_redefine;
    Stop_scroll(0);

    //Store the keys to the TEMP userkeys array
    From_Keys(1);
    From_Keys(0);

    Write(font_g,ret_xtext(16),ret_ytext(3),4,"REDEFINE PLAYER KEYS");

    Write(font_gr,ret_xtext(3),ret_ytext(5),3,"PLAYER 1");
    Write(font_b,ret_xtext(24),ret_ytext(5),4,"PLAYER 2");

    Write(font_s,ret_xtext(2),ret_ytext(7),3,"LEFT:");
    Write(font_s,ret_xtext(2),ret_ytext(9),3,"RIGHT:");
    Write(font_s,ret_xtext(2),ret_ytext(11),3,"JUMP:");
    Write(font_s,ret_xtext(2),ret_ytext(13),3,"FIRE:");

    Write(font_s,ret_xtext(19),ret_ytext(7),3, "LEFT:");
    Write(font_s,ret_xtext(19),ret_ytext(9),3, "RIGHT:");
    Write(font_s,ret_xtext(19),ret_ytext(11),3,"JUMP:");
    Write(font_s,ret_xtext(19),ret_ytext(13),3,"FIRE:");

    //Display current keys to the screen
    Display_Them_All();

    Fade_On();

LOOP //Loop back to here so user can do the other keys and quit the program

    Text_id1 = Write(font_s,ret_xtext(0),ret_ytext(16),3,"PRESS  1 OR 2  TO  REDEFINE  KEYS  (ESC MENU)");

    LOOP
      IF (Key(_esc))
         IF (keys_changed == TRUE) //will prompt the user if they wish to save these keys to use again
            Write(font_g,ret_xtext(0),ret_ytext(16),3,"YOUR PLAYER KEYS HAVE BEEN CHANGED");
            Write(font_g,ret_xtext(0),ret_ytext(17),3,"SAVE TO DISC Y/N  ?");
            LOOP
                IF (scan_code !=0)
                   IF (scan_code == _Y)
                     Save_Keys();
                   END

                   tscreen_adv = TRUE;
                   RETURN;

                END

                FRAME;
            END
         END

         tscreen_adv = TRUE;
         RETURN;
      END

      IF (Key(_1)) //Player 1 Selected by the user
        BREAK;
      END

      IF (Key(_2)) //Player 2 Selected by the user
        plr = 1;
        BREAK;
      END

    FRAME;

    END
    //Delete press 1 or 2 to refdef keys
    Delete_text(Text_id1);


//Loop ENTER NEW KEYS
REPEAT
//Initialise loop logic flags
    accept_keys = FALSE;  //accept new keys after this loop finishes?
    exit_enter  = FALSE;  //Exit enter keys loop
    key_to_rec = 0;       //which key to read in
    last_key_rec = 0;     //To Stop multiple same keys been entered by the user

    Text_id1 = Write(font_s,ret_xtext(0),ret_ytext(16),3,"ENTER  NEW  KEY");
    IF (plr == 0)
        Text_id2 = Write(font_gr,ret_xtext(13),ret_ytext(16),3,"PLAYER  1");
    ELSE
        Text_id2 = Write(font_b,ret_xtext(13),ret_ytext(16),3,"PLAYER  2");
    END

    //Clear players display array
    Clear_Dis_Keys(plr);

    //Delay before starting
    FRAME (2500);

    Text_id3 = Write(font_s,ret_xtext(0),ret_ytext(18),3,"FOR:");

    Write(font_s,ret_xtext(5),ret_ytext(18),3,key_dis[key_to_rec]);

    LOOP

      scan_key = scan_code;   //key pressed by user

      //Special keys
      IF (key(_r_shift))    //Right Shift
            scan_key = 54;
      END

      IF (key(_l_shift))    //Left Shift
            scan_key = 42;
      END

      IF (key(_control))    //CTRL
            scan_key = 29;
      END

      IF (key(_alt))        //ALT
            scan_key = 56;
      END

      //Key pressed by user and not the same as the last, if key is held down
      IF (scan_key != 0 AND last_key_rec <> scan_key)
           last_key_rec = scan_key;
           SWITCH (key_to_rec)
               CASE 0: //LEFT
                  userdefkeys_temp[plr].pl_l = scan_key; //Store New left
               END
               CASE 1: //RIGHT
                  userdefkeys_temp[plr].pl_r = scan_key; //Store New right
               END
               CASE 2: //JUMP
                  userdefkeys_temp[plr].pl_j = scan_key; //Store New jump
               END
               CASE 3: //FIRE
                  userdefkeys_temp[plr].pl_f = scan_key; //Store New fire
               END
           END

         //Display to screen
         Dis_New_Key(key_to_rec, plr);

         IF (key_to_rec < 3) //Check for 4 Keys to enter
            key_to_rec++; //No increase to next key
         ELSE
            BREAK;
         END
      END
      FRAME;
      //Display next key to enter
      Text_id4 = Write(font_s,ret_xtext(5),ret_ytext(18),3,key_dis[key_to_rec]);
    END

//Delete enter text prompts
    Delete_text(text_id1); //enter new key
    Delete_text(text_id2); //player
    Delete_text(text_id4); //FIRE
    Delete_text(text_id3); //For:

//Prompt user to check keys are ok
    Text_id4 = Write(font_s,ret_xtext(0),ret_ytext(20),3,"ARE THESE KEYS OK ?  Y/N/ESC");

    //Check ok
    //N Entered - redo entered keys
    //Y Entered - store entered keys
    //esc - Cancel
    LOOP
       IF (key(_y))
          accept_keys = TRUE; //save the keys when exiting enter keys loop
          exit_enter = TRUE;  //exit enter keys loop
          BREAK;
       END

       IF (key(_n))
          accept_keys = FALSE; //save the keys when exiting enter keys loop
          Delete_text(text_id4); //Keys ok?
          BREAK;
       END

       IF (key(_esc))
          accept_keys = FALSE; //save the keys when exiting enter keys loop
          exit_enter = TRUE;  //exit enter keys loop
          BREAK;
       END

       FRAME;
    END

UNTIL (exit_enter == TRUE)  //Exit enter keys loop

    Delete_text(text_id4); //Keys ok?

    IF (accept_keys == TRUE)
        Store_Keys(plr);
        keys_changed = TRUE; //will prompt the user if they wish to save these keys to use again
    ELSE
       //Restore keys
       Clear_Dis_Keys(plr);
       From_Keys(plr);
       Dis_Players_Key(plr);
    END

    FRAME(1000);


END //Main loop of Redefine Keys


END
PROCESS Display_Them_All()
PRIVATE
    dis_count;
    the_key;
    k_dis_c;
BEGIN
    //key_dis_ids[7]; //to delete keys from the screen
                   //player 1s keys
    key_dis_ids[0] = Write(font_s,ret_xtext(9),ret_ytext(7),3, keynames[(userdefkeys_temp[dis_count].pl_l)-1]);
    key_dis_ids[1] = Write(font_s,ret_xtext(9),ret_ytext(9),3, keynames[(userdefkeys_temp[dis_count].pl_r)-1]);
    key_dis_ids[2] = Write(font_s,ret_xtext(9),ret_ytext(11),3,keynames[(userdefkeys_temp[dis_count].pl_j)-1]);
    key_dis_ids[3] = Write(font_s,ret_xtext(9),ret_ytext(13),3,keynames[(userdefkeys_temp[dis_count].pl_f)-1]);

    dis_count = 1; //player 2s keys

    key_dis_ids[4] = Write(font_s,ret_xtext(26),ret_ytext(7),3, keynames[(userdefkeys_temp[dis_count].pl_l)-1]);
    key_dis_ids[5] = Write(font_s,ret_xtext(26),ret_ytext(9),3, keynames[(userdefkeys_temp[dis_count].pl_r)-1]);
    key_dis_ids[6] = Write(font_s,ret_xtext(26),ret_ytext(11),3,keynames[(userdefkeys_temp[dis_count].pl_j)-1]);
    key_dis_ids[7] = Write(font_s,ret_xtext(26),ret_ytext(13),3,keynames[(userdefkeys_temp[dis_count].pl_f)-1]);

END

//Clears one players keys on screen ready to display new ones the user enters
PROCESS Clear_Dis_Keys(plr)
PRIVATE
   k_start; //start of players text ids
   k_loop;  //loop counter
BEGIN
   IF (plr == 1)   //Clear player 1s keys
      k_start = 4; //player 2s text ids
   END

   FOR (k_loop = 1; k_loop <=4; k_loop++)
       Delete_text(key_dis_ids[k_start]);
       k_start++;
   END
END

//Used when user cancels entering of the keys
PROCESS Dis_Players_Key(plr)
BEGIN
    IF (plr == 0)
            key_dis_ids[0] = Write(font_s,ret_xtext(9),ret_ytext(7),3, keynames[(userdefkeys_temp[plr].pl_l)-1]);
            key_dis_ids[1] = Write(font_s,ret_xtext(9),ret_ytext(9),3, keynames[(userdefkeys_temp[plr].pl_r)-1]);
            key_dis_ids[2] = Write(font_s,ret_xtext(9),ret_ytext(11),3,keynames[(userdefkeys_temp[plr].pl_j)-1]);
            key_dis_ids[3] = Write(font_s,ret_xtext(9),ret_ytext(13),3,keynames[(userdefkeys_temp[plr].pl_f)-1]);
    ELSE
            key_dis_ids[4] = Write(font_s,ret_xtext(26),ret_ytext(7),3, keynames[(userdefkeys_temp[plr].pl_l)-1]);
            key_dis_ids[5] = Write(font_s,ret_xtext(26),ret_ytext(9),3, keynames[(userdefkeys_temp[plr].pl_r)-1]);
            key_dis_ids[6] = Write(font_s,ret_xtext(26),ret_ytext(11),3,keynames[(userdefkeys_temp[plr].pl_j)-1]);
            key_dis_ids[7] = Write(font_s,ret_xtext(26),ret_ytext(13),3,keynames[(userdefkeys_temp[plr].pl_f)-1]);
    END

END

PROCESS Dis_New_Key(key_count, plr)
BEGIN
    IF (plr == 0)
        SWITCH (key_count)
        CASE 0:
            key_dis_ids[0] = Write(font_s,ret_xtext(9),ret_ytext(7),3, keynames[(userdefkeys_temp[plr].pl_l)-1]);
        END

        CASE 1:
            key_dis_ids[1] = Write(font_s,ret_xtext(9),ret_ytext(9),3, keynames[(userdefkeys_temp[plr].pl_r)-1]);
        END

        CASE 2:
            key_dis_ids[2] = Write(font_s,ret_xtext(9),ret_ytext(11),3,keynames[(userdefkeys_temp[plr].pl_j)-1]);
        END

        CASE 3:
            key_dis_ids[3] = Write(font_s,ret_xtext(9),ret_ytext(13),3,keynames[(userdefkeys_temp[plr].pl_f)-1]);
        END

        END

    ELSE
        SWITCH (key_count)
        CASE 0:
            key_dis_ids[4] = Write(font_s,ret_xtext(26),ret_ytext(7),3, keynames[(userdefkeys_temp[plr].pl_l)-1]);
        END
        CASE 1:
        key_dis_ids[5] = Write(font_s,ret_xtext(26),ret_ytext(9),3, keynames[(userdefkeys_temp[plr].pl_r)-1]);
        END
        CASE 2:
            key_dis_ids[6] = Write(font_s,ret_xtext(26),ret_ytext(11),3,keynames[(userdefkeys_temp[plr].pl_j)-1]);
        END
        CASE 3:
        key_dis_ids[7] = Write(font_s,ret_xtext(26),ret_ytext(13),3,keynames[(userdefkeys_temp[plr].pl_f)-1]);
        END
        END
    END

END

//Store the keys to the TEMP userkeys array
PROCESS From_Keys(plr)
BEGIN
    userdefkeys_temp[plr].pl_l = userdefkeys[plr].pl_l; //left
    userdefkeys_temp[plr].pl_r = userdefkeys[plr].pl_r; //right
    userdefkeys_temp[plr].pl_f = userdefkeys[plr].pl_f; //fire
    userdefkeys_temp[plr].pl_j = userdefkeys[plr].pl_j; //jump
END

//Store the keys to the userkeys array
PROCESS Store_Keys(plr)
BEGIN
    userdefkeys[plr].pl_l = userdefkeys_temp[plr].pl_l; //left
    userdefkeys[plr].pl_r = userdefkeys_temp[plr].pl_r; //right
    userdefkeys[plr].pl_f = userdefkeys_temp[plr].pl_f; //fire
    userdefkeys[plr].pl_j = userdefkeys_temp[plr].pl_j; //jump
END

//Restores the players key display array
PROCESS Restore_Keys()
PRIVATE
    plr;
BEGIN
     FOR (plr = 0; plr < 1; plr++)
        userdefkeys[plr].pl_l = Restore_userdefkeys[plr].pl_l; //left
        userdefkeys[plr].pl_r = Restore_userdefkeys[plr].pl_r; //right
        userdefkeys[plr].pl_f = Restore_userdefkeys[plr].pl_f; //fire
        userdefkeys[plr].pl_j = Restore_userdefkeys[plr].pl_j; //jump
     END
END


//Quits the program
PROCESS Quit_game();
BEGIN
   Stop_scroll(0);
   Signal (type Scroll_bubbles, s_kill);
   Signal (type full_bubble, s_kill);
   Signal (type pop_bubbles, s_kill);
   Signal (type bubble_stream, s_kill);
   Signal (type rand_pop_bubs, s_kill);

   LOOP
      IF (key(_y))
         Let_me_alone();
         Exit("Thanks For Playing Bubble Bobble",0);
      END

      IF (Key(_n))
         tscreen_adv = TRUE;
         BREAK;
      END

      FRAME;
   END
END

PROCESS Score_Displays();
BEGIN
   write(font_r,ret_xtext(11)+8,ret_ytext(0),3,"HIGH SCORE");
   write_int(font_s, ret_xtext(16),ret_ytext(1),4,&Hi_score);

   write(font_gr,ret_xtext(4),ret_ytext(0),3,"1UP");
   write_int(font_s, ret_xtext(8),ret_ytext(1),5,&bubbob[0].score);

   write(font_b,ret_xtext(25),ret_ytext(0),3,"2UP");
   write_int(font_s, ret_xtext(29),ret_ytext(1),5,&bubbob[1].score);

//Top left level number if on a normal or demo level
   IF (level_type == lv_normal OR  level_type ==lv_demo)
       lev_txt = write_int(font_n,76,64,4, &act_level);
   END
END

PROCESS Do_Main_Title() // Main Title Screen
PRIVATE
   plr2_start_txt;
BEGIN
//Set up some scroll planes

    titles_timer = 0;
    Timer[9] = 0;

    IF (credits == 0)
        Title_sprite();
    END

    Fade_on();
    Changing_Titles();

    Scroll_Bubbles();


    LOOP
       IF (titles_timer >= 21) //21 Title changing text going to loop

       //IF (titles_timer >= 5) //21 Title changing text going to loop
            //tscreen_adv = TRUE;
            Fade_off();
            cur_tscreen = t_insert_coin;
            Main_logic();
            titles_timer = 0;

       END

       IF (cur_tscreen != t_title_main OR credits > 0)
          BREAK;
       END

       FRAME;
    END

IF (cur_tscreen == t_title_main) //Coin Entered staying on the title screen

    //Show When Extra Lives are awarded, life_set is a global
    Write_int(font_s, ret_xtext(24),ret_ytext(11),5,&Extra_lives[life_set].first);
    Write_int(font_s, ret_xtext(24),ret_ytext(13),5,&Extra_lives[life_set].second);
    //Bonus writing
    Text_Writer(Txt_on_off[8].Lines_On, t_norm);

    IF (credits == 1)
        Text_Writer(Txt_on_off[6].Lines_On, t_norm);
    END

    LOOP
       IF (cur_tscreen != t_title_main)
          BREAK;
       END
       //Changes the text to display press 1 or 2 player button when 2 or more coins are entered
       IF (credits >= 2 AND plr2_start_txt == FALSE)
         Text_Writer(Txt_on_off[7].Lines_On, t_norm);
         plr2_start_txt = TRUE;
       END

       FRAME;
    END
    FRAME;
END // Still on title screen - Waiting for start game
//  scroll.y0
//  scroll.y1

//    Stop_scroll(0);

END
//Does the changing text on the title screens bottom
PROCESS Changing_Titles()
PRIVATE
   cur_t_id;
   next_t_time;
   l_off; //Lines to delete from the screen
   g_id;
   lines[2];
   arr_loc;
BEGIN
   cur_t_id = 22;

   LOOP
      titles_timer = Timer[9]/100;
      IF (next_t_time < titles_timer)

        FOR (arr_loc = 0; arr_loc <= 2; arr_loc++)
           IF (lines[arr_loc] != 0)
              Delete_text(lines[arr_loc]);
              lines[arr_loc] = 0;
           END
        END

        arr_loc = 0;

        LOOP
            x = ret_xtext(Game_Text[cur_t_id].txt_x);
            y = ret_ytext(Game_Text[cur_t_id].txt_y);
            lines[arr_loc] = write(font_s, x, y ,3,Game_Text[cur_t_id].txt_text);
            arr_loc++;

            IF (Game_Text[cur_t_id].txt_linefeed == FALSE)
                BREAK;
            END
            IF (Game_Text[cur_t_id].txt_linefeed == TRUE)
                cur_t_id++; //Update Current title to point to the next to display
            END
        END

        next_t_time = titles_timer + 2; //Delay by 2 seconds befor displaying next text to screen

        IF (g_id !=0)
           signal (g_id, s_kill);
           g_id = 0;
        END

        IF (cur_t_id == 22)
            Static_Anim_Titles(316, 369, 0, 53);       //Dibsoft
            g_id = get_id (type Static_Anim_Titles);
        END

        IF (cur_t_id == 25)
            Static_Anim_Titles(320, 361+30, 0, 31);    //Taito
            g_id = get_id (type Static_Anim_Titles);
        END

        IF (cur_t_id == 26)
            Static_Anim_Titles(320, 361+30+16, 0, 55); //Div2
            g_id = get_id (type Static_Anim_Titles);
        END
        cur_t_id++;

        IF (cur_t_id > 34) //loop if at end of text sequence
            cur_t_id = 22;
        END
      END

      IF (cur_tscreen != t_title_main) BREAK; END

      FRAME;
   END

//Delete Changing text
   FOR (arr_loc = 0; arr_loc <= 2; arr_loc++)
           IF (lines[arr_loc] != 0)
              Delete_text(lines[arr_loc]);
              lines[arr_loc] = 0;
           END
   END

//Kill Sprite if one there
   IF (g_id !=0)
       signal (g_id, s_kill);
       g_id = 0;
   END
//   l_off = Txt_on_off[cur_t].Lines_Off;
//   Del_Scr_Text(l_off); //Delete text from the screen

END


PROCESS Title_Sprite()
PRIVATE
    roll_id;
BEGIN
    file =titlesfile;

    GRAPH = 1;
    x = 320;
    y = 180;
    z = pri_tit;

    size =0;
    LOOP
       size+=2;
       IF(size >= 100 OR credits >0)BREAK; END
       FRAME;
    END

    Rotate_Palette (248,255, 3);
    roll_id = get_id (type Rotate_palette);

    LOOP
        IF (titles_timer >= 5) kill = TRUE; END
        IF (credits > 0 OR cur_tscreen != t_title_main) BREAK; END
        FRAME;
    END

   //signal get rid off rotate pallette, using signal s_kill gives a error
   IF (roll_id != 0)  roll_id.kill = TRUE; END

END

//Deletes all screen Text and then puts score displays back on
PROCESS Auto_Adv_After(secs_till); //Auto Advances the Title Screen
BEGIN
    Timer[9] = 0;
    LOOP
        IF (Timer[9] > secs_till*100 OR key(_space))
            tscreen_adv = TRUE; //advance to next screen
            BREAK;
        END

        FRAME;
    END
    fade_off();
    delete_text(all_text);
    score_displays();
END

PROCESS Auto_Adv_Kill(secs_till); //Sets calling process local to kill after a number of seconds
BEGIN
    Timer[9] = 0;
    LOOP
        IF (Timer[9] > secs_till*100 OR key(_space))
            BREAK;
        END
        FRAME;
    END
    father.kill = TRUE;

END

PROCESS Goto_Main_Title()
BEGIN
    IF (cur_tscreen != t_title_main AND credits >=1)
        cur_tscreen = t_game_over;
        tscreen_adv = TRUE;
        //BREAK;
    END

END

//Load levels into arrays
//also hardness maps - plat n bubble
PROCESS Load_levels()
BEGIN
   //Unload maps if loaded to free up memory
   IF (plat_map != 0)
       unload_map (plat_map);
       unload_map (bubble_map);
   END

   IF (do_levels == lev_normal)      //levels normal
      plat_map = load_map (p_map1);   //Load platform map containing all the normal game
      bubble_map = load_map (p_bub1); //Load bubble map containing all the normal game
      load (level_n, OFFSET levels);  //level data for bubble speed, round time etc
      load (bad_n, OFFSET Baddies);   //Baddie data x,y,direction, type for normal game
   ELSE
                                      //Levels Extra
      plat_map = load_map (p_map2);   //Load platform data
      bubble_map = load_map (p_bub2); //Load bubble data

      load (level_e, OFFSET levels);  //load level data
      load (bad_e, OFFSET Baddies);   //load baddie data
   END
END


PROCESS Flash_text(st_arr, end_arr); //flashes text
PRIVATE
     dis_text;      //true display, false move off the screen
     arr_pos;       //used to loop through the
     flash_count;
BEGIN

     LOOP
        IF (flash_count>20)
         flash_count = 0;

         arr_pos = st_arr; //get start position

         IF (dis_text == TRUE)
           REPEAT
              //move text back to on screen
              move_text (Text_On_Scr[arr_pos].Text_Id, Text_On_Scr[arr_pos].txt_x, Text_On_Scr[arr_pos].txt_y);
              arr_pos++;
           UNTIL (arr_pos > end_arr)
           dis_text = FALSE;
         ELSE
           REPEAT
              //move text off the screen
              move_text (Text_On_Scr[arr_pos].Text_Id, 640, 640);
              arr_pos++;
           UNTIL (arr_pos > end_arr)

           dis_text = TRUE;
         END

        END
        flash_count++;
        IF (updating_text == TRUE OR game_state == gs_start_adv_level) BREAK; END //text deleted from the screen

        FRAME;
     END

END

PROCESS Text_Writer(txt_id, text_type)
PRIVATE
   fnt; //gets the font fileid pointer
   onscr_start; //used to save the start position for flashing text
BEGIN

   REPEAT
      FRAME;
   UNTIL (updating_text == FALSE)

   onscr_start = txt_onscr; //save how many lines on screen incase we need it for not normal text - non static

   LOOP
   //Get the correct game font to Display
   SWITCH (Game_Text[txt_id].txt_font)
      CASE f_silver:
         fnt = font_s;
      END
      CASE f_gold:
         fnt = font_g;
      END
      CASE f_red:
         fnt = font_r;
      END
      CASE f_green:
         fnt = font_gr;
      END
      CASE f_blue:
         fnt = font_b;
      END
   END

//   Text_Id; //id returned when its written to the screen
//   Arr_loc; //to delete until line break

      //Display the text to Screen
      Text_on_Scr[txt_onscr].txt_x = ret_xtext(Game_Text[txt_id].txt_x);
      Text_on_Scr[txt_onscr].txt_y = ret_ytext(Game_Text[txt_id].txt_y);

      Text_on_Scr[txt_onscr].Text_Id = write(fnt,Text_on_Scr[txt_onscr].txt_x,Text_on_Scr[txt_onscr].txt_y,3,Game_Text[txt_id].txt_text);
      Text_on_Scr[txt_onscr].Arr_loc = txt_id; //to delete until line break

      txt_onscr++;

      //Check to see if any more lines to display, by checking the line feed variable
      IF (Game_Text[txt_id].txt_linefeed == FALSE)

         IF (text_type == t_flash) //check for flashing text
            Flash_text (onscr_start, txt_onscr-1);
         END
         BREAK;//exit the write text to screen loop
      END

      //Line feed dectected so locate next line of text to display
      txt_id++;
   END

//    t_norm   = 0;
//    t_flash  = 1;

END

PROCESS Del_Scr_Text(arr_pos)
PRIVATE
    txt_loc;
    save_t_loc;
    del_n_lines;
    txt_found;
BEGIN

    IF (Text_on_Scr[0].Text_id ==0) //Error Check - Check to see if they is text on screen
       RETURN;
    END

    IF (updating_text == TRUE)
        REPEAT //Error Check updating the number on screen already
            FRAME;
        UNTIL (updating_text == FALSE)
    END

    REPEAT
      IF (Text_on_Scr[txt_loc].Arr_loc == arr_pos)
         txt_found = TRUE;
         save_t_loc = txt_loc;
      ELSE
         txt_loc++;
      END
    UNTIL (txt_found == TRUE OR txt_loc > txt_onscr)


    IF (txt_found == TRUE) //found the text delete it
      LOOP
         delete_text(Text_on_Scr[txt_loc].Text_Id); //delete one line
         del_n_lines++; //how many lines deleted

         IF (Game_Text[arr_pos].txt_linefeed == FALSE) BREAK; END //delete until the break: linefeed == False

         //Line feed dectected so locate next line of text to delete
         arr_pos++;
         txt_loc++;
      END

      Resort_txtarr(save_t_loc, del_n_lines);
    END
END

PROCESS Resort_txtarr(text_loc, del_n_lines);
PRIVATE
   del_loc;
   del_count;
   exit_cpy;

BEGIN
//Remove the Text Items from the text screen array

   updating_text = TRUE; //to stop the delete text or place text processes from running whilst the update is running
   FRAME;

   del_loc = text_loc;

   REPEAT
      Text_on_Scr[del_loc].Text_Id = 0; //clear the text id of the now deleted text
      Text_on_Scr[del_loc].Arr_Loc = 0; //clear the array position in the screen text
      del_loc++;
      del_count++;
   UNTIL (del_count >= del_n_lines)

//sort the array
   REPEAT
      IF (Text_on_Scr[del_loc].Text_Id != 0) //if text information to shift up
         Text_on_Scr[text_loc].Text_Id = Text_on_Scr[del_loc].Text_Id;
         Text_on_Scr[text_loc].Arr_Loc = Text_on_Scr[del_loc].Arr_Loc;
         //Clear where we have copied from
         Text_on_Scr[del_loc].Text_Id = 0; //clear the text id of the now deleted text
         Text_on_Scr[del_loc].Arr_Loc = 0; //clear the array position in the screen text

         text_loc++;
         del_loc++;
      ELSE
         exit_cpy = TRUE; //shifted all information up
      END

   UNTIL (exit_cpy == TRUE)


//update how many in the array
   txt_onscr = 0;

   REPEAT
      IF (Text_on_Scr[txt_onscr].Text_Id != 0) //if text information to shift up
         txt_onscr++;
      END
   UNTIL (Text_on_Scr[txt_onscr].Text_Id == 0)

   updating_text = FALSE; //can place text

END

//Clears text array for a new screen
PROCESS Clear_Txt_array()
PRIVATE
    del_loc;
BEGIN
     FOR (del_loc = 0; del_loc <= 50; del_loc++)
        Text_on_Scr[del_loc].Text_Id = 0; //clear the text id of the now deleted text
        Text_on_Scr[del_loc].Arr_Loc = 0; //clear the array position in the screen text
     END
     Txt_onscr = 0;
     updating_text = FALSE; //can place text
END


PROCESS Instruction_Level()
PRIVATE
   txtid;
   a_loc;
   k_move;
   Play_rec;
   txt_to_do;
   l_off;    //lines to take off the screen starting from this position from Txt_on_off[]
BEGIN
   Clear_Txt_array(); //clear text in display array

   drawloc2 = 80;
   auto_loc1 = 0;

   level_next_go = FALSE;  //initialise advance level
   noscrolldraw = TRUE;    //draws the screen in one go - for extend and secret room

//Define Scroll plane and Region on screen
   define_region(1,60,0,518,464);   //scrolling play area region definition Region = 1
   start_scroll (0, blocksfile, scr_graf, scr_bgrd, 1 , 10); //set up the games scrollplace (Vert Circular 2 screens)
   restore_type = no_restore;       //speeds the game up conciderably

//   scroll.y0 += 2; //adjustment as main title's scrollplane messes this one up
//   scroll.y1 += 1;

   level_type = lv_instr;

   Extend_Demo_Level();
   game_state = gs_level_setup;
   Demo_Level_Setup();
   Player_join_game(0);
   Players_Start();

//   Test_Info();

FRAME;
   Play_rec = 0; //0 = play, 1 = record

   IF (play_rec == 0)
      load (instr1, OFFSET autoplay1);
      Auto_Play(0);
   ELSE
      Record_Demo(0); //player 1
      Do_keys();
   END

  LOOP

  test2 = auto_loc1;

      IF (auto_loc1 == 0 AND txt_to_do ==0)
         l_off = Txt_on_off[txt_to_do].Lines_Off;
         Text_Writer(Txt_on_off[txt_to_do].Lines_On, t_norm);
         txt_to_do++;
      END

      IF (auto_loc1 == 5 AND txt_to_do ==1)
         Del_Scr_Text(l_off);
         l_off = Txt_on_off[txt_to_do].Lines_Off;
         Text_Writer(Txt_on_off[txt_to_do].Lines_On, t_norm);
         txt_to_do++;
      END

      IF (Timer[3]/10 >= 115 AND txt_to_do ==2)
         Del_Scr_Text(l_off);
         l_off = Txt_on_off[txt_to_do].Lines_Off;
         Text_Writer(Txt_on_off[txt_to_do].Lines_On, t_norm);
         txt_to_do++;
      END

      IF (auto_loc1 == 20 AND txt_to_do ==3)
         Del_Scr_Text(l_off);
         l_off = Txt_on_off[txt_to_do].Lines_Off;
         Text_Writer(Txt_on_off[txt_to_do].Lines_On, t_norm);
         txt_to_do++;
      END

      IF (level_items == TRUE AND txt_to_do ==4)
         Del_Scr_Text(l_off);
         l_off = Txt_on_off[txt_to_do].Lines_Off;
         Text_Writer(Txt_on_off[txt_to_do].Lines_On, t_norm);
         txt_to_do++;
      END

      IF (level_timer >= 28 AND bad_on_screen == 0 AND txt_to_do ==5)
         Del_Scr_Text(l_off);
         l_off = Txt_on_off[txt_to_do].Lines_Off;
         Text_Writer(Txt_on_off[txt_to_do].Lines_On, t_flash);
         txt_to_do++;
      END

      IF (auto_loc1 >= 39 OR (credits >= 1 AND level_timer >0))
         //game_state = gs_level_completed;
         game_state = gs_start_adv_level;
         Fade_off();
         FRAME;

         level_next = 1;
         Signal (type T_Star_Sprites, s_kill);
         Signal (type Baddie_drop, s_kill);
         Signal (type Food, s_kill);
         Signal (type item, s_kill);
         Signal (type Bubbled_player, s_kill);
         Signal (type auto_play, s_kill);

         Del_Scr_Text(l_off);

         baddie_alldie = mkill_do_nothing; //kill all baddie processes
         bubble_alldie = TRUE;             //kill all bubbles
         bubbob[0].lives = 0;

         //Kill the scroll and region as title screen doesnt use it
         stop_scroll(0);
         restore_type = complete_restore;
         tscreen_adv = TRUE; //When set to true it advances to the next title screen, and so goes to the main titles

         FRAME;
         game_state = gs_completed;
         level_type = lv_title; //needs this or main title screen wont work properly

         BREAK; //Exit the instruction level loop
      END

      FRAME;
   END

END

//Start Recording/Save the players keys when playing a game/instr/extend level
PROCESS Record_Demo(plr)
PRIVATE
    tot_size;
BEGIN
   stop_recording = FALSE; //used by the record player processes when True will stop recording the players moves

   Record_Player(plr);

   REPEAT
      IF (key(_enter)) stop_recording = TRUE; END
      FRAME;
   UNTIL (stop_recording == TRUE)

   test3 = tot_size;
//   save (instr1, OFFSET autoplay1, test3*4);

   /*
   IF (plr == 0) //save extend recordings
      save (extend_d1, OFFSET autoplay1, SIZEOF (autoplay1));
   ELSE
      save (extend_d2, OFFSET autoplay2, SIZEOF (autoplay2));
   END
   */

END


PROCESS Auto_Play(plr)
PRIVATE
     a_kill;
     keytime[5];
     key_read;
     key_nexttime;
     timer_val;
BEGIN

    REPEAT
        FRAME;
    UNTIL (game_state == gs_level_go)

//Read the time to start auto play
    IF (plr == 0)
        auto_loc1 = 0; //global plr1 place in the autoplay arrays
        key_nexttime = autoplay1[auto_loc1].time_on; //player 1 start moving at this time
    ELSE
        auto_loc2 = 0; //global plr2 place in the autoplay arrays
        key_nexttime = autoplay2[auto_loc2].time_on; //player 2 start moving at this time
    END

//Auto Play Loop
   REPEAT
//Left
    IF (keytime[mv_left] > timer_val)
        keys_pressed[plr].pl_left = TRUE;
    ELSE
        keys_pressed[plr].pl_left = FALSE;
    END

//Right
    IF (keytime[mv_right] > timer_val)
        keys_pressed[plr].pl_right = TRUE;
    ELSE
        keys_pressed[plr].pl_right = FALSE;
    END

//Jump
    IF (keytime[mv_jump] > timer_val)
        keys_pressed[plr].pl_jump = TRUE;
    ELSE
        keys_pressed[plr].pl_jump = FALSE;
    END

//Fire
    IF (keytime[mv_fire] > timer_val)
       keys_pressed[plr].pl_fire = TRUE;
    ELSE
        keys_pressed[plr].pl_fire = FALSE;
        bubbob[plr].bubrel = TRUE;
    END

    IF (bubbob[plr].bubrel == TRUE AND keys_pressed[plr].pl_fire == TRUE)
        bubbob[plr].bubkey = TRUE;
        bubbob[plr].bubrel = FALSE;
    END

//Check for next key and read it in, if it's time to do so
   IF (key_nexttime == timer_val) //next key is due to be read in
      IF (plr == 0)//Player 1's keys
         key_read = autoplay1[auto_loc1].key_pressed;              //which key has been pressed?
         keytime[key_read] = autoplay1[auto_loc1].time_off; //store the key duration
         auto_loc1++;                 //increase array location
         key_nexttime = autoplay1[auto_loc1].time_on;   //next key due to be read on this time
      ELSE
         key_read = autoplay2[auto_loc2].key_pressed;              //which key has been pressed?
         keytime[key_read] = autoplay2[auto_loc2].time_off; //store the key duration
         auto_loc2++;                 //increase array location
         key_nexttime = autoplay2[auto_loc2].time_on;   //next key due to be read on this time
      END
   END
   timer_val++; //have to use a counter as Timer[] is crap

   FRAME;

   UNTIL (key_read == mv_exit) // OR (level_type != lv_extend OR level_type != lv_instr OR level_type != lv_demo))

END

//    mv_wait  = 0; - not used as we check the time the next key is pressed on
//    mv_left  = 1;
//    mv_right = 2;
//    mv_jump  = 3;
//    mv_fire  = 4;
//    mv_exit  = 5; //exit the auto play
//    no_key_moves = 5;

PROCESS Record_Player(plr)
PRIVATE
     key_rec[no_key_moves]; //Status of the key been recorded/not been recorded
     rec_pos[no_key_moves]; //Array position to store the duration to when the key is released
     rec_dur[no_key_moves]; //Temp Storage of the duration of the key
     keys[no_key_moves];
     arr_pos;    //position in the global recording array
     key_loop;   //to check for updates to key_rec array
     timer_val;
BEGIN

    REPEAT
        FRAME;
    //UNTIL (bubbob[plr].bubbled != TRUE) //start recording when player is no
    UNTIL (game_state == gs_level_go)

//used by the Instr and Extend screen demos
    IF (plr == 0)
      auto_loc1 = 0; //global plr1 place in the autoplay arrays
    ELSE
      auto_loc2 = 0; //global plr2 place in the autoplay arrays
    END

//Record Player Loop
    REPEAT
    //Updates From player keys to local variables for keys
    keys[mv_left]  = keys_pressed[plr].pl_left;
    keys[mv_right] = keys_pressed[plr].pl_right;
    keys[mv_jump]  = keys_pressed[plr].pl_jump;
    keys[mv_fire]  = keys_pressed[plr].pl_fire;

   timer_val++;
   //check for new key press to record
   FOR (key_loop = 1; key_loop < no_key_moves; key_loop++)

      //If the key is being pressed
      IF (keys[key_loop] == TRUE)

         IF (key_rec[key_loop] == Rec_Free) //key is not been recorded
            IF (plr == 0)
               autoplay1[arr_pos].arr_ind_loc = arr_pos;  //for displaying on screen the array index number
               autoplay1[arr_pos].time_on = timer_val;    //Store the Timer Value
               autoplay1[arr_pos].key_pressed = key_loop; //Store the key
            ELSE
               autoplay2[arr_pos].arr_ind_loc = arr_pos;  //for displaying on screen the array index number
               autoplay2[arr_pos].time_on = timer_val;    //Store the Timer Value
               autoplay2[arr_pos].key_pressed = key_loop; //Store the key
            END
            key_rec[key_loop] = Rec_Doing; //Set this to record the duration from now on until its released
            rec_pos[key_loop] = arr_pos;   //Store the array position which we are currently pointing at
            arr_pos++;                     //Array increase ready for the next key the user presses
         END

      //Not being pressed and still recording
      ELSE
         IF (key_rec[key_loop] == Rec_Doing) //clear finished recordings
            IF (plr == 0)
               autoplay1[rec_pos[key_loop]].time_off = timer_val; //Store the time off of this key
            ELSE
               autoplay2[rec_pos[key_loop]].time_off = timer_val; //Store the time off of this key
            END

            key_rec[key_loop] = Rec_Free; //Set Key to be free
         END

      END//key being pressed
   END//key loop
   test4 = arr_pos;

   FRAME;

   UNTIL (stop_recording == TRUE OR arr_pos >= 1000)

//Terminate all current recordings of keys and store these
   FOR (key_loop = 1; key_loop < no_key_moves; key_loop++)
       IF (key_rec[key_loop] == Rec_Doing) //clear finished recordings
            IF (plr == 0)
               autoplay1[rec_pos[key_loop]].time_off = timer_val; //Store the time off of this key
            ELSE
               autoplay2[rec_pos[key_loop]].time_off = timer_val; //Store the time off of this key
            END
        END
   END

//Then store stop autoplay flag at the end of the array
   IF (plr == 0)
       autoplay1[arr_pos].arr_ind_loc = arr_pos; //for displaying on screen the array index number
       autoplay1[arr_pos].time_on = timer_val;   //Store the Timer Value
       autoplay1[arr_pos].key_pressed = mv_exit; //Store the exit autoplay flag
       autoplay1[arr_pos].time_off = timer_val;
   ELSE
       autoplay2[arr_pos].arr_ind_loc = arr_pos; //for displaying on screen the array index number
       autoplay2[arr_pos].time_on = timer_val;   //Store the Timer Value
       autoplay2[arr_pos].key_pressed = mv_exit; //Store the exit autoplay flag
       autoplay2[arr_pos].time_off = timer_val;
   END

END


//To replay random bubbles
//PROCESS Record_Rnd_Bubbles()
//BEGIN
//END

PROCESS Demo_Level_Setup()
BEGIN
   game_state = gs_level_start;

   bubble_rate = 4;    //bubble speed
   bubble_time = 30; //trap bubbles time
   bad_speed = 2;           //normal run
   bad_speed2= bad_speed+2; //angry

   last_hurry = this_hurry; //hurry on last level?
   last_skel  = this_skel;  //skel on last level?
   last_umb = this_umb;     //umbrella on last level?
   this_hurry = FALSE;      //reset hurry on this new level?
   this_skel  = FALSE;      //rest skel on this level?
   this_umb = FALSE;        //umbrella on this level?
   level_stop_what = 0;     //reset the stops time. monsters for items, clock, heart, extend
   spec_weapon_go  = FALSE; //extra sprite dection for tiara stars, big lightning, necklace pinball star
   secret_num = 0;          //for secret room effects
   sr_player_died = FALSE;  //player died in the secret room
   kill_secret_eff = FALSE; //to kill off the pinball and star sprites in the secret room

   numfire  = 0; //number allowed on screen
   numwater = 0;
   numlight = 0;

   count_extra = 0;     //extend bubbles done

   level_hurry  = 45;
   level_skel   = level_hurry + 10;
   level_next   = 0; //seconds to next level

   act_hurry = level_hurry;
   act_skel  = level_skel;

   timer[1] = 0;          //next bubble delay
   timer[2] = 0;          //bubble anim delays
   timer[3] = 0;          //round timer
   timer[4] = 0;          //reset bubbled timer
   timer[5] = 0;          //flash bubbles timer

   baddie_what  = mon_norm;  //make baddies normal not angry
   level_food   = FALSE;     //food displayed?
   level_items  = FALSE;     //or item?

//   lev_ready();              //screen level info
//   Baddies_st(act_level-1);  //drop nasties onto the screen

   b_speed();                //set bubble speed
   baddie_alldie = FALSE;    //this kills all the baddie processes
   bubble_alldie = FALSE;    //this kills all the bubble processes

   bubbob[0].special_rings = 0;
   bubbob[1].special_rings = 0;
   bubbob[0].special_fireball = 0; //fireball counter
   bubbob[1].special_fireball = 0;

   bubbob[0].bubble_type = blow_normal;
   bubbob[1].bubble_type = blow_normal;

   Demo_Level_Events();

END

PROCESS Demo_Level_Events();
PRIVATE
    food_num; //food to do on this level
    baddies1;
    baddies2;
    baddies3; //for the item
BEGIN
 //level anims going? baddies dropping to start positions?
LOOP
//Start the level

    IF (game_state == gs_level_start)
        IF (bubbob[0].bubbled == TRUE OR bubbob[1].bubbled == TRUE)
           timer[3] = 0;
           timer[4] = 0;  //seconds for a the bubble delays
        ELSE
           game_state = gs_level_go;
        END
    END

//are all the anims finished and baddies in the correct positions?

    IF (game_state == gs_level_go OR game_state >= gs_level_completed)
        level_timer = timer[3]/100; //round timer in seconds
        level_timer2 = timer[4];    //seconds for a the bubble delays

      IF (timer[3]/10 == 15 AND baddies1 == FALSE)
         baddies1 = TRUE;
         Baddie_drop(ret_adjustedy(baddies_instr[0].my), 0, baddies_instr[0].mdelay);
      END

      IF (level_timer == 7 AND baddies2 == FALSE)
         baddies2 = TRUE;
         Baddie_drop(ret_adjustedy(baddies_instr[1].my), 1, baddies_instr[1].mdelay);
         Baddie_drop(ret_adjustedy(baddies_instr[2].my), 2, baddies_instr[2].mdelay);
         Baddie_drop(ret_adjustedy(baddies_instr[3].my), 3, baddies_instr[3].mdelay);
      END

      IF (level_timer == 22 AND baddies3 == FALSE)
         baddies3 = TRUE;
         Baddie_drop(ret_adjustedy(baddies_instr[4].my), 4, baddies_instr[4].mdelay);
         Baddie_drop(ret_adjustedy(baddies_instr[5].my), 5, baddies_instr[5].mdelay);
         Baddie_drop(ret_adjustedy(baddies_instr[6].my), 6, baddies_instr[6].mdelay);
         Baddie_drop(ret_adjustedy(baddies_instr[7].my), 7, baddies_instr[7].mdelay);
      END

        IF (game_state == gs_level_completed)
            game_state = gs_level_next_timer;
            level_next = level_timer + 3;
//            level_next = level_timer + next_sec ; //seconds before next level auto advances

        END

        IF (level_next != 0) //Level next timer set
            IF (level_timer > level_next-6)
                bubble_alldie = FALSE; //kill all the bubbles end of level and do falling food!!
            ELSE
                bubble_alldie = TRUE;
            END

            IF (level_timer >= level_next) //set to advance to next level
                //last_completed_time = level_timer;
                game_state = gs_start_adv_level;
                level_next = 0;       //reset next level timer
                level_advance = 1;    //one level advance by one screen
            END
        END

        IF (level_timer == time_food+4 AND level_food == FALSE)
           level_food = TRUE; //food has been displayed on level
           food_num = RAND(20,51); //Demo Level Food
           //now display food to screen
           Food (ret_adjustedx2(179), ret_adjustedy2(184), food_num, fd_norm);
        END
        //FOOD END

        //Do ITEM for instr level Star Tiara

        IF (level_timer == 20 AND level_items == FALSE)
           level_items = TRUE;     //set item to has been displayed on level
           item_num = 26;
           Item (ret_adjustedx2(61), ret_adjustedy2(64), item_num);
         END

      IF (player_died == TRUE)
         //load updated times for hurry from timers value at this time
         act_hurry = level_timer + level_hurry;
         act_skel  = level_timer + level_skel;
         IF (baddie_what == mon_angry)
              baddie_what = mon_norm; //back to normal
         END
         player_died = FALSE;     //ok done event now restart timer

      END
    END

    IF (game_state == gs_exit OR level_type != lv_instr) BREAK; END

test = level_timer;
   FRAME;
END

END //Demo Level Events process

//Start of game animation with bubbles and bubbled Dinos bobbling around
//uses
//    intro_screen = 16;    //the star scape graphic - in Titles FPG
//    intro_text = 52;     //text for the screen
//    intro_bubbles = 100; //clear intro bubble graphic
PROCESS Do_Intro_Screen();
PRIVATE
   dinoids[1];
   next_bubble;
   text_del;
   timer_tst;
   rot_id;
BEGIN
//Fade Screen
   fade_off();
   FRAME;
//delete score text from screen

   delete_text(all_text);
   restore_type = partial_restore;        //speeds the game up conciderably

   file = titlesfile;   //Title screen file pointer also holds big baddies
// put intro stars screen
   put_screen(blocksfile, scr_Stars); //Blocks FPG

//Bubbled Dinos
   Dino_Intro(1);
   Dino_Intro(2);
   dinoids[0] = get_id (type Dino_Intro);
   dinoids[1] = get_id (type Dino_Intro);
   Titles_timer = 0;

//   do bubble field
     bubble_spitter();
//fade screen on
     fade_on();
     FRAME;

     Timer[1] = 0;

//   Rotate palette Purple for twinkling stars
     rotate_palette (241, 248, intro_rotate_delay); // Start_Col, End_Col 241-248
     rot_id = get_id (type rotate_palette);

//   zooming title text
     intro_txt(320,40, 62);
//Do Music
     s_trigger[e_bbstart] = TRUE;

     REPEAT
        Titles_timer = timer[1]/10;
        FRAME;
     UNTIL (Titles_timer >= 70) //kill local var is altered by the rotate palette function when its completed
     signal(rot_id, s_kill);

     fade(10,10,10,1);
     REPEAT
         FRAME;
     UNTIL (fading == FALSE)

     restore_type = complete_restore; //complete
     clear_screen();
     FRAME;

//   kill dino intro processes
     signal (dinoids[0], s_kill);
     signal (dinoids[1], s_kill);

//to quit the loop waiting on this finishing
   intro_finished = TRUE;

//***DINO SET UP*** - needs the code from the main loop


END

//Zooms the Intro Text towards the screen getting bigger
PROCESS Intro_txt(xloc, yloc, an_start)
PRIVATE
    size_del;
    size_ad;
    y_sp;
BEGIN
    file = titlesfile;

    x = 320;
    ypos = 240;
    //z = zpri;

    GRAPH = an_start;
    size = 0;
    y_sp = -20;
    REPEAT

      ymov +=y_sp;
      y = ypos + ymov/10;
      size += 2;

       FRAME;
    UNTIL (size > 180)

    IF (an_start < 65) intro_txt(xloc, yloc, an_start+1); END
END

//Does Dino Start Animation
PROCESS Dino_Intro(plr)
PRIVATE
    x_pos;
    y_pos;

    me_deg;  //degrees 0-360
    x_dist;
    y_dist;
    rot_dir; //0= anti-clockwise 1=clockwise
    rot_speed;
    an_start; //animation variables
    an_frames;
    an_count;
    an_delay;
    fcount;
BEGIN
    file = sprites;
    an_start  = bubanim[0].a_start; //animation bubbled dino start
    an_frames = bubanim[0].a_end;   //number of frames

    IF (plr == 1) //player 1
      x_pos = x_p1_intro;
    ELSE
      x_pos = x_p2_intro;
      an_start +=b_offset; //alter for blue player
      rot_dir = 1;         //0= anti-clockwise 1=clockwise
      me_deg = 180-2;
    END
    y_pos = y_intro;
    z = 30;

    fcount = an_start;
    rot_speed = 2;
    LOOP

    GRAPH = fcount;

    IF (plr == 2) //player 2 = clockwise
       me_deg+= rot_speed;
      IF (me_deg > 360) me_deg = 0; END
    ELSE
      me_deg-= rot_speed;   //player 1 = anti-clockwise
      IF (me_deg < 0) me_deg = 360; END
    END

    x_dist = get_distx((me_deg*k), 24);
    y_dist = get_disty((me_deg*k), 24);

    x = x_dist + x_pos;
    y = y_dist + y_pos;

    an_count++;
    an_delay++;

    IF (an_delay > 10)
       an_delay = 0;
       fcount++; //change current frame

       IF (fcount => an_start + an_frames) //frame number over end of animation
          fcount = an_start; //reset animation
       END
    END

    FRAME;

    END//Loop

END

//This process has no graphic is a hidden process which gets rotated in a circle
//to spit bubbles
PROCESS Bubble_Spitter()
PRIVATE
    x_pos;
    y_pos;
    me_deg;
    x_dist;
    y_dist;
    bub_del;
    bub_timer;
    bub_time_max;
    bub_next;
    bub_dir;
BEGIN

    x = x_scr_middle; //middle of the screen
    y = y_scr_middle;
    xpos = x;
    ypos = y;

    bub_time_max = 5;
    bub_next = 2;
    bub_dir = 1;

    REPEAT

    IF (Titles_timer == 30) bub_dir = 2; END

    IF (bub_dir ==1)
       IF (Titles_timer > bub_next)
            bub_next = Titles_timer + 4;
            IF (bub_time_max> 1) bub_time_max--; END
       END
    ELSE
       IF (bub_timer >= bub_next)
            bub_next = Titles_timer;
            IF (bub_time_max<= 5) bub_time_max++; END
       END
    END

    IF (bub_del >= bub_time_max)
      me_deg += rand (0, 360);
      x_dist = get_distx((me_deg*k), rand (35,55));
      y_dist = get_disty((me_deg*k), rand (35,55));

      x = x_dist + x_pos;
      y = y_dist + y_pos;

      bubble_intro(x_dist, y_dist);

      bub_del = 0;
    END
    bub_del++;

    FRAME;

    UNTIL (Titles_timer > 60)

END

PROCESS Bubble_Intro(x_sp, y_sp)
PRIVATE
    x_sp;
    y_sp;
//    dist;
//    b_angle;

    x_pos;
    y_pos;
//    me_deg;
    alive_time;
BEGIN
    file = sprites;

    x = x_scr_middle; //middle of the screen
    y = y_scr_middle;
    z = 30;
    xpos = x;
    ypos = y;
    size = 30;

    //Does Rainbow intro bubbles if cheat mode is on
    IF (cheat_mode == TRUE)
        GRAPH = rand (rainbow_bubbles,rainbow_bubbles+5); //rainbow intro bubble graphic
    ELSE
        GRAPH = intro_bubbles; //clear bubble
    END

    REPEAT

    IF (x <0 OR x => 680) BREAK; END
    IF (y< y_up_start OR y > 480) BREAK; END

      xmov +=x_sp;
      ymov +=y_sp;

      x = xpos + xmov/10; //divide by 10 to get a angle
      y = ypos + ymov/10;
      alive_time++;

    IF (alive_time MOD 2 == 0)
       size+= 2;
    END

    IF (size >90)
      IF (x_sp<0) x_sp--; END
      IF (x_sp>0) x_sp++; END
      IF (y_sp<0) y_sp--; END
      IF (y_sp>0) y_sp++; END

    END

       FRAME;
    UNTIL (kill == TRUE)

END


//rotates the pallette
PROCESS Rotate_Palette (Start_Col, End_Col, Rot_Delay);
PRIVATE
   pal_rot_count; //Where the palette is
   pal_at_start;  //palette has looped T/F
   pal_end_count; //count of how many colours to shift
   pal_del_count;  //delay to slow down the shifting of the colours
BEGIN
      pal_rot_count = 0; //where the palette is
      pal_end_count = End_Col - Start_col;
      REPEAT
         pal_del_count++; //palette rotation timer delay increase

         //Rotation delay
         IF(pal_del_count >= Rot_Delay)
            roll_palette(Start_Col,End_Col - Start_col,1); //move the palette
            pal_rot_count++;    //increase the colour rotation count by 1
            pal_del_count = 0;  //reset the delay counter
            IF (pal_rot_count >= pal_end_count) pal_rot_count = 0; END
         END

      FRAME;

      UNTIL ((father.kill == TRUE OR kill == TRUE) AND pal_rot_count == 0) //have to check for seconds then
                                                            //to see if the rotation has finishe
    father.kill = TRUE; //we are finshed rotating the palette and the timer has reached the correct time
    FRAME;

END



//returns X position on screen of screen text
//input:  x block location, output: x pos on screen
PROCESS Ret_Xtext(x_in);
BEGIN
//x screen pos, block resolution, x block pos
    RETURN (x_txt_st + block_res * x_in);
END

//returns position on screen of screen text
PROCESS Ret_Ytext(y_in);
BEGIN
//x screen pos, block resolution, x block pos
    RETURN (y_txt_st + (block_res+2) * y_in);
END

PROCESS ret_ytext2(y_in);
BEGIN
//x screen pos, block resolution, x block pos
    RETURN ((y_txt_st + (block_res+2) * y_in)-4);
END

PROCESS Act_Level_Setup()
PRIVATE
   plr_count;
BEGIN

   IF (level_type != lv_demo AND level_type != lv_boss)
      level_type = lv_normal;
   END

   bubble_rate  = levels[act_level-1].bub_speed; //rate of bubble movement
   bubble_time  = levels[act_level-1].bubbled_time; //trap bubbles time from level array
   B_Speed();                //set bubble speed

   last_hurry = this_hurry; //hurry on last level?
   last_skel  = this_skel;  //skel on last level?
   last_umb = this_umb;     //umbrella on last level?
   this_hurry = FALSE;      //reset hurry on this new level?
   this_skel  = FALSE;      //rest skel on this level?
   this_umb = FALSE;        //umbrella on this level?
   level_stop_what = 0;     //reset the stops time. monsters for items, clock, heart, extend
   spec_weapon_go  = FALSE; //extra sprite dection for tiara stars, big lightning, necklace pinball star
   secret_num = 0;          //for secret room effects
   sr_player_died = FALSE;  //player died in the secret room
   kill_secret_eff = FALSE; //to kill off the pinball and star sprites in the secret room

   numfire  = levels[act_level-1].fire;    //number allowed on screen
   numwater = levels[act_level-1].water;
   numlight = levels[act_level-1].light;

   count_extra = 0;     //extend bubbles done

   level_hurry  = levels[act_level-1].hurry_time;
   level_skel   = level_hurry + levels[act_level-1].bubba_time;
   level_next   = 0; //seconds to next level

   act_hurry = level_hurry; //Hurry up on this time, seconds
   act_skel  = level_skel;  //Skel appears on this time, seconds

   timer[1] = 0;          //next bubble delay
   timer[2] = 0;          //bubble anim delays
   timer[3] = 0;          //round timer
   timer[4] = 0;          //reset bubbled timer
   timer[5] = 0;          //flash bubbles timer

   baddie_what  = mon_norm;  //make baddies normal not angry
   level_food   = FALSE;     //food displayed?
   level_items  = FALSE;     //or item?

   IF (level_type != lv_boss)
      //LEVELS 1-99
      lev_ready();              //screen level info
      Baddies_st(act_level-1);  //drop nasties onto the screen
      item_num = Item_Find();   //get which item to use
   ELSE
      //LEVELS 100
      item_num = 54; //lightning potion for level 100;
      End_Level_Events();
      game_state = gs_level_start;
      GF_End(0);
      GF_End(1);
      Boss_Baddie();
   END

   baddie_alldie = FALSE;    //this kills all the baddie processes
   bubble_alldie = FALSE;    //this kills all the bubble processes

//   bubbob[0].bubble_type = blow_normal;
//   bubbob[1].bubble_type = blow_normal;

   level_fall_food(act_level); //determine if this is a falling food level - all normal bubbles to food

   spec_Items[28].counter++; //levels started counter for item necklace

//Reset Rings and check for Fire Bubble collection
   FOR (plr_count = 0; plr_count < 1; plr_count++)
      bubbob[plr_count].special_rings = 0;    //Clear Purple, Cyan and Red Rings
      bubbob[plr_count].special_fireball = 0; //fireball counter

      IF (bubbob[plr_count].special_fbcount > 0)  //Firebubble gives fireball for 5 Rounds
         bubbob[plr_count].special_fbcount--;     //decrease on level
         bubbob[plr_count].special_fireball = 16; //set player to fireball
      END
   END

   IF (item_num != 999 AND got_bell == TRUE) //Do animation if there is a special item to be done
    // Bell item collected
        bell(20);
   END

END

PROCESS Speed_Adj (bspeed)
//returns the add number to detect the correct distance from the plafforms
//IN: bubble add speed
//OUT: add amount
BEGIN
    RETURN  ((bspeed / 2) + bspeed MOD 2);
END

//    B_Potion_Dis = 0; //Display to screen
//    B_Potion_Scr = 1; //On screen
//    B_Potion_Col = 2; //Collected by the player

//LEVEL 100 Events
PROCESS End_Level_Events()
PRIVATE
    food_num; //food to do on this level
    id2; //to check to see if item is already present on the screen
    id3; //for other players potion
    //id2 and id3 reused to move the dinos at the end
    plr_loop; //for clearing the movement array
    plr_alive[1];
    scr_t_num; //for scrolling text, holds how many lines put to the screen
    s_timer;   //scroll timer in seconds
BEGIN
 //level anims going? baddies dropping to start positions?
   s_trigger[e_boss] = TRUE;

   bosspotion[0] = B_Potion_Dis;
   bosspotion[1] = B_Potion_Dis;

REPEAT
//Start the level

    IF (game_state == gs_level_start)
        game_state = gs_level_go;
        //Random_Bubble();       //bubbles from top/bottom of screen
        timer[3] = 0;
        timer[4] = 0;  //seconds for a the bubble delays
    ELSE

//are all the anims finished and baddies in the correct positions?
        level_timer = timer[3]/100; //round timer in seconds
        level_timer2 = timer[4];    //seconds for a the bubble delays

        IF (game_state == gs_level_completed)
            timer[3] = 0;
            timer[4] = 0;  //seconds for a the bubble delays
        END

        //Player 1 Potion
        IF (bosspotion[0] == B_Potion_Dis) //Display to screen
            Item (ret_adjustedx2(levels[act_level-1].foodx), ret_adjustedy2(levels[act_level-1].foody), item_num);
            level_food = TRUE;
            bosspotion[0] = B_Potion_Scr; //On screen
        END

        //Player 2 Potion
        IF (bosspotion[1] == B_Potion_Dis) //Display to screen
            Item (ret_adjustedx2(levels[act_level-1].itemx), ret_adjustedy2(levels[act_level-1].itemy), item_num);
            bosspotion[1] = B_Potion_Scr; //On screen
        END

        //HIGH SCORE
        IF (bubbob[0].score > Hi_score) Hi_score = bubbob[0].score; END
        IF (bubbob[1].score > Hi_score) Hi_score = bubbob[1].score; END
 END //IF Level go


 FRAME;
 //Players on screen <= 0

UNTIL (game_state == gs_level_completed OR Players_on_screen <= 0) //Player died or game completed

   IF (Players_on_screen <= 0)
       Signal (type Boss_baddie, s_kill);
       Signal (type GF_End, s_kill);
       Game_End_Reset();
      RETURN;
   END

   level_type = lv_end;
   spec_Items[29].counter++; //purple treasure chest = completed game

//Kill The keys
   Signal (TYPE Do_keys, s_kill);
   Signal (TYPE Game_loop, s_kill);
   Signal (TYPE Topborder, s_kill);

   Put_Scroll_Text(27); //put the scroll text to screen

//Clear last moves from movement array
   FOR (plr_loop = 0; plr_loop <= 1; plr_loop++)
       keys_pressed[plr_loop].pl_right = FALSE;
       keys_pressed[plr_loop].pl_left  = FALSE;
       keys_pressed[plr_loop].pl_jump  = FALSE;
       keys_pressed[plr_loop].pl_fire  = FALSE;
   END

   bubble_alldie = TRUE;

   LOOP
      IF (game_state == gs_comp_crack) BREAK; END
      FRAME;
   END

//Crack Celing - GF break bubble triggers now
   TS_BlockCrack (64, 48, 0);
   TS_BlockCrack (129, 48, 1);
   TS_BlockCrack (193, 48, 2);
   TS_BlockCrack (273, 48, 3);
   TS_BlockCrack (335, 48, 4);
   TS_BlockCrack (385, 48, 5);

   LOOP
      FRAME;
      IF (ani_finish >=6) BREAK; END //Wait till all completed
   END

//Dino Fall
   game_state = gs_comp_girlf;

   TS_BlockFall(92 , 48, 0, 0);
   TS_BlockFall(159, 48, 1, -10);
   TS_BlockFall(223, 48, 2, 0);
   TS_BlockFall(294, 48, 3, 0);
   TS_BlockFall(366, 48, 4, 10);
   TS_BlockFall(427, 48, 5, 0);
   TS_BlockFall(490, 48, 6, 0);


   DinoFall(0);
   DinoFall(1);

//Remove blocks from background
//TO DO
   ani_finish = 0;
   LOOP
       IF (ani_finish >= 2) BREAK; END
   FRAME;
   END

   game_state = gs_comp_dino_mv;
   IF (Player_alive(0) == TRUE)
      bubbob[0].level_reached = 101;
   END

   IF (Player_alive(1) == TRUE)
      bubbob[1].level_reached = 101;
   END

//check that both dinos are alive
   IF (players_on_screen !=2)
        //find which one to make alive
        IF (bubbob[1].sprite_id == 0)
            man(1);
        END

        IF (bubbob[0].sprite_id == 0)
            man(0);
        END
   END
//move across to girfriend
   ani_finish = 0;

   Dino_move(0);
   Dino_move(1);
   LOOP
       IF (ani_finish >= 2) BREAK; END
      FRAME;
   END

   game_state = gs_comp_human;
   FRAME (5000);
   ani_finish = 0;
   game_state = gs_comp_kiss;

   rotate_palette (248,254,5);

//End Writing
   Static_Anim(x_scr_middle, y_scr_middle, pri_endwrit, 656); //Big Heart
   Static_Anim(x_scr_middle, y_million, pri_endwrit, 658); // 1 million
   Static_Anim(x_happy1, y_happy, pri_endwrit, 659); // Happy End Left
   Static_Anim(x_happy2, y_happy, pri_endwrit, 659); // Happy End Right

   Static_Anim(x_heart1, y_heart, pri_endwrit, 657); // Happy End Left
   Static_Anim(x_heart2, y_heart, pri_endwrit, 657); // Happy End Right

   LOOP
      IF (ani_finish >= 2) BREAK; END
      FRAME;
   END

   map_xput(blocksfile, scr_graf, grpclr_end, 32, drawloc , 0, 100, 0);
   convert_palette(blocksfile, scr_graf, offset pal); //clear the screen
   refresh_scroll(0); //update the scroll display buff

   Delete_text (lev_txt); //get rid of level number

   cur_level = 101; //For level all on highscore and level reached screen
   Signal (type player_lives, s_kill);
   Signal (type player_lives, s_kill);

   Dissolve_screen(); //Do Disolve blocks animation and put a line of stars to screen

   game_state = gs_comp_roof;

   LOOP
   IF (game_state == gs_comp_comet) BREAK; END
        FRAME;
   END

   Comet();

//Wait before sending bubbles off the screen
   FRAME(10000);

   game_state = gs_comp_buboff;
   ani_finish = 0;

//Wait till bubbles go off the screen
   LOOP
      IF (ani_finish >= 2) BREAK; END
      FRAME;
   END
   fade_off();
   FRAME;

//get rid off static animations
   Signal (type Static_Anim, s_kill);
   restore_type = complete_restore;
   fade_on();

//kill the rotate pallette process
   id3 = get_id(type rotate_palette);
   id3.kill = TRUE;

//End Text
   timer[9] = 0;
   test_info();

   Scroll_the_text();

   LOOP
      s_timer = timer[9]/100;   //scroll timer in seconds
      test = s_timer;

      IF (s_timer > stext_secs OR
          (s_timer > 5 AND key(_space))) BREAK; END //check for how long we have been scrolling

      FRAME;
   END
//Kill the scroller, which clears the scroll array as well
   Signal (type Scroll_the_text, s_kill);

//Fade The Screen
   fade(0,0,0,2);

   REPEAT
      FRAME;
   UNTIL (fading == FALSE)

   Do_keys();

//Rest the game variables and advance to enter score screen
   Game_End_Reset();
   players_on_screen = 0;

END //PROCESS level events


//advances a graphic down the screen black in colour removing a block at a time
//the background in a disolve/crumble. the star screen is put to it a 16 line at a time
PROCESS Dissolve_screen()
PRIVATE
    an_start;
    an_count;
    an_frame;

    y_dest;
    y_orig;
BEGIN
    do_music = TRUE;

    s_trigger[e_complete] = TRUE;

    file = sprites;
    x = x_def-48;
    y = 0;
    z = pri_disolve;

    region = 1;

    y_dest = drawloc-48;

    REPEAT //disolve anim
      an_frame = end_disolve;
      an_count = 0;
      REPEAT
         GRAPH = an_frame;
         an_count++;
         an_frame++;
         FRAME (250);

      UNTIL (an_count >=8)
    y+=16;

    //Copies star screen to the foreground screen effectively rubnbing ou all the screen
    //only a 16 band
    map_block_copy(blocksfile, scr_graf, 0, y_dest, scr_Stars, 0, y_orig, 640, 16);
    y_dest += block_res;
    y_orig += block_res;
    refresh_scroll(0);                                 //update the scroll display buff

    UNTIL (y>=480)

    game_state = gs_comp_comet;

END


//Move to girfriend, cloud appear then human
PROCESS Dino_move(plr)
PRIVATE;
    movetox;
    id2;
    ani_count;
    an_frame;
BEGIN
    id2 = bubbob[plr].sprite_id;
    file = sprites;

    IF (plr == 0)
        movetox = 202;
        IF (id2.x < movetox) xmov = mv_right; END
        IF (id2.x > movetox) xmov = mv_left; END
    ELSE
        movetox = 430;
        IF (id2.x < movetox) xmov = mv_right; END
        IF (id2.x > movetox) xmov = mv_left; END
    END

    LOOP
        IF (xmov == mv_left)
           IF (movetox >= id2.x)
               keys_pressed[plr].pl_left  = FALSE;
               BREAK;
           ELSE
               keys_pressed[plr].pl_left = TRUE;
           END
        END

        IF (xmov == mv_right)
           IF (movetox <= id2.x)
               keys_pressed[plr].pl_right  = FALSE;
               BREAK;
           ELSE
               keys_pressed[plr].pl_right = TRUE;
           END
        END

    FRAME;
    END //move loop

   Signal (id2, s_kill); //Kill Dino Sprite
   bubbob[plr].sprite_id = 0; //Clear the sprite id
   father.ani_finish++;

//Show the dino facing the girlfriend
   x = id2.x;
   y = id2.y;
   IF (plr == 0)
       GRAPH = bubanim[1].a_start;
       FLAGS = 1;
   ELSE
       GRAPH = bubanim[1].a_start + b_offset;
   END

//wait for both to face girlfriend
   LOOP
      FRAME;
      IF (game_state == gs_comp_human) BREAK; END
   END

   an_frame = 402;

//do cloud appear animation
   LOOP
     GRAPH = an_frame;
     IF (ani_count >=4) BREAK; END
     FRAME (1000);
     ani_count++;
     an_frame++;
   END

//now human form - man
   IF (plr == 0)
       GRAPH = gr_man;
   ELSE
       GRAPH = gr_man + bl_add;
   END

//Wait for a delay from main events
   LOOP
       FRAME;
       //Kill when kiss animation go
       IF (game_state == gs_comp_kiss) BREAK; END
   END

END //PROCESS move dino


PROCESS DinoFall(plr)
PRIVATE
   id2;
BEGIN

   IF (bubbob[plr].sprite_id == 0) RETURN; END

   id2 = bubbob[plr].sprite_id;
   IF (y >= 431) RETURN; END

   file = sprites;
   x = id2.x;
   y = id2.y;
   flags = id2.flags;

   //sleep
   signal (id2, s_sleep);
   //facing?

   IF (plr == 0)
       GRAPH = bubanim[1].a_start;
   ELSE
       GRAPH = bubanim[1].a_start + b_offset;
   END

   LOOP
      IF (y < 431)
           y+=2;
      ELSE
           BREAK;
      END

      FRAME;
       //until = 430;
   END
   id2.ypos = 430; //update dinos y
   signal (id2, s_wakeup);

//   awake

END

PROCESS TS_BlockCrack(x , y, num)
PRIVATE
   yst;
   ani_count;
   an_frame;
   del_frame;
BEGIN
   file = sprites;
   yst = y;

   x += 91; //xscrren crack start

   an_frame = end_cracks+(num*4);
   GRAPH = end_cracks+(num*4);
   ani_count = 1;

   del_frame = rand(0,5000);

   FRAME (del_frame); //Delay starting

   LOOP
       GRAPH = an_frame;
       IF (ani_count >=4) BREAK; END

       FRAME (1000);
       ani_count++;
       an_frame++;
   END
   father.ani_finish++;

//Wait for others to finish
   LOOP
      FRAME;
      IF (game_state == gs_comp_girlf) BREAK; END
   END

END

PROCESS TS_BlockFall(x , y, num, pri)
PRIVATE
   y_speed;

   del_frame; //delay start by using a frame rate

BEGIN
   region = 1;
   file = sprites;
   z = pri;

   GRAPH = end_blocks+num;

   LOOP
       IF (game_state == gs_comp_roof) BREAK; END
       IF (key (_space)) BREAK; END

       FRAME;
   END
   del_frame = rand(0,5000);
   FRAME (del_frame); //Delay starting

   LOOP
       y+= y_speed/10;
       IF (y_speed < 800)
          y_speed+=1;
       END

       IF (y > 480) BREAK; END
       FRAME;
   END
   father.ani_finish++;

END

//Does GF, Comet, Bubble off end of game
PROCESS GF_End(plr)
PRIVATE
    x_pos;
    y_pos;

    me_deg;  //degrees 0-360
    x_dist;
    y_dist;
    rot_speed;
    an_start; //animation variables
    an_frames;
    an_count;
    an_delay;
    fcount;

    a_break;
    y_speed;

    id2; //used to let end level events know of animation
    id3; //for bubble sprite at the end

    n_scr_lines; //for calling the scroll text routine
    scr_timer;   //scroll timer

BEGIN
    file = sprites;
    an_start  = trapped_gph; //animation bubbled dino start
    an_frames = 2;   //number of frames

    IF (plr == 0)      //player 1s gf
      x_pos = x_p1_gf;
      me_deg = 180-2;
    ELSE
      x_pos = x_p2_gf;
      an_start +=2 ;   //alter for blue player
    END
    y_pos = y_gf;

    z = pri_gf;

    fcount = an_start;
    rot_speed = 4; //rotation speed
    LOOP

      GRAPH = fcount;

      IF (plr == 0) //player 2 = clockwise
         me_deg+= rot_speed;
         IF (me_deg > 360) me_deg = 0; END
      ELSE
         me_deg-= rot_speed;   //player 1 = anti-clockwise
         IF (me_deg < 0) me_deg = 360; END
      END

      x_dist = get_distx((me_deg*k), 16);
      y_dist = get_disty((me_deg*k), 16);

      x = x_dist + x_pos;
      y = y_dist + y_pos;

      an_count++;
      an_delay++;

      IF (an_delay > 10)
       an_delay = 0;
       fcount++; //change current frame

         IF (fcount => an_start + an_frames) //frame number over end of animation
            fcount = an_start; //reset animation
         END
      END

      FRAME;

        IF (game_state == gs_comp_crack) BREAK; END

    END//Loop


    s_trigger[e_glass] = TRUE;

    fcount = gr_girl;

//place g/f break bubble in the right place on the screen
    IF (plr == 0)
        x = 172;
    ELSE
        x = 460;
    END

    IF (plr == 0)
      Anim(x, y, gf_green_break, 4, 40, 10, 0);
    ELSE
      Anim(x, y, gf_green_break+gf_break_add, 4, 40, 10, 0);
      fcount += bl_add;
    END

    GRAPH = fcount;

    LOOP
       FRAME;

       IF (ani_finish != 0) //Anim 2 increase ani_finish when it terminates and will advance down screen
           IF (y < 431)
                y+=2;
           ELSE
              BREAK;
           END
       END
    END

    y = 431; //on the screen line
    id2 = get_id (type End_Level_Events);

    id2.ani_finish++;

    LOOP
       FRAME;
       IF (game_state == gs_comp_human) BREAK; END
    END

    //Smile Graphic - seen boyfriend
    GRAPH++;

    LOOP
       FRAME;
       IF (game_state == gs_comp_kiss) BREAK; END
    END

    an_count=0;

    //hold hands then kiss
    REPEAT
      GRAPH++;
      an_count++;
      FRAME (2000);
    UNTIL (an_count >2)

    id2.ani_finish++; //Tell End of level events animation finished
    LOOP
        IF (game_state == gs_comp_comet) BREAK; END
        FRAME;
    END

    IF (plr == 0)
        Anim2(x+8, y, 0, 212, 2, 10);
        an_delay = 1000;
    ELSE
        Anim2(x, y, 0, 212, 2, 10);
        an_delay = 5000;
    END

//Bubble exit screen
    LOOP
        IF (game_state == gs_comp_buboff) BREAK; END
        FRAME;
    END

    FRAME (an_delay); //delay bubble move off screen differently for each player


    REPEAT
       y -= y_speed/10;
       son.y -= y_speed/10;

       IF (y_speed < 800)
          y_speed+=1;
       END

        FRAME;
    UNTIL (y <= -100)

    signal (son, s_kill);

    id2.ani_finish++;

END //PROCESS Girl Friend End

//    gf_green_break = 661;
//    gf_break_add = 3;
//    gr_man      = 767;
//    gr_girl     = 768;
//    gf_together = 770;
//    bl_add = 6;        //get other player graphics by adding this



PROCESS Level_Events()
PRIVATE
    food_num; //food to do on this level
BEGIN
 //level anims going? baddies dropping to start positions?
LOOP
//Start the level

    IF (game_state == gs_level_start)
        IF (bubbob[0].bubbled == 0 AND bubbob[1].bubbled == 0)
           game_state = gs_level_go;
           Random_Bubble();       //bubbles from top/bottom of screen
           timer[3] = 0;
           timer[4] = 0;  //seconds for a the bubble delays
           Enter_Coin_Dino();
        END
    END

//are all the anims finished and baddies in the correct positions?

    IF (game_state == gs_level_go OR game_state >= gs_level_completed)
        level_timer = timer[3]/100; //round timer in seconds
        level_timer2 = timer[4];    //seconds for a the bubble delays

        IF (level_stop_what == stop_heart)
           IF(level_timer > heart_timer)
               baddie_what = mon_norm; //baddies back to normal
               level_stop_what = 0;    //unfreeze the monsters
               heart_timer = 0;
           END
        END

        IF (game_state == gs_level_completed)
            game_state = gs_level_next_timer;
            level_next = level_timer + next_sec ; //seconds before next level auto advances
        END

        IF (level_next != 0) //Level next timer set
            IF (level_timer > level_next-6)
                bubble_alldie = FALSE; //kill all the bubbles end of level and do falling food!!
            ELSE
                bubble_alldie = TRUE;
            END

            IF (level_timer == level_next-7)
                score_match_check();    //falling food score matched
            END

//EDIT THIS OUT TO STOP LEVEL ADVANCE
            IF (level_timer >= level_next) //set to advance to next level
                last_completed_time = level_timer;
                game_state = gs_start_adv_level;
                level_next = 0;       //reset next level timer
                level_advance = 1;    //one level advance by one screen

                IF (extra_items == TRUE)
                   IF (lev_multi == FALSE) //trap nasties item
                       missed_multi++;
                       IF (missed_multi >=3) //missed multi pop of 3 or more for 3 levels in a row
                          missed_multi = 0;
                          spec_items[56].counter++;
                       END
                   END
                   lev_multi = FALSE;

                   IF (got_extend == FALSE) //no extend letter this level
                      spec_items[60].counter++;
                   END
                   got_extend = FALSE;
                END

            END

        END

        IF ((level_timer == time_food OR (got_crystal_ball == TRUE AND level_timer ==2))
            AND level_food == FALSE)
           level_food = TRUE; //food has been displayed on level

        food_num = 1; //food to do on this level default to 1 incase of errors

        //FOOD to display on this screen
        //atract/demo code
           IF (level_type == lv_demo)
               food_num = RAND(20,51); //Demo Level Food
           ELSE
               //Normal Level
           IF (act_level == 1)    //actual level counter is level 1
               food_num = RAND(21,38);
           ELSE
               IF (last_skel == TRUE)
                   food_num = food_SHU_Last(1); //1 = skel
               ELSE
                    IF (last_hurry == TRUE)
                        food_num = food_SHU_Last(2); //2 = hurry
                    ELSE
                        IF (last_umb == TRUE)
                            food_num = food_SHU_Last(3); //2 = umbrella
                        ELSE

                            IF (players_on_screen == 1) //One Player game
                                IF(last_completed_time > 29) last_completed_time = 29; END
                                food_num = 49 - last_completed_time;
                            ELSE                        //Two player game
                                IF(last_completed_time > 39) last_completed_time = 39; END
                                food_num = 59 - last_completed_time;
                            END
                        END
                    END
               END
           END
               IF (food_num == 0) //to stop a error if it cannot find a food from algorithm above
                  food_num = 1;
               END

           END

           //now display food to screen
           Food (ret_adjustedx2(levels[act_level-1].foodx), ret_adjustedy2(levels[act_level-1].foody), food_num, fd_norm);
        END
        //FOOD END

        //HIGH SCORE
        IF (bubbob[0].score > Hi_score) Hi_score = bubbob[0].score; END
        IF (bubbob[1].score > Hi_score) Hi_score = bubbob[1].score; END

        IF ((level_timer == time_item OR (got_crystal_ball == TRUE AND level_timer ==2))
        AND level_items == FALSE AND level_next == 0)
           level_items = TRUE;     //set item to has been displayed on level
//TEST RANDOM ITEM
//item_num = 18;//blue cross

//item_num = 6;  //8); //umbrellas

//item_num = RAND (29, 33); //chests
//item_num = RAND (34, 39); //canes
//item_num = 4;  //clock
//item_num = 25; //book
//item_num = 5;  //bomb
//item_num = 28; //pinball star
//item_num = 19; //lightning big
//item_num = 23; //purple lantern
//item_num = 14; //heart
//item_num = RAND (9, 13); //potions
//item_num = 45;//secret room

//item_num = 50;

           IF (item_num != 999)    //999 means none found, others point to an index number of a item
               Item (ret_adjustedx2(levels[act_level-1].itemx), ret_adjustedy2(levels[act_level-1].itemy), item_num);
           END
         END //Items

IF (level_stop_what < stop_monsters) //Clock item or potion dont do hurry up or skel
      //this to get rid of skel and hurry straight away
      IF (pl_died_skhurry == FALSE AND game_state == gs_level_go)

        //HURRY UP! time reached
        IF (level_timer == act_hurry AND level_type == lv_normal) //no hurry on a potion or secret room
            IF (get_id(type lev_hurry) == 0)
                this_hurry = TRUE; //set hurry displayed for food on next level
                Lev_Hurry();
            END
        END

        IF (level_timer == act_skel AND (level_type == lv_secret OR level_type == lv_normal))
            this_skel = TRUE; //set skel displayed for food on next level
            do_skels ();      //make skels appear
        END
      END
END

      IF (player_died == TRUE)
         //load updated times for hurry from timers value at this time
         act_hurry = level_timer + level_hurry;
         act_skel  = level_timer + level_skel;
         baddie_what = mon_norm; //back to normal
         player_died = FALSE;     //ok done event now restart timer

      END

    END

   IF (game_state == gs_exit OR level_type == lv_boss) BREAK; END

FRAME;

test = level_timer;


END //Level Events loop

END //process level events
/*
    in level events process
    level_timer = timer[3]/100; //round timer in seconds
    level_timer2 = timer[4];    //seconds for a the bubble delays
*/
PROCESS Timer_Process ()
BEGIN
  LOOP
//    IF (timer[0] >20)   //For delaying key reads
//        timer[0] = 0;
//    END

    IF (timer[2] >20) //anim timer delay used by special bubbles and hurry
        timer[2] = 0;
    END
    IF (timer[5] > 5) //flash bubbles timer
        timer[5] = 0;
    END
    FRAME;
  END

END

PROCESS Score_Match_Check()
PRIVATE
    plr_alive1;
    plr_alive2;

    score1;
    score2;
    matchcount; //gets 2 if both players are alive and have found a score match aa0
BEGIN
    IF (ffall_type != ffall_t_ccane AND ffall_level == FALSE) //level is a falling food level and not a candy cane
        plr_alive1 = Player_Alive(0);
        plr_alive2 = Player_Alive(1);

//check 1 player alive
//or both players to compare later
       IF (plr_alive1 == TRUE)
           score_match (0);
           IF (bubbob[0].scorematched == TRUE)
               score1 = bubbob[0].matchind; //falling food number found
               ff_sprid = score1;           //save it to do falling food later
               ffall_type= ffall_t_score1;  //falling food type matched to others score
               matchcount++;
               ffall_level = TRUE; //make the bubbles into falling items
           END
       END

       IF (plr_alive2 == TRUE)
           score_match (1);
           IF (bubbob[1].scorematched == TRUE)
               score2 = bubbob[1].matchind; //falling food number found
               ff_sprid = score2;           //save it to do falling food later
               ffall_type= ffall_t_score1;  //falling food type matched to others score
               matchcount++;
               ffall_level = TRUE; //make the bubbles into falling items
           END
       END
//next part will compare if both players are alive and give
//the correct result from above

       IF (matchcount == 2) //check players match
           //plr1 = plr2
               IF (score1 == score2)
                   ff_sprid = score1; //sprite index of falling food
                   ffall_type= ffall_t_score2;    //falling food type matched to others score
                   ffall_level = TRUE; //make the bubbles into falling items
               END
           //plr1 > plr2
               IF (score1 > score2)
                   ff_sprid = score1; //sprite index of falling food
                   ffall_type= ffall_t_score1;    //falling food type matched to others score
                   ffall_level = TRUE; //make the bubbles into falling items
               END
           //plr1 < plr2

               IF (score1 < score2)
                   ff_sprid = score2; //sprite index of falling food
                   ffall_type= ffall_t_score1;    //falling food type matched to others score
                   ffall_level = TRUE; //make the bubbles into falling items
               END
        END
    END
END

//default values
//    game_vhard = 14;
//    game_hard  = 10;
//    game_norm  = 7;
//    game_easy  = 4;
PROCESS Game_difficulty()
BEGIN
    SWITCH (game_diff_value)
        CASE 0..4:            //Easy
             game_diff = 1;
        END
        CASE 5..7:            //Normal
             game_diff = 2;
        END
        CASE 8..11:           //Hard
             game_diff = 3;
        END
        CASE 12..30:          //Very Hard
             game_diff = 4;
         END
    END
END

//Falling food score match
//finds a score aa0
//outputs the index of the falling food into: bubbob[plr].matchind
//true if found into: bubbob[plr].scorematched

PROCESS Score_Match(plr)
PRIVATE
    strtemp1;
    strtemp2;
    inttemp1;
    str_length;

BEGIN
//GET Player score test for a score match

       bubbob[plr].matchind = 0;         //reset score match number
       bubbob[plr].scorematched = FALSE; //set to false

    IF (bubbob[plr].score == 0)    //score match 0
       bubbob[plr].matchind = 0;      //score match number 0 to 9
       bubbob[plr].scorematched = TRUE;  //true false matched to aa0
    ELSE
        strtemp1 = itoa (bubbob[plr].score);
        str_length = strlen (strtemp1);

      IF (str_length >= 3) //3 characters long aa0
        IF  (str_length== 3)
            strtemp2 = strdel (strtemp1, 0, 1);   //get aa
        END

        IF (str_length>3)
            strtemp2 = strdel (strtemp1, strlen(strtemp1)-3,1);  //get aa delete leading chars
        END

        inttemp1 = calculate (strtemp2); //convert it back to a integer
        IF (inttemp1 == 0)    //check score match = 000;
           bubbob[plr].matchind = 0;     //score matched 0
           bubbob[plr].scorematched = TRUE;
        ELSE
            IF ((inttemp1 MOD 11) == 0)    //check score match = 110,220,330..990
                bubbob[plr].matchind = inttemp1 / 11; //matched 1..9
                bubbob[plr].scorematched = TRUE;
            END
        END
      END
    END
END //Score Match


//Find a item to display from the game counters in the items array
PROCESS Item_Find()
PRIVATE
    last_id;    //last one found
    search_id;  //to search the array
    found_item; //have we found a item
BEGIN
    found_item = FALSE;
    last_id = 0;      //item number returned else 999 to say dont display a item as weve not found one
    Game_difficulty(); //update game difficulty

      SWITCH (game_diff)
      CASE 4:
            FOR (search_id = 0; search_id < num_items; search_id++)
                IF (spec_Items[search_id].counter >= spec_Items[search_id].item_l_VHard)
                    found_item = TRUE;   //yes found a item to display
                    last_id = search_id; //we dont break from this loop because the highest item found is used
                END
            END
      END
      CASE 3:
            FOR (search_id = 0; search_id < num_items; search_id++)
                IF (spec_Items[search_id].counter >= spec_Items[search_id].item_l_Hard)
                    found_item = TRUE;   //yes found a item to display
                    last_id = search_id; //we dont break from this loop because the highest item found is used
                END
            END
      END
      CASE 2:
            FOR (search_id = 0; search_id < num_items; search_id++)
                IF (spec_Items[search_id].counter >= spec_Items[search_id].item_l_Normal)
                    found_item = TRUE;   //yes found a item to display
                    last_id = search_id; //we dont break from this loop because the highest item found is used
                END
            END
      END
      CASE 1:
            FOR (search_id = 0; search_id < num_items; search_id++)
                IF (spec_Items[search_id].counter >= spec_Items[search_id].item_l_Easy)
                    found_item = TRUE;   //yes found a item to display
                    last_id = search_id; //we dont break from this loop because the highest item found is used
                END
            END
      END

      END

    IF (found_item == TRUE)   //yes found a item to display
        RETURN (last_id);
    ELSE
        RETURN (999);         //not found send terminator
    END
END

//process to randomly pick a food
//for Skel Hurry or Umbrella on last level
PROCESS Food_SHU_Last(foodget)
PRIVATE
    rand_food;
    ret_food; //actual number of food to display from 17
BEGIN
//for next level food items

    rand_food = RAND (0,15); //randomise the array index from 1 to 16

    SWITCH (foodget) //1 to 3
        CASE 1:
         ret_food = skel_food[rand_food]; //skel on last level food ids in array to choos from
        END
        CASE 2:
         ret_food = hurry_food[rand_food];
        END
        CASE 3:
         ret_food = umb_food[rand_food];
        END
    END

    RETURN (ret_food);
END

//Bubble Speed
PROCESS B_Speed()
//Does the frame rate and the bubbles pixel speed
PRIVATE
    bframer;
BEGIN

    bubble_speed = ((bubble_rate-1)/4)+1;
    bframer = bubble_rate MOD 4;

    Bub_add = speed_adj (bubble_speed); //speed adjust for platforms

    IF (bubble_rate <= 3)
        SWITCH (bframer)
        CASE 1: bubble_frame = 250; END
        CASE 2: bubble_frame = 200; END
        CASE 3: bubble_frame = 150; END
        END
    ELSE

        SWITCH (bframer)
        CASE 1: bubble_frame = 130; END
        CASE 2: bubble_frame = 120; END
        CASE 3: bubble_frame = 110; END
        DEFAULT:
            bubble_frame = 100;
        END
    END
    END
END //BSpeed

//x, y, number of baddie ,left or right, index in baddie array, player id
//this has player id cause each skel goes for different players
PROCESS Lev_Ready()
BEGIN
    Ready1 = write(font_s,268,232,3,"ROUND ");
    Ready2 = write(font_s,268,264,3,"READY  !");
    Ready3 = write_int(font_s,396,232,5,&act_level);

    LOOP
       FRAME;
       IF (game_state == gs_level_go) BREAK; END //when all baddies on the screen
    END
    //delete Ready Text from the screen after all the baddies are on the screen

    delete_text(Ready1);
    delete_text(Ready2);
    delete_text(Ready3);

END

//Level Hurry animation
PROCESS Lev_Hurry()
PRIVATE
    stop;
    animfrm;
    maxfrm;

BEGIN
    region = 1;
    file = sprites;

    x = x_def + 210;
    y = y_dn_stop;
    z = pri_hurry_up; //display infront of everything

    animfrm = hurryfrm;
    maxfrm = hurryfrm+1;

    spec_Items[40].counter++; //bell for number times hurryup! has run

    REPEAT
        GRAPH = animfrm;

        IF (y > stop_at_y AND y < stop_at_y + 16)

            IF (stop == 0)
                stop = level_timer+2; //get level time at this point
                s_trigger[e_Hurry] = TRUE;
                level_stop_what = stop_everything;
            END

            IF (level_timer => stop)
                y-=16;
            END   //wait 2 seconds
        ELSE
            level_stop_what = 0;
            y-=16; //Move "hurry up!!" up the screen
        END

        IF (timer[2] == 0) //animation delay
            animfrm++;
            IF (animfrm > maxfrm)
               animfrm = hurryfrm;  //reload animation
            END
        END

        FRAME;

    UNTIL (y < y_up_stop OR pl_died_skhurry == TRUE OR player_died == TRUE OR game_state == gs_adv_level) //until off the screen or player died

    IF (baddie_what == mon_norm AND pl_died_skhurry == FALSE)
        baddie_what = mon_angry; //make angry only if normal and not blue
        s_trigger[e_fast] = TRUE;
    END
END //Lev Hurry

//Need 2 different ones one for secret room
PROCESS Do_Skels ()
PRIVATE
    id2;
    id3;
    player; //for checking for player already has a skel
    done_skel; //flag to play sound effect
BEGIN
    id2 = get_id (type man);
    id3 = get_id (type man);

    //skel rascal, id of player to follow, dino num for appear on screen
    IF (id2 != 0)
        player = ret_dino_num2(id2);

        IF (check_for_skel (player) == FALSE AND player !=0)
            skel_baddie (id2, player);
            done_skel = TRUE; //flag to play sound effect
        END
    END
        IF (id3 != 0)
        player = ret_dino_num2(id3);

        IF (check_for_skel (player) == FALSE AND player !=0)
            skel_baddie (id3, player);
            done_skel = TRUE; //flag to play sound effect
        END
    END

    IF (done_skel == TRUE AND level_type != lv_secret) // Sound Effect but not on a secret room
        s_trigger[e_skel] = TRUE;
    END
END //Do Skels

//Checks to see if we have done a skel for the player
PROCESS Check_For_Skel (player)
PRIVATE
    id2;
BEGIN
    id2 = get_id (TYPE skel_baddie);

    IF (id2 != 0)             //check first skel
        IF (id2.who == player)
            RETURN (TRUE);
        ELSE
            id2 = get_id (TYPE skel_baddie);
            IF (id2 != 0)    //if there is another on screen check its for player
                IF (id2.who == player)
                    RETURN (TRUE);
                END
            END
        END
    END

    RETURN (FALSE);  //return false if not there
END //Check for Skel

//sprites
PROCESS Ret_AdjustedX(xin)
BEGIN
    RETURN ((xin*2)-32);
END

//food items
PROCESS Ret_AdjustedX2(xin)
BEGIN
    xin+=40;
    RETURN (xin*2);
END

//sprites
PROCESS Ret_AdjustedY(yin)
BEGIN
     RETURN (((prop_y - yin)*2));
END

//food items
PROCESS Ret_AdjustedY2(yin)
BEGIN
     RETURN (((prop_y - yin)*2)+79);
END


//Drops the baddies onto the screen
//using baddie drop to do the drop sprite
//which then creates the correct baddie sprite
PROCESS Baddies_St(level)
PRIVATE
    b_ind;
    b_ind2;
    b_count;
    start_del;
    start_timer;
    del_timer;

    ylocs[6];
    mdelays[6];
    mon_amt;  //number droped onto screen so far
    min_val;  //value with minimum value
    mdel;
BEGIN
    bad_on_screen = 0;         //reset number of baddies on screen
    b_ind = (level*7);
    b_ind2 = b_ind; //save level index

//Global variables of monster speed
    bad_speed = levels[level].baddie_speed; //normal run
    bad_speed2= bad_speed+2;                //angry
    IF (bad_speed2 >7) bad_speed = 7; END

    num_baddies = levels[level].badnum;

//  b_ind = level in monster array;
    min_val = 999;

    FOR (b_count = 0; b_count < num_baddies; b_count++)
        ylocs[b_count]   = ret_adjustedy(baddies[b_ind].my);
        mdelays[b_count] = baddies[b_ind].mdelay;

        //get lowest yloc
        IF (ylocs[b_count] < min_val)
            min_val = ylocs[b_count];
        END
        b_ind++;
    END

//timer drop routine
    REPEAT

        FOR (b_count = 0; b_count < num_baddies; b_count++)
            IF (del_timer == mdelays[b_count])
                IF (del_timer == 1)
                    mdel = ((ylocs[b_count]) - min_val)/2;
                ELSE
                    mdel = del_timer;
                END

                Baddie_drop(ylocs[b_count], b_ind2+b_count, mdel);

                mon_amt++;
            END
        END

    FRAME;

    del_timer++;

    UNTIL (mon_amt >= num_baddies)


END

PROCESS Baddie_drop(yloc, b_ind, mon_delay)
PRIVATE
    an_frame; //
    nframes;  //number of frames
    fcount;   //frame count
    fdelay;
    an_start;
    x_st;
    y_st;
    id2;
    b_ind;
    badid;
    bdir;
    xloc;

BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;
    IF (level_type != lv_instr)
      badid = baddies[b_ind].mtype;
      xloc = ret_adjustedx(baddies[b_ind].mx);
      bdir = baddies[b_ind].dir;
    ELSE
      badid = baddies_instr[b_ind].mtype;
      xloc = ret_adjustedx(baddies_instr[b_ind].mx);
      bdir = baddies_instr[b_ind].dir;
    END
    //Baddy Animation arrays
    an_start = baddie_anims[badid].astart;
    nframes = baddie_anims[badid].num_frames;

    //extra frame in spring sprite dont show it in anim
    IF (badid == 5) nframes--; END

    x_st = xloc + x_def;
    y_st = yloc + y_def + 10;

    x = xloc + x_def;
    y = y_def - (5 * 16); //top of screen drop position
    z = pri_nasties;

    an_frame = an_start;

    IF (bdir == 1) //direction the nastie is facing
      FLAGS = 1;
      x-=1;
    ELSE
      FLAGS = 0;
    END

    REPEAT

    GRAPH = an_frame;
    fdelay++;

    IF (y < y_st)   //drop it down the screen until its reached the starting position
        y+=2;
        fall = TRUE;
    END

    IF (fdelay > 10) //animation frame delay
        fdelay  = 0;
        an_frame++;
        fcount ++;

    IF (fcount >= nframes) //loop the animation
        fcount = 0;

        IF (badid > 0)
            an_frame = an_start;
        END

        END
    END
    //bubble blown hit detection
    id2 = collision(type bubble_blow);
    IF (id2 != 0)
        mon_delay = 0;
        BREAK;
    END
    //dino dection
    id2 = collision(type man);
    IF (id2 != 0)
      id2.kill = Kill_D_norm; //set the kill flag in the dino process
    END


    FRAME;

    UNTIL (y == y_st) //reached starting position or hit by a bubble been blown

    SWITCH (badid)

        CASE 1,2,6,7: //zenchan, mighta, hignsu, drunk
            norm_baddie (x, y , badid, bdir, b_ind, mon_delay);
        END

        CASE 3,4:     //pulpul, monsta
            diag_baddie (x, y , badid, bdir, b_ind, mon_delay);
        END

        CASE 8:       //invader
            invader_baddie (x, y , badid, bdir, b_ind, mon_delay);
        END

        CASE 5:       //banabou
            spring_baddie (x, y , badid, bdir, b_ind, mon_delay);
        END
    END //Switch end

    bad_on_screen++;   //number on screen

    IF (bad_on_screen >= num_baddies AND level_type != lv_instr)
      game_state = gs_level_start;
    END

END


PROCESS Boss_Bottle(x, y, facing, me_deg)
PRIVATE
    animdel;
    animfrm;
    angadd;  //speed of rotation
    bottlespd;
    sidehit;
    id2;
    x_pos; //curent position of the sprite
    y_pos;
    x_sp;  //Speed of movement
    y_sp;

    x_dist;
    y_dist;

BEGIN
    xpos = x;
    ypos = y;
    bottlespd = 40;
    region = 1; //needed for clipping the sprite when it goes off the playfield

//    me_deg  = 0 to 360;
                          //angle, distance
      x_dist = get_distx((me_deg*k), bottlespd);
      y_dist = get_disty((me_deg*k), bottlespd);

//check that drunk is not too close to the side of the screen
 IF ((xpos > x_side1 AND facing == 1) OR (xpos < x_side2 AND facing == 2))

    file = sprites;

    GRAPH = drunkbottle;
    z = 500;

    angadd = 27000;

REPEAT

    IF (facing == Face_Right)
        angle+=angadd;
    ELSE
        angle-=angadd;
    END

    xmov +=x_dist;
    ymov +=y_dist;
    x = xpos + xmov/10; //divide by 10 to get a angle
    y = ypos + ymov/10;


    IF (x < 100) sidehit = TRUE; END
    IF (x > 532) sidehit = TRUE; END

    IF (y < 64)  sidehit = TRUE; END
    IF (y > 440) sidehit = TRUE; END

    FRAME;

    IF (id2 = collision (type man))
        IF (id2.inv <= 0 ) //check to see if invunrable
            id2.kill = Kill_D_norm;
            BREAK;
        END
    END

UNTIL (sidehit == TRUE)

END

END //Drunk Bottle


PROCESS Dino_Millions(id2) //adds bonus score to dinos
PRIVATE
   wh_dino; //which dino popped the boss bubble to kill him?

   dino_sc1; //score 1 to add
   dino_sc2; //score 2 to add
   alive_1;  //plr1 alive
   alive_2;  //plr2 alive

BEGIN
   wh_dino = Ret_Dino_Num2(id2); //1, 2, or 99

   //Check for dino not found
   IF (wh_dino == 99) RETURN; END

   IF (players_on_screen == 1)
      IF (wh_dino == 1)
          dino_sc1 = 1000;
          alive_1 = TRUE;
      ELSE
          dino_sc2 = 1000;
          alive_2 = TRUE;
      END
   ELSE
      alive_1 = TRUE;
      alive_2 = TRUE;

      IF (wh_dino == 1)
          dino_sc1 = 999; //do one less than total - some bug
          dino_sc2 = 499;
      ELSE
          dino_sc1 = 499;
          dino_sc2 = 999;
      END
   END

   wh_dino--; //alter so it gets array position

//Add End game Score to players
   REPEAT
    IF (dino_sc1 >= 0 AND alive_1 == TRUE)
       bubbob[0].score+= 1000;
        IF (bubbob[0].score > Hi_score) Hi_score = bubbob[0].score; END
       dino_sc1--;
    END

    IF (dino_sc2 >= 0 AND alive_2 == TRUE)
       bubbob[1].score+= 1000;
       IF (bubbob[1].score > Hi_score) Hi_score = bubbob[1].score; END
       dino_sc2--;
    END

    FRAME;

   UNTIL (dino_sc1 == 0 AND dino_sc2 == 0)

END

//X pos, Y pos, baddie id, facing, index in main baddie array

PROCESS Boss_Baddie() //The End of Game Boss
PRIVATE
    gfxnum;      //gets what graphic to display next
    st_frm;      //cur anim frame
    maxfrm;      //max anim frame
    anim_time;   //this counts up
    an_start;    //animation start graph number
    diefrme;     //die frame number
    goud;        //up/down
    del_start;
    id2;         //for closest and player collision
    id3;         //for closest player
    lastangry;   //angry or normal last frame
    hur_angry;   //hurry made this nastie angry - for droping baddie to floor before starts moving
    m_delay;
    last_health; //to do the flash blue anim

    flash_go;
    flash_count;

    boss_timeout; //time boss will be released
    bottle_time;  //time to throw a bottle?
    b_deg;
    b_count;

    dist;  //dist p1
    dist2; //dist p2
    ck_id; //gets the closest dino id

    grav;     //gravity
    vel;      //velocity of jump
    velst;    //velocity start used to tell if jump finished
    vel_dec;

BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = Titlesfile;
    xpos = x_scr_middle;
    ypos = y_scr_middle;

    diefrme = boss_hitdie;
    an_start = boss_norm;
    maxfrm   = boss_norm+4;
    gfxnum = an_start; //load anim


//Start Movement initialation
    facing = Face_Right;
    bad_speed = 3;      //speed of normal movement
    m_delay = 100;      //delay before he starts moving
    boss_health = boss_set_health;   //health of end game boss
    last_health = boss_health; //to do the flash blue anim

    IF (facing == Face_Left)
        FLAGS = 1; //Left
        goud = Face_Down;  //down
    ELSE
        goud = Face_Up; //up Right
    END

    z = pri_nasties;
    x = xpos;
    y = ypos;


REPEAT

    IF (angry != mon_bossbubb)

      IF (boss_health < boss_set_health/10) //flash blue if below 10 percent
         flash_go = TRUE;
      ELSE
         flash_go = FALSE;  //no flash above 10 percent
      END

      IF (boss_health <= 0) //Bubble the boss up
         angry = mon_bossbubb;
         flash_go = FALSE;
         boss_timeout = level_timer+4; //time boss will be released
      END
    ELSE
      //Check to see if boss can escape from being bubbled up
      IF (level_timer > boss_timeout)
         angry = mon_angry;
         boss_health = boss_set_health/2; //put back to half health
      END
    END



//update animation frames if status has changed
    IF (lastangry != angry)
        anim_time = 20; //angry right away - changes the anim frame straight away
        gfxnum = maxfrm;
        lastangry = angry;
    END

//speed of baddies,1 min maximum is 7
    IF (angry == mon_angry)
        man_speed = bad_speed+2; //Angry Speed
    ELSE
        man_speed = bad_speed;  //Normal Speed
    END

//for swapping anim graphic to face the other way
    IF (facing == Face_Left)
        FLAGS = 1;
    ELSE
        FLAGS = 0;
    END

//animation goes twice as fast if angry
     IF (angry == mon_angry)
         anim_time+= 2;
     ELSE
         anim_time++; //increase it by one
     END

     IF (anim_time >= 10)
         anim_time = 0;
         gfxnum++;
         IF (gfxnum >= maxfrm)
            //reload anim
            IF (angry == mon_norm)
               an_start = boss_norm;
               maxfrm   = boss_norm+4;
               gfxnum = an_start; //load anim to graphics
            END

            IF (angry == mon_angry) //Turn red and run faster
               an_start = boss_angry;
               maxfrm   = boss_angry+2;
               gfxnum = an_start;
            END

            IF (angry == mon_bossbubb) //used for the boss when bubbled up
               an_start = boss_bubbled;
               maxfrm = boss_bubbled+4;
               gfxnum = an_start;
            END
         END

     END

    IF (flash_go == TRUE)
       flash_count++;
    ELSE
       flash_count = 0;
    END

    IF (angry != mon_bossbubb AND last_health != boss_health OR (flash_count >= 5 AND flash_go == TRUE)) //to do the flash blue anim
       IF (flash_count >8) flash_count = 0; END
       GRAPH = boss_hitdie;
    ELSE
       GRAPH = gfxnum;
    END


IF (del_start > m_delay) //del start timer, wait del const of frames to wait

    xmov = 0; //clear x y stop local variables
    xstop = FALSE;
    ystop = FALSE;

    IF (angry != mon_bossbubb)
      bottle_time++;  //time to throw a bottle?
    END

    IF (bottle_time > 200)
       bottle_time = 0;

    id2 = get_id(type man);
    id3 = get_id(type man);
//get ids of both players

//check if alive get distance
    IF (id2 != 0)
      dist = get_dist(id2);
      ck_id = id2;
    END
//plr2 distance
    IF (id3 != 0)
      dist2 = get_dist(id3);
      ck_id = id3;
    END
//get which is closest
    IF (id2 != 0 AND id3 != 0)
        IF (dist < dist2)
            ck_id = id2; //ck_id gets the closest dino
        ELSE
            ck_id = id3;
        END
    END

    IF (facing == face_Left)
        b_deg = 90; //Left
    ELSE
        b_deg = 270; //Right
    END

    IF (ck_id > 0)
        IF (y < ck_id.y-128)
            b_deg = 180; //Up
        END

        IF (y > ck_id.y+128)
            b_deg = 0;   //Down
        END

    END

       FOR (b_count = 0; b_count < 8; b_count++)
         Boss_Bottle(x, y, facing, b_deg);
         s_trigger[e_botchuck] = TRUE;
         b_deg += 25;
         IF (b_deg >= 360)
             b_deg = b_deg - 360;
         END

       END
    END

//Movement
IF(angry != mon_bossbubb)
//Left
   IF (facing == Face_Left)
       xmov = -man_speed;
       IF (x <152)
         xstop = TRUE;
         xmov = 0;
       END
   END

//Right
   IF (facing == Face_Right)
       xmov = man_speed;
       IF (x > 478)
         xstop = TRUE;
         xmov = 0;
       END

   END

//Up
   IF (goud == Face_Up)
      ydmov = -man_speed;
      IF (y <= 128)
          ystop = TRUE;
          ydmov = 0;
      END
   END

//Down
   IF (goud == Face_Down)
      ydmov = man_speed;
      IF (y >= 384)
          ystop = TRUE;
          ydmov = 0;
      END
   END

//update x position
    xpos += xmov;
//update y coords
    ypos += ydmov;
END

//hit a platform Left Right then turn around
    IF (xstop == TRUE)
        IF (facing == Face_Left) //face the other way
           facing = Face_Right;
        ELSE
           facing = Face_Left;
        END
    END

//hit a platform above or below move the other way
    IF (ystop == TRUE)
        IF (goud == Face_Up) //swap movement
            goud = Face_Down;
        ELSE
            goud = Face_Up;
        END
    END

ELSE //drop delay onto screen
    IF (game_state == gs_level_go)
        del_start++;
    END
END

//write to sprites coords

    x = xpos;
    y = ypos;

    last_health = boss_health; //to do the flash blue anim

    FRAME;

    id2 = collision (type man);
    IF (id2 != 0)
        IF (angry == mon_bossbubb) //used for the boss when bubbled up
           kill = TRUE;
        ELSE
            IF (id2.inv <= 0 )   //check to see if invunrable
                id2.kill = Kill_D_norm; //not kill dino
            END
        END
    END

//IF (key(_space)) BREAK; END

UNTIL (kill == TRUE)

    IF (id2 != 0)
       Dino_Millions(id2);
    END

    Music_Stop();
    s_trigger[e_multinew] = TRUE;

    GRAPH = diefrme; //Blue Die frame of Boss
    anim_time = 0;

//Kill boss animation

    vel = -260; //uses a jump type movement
    grav = 20;
    vel_dec = 4;
    game_state = gs_level_completed; //completed the level

    LOOP

     ydmov = vel/grav;
     IF (ydmov == 0) ydmov = 1; END //to stop zero stoping movement
     vel = vel + vel_dec;

     IF (y > 480+64) BREAK; END

     y += ydmov;

     anim_time++;
     IF (anim_time >= 5)
         anim_time = 0;
         angle +=30000;
     END

    FRAME;

    END
   s_trigger[e_boom] = TRUE;
   s_trigger[e_explos] = TRUE;

   Shake(); //Shakes the screen

   LOOP
       FRAME;
       IF (ani_finish != 0) BREAK; END
   END
   game_state = gs_comp_crack;

END //Boss Baddie

//Skel sprite
PROCESS Skel_Baddie (id2, player)
PRIVATE
    gfxnum;      //gets what graphic to display next
    st_frm;      //cur anim frame
    maxfrm;      //max anim frame
    anim_time;   //this counts up
    an_start;    //animation start graph number
    diefrme;     //die frame number
    golr;        //which way to run
    goud;

    waytogo;

    alivetime;    //gets faster more player avoids skel
    move_del;     //timer for delaying movement
    del_time;     //value to move on
    moved;        //amount moved
    moving;       //skel moving
    monsterspeed; //speed of skel starts of at 2 pixels max 8
    xdist;
    ydist;
    badid;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;
    who = player; //to check for redo of skels if theres another hurry
                  //dont want to make more than 1 for each player
    IF (player == 1)
        xpos = x_sk1;
        facing = 2;   //look right
    ELSE
        xpos = x_sk2;
        facing = 1;   //look left
    END

    IF (id2.y > 220)
        ypos = y_ska;
    ELSE
        ypos = y_skb;
    END

    spec_Items[43].counter ++; //Skull Item

    waytogo = 2; //Up down movement first

    IF (level_type == lv_secret) //locate grey ghost instead of barron non blubba
       badid = secret_num+8;
    END

    diefrme = baddie_anims[badid].die;
    an_start = baddie_anims[badid].astart;
    maxfrm = an_start + baddie_anims[badid].num_frames;
    gfxnum = an_start + (baddie_what * baddie_anims[badid].num_frames); //load anim
    monsterspeed = 2;
    golr = 0;
    goud = 0;

    x = xpos;
    y = ypos;
    z = pri_nasties;

    del_time = 100;

//Appears out of a cloud anim but not on a secret room
    IF (level_type != lv_secret)
    GRAPH = diefrme;
    LOOP

        IF (timer[2]==0)
           GRAPH++;
           IF (GRAPH > diefrme+3) BREAK; END
        END
        FRAME;

    END
      GRAPH = an_start;
    END

    anim_time = 11; //force reload anim in main loop
    REPEAT

//Player Detection on the screen
//check if alive get distance

    IF (move_del > del_time)
        moving = TRUE;
    END

    IF (id2 != 0)
        xdist = get_distx(get_angle(id2), get_dist(id2));
        ydist = get_disty(get_angle(id2), get_dist(id2));


     IF (waytogo == 1)
        IF (xdist < 0) golr = 1; END //go left thats where the player is
        IF (xdist > 0) golr = 2; END //go right etc.

     ELSE
        IF (ydist < 0) goud = 1; END //go left thats where the player is
        IF (ydist > 0) goud = 2; END //go right etc.
     END

        IF (moving == FALSE)
            golr = 0;
            goud = 0;
        END

    END

//IF not moving do a wait delay
    IF (moving == FALSE) move_del++; END     //timer for delaying movement

//animation
    anim_time++; //increase it by one

    IF (anim_time >= 10)
         anim_time = 0;
         gfxnum++;
         IF (gfxnum >= maxfrm)
            //reload anim
            gfxnum = an_start;
            maxfrm = gfxnum + baddie_anims[badid].num_frames;
         END

     END

    GRAPH = gfxnum;

    xmov = 0; //clear x y stop local variables
    xstop = FALSE;
    ydmov = 0;

    IF (moving == TRUE)
        moved += monsterspeed; //amount moved

        IF (moved > 112) //7 blocks * block res = 16
           moving = FALSE;
           move_del = 0;
           moved = 0;    //reset timer
           alivetime++;    //gets faster more player avoids skel

           //decrease delay time on each 2 moves
           IF (alivetime MOD 2 == 0)
                IF (del_time >= 16) del_time -= 8; END
           END
           //speed up skel on each 4 moves
           IF (alivetime MOD 4 == 0)
                IF (monsterspeed < 7) monsterspeed++; END
           END

            IF (waytogo == 1)
                waytogo = 2;
            ELSE
                waytogo = 1;
            END
        END

        //left
        IF (golr == 1)
            xmov -=monsterspeed;
            //these alter the sprite to be on x zero in relation to the player
            IF (xdist > xmov) xmov = xdist; END
            facing = 1;
        END

        //right
        IF (golr == 2)
            xmov = monsterspeed;
            IF (xdist < xmov) xmov = xdist; END
            facing = 2;
        END

        //up
        IF (goud == 1)
            ydmov = -monsterspeed;
            IF (ydist > ydmov) ydmov = ydist; END
        END

        //down
        IF (goud == 2)
            ydmov = monsterspeed;
            IF (ydist < ydmov) ydmov = ydist; END
        END
    END

//which way is skel facing, flips the anim frame horizontal
    IF (facing == 2)
        FLAGS = 0;
    ELSE
        FLAGS = 1;
    END

//update x position
    xpos += xmov;

//update y coords
    ypos += ydmov;

//write to sprites coords
    x = xpos;
    y = ypos;

    IF (id2 == collision (type man))
        IF (id2.inv <= 0 ) //check to see if invunrable
            id2.kill = Kill_D_norm ;

            spec_Items[43].counter ++; //Skull Item caught the player

            IF (level_type == lv_secret)
               sr_player_died = TRUE;  //player died in the secret room so exit it
                                                      //no stars for this kill
            END

            BREAK;  //quits skel movement loop
        END
    END

    FRAME;

    //skel disapear plr has died, baddies all killed
    UNTIL (id2 == 0 OR pl_died_skhurry == TRUE OR game_state >= gs_level_completed);

    IF (level_type != lv_secret) //disapear cloud but not on a scret room

//disapear anim
      GRAPH = diefrme+3;
      LOOP

        IF (timer[2]==0)
           GRAPH--;
           IF (GRAPH < diefrme) BREAK; END
        END
        FRAME;

      END
   END
END //Skel Baddie

//x, y, number of baddie ,left or right, index in baddie array, delay before moving
PROCESS Spring_Baddie (xpos, ypos , badid, bdir, b_ind, mon_delay)
PRIVATE
    gfxnum;      //gets what graphic to display next
    st_frm;      //cur anim frame
    maxfrm;      //max anim frame
    jmpfrm;     //jump frame unique to this sprite when it hits the platform
    anim_time;   //this counts up
    an_start;    //animation start graph number
    diefrme;     //die frame number
    gojump;      //1 = jumpup  2 = jump across  3 = jump jam

    new_jump; //To stop movement routine stoping the new jump left right

    id2;       //plr1
    id3;       //plr2
    ck_id;     //id to check x y from
    lastplr_y; //last player y coord
    lastjmp_y; //where jump started from
    lastjmp_x; //where jump started from

    dist;
    dist2;      //distance to pl2
    det_delay; //detection of where the player is delay /2 if angry
    rel_delay;
    grav;     //gravity
    vel;      //velocity of jump
    velst;    //velocity start used to tell if jump finished
    vel_dec;
    jumpanim; //this allows animation on jumping up, looks left right

    ylast;
    reboundcount;
    sjumpy;
    jsamecount;
    del_start;
    lastangry;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;
    //fall = 0;
    //jump = FALSE;

    diefrme = baddie_anims[badid].die;
    an_start = baddie_anims[badid].astart;
    maxfrm = an_start + baddie_anims[badid].num_frames;
    jmpfrm = maxfrm-1; //3rd frame the hit platform frame end of norm move
    maxfrm --;       //one less than 3 only has 2 frames
    gfxnum = an_start + (angry * baddie_anims[badid].num_frames); //load anim
    badnum = badid; //for trap bubbles

    facing = bdir;
    x = xpos;
    y = ypos;
    z = pri_nasties;

    yinertia = FALSE;
    xinertia = FALSE;

    det_delay = rel_delay; //to stop monsters jumping up at the start when they move at first

    IF (facing == Face_Left)
        FLAGS = 1;
    END

REPEAT //Nastie loop start

    //If baddie has now changed to normal, angry or heart/blue
    //from last frames status
    IF ((baddie_what == mon_angry OR baddie_what == mon_heart) AND lastangry != baddie_what)
       angry = baddie_what;
    END

    //When player is killed or heart ends set back to normal baddie
    IF (player_died == TRUE OR heart_finished == TRUE) //Player died back to normal status
       angry = mon_norm;
    END

    IF (lastangry != angry)
        anim_time = 20;    //change the anim frame straight away
        gfxnum = maxfrm;
        lastangry = angry; //set this to stop the anim frame from freezing
    END

//speed of baddies,1 min maximum is 7
    IF (angry == mon_angry)
        man_speed = bad_speed2; //Angry Speed
        rel_delay = det_del_angry; //timer for finding player on screen
    ELSE
        man_speed = bad_speed;  //Normal Speed
        rel_delay = det_del_norm;
    END

IF (del_start > mon_delay) //del start timer, wait del const of frames to wait

    IF (det_delay < 0)
        det_delay = rel_delay;

        id2 = get_id(type man);
        id3 = get_id(type man);
//get ids of both players

//check if alive get distance
    IF (id2 != 0)
        dist = get_dist(id2);
        ck_id = id2;
    END
//plr2 distance
    IF (id3 != 0)
        dist2 = get_dist(id3);
        ck_id = id3;
    END
//get which is closest
    IF (id2 != 0 AND id3 != 0)
        IF (dist < dist2)
            ck_id = id2; //ck_id gets the closest dino
        ELSE
            ck_id = id3;
        END
    END
    IF (ck_id > 0)
        lastplr_y = ck_id.y; //read new y variable in
    END

    END

    det_delay--; //where the player is read delay


IF (jump == FALSE)
    IF (fall == 0)
        //jump up
        IF  (y > lastplr_y AND platabove == TRUE)

             gojump = 1; //jump up val

             IF (lastjmp_x == x AND lastjmp_y == y) //read where last jumped from
                  jsamecount++;
                  IF (jsamecount >2)
                      gojump = 3;    //Jump 3
                      jsamecount = 0;
                    END
                END

                lastjmp_x = x; //where jump started from to stop jump sticking
                lastjmp_y = y;

         ELSE
                gojump = 2; //normal jump around
         END

//to stop baddie being stuck in a box

        IF (reboundcount > 10)
            gojump = 1;
           reboundcount = 0;
        END
    END

END //set Jump up/across

//checking for fall == false stops jumping in mid air

    //check for jump
    IF (gojump > 0 AND jump == FALSE AND fall == 0)
        s_trigger[e_boing] = TRUE;

        IF (gojump == 2)
            vel =     jumpacross[man_speed-1].vel; //jump across 6 blocks
            grav =    jumpacross[man_speed-1].grav;
            vel_dec = jumpacross[man_speed-1].vel_dec;

            GRAPH = jmpfrm;
        ELSE
            vel =     jumpup[man_speed-1].vel;     //jump up
            grav =    jumpup[man_speed-1].grav;
            vel_dec = jumpup[man_speed-1].vel_dec;
        END
           velst = vel;    //vel start used to stop jump at bottom of jump
           jump = TRUE;    //jump switch to on

        IF (gojump == 1)   //to do the look around before jumping only if jumpup
            jumpanim = 20;

            gfxnum = jmpfrm;

            IF (facing == Face_Left)
                FLAGS = 0;
            ELSE
                FLAGS = 1;
            END

        ELSE
           jumpanim = 0;
        END

        sjumpy = y;       //start jump pos to stop when
        new_jump = TRUE;  //this is used because one IF statement will cancel the new jump movement out

    END

    IF (jumpanim > 0) jumpanim--; END //for looking left right before jumping

      //reset facing for jump
        IF (gojump ==1 AND jumpanim == 10)
            IF (FLAGS == 1)
                FLAGS = 0;
            ELSE
                FLAGS = 1;
            END
        END


    IF (jump == TRUE AND fall == 0 AND gojump != 0 AND jumpanim <= 0 AND level_stop_what == 0)
            ydmov = vel/grav;
            IF (ydmov == 0) ydmov = 1; END //to stop zero stoping movement
            vel = vel + vel_dec;

            IF (y > sjumpy-4  AND vel > 0)
                jump = FALSE;
                fall = TRUE;
                gojump = 0;
                ydmov = 0;
            END
    END

//End of fall jump down movement

    xmov = 0; //clear x y stop local variables
    xstop = FALSE;

//left right jump movement

    IF (gojump != 1 and Fall == 0)
        IF (facing == Face_Left)
            xmov -=man_speed;
        ELSE
            xmov = man_speed;
        END
    END

ELSE //drop delay onto screen
    IF (game_state == gs_level_go)
        del_start++;
    END
END


//animation goes twice as fast if angry
     IF (angry == mon_angry)
         anim_time+= 2;
     ELSE
         anim_time++; //increase it by one
     END

     IF (anim_time >= 10 AND jumpanim <= 0 AND level_stop_what < stop_monsters)

         anim_time = 0;
         gfxnum++;
         IF (gfxnum >= maxfrm)
            //reload anim
            gfxnum = an_start + (angry * baddie_anims[badid].num_frames);
            maxfrm = gfxnum + baddie_anims[badid].num_frames;
            jmpfrm = maxfrm-1; //3rd frame the hit platform frame
            maxfrm --;       //one less than 3 only has 2 frames
         END

     END

    GRAPH = gfxnum;

    IF (level_stop_what == stop_heart)
        jump = FALSE;
    END

//DETECT PLATFORMS
    nonebelow = 0;
    platabove = FALSE;

//normal platform detection
    get_hard_col();

//for jumping up to find player
    ex_plat_det();


    IF (fall == 0 AND gojump > 0 AND xstop == TRUE AND new_jump == FALSE)

        IF (gojump == 2) //if jump across dont reverse way we are facing
            gojump = 0;
            fall = TRUE; //Fall down when spring thing hits a platform
        END
            jump = FALSE;
            fall = TRUE;
            gojump = 0;
    END

    IF (fall == 0 AND xstop == TRUE AND new_jump == TRUE)
            IF (facing == Face_Left) //face the other way
                IF (ylast == y)
                    reboundcount++;
                ELSE
                    reboundcount = 0;
                END
                ylast = y;
                facing = Face_Right;
            ELSE
                facing = Face_Left;
            END
    END

//clear the new jump var now we have started in a new direction
    IF (new_jump == TRUE) new_jump = FALSE; END

//for swapping anim graphic to face the other way
    IF (jumpanim <= 0)
        IF (facing == Face_Left)
            FLAGS = 1;
        ELSE
            FLAGS = 0;
        END
    END

//update x position
    IF (level_stop_what == 0)
      xpos += xmov;
    END

//update y coords
    IF (level_stop_what == stop_heart OR level_stop_what == 0)
      ypos += ydmov;
    END
//hit a platform turn around


//bottom of screen fall though to top
    IF (ypos > y_b_loop)
        ypos = y_bt;
    END

//write to sprites coords
    x = xpos;
    y = ypos;

        FRAME;
    //Running into Dino collision detection
    id2 = collision (type man);

    IF (id2 != 0)
        IF (baddie_what != mon_heart)
            IF (id2.inv <= 0 )   //check to see if invunrable
                id2.kill = Kill_D_norm; //not kill dino
            END
        ELSE
            kill = mkill_heart;
        END
    END

    id2 = collision (type water); //water flow kill of baddies
    IF (id2 != 0)
      kill = mkill_water_bubble;
      baddie_water_kill(x, y, badid, id2);
    END

    IF (spec_weapon_go != 0) //special items collision detection
      SWITCH (spec_weapon_go)
        CASE spec_go_tiara:
            id2 = collision(type T_Star_Sprites); //tiara stars
            IF (id2 != 0) kill = mkill_tiara; END
        END
        CASE spec_go_pinball:
            id2 = collision(type Pinball_Star);    //Necklace
            IF (id2 != 0) kill = mkill_necklace; END
        END
        CASE spec_go_light:
            id2 = collision(type Big_Lightning);    //Yellow cross
            IF (id2 != 0) kill = mkill_lning_cross; END
        END
      END
    END
//Nastie loop end
UNTIL (baddie_alldie != 0 OR kill != 0); //kill all of them no effects, or hit by a item/bubble effect/dino

    IF (kill > mkill_trap) //killed by item weapon
        //coords, baddie number, which way facing, multi to 0 as this is not a trap bubble pop, kill type
        IF (kill != mkill_water_bubble)
           baddie_kill(x, y, badid, facing, 0, kill);
        END
    ELSE
        IF (baddie_alldie != mkill_do_nothing)
            baddie_kill(x, y, badid, facing, 0, baddie_alldie);
        END
    END

END


//x, y, number of baddie ,left or right, index in baddie array
PROCESS Invader_Baddie (xpos, ypos , badid, bdir, b_ind, mon_delay)
PRIVATE
    gfxnum;      //gets what graphic to display next
    st_frm;      //cur anim frame
    maxfrm;      //max anim frame
    anim_time;   //this counts up
    an_start;    //animation start graph number
    diefrme;     //die frame number
    golr;        //which way to run
    gofire;

    firesprite;  //does the baddie have fire capablities?
    id2;       //plr1
    id3;       //plr2
    ck_id;     //id to check x y from
    lastplr_x; //last player x coord

    dist;
    dist2;      //distance to pl2

    firedel;
    del_start;
    lastangry;  //for changes in main angry
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;
    fall = 0;
    jump = FALSE;

    diefrme = baddie_anims[badid].die;
    an_start = baddie_anims[badid].astart;
    maxfrm = an_start + baddie_anims[badid].num_frames;
    gfxnum = an_start + (angry * baddie_anims[badid].num_frames); //load anim
    badnum = badid; //for trapbubbles

    golr = bdir;
    x = xpos;
    y = ypos;
    z = pri_nasties;

    yinertia = FALSE;
    xinertia = FALSE;

REPEAT

    IF (del_start > mon_delay) //del start timer, wait del const of frames to wait

    //If baddie has now changed to normal, angry or heart/blue
    //from last frames status
    IF ((baddie_what == mon_angry OR baddie_what == mon_heart) AND lastangry != baddie_what)
       angry = baddie_what;
    END

    //When player is killed or heart ends set back to normal baddie
    IF (player_died == TRUE OR heart_finished == TRUE) //Player died back to normal status
       angry = mon_norm;
    END

    IF (lastangry != angry)
        anim_time = 20;    //change the anim frame straight away
        gfxnum = maxfrm;
        lastangry = angry; //set this to stop the anim frame from freezing
    END

//speed of baddies,1 min maximum is 7
    IF (angry == mon_angry)
        man_speed = bad_speed2; //Angry Speed
    ELSE
        man_speed = bad_speed;  //Normal Speed
    END


//Player Detection on the screen

IF (fall == 1) //fall just started read the player coords in

    id2 = get_id(type man);
    id3 = get_id(type man);
//get ids of both players

//check if alive get distance
    IF (id2 != 0)
    dist = get_dist(id2);
    ck_id = id2;
    END
//plr2 distance
    IF (id3 != 0)
    dist2 = get_dist(id3);
    ck_id = id3;
    END
//get which is closest
    IF (id2 != 0 AND id3 != 0)
        IF (dist < dist2)
            ck_id = id2; //ck_id gets the closest dino
        ELSE
            ck_id = id3;
        END
    END
    IF (ck_id > 0)
        lastplr_x = ck_id.x; //read new y variable in

        IF ( (lastplr_x - xpos) < 0) golr = 1; END //go left thats where the player is
        IF ( (lastplr_x - xpos) > 0) golr = 2; END //go right etc.

    END

    END

    xmov = 0; //clear x y stop local variables
    xstop = FALSE;
//left right movement

    IF (fall <= 1) //fall now a fall counter to stop jerking when stopped
        //left
        IF (golr == 1)
            xmov -=man_speed;
        END

        //right
        IF (golr == 2)
            xmov = man_speed;
        END
    END

ELSE //drop delay onto screen
    IF (game_state == gs_level_go)
        del_start++;
    END
END

//animation goes twice as fast if angry
     IF (angry == mon_angry)
         anim_time+= 2;
     ELSE
         anim_time++; //increase it by one
     END

     IF (anim_time >= 10 AND level_stop_what < stop_monsters)
         anim_time = 0;
         gfxnum++;
         IF (gfxnum >= maxfrm)
            //reload anim
            gfxnum = an_start + (angry * baddie_anims[badid].num_frames);
            maxfrm = gfxnum + baddie_anims[badid].num_frames;
         END

     END

    GRAPH = gfxnum;

//DETECT PLATFORMS
    nonebelow = 0;
    get_hard_col();

IF (level_stop_what == 0)
//update x position
    IF (fall <= 1)
        xpos += xmov;
    END
END

    IF ((fall!= 0 AND level_stop_what == stop_heart) OR level_stop_what == 0)
//update y coords
    ypos += ydmov;
    END

//hit a platform turn around
    IF (fall == 0 AND xstop == TRUE)

       IF (golr == 1) //face the other way
           golr = 2;
       ELSE
           golr = 1;
       END
    END

//Fire a missle across the screen?
    IF (xinertia == FALSE AND fall == 0 AND level_stop_what == 0)
        invzapp(id, xpos, ypos);
    END

//bottom of screen fall though to top
    IF (ypos > y_b_loop)
        ypos = y_bt;
    END

//write to sprites coords
    x = xpos;
    y = ypos;

    id2 = collision (type man);

    IF (id2 != 0)
        IF (baddie_what != mon_heart)
            IF (id2.inv <= 0 )   //check to see if invunrable
                id2.kill = Kill_D_norm; //not kill dino
            END
        ELSE
            s_trigger[e_popmulti] = TRUE; //Kill by running into by Heart Sound
            kill = mkill_heart;
        END
    END

    id2 = collision (type water); //water flow kill of baddies
    IF (id2 != 0)
      kill = mkill_water_bubble;
      baddie_water_kill(x, y, badid, id2);
    END


    IF (spec_weapon_go != 0) //special items collision detection
      SWITCH (spec_weapon_go)
        CASE spec_go_tiara:
            id2 = collision(type T_Star_Sprites); //tiara stars
            IF (id2 != 0) kill = mkill_tiara; END
        END
        CASE spec_go_pinball:
            id2 = collision(type Pinball_Star);    //Necklace
            IF (id2 != 0) kill = mkill_necklace; END
        END
        CASE spec_go_light:
            id2 = collision(type Big_Lightning);    //Yellow cross
            IF (id2 != 0) kill = mkill_lning_cross; END
        END
      END
    END

        FRAME;

UNTIL (baddie_alldie != 0 OR kill != 0); //kill all of them no effects, or hit by a item/bubble effect/dino

    IF (kill > mkill_trap) //killed by item weapon
        //coords, baddie number, which way facing, multi to 0 as this is not a trap bubble pop, kill type
        IF (kill != mkill_water_bubble)
            baddie_kill(x, y, badid, facing, 0, kill);
        END
    ELSE
        IF (baddie_alldie != mkill_do_nothing)
            baddie_kill(x, y, badid, facing, 0, baddie_alldie);
        END
    END
END //Invader BAddie

//Laser bolt from Invader sprite
//    invaderzzap = 607;
//    invaderstar = 609;
PROCESS InvZapp(id2, xst, yst)
PRIVATE
    animdel;
    animfrm;
    firespd;
    animlen;
    id3;
BEGIN
    x = xst;
    y = yst + 4;

    xpos = (x + 4); //adjustment as h map 1/2 size of screen
    ypos = (y - 64);

    id2.xinertia = TRUE;
    region = 1; //needed for clipping the sprite when it goes off the playfield

    file = sprites;

    animfrm = invaderzzap;
    //z = 500;

    ystop = 0;
    GRAPH = animfrm;

    animdel = 5;
    ydmov = 4;

    s_trigger[e_laser] = TRUE;

    REPEAT

    GRAPH = animfrm;
IF (level_stop_what != stop_everything)

    ypos += ydmov;
    y += ydmov;

    animdel--;

    IF (animdel < 0)
        animfrm++;
        animdel = 5;
        IF (animfrm > invaderzzap+1) animfrm = invaderzzap; END
    END
END
    FRAME;
    id3 = collision (type man);

    IF (id3 != 0)
        IF (id3.inv <= 0 ) //check to see if invunrable
            id3.kill = Kill_D_FireInv;
            BREAK;
        END
    END

    UNTIL (ystop == TRUE OR ypos > y_dn_block-80)
//need to put in a die star

    animfrm = invaderstar;

    LOOP

    FRAME;

    GRAPH = animfrm;

    animdel--;

    IF (animdel < 0)
        animfrm++;
        animdel = 5;
        animlen++;
        IF (animfrm > invaderstar+1) animfrm = invaderstar; END
    END

    IF (animlen > 10) BREAK; END

    END

    //set fire to go again
    id2.xinertia = FALSE;

END //Invader zzapp

//x, y, number of baddie ,left or right, index in baddie array
PROCESS Norm_Baddie (xpos, ypos , badid, bdir, b_ind, mon_delay)
PRIVATE
    gfxnum;      //gets what graphic to display next
    st_frm;      //cur anim frame
    maxfrm;      //max anim frame
    anim_time;   //this counts up
    an_start;    //animation start graph number
    diefrme;     //die frame number
    gojump;      //1 = jumpup  2 = jump across  3 = jump jam
    gofire;

    firesprite;  //does the baddie have fire capablities?
    id2;       //plr1
    id3;       //plr2
    ck_id;     //id to check x y from
    lastplr_y; //last player y coord
    lastjmp_y; //where jump started from
    lastjmp_x; //where jump started from

    dist;
    dist2;      //distance to pl2
    det_delay; //detection of where the player is delay /2 if angry
    rel_delay; //timer for finding players on screen
    grav;     //gravity
    vel;      //velocity of jump
    velst;    //velocity start used to tell if jump finished
    vel_dec;
    jumpanim; //this allows animation on jumping up, looks left right
    firespr;  //is this sprite able to fire? mighta monster super drunk all fire
    firedel;
    ylast;
    reboundcount; //when baddie is trapped it will cause it to jump up
    sjumpy;       //y start pos of jump
    jsamecount;   //jumped up more than 2 times do a jump3 up and across 1/2

    del_start; //delay starting movement
    lastangry;
BEGIN

    SWITCH (badid)
    CASE 2,6,7:
        firespr = TRUE; //mighta, monster, super drunk
    END
    DEFAULT:
        firespr = FALSE;//zen chan
    END
    END
    region = 1; //needed for clipping the sprite when it goes off the playfield

    file = sprites;

//    fall = 0;
    jump = FALSE;

    diefrme = baddie_anims[badid].die;
    an_start = baddie_anims[badid].astart;
    maxfrm = an_start + baddie_anims[badid].num_frames;
    gfxnum = an_start + (angry * baddie_anims[badid].num_frames); //load anim
    badnum = badid; //for trapbubbles

    facing = bdir;
    x = xpos;
    y = ypos;
    z = pri_nasties;

    yinertia = FALSE;
    xinertia = FALSE;
    GRAPH = gfxnum;
    det_delay = rel_delay;

    IF (facing == Face_Left) //reverse graphic for facing left
        FLAGS = 1;
    END

    REPEAT

IF (del_start > mon_delay) //del start timer, wait del const of frames to wait

    //If baddie has now changed to normal, angry or heart/blue
    //from last frames status
    IF ((baddie_what == mon_angry OR baddie_what == mon_heart) AND lastangry != baddie_what)
       angry = baddie_what;
    END

    //When player is killed or heart ends set back to normal baddie
    IF (player_died == TRUE OR heart_finished == TRUE) //Player died back to normal status
       angry = mon_norm;
    END

    IF (lastangry != angry)
        anim_time = 20;    //change the anim frame straight away
        gfxnum = maxfrm;
        lastangry = angry; //set this to stop the anim frame from freezing
    END

//speed of baddies,1 min maximum is 7
    IF (angry == mon_angry)
        man_speed = bad_speed2; //Angry Speed
        rel_delay = det_del_angry; //timer for finding player on screen
    ELSE
        man_speed = bad_speed;  //Normal Speed
        rel_delay = det_del_norm;
    END

    IF (gojump == 3) //for jumping up but not across
        man_speed = 2;
    END

//detection of the players on screen

//IF (
//    bubbob[0].bubbled == 0 AND
//    bubbob[1].bubbled == 0
//    )

    IF (det_delay < 0)
        det_delay = rel_delay;

    id2 = get_id(type man);
    id3 = get_id(type man);
//get ids of both players

//check if alive get distance
    IF (id2 != 0)
      dist = get_dist(id2);
      ck_id = id2;
    END
//plr2 distance
    IF (id3 != 0)
      dist2 = get_dist(id3);
      ck_id = id3;
    END
//get which is closest
    IF (id2 != 0 AND id3 != 0)
        IF (dist < dist2)
            ck_id = id2; //ck_id gets the closest dino
        ELSE
            ck_id = id3;
        END
    END
    IF (ck_id > 0)
        lastplr_y = ck_id.y; //read new y variable in
    END

    END

    det_delay--; //where the player is read delay


IF (jump == FALSE AND yinertia == FALSE)
    IF (fall == 0)

        IF  (y >= lastplr_y AND nonebelow == 0 AND xmov !=0)
            gojump = 2; //jump across
        ELSE
            //jump up
            IF  (y > lastplr_y AND platabove == TRUE AND y MOD 16 <= 1)
                    gojump = 1; //jump up val

                //If jumped up more than the same place do a jump3
                IF (lastjmp_x == x AND lastjmp_y == y) //read where last jumped from
                    jsamecount++;
                    IF (jsamecount >2)
                        gojump = 3;     //set to do a jump3 - Up 1/2 across
                        jsamecount = 0; //clear jump counter
                    END
                ELSE
                    jsamecount = 0;
                END

                lastjmp_x = x; //where jump started from to stop jump sticking - used by above
                lastjmp_y = y;

            ELSE
                gojump = 0; //no jump
            END
        END
//To stop baddie being stuck in a box we count how many times its hit the side
        IF (reboundcount > 10 )//AND (xpos MOD 16!=11)) //xpos mod 16 !=11 stops an fall thorough platform error of the baddie
           gojump = 1;
           reboundcount = 0;
        END
    END

END //set Jump up/across

//check for jump key
//checking for fall == false stops jumping in mid air

//check for superdrunk cant jump when firing
//xinertia reused == TRUE its firing
//Jump 1 = Jump Up
//Jump 2 = Jump Across
//Jump 3 = Jump 1/2 Across and Up

IF  (badid != 7 OR (badid == 7 AND xinertia == FALSE)) //xinerita used for firing a missile
    //check for jump
    IF (gojump > 0 AND jump == FALSE AND fall == 0)

        IF (gojump == 2)
            vel =     jumpacross[man_speed-1].vel; //jump across
            grav =    jumpacross[man_speed-1].grav;
            vel_dec = jumpacross[man_speed-1].vel_dec;

        ELSE
            vel =     jumpup[man_speed-1].vel;     //jump up
            grav =    jumpup[man_speed-1].grav;
            vel_dec = jumpup[man_speed-1].vel_dec;
        END
           velst = vel;    //vel start used to stop jump at bottom of jump
           jump = TRUE;    //jump switch to on

        IF (gojump == 1)   //to do the look around before jumping only if jumpup
            jumpanim = 20;

            IF (facing == Face_Left)
                FLAGS = 0;
            ELSE
                FLAGS = 1;

            END

        ELSE
           jumpanim = 0;
        END

        sjumpy = y; //start jump pos to stop when
    END
END

    IF (jumpanim > 0) jumpanim--; END //for looking left right before jumping

     //reset facing for jump
    IF (gojump ==1 AND jumpanim == 10)
        IF (FLAGS == 1)
            FLAGS = 0;
        ELSE
            FLAGS = 1;
        END
    END


//Jump Movement
    IF (jump == TRUE AND fall == 0 and gojump != 0 AND jumpanim <= 0 AND level_stop_what == 0)
            ydmov = vel/grav;
            IF (ydmov == 0) ydmov = 1; END //to stop zero stoping movement
            vel = vel + vel_dec;

            IF (y > sjumpy-4  AND vel > 0)
                jump = FALSE;
                fall = 1;
                gojump = 0;
                ydmov = 0;
            END

    END

//End of fall jump down movement

    IF (fall == 0 AND gojump == 0 AND xstop == TRUE)
            IF (facing == Face_Left)
                IF (ylast == y)
                    reboundcount++;
                ELSE
                    reboundcount = 0;
                END
                ylast = y;
                facing = Face_Right;

            ELSE
                ylast = y;
                facing = Face_Left;
                FLAGS = 1;
            END
    END

//hit a platform turn around
    IF (gojump == 2 AND xstop == TRUE) //if jump across dont reverse way we are facing
        gojump = 0;
        jump = FALSE;
        fall = TRUE;
    END

    xmov = 0; //clear x y stop local variables
    xstop = FALSE;
//left right movement
//if sprite is not firing y inertia == FALSE
//and jumping across

    IF ((fall == 0 AND jump == FALSE AND yinertia == FALSE) OR gojump >= 2)
        //left
        IF (facing == Face_Left)
            xmov -=man_speed;
        END

        //right
        IF (facing == Face_Right)
            xmov = man_speed;
        END
    END

//for swapping anim graphic to face the other way
    IF (jumpanim <= 0)
        IF (facing == Face_Left)
            FLAGS = 1;
        ELSE
            FLAGS = 0;
        END
    END


//DETECT PLATFORMS
    nonebelow = 0;
    platabove = FALSE;

ELSE //drop delay onto screen
    IF (game_state == gs_level_go)
        del_start++;
    END
END

//ANIMATION
//animation goes twice as fast if angry
     IF (angry == mon_angry)
         anim_time+= 2;
     ELSE
         anim_time++; //increase it by one
     END

     IF (anim_time >= 10 AND level_stop_what < stop_monsters)
         anim_time = 0;
         gfxnum++;
         IF (gfxnum >= maxfrm)
            //reload anim
//            IF (baddie_what == mon_heart)

            gfxnum = an_start + (angry * baddie_anims[badid].num_frames);
            maxfrm = gfxnum + baddie_anims[badid].num_frames;

         END
     GRAPH = gfxnum;
//     GRAPH = 998;
     END

IF (level_stop_what == stop_heart)
    jump = FALSE;
END

//Normal platform detection L R Jump Fall
    Get_Hard_Col();

//jumping off platforms jumping up
    IF (fall == FALSE AND jump == false)
        ex_plat_det();
    END

//Update Y coords
    IF ((level_stop_what == stop_heart) OR level_stop_what == 0)
        ypos += ydmov;
    END
//Update X position

    IF (level_stop_what == 0)

    xpos += xmov;

//Can this player Fire a missle across the screen? if so fire one if player on this y plane
      IF (firespr == TRUE AND xinertia == FALSE AND fall == 0 AND jump == false
          AND y == lastplr_y AND kill == 0)
          //call what missile to determine - rock, fireball, laser
          whatmissle(id, x, y, facing, badid, man_speed);
      END

    END //Level stop
//bottom of screen fall though to top
    IF (ypos > y_b_loop)
        ypos = y_bt;
    END

    x = xpos;
    y = ypos;

//write to sprites coords
    id2 = collision (type man);

    IF (id2 != 0)
        IF (baddie_what != mon_heart)
            IF (id2.inv <= 0 )   //check to see if invunrable
                id2.kill = Kill_D_norm; //not kill dino
            END
        ELSE //Heart_kill
            s_trigger[e_popmulti] = TRUE;
            kill = mkill_heart;
        END
    END

    id2 = collision (type water); //water flow kill of baddies
    IF (id2 != 0)
      kill = mkill_water_bubble;
      baddie_water_kill(x, y, badid, id2);
    END

    IF (spec_weapon_go != 0) //special items collision detection
      SWITCH (spec_weapon_go)
        CASE spec_go_tiara:
            id2 = collision(type T_Star_Sprites); //tiara stars
            IF (id2 != 0) kill = mkill_tiara; END
        END
        CASE spec_go_pinball:
            id2 = collision(type Pinball_Star);    //Necklace
            IF (id2 != 0) kill = mkill_necklace; END
        END
        CASE spec_go_light:
            id2 = collision(type Big_Lightning);    //Yellow cross
            IF (id2 != 0) kill = mkill_lning_cross; END
        END
      END
    END


    FRAME;


    UNTIL (baddie_alldie != 0 OR kill != 0); //kill all of them no effects, or hit by a item/bubble effect/dino

    IF (kill > mkill_trap) //killed by item weapon
        //coords, baddie number, which way facing, multi to 0 as this is not a trap bubble pop, kill type
        IF (kill != mkill_water_bubble)
            baddie_kill(x, y, badid, facing, 0, kill);
        END
    ELSE
        IF (baddie_alldie != mkill_do_nothing)
            baddie_kill(x, y, badid, facing, 0, baddie_alldie); //for level advance all kill no food/diamonds
        END
    END
END //Normal Baddie

//detection for nasties which detects platforms above and when
//to jump across a gap
PROCESS Ex_Plat_Det()
PRIVATE
    pl_count;
    xadj;     //to adjust where to jump off
BEGIN
    xadj = ABS (father.xmov); //make neg values positive
    xadj--;

    xpos = (father.xpos);
    ypos = (father.ypos);

//right jump off detect
    IF (father.xmov < 0)
        IF(map_get_pixel(platdata, plt_hrd, xpos - xadj, ypos + 34) == 0)
            father.nonebelow = 0;
        ELSE
            father.nonebelow = 1;
        END
    END

//right jump off detect
    IF (father.xmov > 0)
            IF (map_get_pixel(platdata, plt_hrd, xpos + 31 + xadj , ypos + 34) == 0)
               father.nonebelow = 0;
            ELSE
               father.nonebelow = 1;
            END
    END

//Detect platforms above nasty to jump onto
    FOR (pl_count = 64; pl_count > 0; pl_count -= 16)
    IF (map_get_pixel(platdata, plt_hrd, xpos + 16, ypos - pl_count) >= 1)
        father.platabove = TRUE;
        BREAK;
    END

    END
END //Extra Platform Detection

//this does which baddie missle to do for normal baddies
PROCESS WhatMissle(the_id, xst, yst, rway, bad_id, mansp)
BEGIN
    SWITCH (bad_id)
        CASE 2:
            therock(the_id, xst, yst, rway, mansp);
        END
        CASE 6:
            MFireball(the_id, xst, yst, rway);
        END
        CASE 7:
            drnk_bottle(the_id, xst, yst, rway);
        END
    END
END

//Super Drunk Bottle
PROCESS Drnk_Bottle(id2, xst, yst, rway);
PRIVATE
    animdel;
    animfrm;
    angadd;  //speed of rotation
    bottlespd;
    xstart;
    sidehit;
    changedircount;
    bottlecount;
    id3;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    x = xst;
    y = yst;

    xpos = x;
    ypos = y;

//check that drunk is not too close to the side of the screen
 IF ((xpos > x_side1 AND rway == 1) OR (xpos < x_side2 AND rway == 2))

    bottlespd = 8;

    IF (rway == 1)
        x-=16;
        xmov = -bottlespd;
    ELSE
        x+=16;
        xmov = bottlespd;
    END

    id2.xinertia = TRUE;

    file = sprites;

    GRAPH = drunkbottle;
    z = 500;

    id2.yinertia = TRUE;


    animdel = 10;
    bottlecount = 0;
    angadd = 45000;

//pick up bottle animation
    LOOP

    animdel--;

    IF (animdel < 0)
        animdel = 3;
        IF (rway == 2)
            angle+=angadd;
        ELSE
            angle-=angadd;
        END
        bottlecount++; //to detect when bottle is rotated to start pos
        IF (bottlecount > 4) BREAK; END
    END

    FRAME;

    END

    s_trigger[e_botchuck] = TRUE;

    angadd = 27000;
    xstart = x;
    sidehit = FALSE;
    changedircount = 0;

    xpos = x;
    ypos = y;

    REPEAT
IF (level_stop_what != stop_everything)

    IF (rway == 1)
        angle+=angadd;
    ELSE
        angle-=angadd;
    END

//left hit platforms then set destroy xstop = TRUE
    IF (xmov < 0)
        IF (ycolfind(xpos, ypos) == TRUE);
            s_trigger[e_bothit] = TRUE;
            xmov = NEG xmov;
            angadd = NEG angadd;
            sidehit = TRUE;
            changedircount++;
        END
    END

//Right platforms
    IF (xmov > 0)
        IF (ycolfind(xpos + 31, ypos)== TRUE);
            s_trigger[e_bothit] = TRUE;
            xmov = NEG xmov;
            angadd = NEG angadd;
            sidehit = TRUE;
            changedircount++;
        END
    END
    xpos += xmov;
    x = xpos;
END
    FRAME;

    IF (id3 = collision (type man))
        IF (id3.inv <= 0 ) //check to see if invunrable
            id3.kill = Kill_D_norm;
            BREAK;
        END
    END

    //If nastie sprite died or level advance
    IF (id2.kill != 0) BREAK; END

    IF (level_type != lv_normal AND level_type != lv_demo OR game_state == gs_adv_level OR game_state == gs_level_anims)
       RETURN;
    END


    UNTIL ((rway == 1 AND x => xstart) OR (rway == 2 AND x =< xstart)
    AND sidehit == TRUE OR changedircount > 1)
END

    id2.yinertia = FALSE; //to let the normal baddie process
    id2.xinertia = FALSE; //know that it can throw another and move again

END //Drunk Bottle


PROCESS MFireball(id2, x, y, rway)
PRIVATE
    animdel;
    animfrm;
    firespd;
    id3;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    y += 4;

    xpos = x; //adjustment as h map 1/2 size of screen
    ypos = y;

 IF ((xpos > x_side1 AND rway == 1) OR (xpos < x_side2 AND rway == 2))

    IF (id2.angry == 0)
        firespd = 6;    //fireball speed
    ELSE
        firespd = 10;
    END

//fireball direction of movement
    IF (rway == 1)
        xmov = -firespd;
        FLAGS = 1;        //flip horizontal for left
        xpos -=31;
    ELSE
        xmov = firespd;
        xpos +=31;

    END

    id2.xinertia = TRUE;

    file = sprites;

    animfrm = fireball;
    //z = 500;
    xstop = 0;
    GRAPH = animfrm;

    size = 20;
    animfrm = 20;
    LOOP
        size = animfrm;
        IF (animfrm == 100) BREAK; END
        x += xmov;
        animfrm+=20;

    FRAME;

    END

    animdel = 5;
    animfrm = fireball;
    s_trigger[e_fireball] = TRUE;

REPEAT //Main Loop

    GRAPH = animfrm;
IF (level_stop_what != stop_everything)

//left hit platforms then set destroy xstop = TRUE
    IF (xmov < 0)
        IF (ycolfind(xpos, ypos-8) == TRUE);
            xstop = TRUE;
        END
    END

//Right platforms
    IF (xmov > 0)
        IF (ycolfind(xpos + 31, ypos-8)== TRUE);
            xstop = TRUE;
        END
    END

    xpos += xmov;
    x += xmov;

    animdel--;

    IF (animdel < 0)
        animfrm++;
        animdel = 5;
        IF (animfrm > fireball+1) animfrm = fireball; END
    END

    IF (id3 = collision (type man))
        IF (id3.inv <= 0 ) //check to see if invunrable
            id3.kill = Kill_D_FireInv;
            IF (extra_items == TRUE)
                spec_items[59].counter++; //Fire bubble
            END

            BREAK;
        END
    END

    //If nastie sprite died or level advance
    IF (id2.kill != 0) BREAK; END

    IF (level_type != lv_normal AND level_type != lv_demo OR game_state == gs_adv_level OR game_state == gs_level_anims)
       RETURN;
    END

END
    FRAME;

UNTIL (xstop == TRUE)

//die fireball decrease to nothing in size
    GRAPH = fireball;
    animfrm = 100;
    LOOP
        size = animfrm;
        IF (animfrm <= 0) BREAK; END
        animfrm-=20;
    FRAME;

    END

END
    //set fire to go again
    id2.xinertia = FALSE;
END

//Rock for the Hairy Monster sprite of Normal Baddie
PROCESS TheRock(id2, xpos, ypos, rway, mansp)
PRIVATE
    animdel;
    animfrm;
    angadd;  //speed of rotation
    rockspd;
    id3;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    x = xpos;
    y = ypos;

    IF (id2.angry == 0)
        rockspd = mansp+1;
        angadd = 13500;
    ELSE
        rockspd = 6;
        angadd = 27000;
    END

    IF (rway == 1)
        x-=32;
        xmov = -rockspd;
    ELSE
        x+=32;
        xmov = rockspd;
    END

    id2.xinertia = TRUE;
    id2.yinertia = TRUE;

    file = sprites;

    GRAPH = mighta_rock;
    z = 500;
    size = 20;

    LOOP

    animdel--;

    IF (animdel < 0)
        animfrm+=20;
        animdel = 3;
        size = animfrm;

        IF (animfrm == 100) BREAK; END
    END
    FRAME;

    END

    id2.yinertia = FALSE;
    REPEAT
IF (level_stop_what != stop_everything)

    xpos = (x); //adjustment as h map 1/2 size of screen
    ypos = (y);

    IF (rway == 1)
        angle+=angadd;
    ELSE
        angle-=angadd;
    END

//does side of screen as well
//left hit platforms then set destroy xstop = TRUE
    IF (xmov < 0)
        IF (YColFind_Bad(xpos, ypos) == TRUE);
            xstop = TRUE;
        END
    END

//Right platforms
    IF (xmov > 0)
        IF (YColFind_Bad(xpos + 31, ypos)== TRUE);
            xstop = TRUE;
        END
    END

    x += xmov;
END
    FRAME;

    IF (id3 = collision (type man))
        IF (id3.inv <= 0 ) //check to see if invunrable
            id3.kill = Kill_D_norm;

            BREAK;
        END
    END

    //If nastie sprite died or level advance
    IF ((id2.kill != 0 OR game_state == gs_adv_level OR game_state == gs_level_anims) OR
       (level_type != lv_normal AND level_type != lv_demo))
       RETURN;
    END

    UNTIL (xstop == TRUE)

    animfrm = mighta_dis;
    animdel = 5;

    s_trigger[e_rock] = TRUE;

//Crumble animation
    LOOP

    GRAPH = animfrm;

    animdel--;

    IF (animdel < 0)
        animfrm++;
        animdel = 5;

        IF (animfrm > mighta_dis+3) BREAK; END
    END
    FRAME;

    END

    id2.xinertia = FALSE; //Can throw another one when ready
END //The Rock


PROCESS YColFind_Bad(xst, yst);
//goes down, for Rock
//xstart, ystart
PRIVATE
    blockdet; //gets current block id for comparison
    jdet = 0;
BEGIN

    //test for jump and fall 2 blocks to the side

    //TOP BLOCK
    jdet = map_get_pixel(platdata, plt_hrd, xst, yst);
    jdet += map_get_pixel(platdata, plt_hrd, xst, yst + 15);
    jdet += map_get_pixel(platdata, plt_hrd, xst, yst + 31);

    IF (jdet => 1)
         RETURN(TRUE);
    END
END




//X pos, Y pos, baddie id, facing, index in main baddie array
PROCESS Diag_Baddie (xpos, ypos , badid, bdir, b_ind, mon_delay)
PRIVATE
    gfxnum;      //gets what graphic to display next
    st_frm;      //cur anim frame
    maxfrm;      //max anim frame
    anim_time;   //this counts up
    an_start;    //animation start graph number
    diefrme;     //die frame number
    goud;        //up/down
    diag;
    del_start;
    id2;         //for collisions
    lastangry;   //angry or normal last frame
    hur_angry;   //hurry made this nastie angry - for droping baddie to floor before starts moving
    drop_nast;

BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;

    fall = 0;
    jump = FALSE;
    badnum = badid;

    diefrme = baddie_anims[badid].die;
    an_start = baddie_anims[badid].astart;
    maxfrm = an_start + baddie_anims[badid].num_frames;
    gfxnum = an_start + (angry * baddie_anims[badid].num_frames); //load anim

    facing = bdir;

//Start Movement initialation
    IF (facing == Face_Left)
        FLAGS = 1; //Left
        goud = Face_Down;  //down
    ELSE
        goud = Face_Up; //up Right
    END

    x = xpos;
    y = ypos;
    diag = 0; //for delaying pulpul not used for monsta
    REPEAT

    //If baddie has now changed to normal, angry or heart/blue
    //from last frames status
    IF ((baddie_what == mon_angry OR baddie_what == mon_heart) AND lastangry != baddie_what)
       angry = baddie_what;
       IF (baddie_what == mon_angry)
           hur_angry = TRUE;   //pop of time out of bubble - for droping baddie to floor before starts moving
       END
    END

    //When player is killed or heart ends set back to normal baddie
    IF (player_died == TRUE OR heart_finished == TRUE) //Player died back to normal status
       angry = mon_norm;
       hur_angry = FALSE;
    END

    IF (lastangry != angry)
        anim_time = 20;    //change the anim frame straight away
        gfxnum = maxfrm;
        lastangry = angry; //set this to stop the anim frame from freezing
        IF (angry == mon_angry AND hur_angry == FALSE)
           drop_nast = TRUE;
        END
    END

//speed of baddies,1 min maximum is 7
    IF (angry == mon_angry)
        man_speed = bad_speed2; //Angry Speed
    ELSE
        man_speed = bad_speed;  //Normal Speed
    END

//for swapping anim graphic to face the other way
    IF (facing == Face_Left)
        IF (badid ==3) //only flip the frame if monsta
            FLAGS = 1;
        END
    ELSE
        FLAGS = 0;
    END

//animation goes twice as fast if angry
     IF (angry == mon_angry)
         anim_time+= 2;
     ELSE
         anim_time++; //increase it by one
     END

     IF (anim_time >= 10 AND level_stop_what < stop_monsters)
         anim_time = 0;
         gfxnum++;
         IF (gfxnum >= maxfrm)
            //reload anim
            gfxnum = an_start + (angry * baddie_anims[badid].num_frames);
            maxfrm = gfxnum + baddie_anims[badid].num_frames;
         END

     END

    GRAPH = gfxnum;

    IF (level_stop_what == stop_heart OR drop_nast == TRUE)
        goud = Face_Down; //make all diag sprites fall to the ground if we have collected a heart
    END

IF (del_start > mon_delay) //del start timer, wait del const of frames to wait

    xmov = 0; //clear x y stop local variables
    xstop = FALSE;
    ystop = FALSE;

//Movement

IF (level_stop_what == 0 AND drop_nast == FALSE)
   IF (facing == Face_Left)
//Left
       xmov = -man_speed;
   ELSE
//Right
       xmov = man_speed;
   END

//Up
   IF (goud == Face_Up)
       IF (badid ==3)  //monsta movement
          ydmov = -man_speed;
       ELSE
          //adjustment for pulpul sprite goes 1/2 speed down
          ydmov = -(man_speed/2);
          IF (ydmov == 0) ydmov = -1; END
       END
   END
END

//Down
   IF (goud == Face_Down AND level_stop_what < stop_monsters)
       IF (badid ==3) //monsta movement
          ydmov = man_speed;
       ELSE
          //adjustment for pulpul sprite goes 1/2 speed down
          ydmov = (man_speed/2);
          IF (ydmov == 0) ydmov = 1; END //for zero puts speed 1 in
       END
   END

//   fall = man_speed;

//Detect platforms
   get_hard_col2();

//update x position
    xpos += xmov;
//update y coords

   IF (drop_nast == TRUE AND ystop == TRUE)
       drop_nast = FALSE;
   END

IF (level_stop_what < stop_monsters)
    IF (badid ==4 AND ABS (ydmov) ==1) //do pupul slow movement
        diag--;                   //this does movement every other frame if speed 1 for pulpul
        IF (diag < 0)             //as moves 1/2 speed down
            diag = 1;     //reset delay
            ypos += ydmov;//move down/up pulpul
            //IF (out_region(id,1) == FALSE)
                IF ((ypos <= 82 AND ydmov < 0) OR
                    (ypos >= 432 AND ydmov > 0))
                    ystop = TRUE;
                END
            //END
        END
    ELSE
        IF (badid ==4)
            //IF (out_region(id,1) == FALSE)
            //Check Bounds Pupul
            IF ((ypos <= 82 AND ydmov < 0) OR
               (ypos >= 432 AND ydmov > 0))
               ystop = TRUE;

            ELSE
               ypos += ydmov;    //move pupul
            END
        ELSE
            ypos += ydmov;    //move monsta
        END
    END
END
//hit a platform Left Right then turn around
    IF (xstop == TRUE)
        IF (facing == Face_Left) //face the other way
           facing = Face_Right;
        ELSE
           facing = Face_Left;
        END
    END

//hit a platform above or below move the other way
    IF (ystop == TRUE)
        IF (goud == Face_Up) //swap movement
            goud = Face_Down;
        ELSE
            goud = Face_Up;
        END
    END

//bottom of screen fall though to top
    IF (ypos > y_b_loop)
        ypos = y_bt;
    END

//up to the bottom of the screen
    IF (ypos < y_bt)
       ypos = y_b_loop;
    END

ELSE //drop delay onto screen
    IF (game_state == gs_level_go)
        del_start++;
    END
END

//write to sprites coords

    x = xpos;
    y = ypos;

        FRAME;
    id2 = collision (type man);

    IF (id2 != 0)
        IF (baddie_what != mon_heart)
            IF (id2.inv <= 0 )   //check to see if invunrable
                id2.kill = Kill_D_norm; //not kill dino
            END
        ELSE
            s_trigger[e_popmulti] = TRUE; //Kill by running into by Heart Sound
            kill = mkill_heart;
        END
    END

    id2 = collision (type water); //water flow kill of baddies
    IF (id2 != 0)
      kill = mkill_water_bubble;
      baddie_water_kill(x, y, badid, id2);
    END

    IF (spec_weapon_go != 0) //special items collision detection
      SWITCH (spec_weapon_go)
        CASE spec_go_tiara:
            id2 = collision(type T_Star_Sprites); //tiara stars
            IF (id2 != 0) kill = mkill_tiara; END
        END
        CASE spec_go_pinball:
            id2 = collision(type Pinball_Star);    //Necklace
            IF (id2 != 0) kill = mkill_necklace; END
        END
        CASE spec_go_light:
            id2 = collision(type Big_Lightning);    //Yellow cross
            IF (id2 != 0) kill = mkill_lning_cross; END
        END
      END
    END


    UNTIL (baddie_alldie != 0 OR kill != 0); //kill all of them no effects, or hit by a item/bubble effect/dino

    IF (kill > mkill_trap) //killed by item weapon
        //coords, baddie number, which way facing, multi to 0 as this is not a trap bubble pop, kill type
        IF (kill != mkill_water_bubble)
            baddie_kill(x, y, badid, facing, 0, kill);
        END
    ELSE
        IF (baddie_alldie != mkill_do_nothing)
            baddie_kill(x, y, badid, facing, 0, baddie_alldie);
        END
    END
END //Diag Baddie


PROCESS Get_Hard_Col2(); //for diag sprites
PRIVATE
    xcolpos;
    xcolpos2;
    ycolpos;
    fadj;
    chkplat;
    upadj;
BEGIN

    xmov  = father.xmov;
    xstop = father.xstop;
    ydmov = father.ydmov;

    xcolpos = (father.xpos + xmov); //adjustment as h map 1/2 size of screen
    xcolpos2 = (father.xpos); //adjustment as h map 1/2 size of screen
    ycolpos = (father.ypos);

//    IF (father.badnum == 3) //monsta
//        upadj = father.fall; //to stop jaming when speed = 1
//        IF (ABS (upadj > 1)) upadj = 2; END
//    END

//repeating blocks off screen

    IF (ycolpos >= y_dn_block) ycolpos = y_dn_block; END //Repeat blocks off the screen
    IF (ycolpos <= y_up_block) ycolpos = y_up_block ; END

//Up
    IF (ydmov < 0)
        IF (xcolfind3(xcolpos2, ycolpos + upadj + ydmov) == TRUE)
            ystop = TRUE;
            ydmov = 16 - (ycolpos MOD 16); //for mid air adjustment to be on block
            IF (ydmov == 16) ydmov = 0; END
            father.ydmov = ydmov;
        END
    END

//Down
    IF (ydmov > 0)
        IF (xcolfind3(xcolpos2, ycolpos + 31 + ydmov) == TRUE)
            ystop = TRUE;
            ydmov = 16 - (ycolpos MOD 16); //for mid air adjustment to be on block
            IF (ydmov == 16) ydmov = 0; END
            father.ydmov = ydmov;
        END
    END

//Left
    IF (xmov < 0)
        chkplat = ycolfind2(xcolpos, ycolpos); //check platforms
        IF (chkplat == TRUE);
            father.xstop = TRUE;
            IF ((xcolpos2) mod 16 != 0)
                fadj = -((xcolpos2+5) MOD 16); //+1
                IF (fadj < xmov)
                    father.xmov = fadj;
                END
            ELSE
             father.xmov = 0;

            END

        END
    END

//Right
    IF (xmov > 0)
         chkplat = ycolfind2(xcolpos + 31, ycolpos);
         IF (chkplat== TRUE);
             father.xstop = TRUE;
             IF ((16 - xcolpos2+4) MOD 16 != 0)
               fadj = 16 - (xcolpos2 MOD 16);
                IF (fadj < xmov)
                    father.xmov = fadj;
                END
             ELSE
             father.xmov = 0;
             END

         END
    END

    father.ystop = ystop;
END //Diag hard det

//Nastie y block detection
PROCESS YColFind2(xst, yst);
//this y detection for diag and invader nasties
//xstart, ystart
PRIVATE
    blockdet; //gets current block id for comparison
    bladj;
    bladj2;
    amt;
BEGIN
    amt = father.ydmov;

    //Block detection up
    IF (amt < 0 OR amt == 0)
        blockdet = map_get_pixel(platdata, plt_hrd, xst, yst);
        blockdet = blockdet OR map_get_pixel(platdata, plt_hrd, xst, yst + 15);
    END

    IF (amt> 0 OR amt == 0) //Block Detection down
        blockdet = map_get_pixel(platdata, plt_hrd, xst, yst + 14);
        blockdet = blockdet OR map_get_pixel(platdata, plt_hrd, xst, yst + 30);
    END

    IF (blockdet > 0)
         RETURN(TRUE);
    ELSE
         RETURN(FALSE);
    END
END

PROCESS XColFind3(xst, yst);
// xstart, ystart
PRIVATE
    blockdet; //not zero if block found
    bladj;
    bladj2;
    amt;
BEGIN
    amt = father.xmov;
    IF (amt < 0)  //Move Left
       blockdet = map_get_pixel(platdata, plt_hrd, xst, yst);
       blockdet = blockdet OR map_get_pixel(platdata, plt_hrd, xst + 16, yst);
    ELSE          //Move Right
       blockdet = map_get_pixel(platdata, plt_hrd, xst +16, yst);
       blockdet = blockdet OR map_get_pixel(platdata, plt_hrd, xst + 31, yst);
    END

    IF (blockdet > 0)
         RETURN(TRUE);
    ELSE
         RETURN(FALSE);
    END
END

//Checks one exit is open to the un resized map
PROCESS Get_Exit(xbl, ybl, colour)
BEGIN
    //Check bubble harness map location
    IF (map_get_pixel(platdata, bub_start, xbl, ybl) == colour)

        RETURN (TRUE);
    ELSE
        RETURN (FALSE);
    END
END //Get Exit


PROCESS get_exit_size(x,y,colour);
PRIVATE
    scan_col;
BEGIN
//x = screen draw pos
//xpos = block number count

    REPEAT
        scan_col = map_get_pixel(platdata, bub_start, x, y);
        //Update
        IF (scan_col == colour) xpos++; END
        x++; //increase the x location to get the map pixel from
    UNTIL (xpos >= 28 OR scan_col != colour)

    RETURN (xpos); //return the size
END

//Screen exit status
//   s_ext_closed = 1;   //colours from the bubble map make up the logic
//   s_ext_open_U = 2;
//   s_ext_open_D = 3;

//exits open on the screen for bubbles coming in
//STRUCT exits_open[3]
//    ex_status;  //1 = closed, 2 = up 3 = down
//    ex_st;    //block start pos
//    ex_end;   //end pos
//    ex_size;  //in blocks - 4 for normal exit
//END


//random bubbles from exits of the screen
PROCESS Random_Bubble()
PRIVATE
    rnd_exit;
    Act_Rnd_Exit;
    ecount; //exit loopcount
    exit_size;
    readcolour;
    Exit_No;
    sc_size;
    finished_exits;
BEGIN

//Set all as closed
     FOR (ecount = 0; ecount <= 3; ecount++)
        exits_open[ecount].ex_status = s_ext_closed;
        exits_open[ecount].ex_st = 0;
        exits_open[Exit_No].ex_end = 0;
        exits_open[Exit_No].ex_size = 0;
     END

    ypos = 4; //Top of the screen

    Exit_No = 0; //exit 1

REPEAT
    ecount = 1; //do 2 exits
    xpos = 5;   //miss out the side of the screen
    x = 0;
    finished_exits = FALSE;

REPEAT
    readcolour = map_get_pixel(platdata, bub_start, xpos, ypos);

    IF (readcolour == s_ext_closed) //Start Scan from left side of screen
      sc_size = get_exit_size(xpos ,ypos, readcolour);
      x+= sc_size;
      xpos += sc_size;
    END

    IF (x >= 28)
      finished_exits = TRUE;
    END

    //Exit open
    IF (finished_exits == FALSE)
        //Get the exit direction
        readcolour = map_get_pixel(platdata, bub_start, xpos, ypos);
        exits_open[Exit_No].ex_status = readcolour; //Store the Direction of the exit
        exits_open[Exit_No].ex_st = x;           //Store the start pos of the exit

        //Find size of exit
        sc_size = get_exit_size(xpos,ypos, readcolour);//find how big this exit is

        x+= sc_size;     //update block loc
        xpos += sc_size; //increase scan loc

        exits_open[Exit_No].ex_end = x-1;          //end pos of exit
        exits_open[Exit_No].ex_size = sc_size;

    END

    Exit_No ++; //Next Exit
    ecount++;   //do 2 exits

    IF (x >= 28) //Might of reached the side of the screen
      finished_exits = TRUE;
    END

UNTIL (ecount > 2 OR Exit_No > 3 OR finished_exits == TRUE)
     ypos = 29; //Bottom exits

UNTIL (Exit_No > 3)

  exits_count = 0;
  Exit_No = 0;

//Clear the exits open numbers
  FOR (ecount = 0; ecount < 4; ecount++)
     exit_rnd_open[ecount] = 0;
  END

//Scan for Exits which are open
  FOR (ecount = 1; ecount <=4; ecount++)
      IF (Exit_no < 2)
         //Check Top Exits - to see if they can do random bubbles
         IF (exits_open[Exit_No].ex_status == s_ext_open_D) //Exit movement Down
            exit_rnd_open[exits_count] = Exit_No;
            exits_count++;
         END
      ELSE //Check Bottom Exits
         IF (exits_open[Exit_No].ex_status == s_ext_open_U) //Exit Movement Up
            exit_rnd_open[exits_count] = Exit_No;
            exits_count++;
         END
      END
    Exit_No++;
  END

//on a demo or normal level, potion continues on with the game
 IF (level_type != lv_normal AND level_type != lv_demo OR level_type == lv_extend)
    RETURN;
 END

 IF (exits_count > 0 AND exits_count <5) //only if there are exits do this next random bubble loop
 REPEAT
   IF (game_state != gs_level_go)
      timer[1] = 0;
   END

   IF (timer[1] >= Next_Rnd_Time AND level_next == 0)
    rnd_exit = rand (0, exits_count-1); //find a random exit open
    timer[1] = 0;

    Act_Rnd_Exit = exit_rnd_open[rnd_exit];

    Bubble_rand_go(Act_Rnd_Exit);  //top exit left
   END //Bubble rnd timer

  FRAME;
 UNTIL (game_state >= gs_level_completed OR level_type == lv_secret OR level_type == lv_extend) //Kill when next Level Reached
 END

END

//Random bubbles from top or bottom open levels
PROCESS Bubble_Rand_Go(Exit_Rnd_No)
PRIVATE
    rndcount; //to stop infinite loop in randomiser
    done;     //weve done a random bubble no more
    whichbub; //which one to try and do
    fireb_do; //do a fire bubble?
    e_size;   //exit size
    e_start;  //exit start block
    rnd_st_x; //randomising bubbles x start when exit > 4 blocks in width - could be the whole bottom or top of the screen
BEGIN

//total_bubs - total alive
//max bubs - global var,max on screen at once
// test = max_bubs;
// test2 = total_bubs;

 IF (total_bubs < max_bubs)

//Get Y Start Position of the Random Bubble
    IF (Exit_Rnd_No<=1) // Exit 1 or 2 top
       y = y_bub_startT;
    ELSE
       y = y_bub_startB;
    END
//Initialise X position to be side of the screen
    x = x_bub_start;

    e_size  = exits_open[Exit_Rnd_No].ex_size;
    e_start = exits_open[Exit_Rnd_No].ex_st;

    IF (e_size <=4)
       x += (e_start + (e_size/4)) * block_res; //put bubble in the middle of the exit
    ELSE
       rnd_st_x = rand (1,e_size-1); //randomise along the length of the exit
       x += (e_start + (rnd_st_x-1)) * block_res;
    END

   IF (count_extra < last_lev_extra) //extend if baddies still on screen
        Bubble_sprite(x, y, extrbub, rand (0, 5) , 0, 0, 0);
   ELSE

//Fire Bubble 1 in 4096 bubbles
   IF (RAND (1,fire_bubble_rnd) == 1 OR fire_bubble_go == TRUE)
         fire_bubble_go = FALSE;
         Fire_Bubble(x, y, 0);
      RETURN;
   END

//Random EXTEND Bubbles are done by another process
   LOOP
        whichbub = rand (0, 3); //randomize bubbles
      SWITCH (whichbub)
      CASE bubfire:
        IF (count_fire < numfire)
            Bubble_sprite(x, y, specbub, bubfire , rand (1,0), 0, 0);
            done = TRUE;
        END
      END

      CASE bubwater:
        IF (count_fire < numwater)
            Bubble_sprite(x, y, specbub, bubwater , rand (1,0), 0, 0);
            done = TRUE;
        END
      END

      CASE bublight:
        IF (count_fire < numlight)
            Bubble_sprite(x, y, specbub, bublight , rand (1,0), 0, 0);
            done = TRUE;
        END
      END
      CASE normbub:
        Bubble_sprite(x, y, normbub, 0 , rand (1,0), 0, 0);

        done = TRUE;
      END

      END //SWITCH

   IF (done == TRUE)
        BREAK;
   END

   FRAME;

  END //loop end
     //IF (done == FALSE) Bubble_sprite(x, y, normbub, 0 , rand (1,0), 0, 0); END

  END //extra end

 END

END


//EXTEND store pickup
//id2 of dino, extend bubble number 0-5
PROCESS Extendcol(id2, num)
PRIVATE
    plr;
BEGIN

    plr = ret_dino_num(id2);

    IF (plr == 0)
        //find if collected;
        x = x_bplr1; //xloc start left hand side of screen
    ELSE
        x = x_bplr2; //xloc start right hand side of screen
    END

    IF (bubextend[plr].collected[num] == 0)
        y = y_bplr + (num * 32); //location on screen of extend bubble
        bubextra(x,y,plr,num);   //do extend bubble
    END

    got_extend = TRUE;

END

//checks all extend bubbles are collected and do animation
//for player1 and player2
PROCESS CheckXBub();
BEGIN

//check all collected
        anim_x_plr1 = ret_colected(0);
        anim_x_plr2 = ret_colected(1);

//Player 1 extend bubbles all collected anim
        IF (anim_x_plr1 == TRUE)
            IF (anim_x_p1tme < ext_animtime) //check anim time
                anim_x_p1tme++;              //increase anim time
            ELSE
                anim_x_p1tme = 0;
                clr_collected(0);
                anim_x_plr1 = FALSE;
                effects[e_extend].stop_effect = TRUE;
                Extend_screen(0); //Extend Screen
            END
        END

//Player 2 extend bubbles all collected anim
        IF (anim_x_plr2 == TRUE)
            IF (anim_x_p2tme < ext_animtime) //check anim time
                anim_x_p2tme++;              //increase anim time
            ELSE
                anim_x_p2tme = 0;           //reset timer for next animation
                clr_collected(1);            //destroy bubbles
                anim_x_plr2 = FALSE;        //clear anim go of sprites
                effects[e_extend].stop_effect = TRUE;
                Extend_screen(1); //Extend Screen
            END
        END
END

//Returns true if all the bubbles are collected
//Or animates which player has all 6 bubbles
//input plr1 or 2  (0 or 1)
PROCESS Ret_Colected(plr)
PRIVATE
    bcount;
    bubind;
BEGIN
    //counts bubbles which are on the screen
    FOR (bubind = 0; bubind < 6; bubind++)
       IF (bubextend[plr].collected[bubind] != 0)
           bcount++;
       END
    END

    IF (bcount >= 6) //seven bubbles collected
        IF (doing_effect[pri_1] != e_extend) //trigger sound if not playing
           level_stop_what = stop_everything;
           s_trigger[e_extend] = TRUE;
        END

        RETURN (TRUE);
    ELSE
        RETURN (FALSE);
    END

END

//clears the collected extend bubble array for pl1 or 2
//kills the sprites
PROCESS Clr_Collected(plr)
PRIVATE
    b_id;
    bubind;
BEGIN
    //kills the players extend bubbles collected sprites
    FOR (bubind = 0; bubind < 6; bubind++)
       b_id = bubextend[plr].collected[bubind];//get the id of the bubble
       signal(b_id, s_kill);                   //kill the bubble sprite
       bubextend[plr].collected[bubind] = 0;   //clear the array of sprite id's
    END

END


//Sprites EXTEND
//The ones on the sides of the screen
PROCESS BubExtra(xl,yl,plr, bub)
PRIVATE
    animframe;
     a_max;
    a_min;
    plrx;
    banim;
    sp_it_id;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield

    file = sprites;
    animframe = extend + bub;
    a_min = extend;
    a_max = extend + 6;

    sp_it_id = 39-bub;
    spec_items[sp_it_id].counter++; //Candy canes for extend bubbles collected

    bubextend[plr].collected[bub] = id;
    x = xl;
    y = yl;
    plrx = plr+1;
    LOOP
    GRAPH = animframe;
        //This animates them if the player has collected a whole set of them
        IF ((plrx == 1 AND anim_x_plr1 == TRUE) OR
            (plrx == 2 AND anim_x_plr2 == TRUE))
            banim++;
        //resets the animation frames
        IF (banim => 5)
            banim = 0;
            animframe--;
            IF (animframe < a_min) animframe = a_max -1; END
        END
        END

        IF (level_type == lv_end) BREAK; END

        FRAME;

    END //loop end

END

PROCESS Bubble_MOD (bub_speed)
BEGIN
    SWITCH (bub_speed)
        CASE 1..4:
            RETURN (3);
        END
        DEFAULT:
            RETURN (bub_speed);
        END
    END

END

PROCESS Bubbler_Mov()
PRIVATE
    chk[hd_num]; //array to hold 1 if found for colours
                 //each cell corresponds to a colour
                 //0 not used
                 //1 plat
                 //2 up
                 //3 down
                 //4 left
                 //5 right
                 //6 bobblelr
                 //7 bobble ud
                 //8 bobble circle
    chk2[hd_num]; //array to hold 1 if found for colours

    x_in; //to hold inertia values
    y_in;

    x_st;
    y_st;

    lastx;
    lasty;
    f_adj;

//These are to stop the bubbles from having no movement through been on platforms
    drift_up;      // up or down last y movement
    drift_st;      //start drift up/down of bubble
    no_move;       // no move flag go
    no_move_count; // count as some bubbles stop for a while then go again

    y_bub_mod;     //bubble MOD remainder value 1..4 = 3, 5=5 6=6, 7=7

    runx;   //Run along a wall above/below
    runy;   //run along a wall to the left right
    runxst; //start to initialise x run
    runyst; //start to initialise y run

    bob_go;   //true false
    bob_pos;  //position on table
    bob_pos2; //position on table

    bob_type; //
    ini_Del;
BEGIN
     x = (father.x); //adjustment to where screen starts
     y = (father.y);

//START movement
    chk [map_get_pixel(platdata, bub_hrd, x , y)] = 1; //top left
    chk [map_get_pixel(platdata, bub_hrd, x+31 , y)] = 1; //top right
    chk [map_get_pixel(platdata, bub_hrd, x+15 , y+15)] = 1; //top right
    chk [map_get_pixel(platdata, bub_hrd, x+31 , y+31)] = 1; //bottom right

    IF (chk[hd_up] == 1)
          lasty = lst_up;
    ELSE
       IF (chk[hd_down] == 1)
          lasty = lst_dn;
       END
    END

    IF (chk[hd_left] == 1)
            lastx = lst_lf;
    ELSE
        IF (chk[hd_right] == 1)
            lastx = lst_rt;
        END
    END
//BUBBLE SPEED
   //bubble_speed = 1;
   y_bub_MOD = Bubble_MOD (bubble_speed);

LOOP
     x = (father.x); //adjustment to where screen starts
     y = (father.y);
     xmov = 0;
     ydmov = 0;

     x_in = father.xinertia;
     y_in = father.yinertia;

//for repeating blocks off the screen
    ypos = y;
    IF (y >= y_dn_block) ypos = y_dn_block; END //Repeat blocks off the screen
    IF (y <= y_up_block2) ypos = y_up_block2;END

//Array cells are the colours
    chk[1] =0;
    chk[2] =0; //up
    chk[3] =0; //down
IF(runx == 0)
    chk[4] =0; //left
    chk[5] =0; //right
END

    x_st = 15;
    IF(lastx == lst_rt)
        x_st = 16;
    END

    y_st = 15;
    IF(lasty == lst_dn)
        y_st = 16;
    END

//Check Full size bubble hardness map for movement
//Get the square colour into movement array chk[]
    chk [map_get_pixel(platdata, bub_hrd, xpos+x_st , ypos+y_st)] = 1;

    IF (bob_go == TRUE) //only run if we have stoped moving so check for bobble
        //Bobble Colours
        chk[6] =0; //up down
        chk[7] =0; //left right
        chk[8] =0; //circle

        chk [map_get_pixel(platdata, bub_hrd, xpos+8 , ypos+8)] = 1; //top left
        chk [map_get_pixel(platdata, bub_hrd, xpos+24 , ypos+8)] = 1; //top right
        chk [map_get_pixel(platdata, bub_hrd, xpos+24 , ypos+8)] = 1; //bottom left
        chk [map_get_pixel(platdata, bub_hrd, xpos+24 , ypos+24)] = 1; //bottom right


    SWITCH (bob_type) //bobble movement types
        CASE hd_bob_ud:
            ydmov = bobbletable[bob_pos];  //up down bobble
        END

        CASE hd_bob_lr:
            xmov = bobbletable[bob_pos];   //left right bobble
        END
        CASE hd_bob_cir:
            xmov  = bobbletable2[bob_pos]; //circular bobbles
            ydmov = bobbletable[bob_pos];
        END
    END
        bob_pos++;

        IF(bob_pos >= num_bob)
            bob_pos = 0;
        END

        IF (chk [bob_type] != 1) //end bobble
            bob_go = FALSE;
            father.bobble = FALSE;
        END

    END

    no_move = FALSE;    //initialise no move flag

IF (drift_st == TRUE OR drift_up == TRUE and bob_go == FALSE AND y>80 AND y <= 432) //DRIFT UP/DOWN
//start using the other array
    chk2[1]=0;
    chk2[2]=0;
    chk2[3]=0;
    chk2[4]=0;
    chk2[5]=0;

    chk2 [map_get_pixel(platdata, bub_hrd, x , y)] = 1; //top left
    chk2 [map_get_pixel(platdata, bub_hrd, x+30 , y)] = 1; //top right
    chk2 [map_get_pixel(platdata, bub_hrd, x+15 ,y+16)] = 1; //top right
    chk2 [map_get_pixel(platdata, bub_hrd, x , y+31)] = 1; //bottom left
    chk2 [map_get_pixel(platdata, bub_hrd, x+31 , y+31)] = 1; //bottom right

    IF (chk2[1] ==1)
        IF(lasty == lst_up) //drift up or down through the blocks
            chk[hd_up] =1;
        ELSE
            chk[hd_down] =1;
        END
        //clear left right or bubble will start to wander on x, when it gets near the top of the platform
        chk[hd_left] =0;
        chk[hd_right] =0;
        drift_up = TRUE;
    ELSE
        drift_up = FALSE;
        drift_st = FALSE;
    END

END //DRIFT UP/DOWN

    IF (runx == 0 AND bob_go == FALSE)
        IF (chk[hd_up] == 1)
            ydmov -= bubble_speed;
        ELSE
            IF (chk[hd_down] == 1)
             ydmov += bubble_speed;
            END
        END

        IF (chk[hd_left] == 1)
            xmov -=bubble_speed;
        ELSE
            IF (chk[hd_right] == 1)
            xmov +=bubble_speed;
            END
        END
    END

//Stops inertia shoving bubbles off the screen
    IF (y <= 88 OR y >= 432)
        runy = 0;
        y_in = 0;
    END

    IF (y MOD 16 != 0 AND runx !=0) //to stop runx error when it runs x through a block
      runx = 0;
    END

    IF ((x >= 523 AND x_in > 0) OR (x <= 106 AND x_in < 0))
        x_in = 0;
    END

//inertia add
      ydmov += y_in;
      xmov  += x_in;
      xmov += runx;

      IF (runx < 0)
         IF (xbubfindlf (x, y, bubble_speed) == FALSE)
            runx = 0;
         END
      END

      IF (runx > 0)
         IF (xbubfindrt (x, y, bubble_speed) == FALSE)
            runx = 0;
         END
      END

//place where the bubbles will end up if they dont hit a platform
      xpos   = x + xmov;
      ypos   = y + ydmov;

//do platform detection
IF (drift_up == FALSE AND xmov == 0)

      IF (ydmov < 0)
            IF (xbubfind(x, ypos- man_speed) != 0)
                IF ((ypos+y_bub_MOD) MOD 16 !=0)
                    f_adj =0;
                    f_adj = -((ypos+y_bub_MOD) MOD 16); //for mid air adjustment to be on block

                    IF (f_adj > abs (ydmov))
                        ydmov = f_adj;
                    END
                ELSE
                    ydmov = 0;
                    IF ((y MOD 16)==1)
                        ydmov = -1;
                    END
                    runxst = TRUE; //set run x to start
                END
            ELSE
                lasty = lst_up;
            END
      ELSE
        IF (ydmov > 0)
            IF (xbubfind(x, ypos+31+man_speed) != 0)
                f_adj =0;
                f_adj = 16-((y) MOD 16); //for mid air adjustment to be on block
                IF (f_adj < ydmov)
                    ydmov = 0;
                END

                IF (ydmov == 16) //ydmov gets 16 if on a block
                    ydmov = 0;
                END
                runxst = TRUE; //set run x to start
            ELSE
                lasty = lst_dn;
            END

        END
      END
END //y movement

IF (level_stop_what != stop_everything)
      y+=ydmov;
END

//X Movement
      f_adj =0;
      IF (xmov < 0 AND drift_up == FALSE) //Left
         IF (ybubfind(xpos-1, y) != 0)
            IF ((x+4) MOD 16 != 0)       //adjustment so bubble ends up right next to a platform
                f_adj = -((x+4) MOD 16);
                IF (f_adj > abs (xmov))  //sometimes get an error which puts the bubble trough a platform
                    xmov = 0;
                END
                xmov = f_adj; //ok add the distance to a platform to xmov, which updates the x coord
            ELSE
                xmov = 0;
            END
         ELSE
            lastx = lst_lf;
            IF (xbubfindlf (xpos-1, y, 0) == TRUE AND runx == 0 AND y > 80)
               runx = xmov;
            END

         END
      ELSE
         IF (xmov > 0 ) //Right
            IF (ybubfind(xpos + 31, y) != 0 AND drift_up == FALSE)
            IF ((x+4) MOD 16 != 0)
                xmov = -((xpos+4) MOD 16);
            ELSE
                xmov = 0;
            END

         ELSE
            IF (xbubfindrt (xpos, y, 0) == TRUE AND runx == 0 AND y > 80)
               runx = xmov;
            END

            lastx = lst_rt;
         END
        END
     END //normal movement

IF (level_stop_what != stop_everything)
     x+= xmov;
END
     IF (xmov == 0 AND ydmov == 0)

        //do bobble?
        IF (bob_go == FALSE)
        bob_type = check_bobble(x, y); //call function to see if we are on a bobble coloured square

        IF (bob_type!=0) //detected where on a bobble square of the hardness map
            bob_go = TRUE;   //set to bobble the bubble
            father.bobble = TRUE;
        ELSE
           drift_st = TRUE;
        END

        END
     END

//Loop Bubbles to top bottom of the screen
/*    IF(y_up_stop > y)
       y = y_bub_startB;
       IF (map_get_pixel(platdata, bub_hrd, x , y) != 2)
       END
    END

    IF(y_dn_stop < y)
       y = y_bub_startT;
    END
*/

    father.x = x; //update main bubble sprite
    father.y = y;

    FRAME (bubble_frame); //frame delay on the bubbles

END //LOOP END

END

PROCESS Check_Bobble(x, y);
PRIVATE
    bob_val;
    bl1[hd_num]; //array to hold found colours
BEGIN
    x+=8;
    bl1[map_get_pixel(platdata, bub_hrd, x      ,y     )] = 1;
    bl1[map_get_pixel(platdata, bub_hrd, x + 30 ,y     )] = 1;
    bl1[map_get_pixel(platdata, bub_hrd, x      ,y + 30)] = 1;
    bl1[map_get_pixel(platdata, bub_hrd, x + 30 ,y + 30)] = 1;

    IF (bl1[hd_bob_lr] == 1)
        RETURN(hd_bob_lr);
    END

    IF (bl1[hd_bob_ud] == 1)
        RETURN(hd_bob_ud);
    END

    IF (bl1[hd_bob_cir] == 1)
        RETURN(hd_bob_cir);
    END

    RETURN (0); //return 0 if no bobble of the bubble detected
END

//Process to check for RUN ALONG WALL END LEFT
//RETURNS true if wall found
PROCESS XBubFindLf(xst, yst, xspeed); //x,y, speed to adj start position of checking
//xstart, ystart
PRIVATE
    bl1[hd_num]; //array to hold found colours
BEGIN
    xst+=(32-xspeed);
    bl1[map_get_pixel(platdata, bub_hrd, xst ,yst-1)] = 1;
    bl1[map_get_pixel(platdata, bub_hrd, xst , yst+31)] = 1;

    IF (bl1[hd_stop] == 1)
        RETURN(true); //wall next to the bubble
    ELSE
        RETURN(false);
    END
END

//Process to check for RUN ALONG WALL END RIGHT
//RETURNS true if no wall found
PROCESS XBubFindRt(xst, yst, xspeed);
PRIVATE
    bl1[hd_num]; //array to hold found colours
BEGIN
    //xst-=1;
    bl1[map_get_pixel(platdata, bub_hrd, xst + xspeed, yst-1)] = 1;
    bl1[map_get_pixel(platdata, bub_hrd, xst + xspeed, yst+31)] = 1;

    IF (bl1[1] == hd_stop)
        RETURN(true); //no wall next to the bubble
    ELSE
        RETURN(false);
    END
END

//normal bubble movement up/down find
PROCESS XBubFind(xst, yst);
PRIVATE
    bl1[hd_num]; //array to hold found colours
BEGIN

    bl1[map_get_pixel(platdata, bub_hrd, xst , yst)] = 1;
    bl1[map_get_pixel(platdata, bub_hrd, xst + 16 , yst)] = 1;
    bl1[map_get_pixel(platdata, bub_hrd, xst + 31, yst)] = 1;

    IF (bl1[1] == hd_stop) //return true found a wall
        RETURN(true);
    ELSE
        RETURN(false);
    END
END


//normal bubble movement left/right find
PROCESS YBubFind(xst, yst); //x,y, top and bottom side adjusments to stop sticking
PRIVATE
    bl1[hd_num];
BEGIN

    bl1[map_get_pixel(platdata, bub_hrd, xst, yst)] = 1;
    bl1[map_get_pixel(platdata, bub_hrd, xst, yst + 15)] = 1;
    bl1[map_get_pixel(platdata, bub_hrd, xst, yst + 31)] = 1;

    IF (bl1[1] == hd_stop) //return true found a wall
        RETURN(true);
    ELSE
        RETURN(false);
    END
END

PROCESS Check_XBounds(xpos)
BEGIN
    IF (xpos <xpos_l OR xpos => xpos_r)
        RETURN (TRUE);
    ELSE
        RETURN (FALSE);
    END
END

PROCESS Check_Real_Y(ypos)
//for bubble killing has to use the real y value not the one used for
//the block detection
BEGIN
//    y_up_stop = 32-80; //5* 16 pixel blocks
//    y_dn_stop = 512;   //3* 16

    IF (ypos < y_up_stop OR ypos > y_dn_stop)

        RETURN (TRUE);
    ELSE
        RETURN (FALSE);
    END
END

PROCESS Check_OnScr_Y(ypos)
//for bubble killing has to use the real y value not the one used for
//the block detection
BEGIN
//    y_up_start = -32;
//    y_dn_start = 480;

    IF (ypos > 0 AND ypos < y_dn_start)
        RETURN (TRUE);
    ELSE
        RETURN (FALSE);
    END
END

//Do See through bubbles
PROCESS See_Through();
BEGIN
    IF (bubble_trans == FALSE)   //bubbles see through? = 4
        RETURN (0);
    ELSE
        RETURN (4);
    END
END

//Bubble inertia calculator
PROCESS Inertia_To_Other(id2, dis, xd, yd)
PRIVATE
    moveadd;
BEGIN
    moveadd = 0;

    IF (dis < 28)
       moveadd = 2;
    END

    IF (dis < 20)
       moveadd = 3;
    END

    IF (dis < 18 AND dis > 16)
       moveadd = 4;
    END

    //Shove other sprite across
    IF (xd != 0)
        IF (xd > 0)
            id2.xinertia = moveadd;
        ELSE
            id2.xinertia = -moveadd;
        END
    END

    //shove other sprite down
    IF (yd != 0)
        IF (yd > 0)
            id2.yinertia = moveadd;
        ELSE
            id2.yinertia = -moveadd;
        END
    END

END

PROCESS Pushtest (dist)
//for testing bubble/man proximity for pushing
BEGIN
     IF (dist > 0 AND dist <32)
        RETURN (TRUE);
     ELSE
        RETURN (FALSE);
     END
END


PROCESS Get_Exit_Number(bub_block, w_exit_at);   //Exit number it has gone through
PRIVATE
    sc_exit_st;   //start at this leftmost exit 0 to top, set to 2 for top
    sc_lcount; //check 2 exits so need a loop counter to scan both of them
    exit_found; //found the exit the bubble has gone through - T/F
BEGIN
//    sc_exit_st = 0

//Check the Bottom exits else 0 will start at the top left exit
    IF (w_exit_at == Which_ex_at_Bot)
      sc_exit_st = 2;
    END


    FOR (sc_lcount = 0; sc_lcount < 2; sc_lcount++)
     //Check that the Exit is open
     IF (exits_open[sc_exit_st].ex_status != s_ext_closed)      //1 = closed, 2 = up 3 = down

      //Check if the sprite is at this exit
      IF (bub_block >= exits_open[sc_exit_st].ex_st AND bub_block <= exits_open[sc_exit_st].ex_end)
        exit_found = TRUE;
        BREAK; //quit find exit loop
      END
    END
      sc_exit_st++; //Do the right exit next

    END//Find exit Loop

    IF (exit_found == TRUE)
      RETURN (sc_exit_st); //Return the Exit Number
    ELSE
      RETURN (99); //Return the Terminator to say no exit found
    END
END

//Otherwise it kills the bubble
//Exits
//0 = Top left
//1 = Top Right
//2 = Bottom Left
//3 = Bottom Right
/*
   Exit_Scan[3]
   check1;
   check2;
   check3;
*/

PROCESS Get_Loop_Exit(exit_at)
PRIVATE
    chk_open;     //Check the exit is open
    exits_closed; //gets true if no exits are open to loop the sprite to
    bub_way;      //check the exit does the oposite movement otherwise we cant loop it
BEGIN

    IF (exit_at < 2) //Exits Bottom
      bub_way = s_ext_open_U;
    ELSE             //Exits Top
      bub_way = s_ext_open_D;
    END

    chk_open = Exit_Scan[exit_at].check1;
    //1st one is the next to exit so has to go the other way
    IF (exits_open[chk_open].ex_status == bub_way OR exits_open[chk_open].ex_status ==1)      //check the first - next to the exit
       //Next 2 exits go the same way the sprite was moving
       chk_open = Exit_Scan[exit_at].check2;
       IF (exits_open[chk_open].ex_status != bub_way)      //check the second - down/up
          chk_open = Exit_Scan[exit_at].check3;
          IF (exits_open[chk_open].ex_status != bub_way)      //check the thrid - diagonal
             exits_closed = TRUE; //no they are all shut
          END
       END
    END

    IF(exits_closed == TRUE)
      RETURN (99); //only one exit is open so cant loop the sprite
    ELSE
      RETURN (chk_open); //has the last exit found
    END
END

//   s_ext_closed = 1;   //colours from the bubble map make up the logic
//   s_ext_open_U = 2;
//   s_ext_open_D = 3;

//BUBBLES
//x, y, bubble type, trap bubble number/special id/extend no, blue/green,
//id3 for trap bubbles otherwise unused

//pop right away for blowing bubbles max on screen reached
PROCESS Dino_Bubble_Sprite(xloc, yloc, bcolour, id3)
PRIVATE
    lifetime;
    animframe;
    anim_s;   //start anim frame
    anim_p;   //red  anim frame
    anim_r;   //pink anim frame
    cur_frame; //current frame for up down animation
//  facing Global - for storing which way the dino is facing. For animation of fire water lightning

    animdir;   //for doing animation up and down of frames on trap bubbles
    id2;
    id_store; //for multipop
    plr;
    dist;
    xdist;
    ydist;
    lcount; //loop for checking all the sprites

    //For Turning the Bubble pink then red then flashing
    //gets a percentage of the bubbles lifetime or trapped time if a trap bubble
    one_percent; //one percent counter
    go_pink;     //60 percent
    go_red;      //80 percent
    go_flash;    //90 percent
    bounce_shove;//for squashing the bubbles
    chainpop;    //chain of popping bubbles go?
    detman;
    //lastx;
    //lasty;
    ini_Del; //Intertia delay - to allow bubble mov to update this process with movement

    //which_exit_at; //top bottom which set of exits has the bubble gone through
    bub_block;     //Curent block the bubble is on
    the_exit_No;   //Exit number it has gone through
    loop_to_exit;
    dest_exit_x;
    dest_st_block;
    exit_x_adj;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield

    file = sprites;
    x = xloc;
    y = yloc;
    z = pri_bubbles;

    anim_s = dino_trap_bubbles + (bcolour * 9);
    anim_p = dino_trap_bubbles + 3 + (bcolour * 9);
    anim_r = dino_trap_bubbles + 6 + (bcolour * 9);

    lifetime = bubble_time*100; //bubble fire


//for lifetime of bubbles and going pink then red animations
    one_percent = lifetime/100;
    go_pink     = level_timer2 + (one_percent*60);
    go_red      = level_timer2 + (one_percent*70);
    go_flash    = level_timer2 + (one_percent*85);

    lifetime = lifetime + level_timer2; //lifetime of the bubble

    animframe = anim_s; //load start animation frame

    FLAGS = see_through(); //for transparent bubbles
    GRAPH = animframe;

    animdir = 1;  //initialise animation direction for trap special bubbles

    Bubbler_mov(); //make a bubble movement process for this sprite

//START OF SPRITE LOOP
REPEAT
    xstop = FALSE;
    ystop = FALSE;

   IF (timer[2] == 0)
      cur_frame+=animdir;                 //update current frame
      IF (cur_frame <=0 OR cur_frame >=2) //check bounds
          animdir = NEG animdir; //make the animation go the other way by negating the add value
      END
   GRAPH = animframe + cur_frame;

   END

//Turns the Normal Bubbles Different colours
    IF (level_timer2 >= go_pink)
        IF (level_timer2 < go_red)
        animframe = anim_p;                    //Turn bubble Pink
        ELSE
            IF  (level_timer2 < go_flash)      //turn bubble Red
                animframe = anim_r;
            ELSE
                IF (level_timer2 > lifetime)   //bubble past its lifetime?
                    BREAK;                     //quit sprite loop
                ELSE
                    IF (timer[5] == 0)          //Flash bubble
                        IF (animframe == anim_p)
                            animframe = anim_r;  //Red
                        ELSE
                            animframe = anim_p;  //Pink
                        END
                    END
                END
            END
        END
    END

    ydmov = 0;
    yumov = 0;
    xmov  = 0;
    jmov = FALSE;

    x = son.x;
    y = son.y;
    id2 = 0;
    id_store =0;

//Loop Bubbles to top bottom of the screen
    IF(y < y_up_stop)
       bub_block = (x-108)/block_res;  //Curent block the bubble is on

       the_exit_No = Get_Exit_Number(bub_block, Which_ex_at_Top);   //Exit number it has gone through

       IF (the_exit_no == 99) //99 for none open
         BREAK; //Quit bubble loop - trapped bubbles will release the nastie
       END

       loop_to_exit = Get_Loop_Exit(the_exit_No);

       IF (loop_to_exit == 99) //99 for none open
         BREAK; //Quit bubble loop - trapped bubbles will release the nastie
       END

       //Loop to the bubble if directly above below the destination exit
       IF ((the_exit_No == 0 AND loop_to_exit == 2) OR
           (the_exit_No == 1 AND loop_to_exit == 3) AND exits_open[the_exit_no].ex_st == exits_open[loop_to_exit].ex_st)
            y = y_bub_startB;
       ELSE
         //check to see if its the exit next to the one it has gone through
         IF (the_exit_No <=1 AND loop_to_exit <=1) //Top exit check
            y = y_bub_startT; //y to top start position, was at loop point on the screen
         ELSE
            y = y_bub_startB;
         END

       IF (exits_open[the_exit_no].ex_size == 28) //loop to the bottom if the exit takes over the whole screen
         //map check
            IF (map_get_pixel(platdata, bub_hrd, x , y-16) != 2 OR
                map_get_pixel(platdata, bub_hrd, x+31 , y-16) != 2)
               BREAK; //Quit bubble loop - trapped bubbles will release the nastie
            END
         ELSE
         //Do adjustment for exit and add position difference
         dest_st_block = exits_open[loop_to_exit].ex_st;
         //get the difference to add to the bubble when it is looped
         exit_x_adj = (x-108)-(exits_open[the_exit_no].ex_st * block_res) ;

         //Get initial x for the loop exit
         dest_exit_x = dest_st_block * block_res;
         x = dest_exit_x+108 + exit_x_adj;
         END
       END

    END

    IF(y > y_dn_stop)
       bub_block = (x-108)/block_res;  //Curent block the bubble is on
       the_exit_No = Get_Exit_Number(bub_block, Which_ex_at_Bot);   //Exit number it has gone through

       IF (the_exit_no == 99) //99 for none open
         BREAK; //Quit bubble loop - trapped bubbles will release the nastie

       END

       loop_to_exit = Get_Loop_Exit(the_exit_No);

       IF (loop_to_exit == 99) //99 for none open
         BREAK; //Quit bubble loop - trapped bubbles will release the nastie
       END

       //Loop to the bubble if directly above below the destination exit
       IF ((the_exit_No == 2 AND loop_to_exit == 0) OR
           (the_exit_No == 3 AND loop_to_exit == 1))
         y = y_bub_startT;
       ELSE
         //check to see if its the exit next to the one it has gone through

         IF (the_exit_No >=2 AND loop_to_exit >=2) //Bottom Exit Check
            y = y_bub_startB; //y to bottom start position, was at loop point on the screen
         ELSE
            y = y_bub_startT; //looping to a top exit
         END
            IF (exits_open[the_exit_no].ex_size == 28) //loop to the bottom if the exit takes over the whole screen
            //map check
               IF (map_get_pixel(platdata, bub_hrd, x , y+48) != 3 OR
                  map_get_pixel(platdata, bub_hrd, x+31 , y+48) != 3)
               BREAK; //Quit bubble loop - trapped bubbles will release the nastie
               END
            ELSE
               dest_st_block = exits_open[loop_to_exit].ex_st;
               exit_x_adj = (x-108)-(exits_open[the_exit_no].ex_st * block_res) ;
               dest_exit_x = dest_st_block * block_res;
               x = dest_exit_x + 108 + exit_x_adj;
            END
       END

    END

//    test2 = x;
//    test3 = y;
//    test4 = (x-108)/block_res;
//    test5 = id;
//    test6 = the_exit_No;
//    test7 = loop_to_exit;
//    test8 = exit_x_adj;
    FRAME;

    ini_Del++;
    IF(ini_Del >=2) //delay to allow main movement routine to catch up
      ini_del = 0;
      xinertia = 0;
      yinertia = 0;
    END

    chainpop = FALSE;


//have to do this cause you cant do collisions in a function

FOR (lcount = 1; lcount <= 2; lcount++)
    //check bubble then man process
    //others can be added
    SWITCH (lcount)
        CASE 1:
            IF (id2 = collision(type man))
            detman = TRUE;
            plr = id2;
            popid = id2;    //dino who popped this bubble passed through
                IF (kill==1)
                    multiplr = ret_dino_num2(id2);
                    multistart(x, y, multiplr);
                    kill = 2;
                END
            END
        END

//Kill 3 bubbles touching
        CASE 2:
            detman = FALSE;
            IF (id2 = collision(type bubble_sprite))
                //chain pops 3 bubbles touching
                IF (kill == 2)
                    IF (id2.kill == 0)
                        id2.kill = 2;
                        chainpop = TRUE; //doing a chain pop >1 popped at the same time
                    END
                    id2.popid = popid;
                    kill = 3;

                    IF(id2 = collision(type bubble_sprite))
                        IF (id2.kill == 0)
                            chainpop = TRUE;
                            id2.kill = 2;
                            id2.multiplr = multiplr;
                            id2.popid = popid;

                        END
                    END

                    IF(id2 = collision(type bubble_sprite))
                        IF (id2.kill == 0)
                            chainpop = TRUE;
                            id2.kill = 2;
                            id2.multiplr = multiplr;
                            id2.popid = popid;

                        END

                    END
                END

            END
            m_add[multiplr] = chainpop;
        END
    END

    //who checked to stop each bubble pushing each other in a endless jam
    //will cancel each others inertia out otherwise and we would get no
    //bubbles been shoved around
    IF ((id2 > 0 AND who <> id2) OR (id2 > 0 AND detman == TRUE))

        dist = get_dist(id2);

        IF ((pushtest (dist) == TRUE) OR (bobble == TRUE AND dist < 24))

            xdist = get_distx(get_angle(id2), get_dist(id2));
            ydist = get_disty(get_angle(id2), get_dist(id2));

            IF (bobble == TRUE AND xdist <= 4) //to stop bubbles merging into one position
                xdist = rand (-2,2); //random shove value left or right
            END

            inertia_to_other(id2,dist, xdist, ydist);
            id2.who = id;
            facing = id2.facing; //way dino is facing for water/fire/lightning
            who = 0;             //clear this now we have what we want
        END

    END
END

//kill the bubbles if trap bubble and on a potion level or secret room

//END of BUBBLE LOOP
UNTIL (kill != 0 OR level_next != 0 OR bubble_alldie == TRUE OR level_type >= lv_potion)

    //Do Pop and wake up dino which is trapped
    Pop_Dino_Bubble(x,y, id3);
END

PROCESS Pop_Dino_Bubble(x,y, id2)
PRIVATE
    lifetime;
    animframe;
    anim_s;
    animdir;   //for doing animation up and down of frames on trap bubbles
    lcount; //loop for checking all the sprites

BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;

//bubble pop anim
    lifetime = 0;
    GRAPH = bub_pop;

    REPEAT
         FRAME;
         lifetime++;
    UNTIL (lifetime > 5 OR baddie_alldie != 0)

    GRAPH++;
    lifetime = 0;

    REPEAT
         FRAME;
         lifetime++;
    UNTIL (lifetime > 5 OR baddie_alldie != 0)

    lifetime = 0;
    anim_s = bub_pop2;

    animframe = anim_s;
    GRAPH = animframe;
    lcount = 0;
//POP Anim
    REPEAT

         IF (lcount > 5)
            lcount= 0;
            animframe++;
            IF(animframe>anim_s+1)
                animframe = anim_s;
            END
            GRAPH = animframe;
         END
         lcount++;
         FRAME;
         lifetime++;

    UNTIL (lifetime > 30 OR baddie_alldie != 0)
    id2.x = x;
    id2.xpos = x;
    id2.y = y;
    id2.ypos = y;

    signal (id2, s_wakeup);


END


//BUBBLES
//x, y, bubble type, trap bubble number/special id/extend no, blue/green,
//id3 for trap bubbles otherwise unused
//pop right away for blowing bubbles max on screen reached
PROCESS Bubble_Sprite(xloc, yloc, bub_type, bub_att, bcolour, id3, pop_r_away)
PRIVATE
    lifetime;
    animframe;
    anim_s;   //start anim frame
    anim_p;   //red  anim frame
    anim_r;   //pink anim frame
    cur_frame; //current frame for up down animation
//  facing Global - for storing which way the dino is facing. For animation of fire water lightning

    animdir;   //for doing animation up and down of frames on trap bubbles
    id2;
    id_store; //for multipop
    plr;
    dist;
    xdist;
    ydist;
    lcount; //loop for checking all the sprites

    //For Turning the Bubble pink then red then flashing
    //gets a percentage of the bubbles lifetime or trapped time if a trap bubble
    one_percent; //one percent counter
    go_pink;     //60 percent
    go_red;      //80 percent
    go_flash;    //90 percent
    bounce_shove;//for squashing the bubbles
    chainpop;    //chain of popping bubbles go?
    detman;
    //lastx;
    //lasty;
    ini_Del; //Intertia delay - to allow bubble mov to update this process with movement

    //which_exit_at; //top bottom which set of exits has the bubble gone through
    bub_block;     //Curent block the bubble is on
    the_exit_No;   //Exit number it has gone through
    loop_to_exit;
    dest_exit_x;
    dest_st_block;
    exit_x_adj;
BEGIN
    badnum = bub_type;
    region = 1; //needed for clipping the sprite when it goes off the playfield

    file = sprites;
    x = xloc;
    y = yloc;
    z = pri_bubbles;
    total_bubs++;  //total allowed on screen at one time


    SWITCH (bub_type)
        CASE extrbub:       //EXTEND
            anim_s = extend + bub_att;  //start anim frame
            count_extra++; //count for this level
        END

        CASE specbub:       //SPECIAL
            SWITCH (bub_att)
                CASE bubwater:
                    anim_s = special_bubbles[bcolour].water;
                    count_water++;
                END
                CASE bubfire:
                    anim_s = special_bubbles[bcolour].fire;
                    count_fire++;
                END
                CASE bublight:
                    anim_s = special_bubbles[bcolour].lightning;
                    count_light++;
                END
            END
        END

        CASE trapbub:       //TRAP
            anim_s = trap_bubbles + (bcolour * 3) + (bub_att * 12);
            anim_p = trap_bubbles + 6 + (bub_att * 12);
            anim_r = trap_bubbles + 9 + (bub_att * 12);
            lifetime = bubble_time*100; //bubble fire
        END

        CASE normbub:       //NORMAL
            anim_s = blow_bubbles[bcolour].Full;
            anim_p = bub_pink;
            anim_r = bub_red;
            lifetime = 15*100; //in seconds
        END
    END

//for lifetime of bubbles and going pink then red animations
    one_percent = lifetime/100;
    go_pink     = level_timer2 + (one_percent*60);
    go_red      = level_timer2 + (one_percent*70);
    go_flash    = level_timer2 + (one_percent*85);
    lifetime = lifetime + level_timer2; //lifetime of the bubble

    animframe = anim_s; //load start animation frame

    FLAGS = see_through(); //for transparent bubbles
    GRAPH = animframe;

    animdir = 1;  //initialise animation direction for trap special bubbles

//POP Right away, maximum reached on screen
   IF (pop_r_away != 0 AND bub_type != trapbub)
       plr = pop_r_away;
       popid = plr;    //dino who popped this bubble passed through
       kill = 2;
       multiplr = ret_dino_num2(plr);
       multistart(x, y, multiplr);
   END

   Bubbler_mov(); //make a bubble movement process for this sprite

//START OF SPRITE LOOP
REPEAT
    xstop = FALSE;
    ystop = FALSE;

   IF (timer[2] == 0)
     bounce_shove = 0; //reset the squash bubble frame
                                                    //Special Trap
     IF (bub_type == specbub OR bub_type == trapbub)//Anim Up Down
        cur_frame+=animdir;                 //update current frame
        IF (cur_frame <=0 OR cur_frame >=2) //check bounds
            animdir = NEG animdir; //make the animation go the other way by negating the add value
        END
     END
   GRAPH = animframe + cur_frame;

   END

//Turns the Normal Bubbles Different colours
IF (bub_type == normbub OR bub_type == trapbub) //Colour start NORM TRAP
    IF (level_timer2 >= go_pink)
        IF (level_timer2 < go_red)
        animframe = anim_p;                    //Turn bubble Pink
        ELSE
            IF  (level_timer2 < go_flash)      //turn bubble Red
                animframe = anim_r;
            ELSE
                IF (level_timer2 > lifetime)   //bubble past its lifetime?
                    BREAK;                     //quit sprite loop
                ELSE
                    IF (timer[5] == 0)          //Flash bubble
                        IF (animframe == anim_p)
                            animframe = anim_r;  //Red
                        ELSE
                            animframe = anim_p;  //Pink
                        END
                    END
                END
            END
        END
    END
END


IF (bub_type == normbub) //NORM bubble Squash
    IF (who > 0)

        IF (xinertia !=0 AND Ret_who (who) == TRUE)
        bounce_shove = 1;
        END

        IF (yinertia !=0 AND Ret_who (who) == TRUE)
        bounce_shove = 2;
        END
    END
   GRAPH = animframe + bounce_shove;
END

//   GRAPH = 998; //TEST GRAPHIC

//squash end
    ydmov = 0;
    yumov = 0;
    xmov  = 0;
    jmov = FALSE;

    x = son.x;
    y = son.y;
    id2 = 0;
    id_store =0;

//Loop Bubbles to top bottom of the screen
    IF(y < y_up_stop)
       bub_block = (x-108)/block_res;  //Curent block the bubble is on

       the_exit_No = Get_Exit_Number(bub_block, Which_ex_at_Top);   //Exit number it has gone through

       IF (the_exit_no == 99) //99 for none open
         BREAK; //Quit bubble loop - trapped bubbles will release the nastie
       END

       loop_to_exit = Get_Loop_Exit(the_exit_No);

       IF (loop_to_exit == 99) //99 for none open
         BREAK; //Quit bubble loop - trapped bubbles will release the nastie
       END

       //Loop to the bubble if directly above below the destination exit
       IF ((the_exit_No == 0 AND loop_to_exit == 2) OR
           (the_exit_No == 1 AND loop_to_exit == 3) AND exits_open[the_exit_no].ex_st == exits_open[loop_to_exit].ex_st)
            y = y_bub_startB;
       ELSE
         //check to see if its the exit next to the one it has gone through
         IF (the_exit_No <=1 AND loop_to_exit <=1) //Top exit check
            y = y_bub_startT; //y to top start position, was at loop point on the screen
         ELSE
            y = y_bub_startB;
         END

       IF (exits_open[the_exit_no].ex_size == 28) //loop to the bottom if the exit takes over the whole screen
         //map check
            IF (map_get_pixel(platdata, bub_hrd, x , y-16) != 2 OR
                map_get_pixel(platdata, bub_hrd, x+31 , y-16) != 2)
               BREAK; //Quit bubble loop - trapped bubbles will release the nastie
            END
         ELSE
         //Do adjustment for exit and add position difference
         dest_st_block = exits_open[loop_to_exit].ex_st;
         //get the difference to add to the bubble when it is looped
         exit_x_adj = (x-108)-(exits_open[the_exit_no].ex_st * block_res) ;

         //Get initial x for the loop exit
         dest_exit_x = dest_st_block * block_res;
         x = dest_exit_x+108 + exit_x_adj;
         END
       END

    END

    IF(y > y_dn_stop)
       bub_block = (x-108)/block_res;  //Curent block the bubble is on
       the_exit_No = Get_Exit_Number(bub_block, Which_ex_at_Bot);   //Exit number it has gone through

       IF (the_exit_no == 99) //99 for none open
         BREAK; //Quit bubble loop - trapped bubbles will release the nastie

       END

       loop_to_exit = Get_Loop_Exit(the_exit_No);

       IF (loop_to_exit == 99) //99 for none open
         BREAK; //Quit bubble loop - trapped bubbles will release the nastie
       END

       //Loop to the bubble if directly above below the destination exit
       IF ((the_exit_No == 2 AND loop_to_exit == 0) OR
           (the_exit_No == 3 AND loop_to_exit == 1))
         y = y_bub_startT;
       ELSE
         //check to see if its the exit next to the one it has gone through

         IF (the_exit_No >=2 AND loop_to_exit >=2) //Bottom Exit Check
            y = y_bub_startB; //y to bottom start position, was at loop point on the screen
         ELSE
            y = y_bub_startT; //looping to a top exit
         END
            IF (exits_open[the_exit_no].ex_size == 28) //loop to the bottom if the exit takes over the whole screen
            //map check
               IF (map_get_pixel(platdata, bub_hrd, x , y+48) != 3 OR
                  map_get_pixel(platdata, bub_hrd, x+31 , y+48) != 3)
               BREAK; //Quit bubble loop - trapped bubbles will release the nastie
               END
            ELSE
               dest_st_block = exits_open[loop_to_exit].ex_st;
               exit_x_adj = (x-108)-(exits_open[the_exit_no].ex_st * block_res) ;
               dest_exit_x = dest_st_block * block_res;
               x = dest_exit_x + 108 + exit_x_adj;
            END
       END

    END

//    test2 = x;
//    test3 = y;
//    test4 = (x-108)/block_res;
//    test5 = id;
//    test6 = the_exit_No;
//    test7 = loop_to_exit;
//    test8 = exit_x_adj;
    FRAME;

    ini_Del++;
    IF(ini_Del >=2) //delay to allow main movement routine to catch up
      ini_del = 0;
      xinertia = 0;
      yinertia = 0;
    END

    chainpop = FALSE;


//have to do this cause you cant do collisions in a function

FOR (lcount = 1; lcount <= 2; lcount++)
    //check bubble then man process
    //others can be added
    SWITCH (lcount)
        CASE 1:
            IF (id2 = collision(type man))
            detman = TRUE;
            plr = id2;
            popid = id2;    //dino who popped this bubble passed through
                IF (kill==1)
                    multiplr = ret_dino_num2(id2);
                    multistart(x, y, multiplr);
                    kill = 2;
                END
            END
        END

//Kill 3 bubbles touching
        CASE 2:
            detman = FALSE;
            IF (id2 = collision(type bubble_sprite))
                //chain pops 3 bubbles touching
                IF (kill == 2)
                    IF (id2.kill == 0)
                        id2.kill = 2;
                        chainpop = TRUE; //doing a chain pop >1 popped at the same time
                    END
                    id2.popid = popid;
                    kill = 3;

                    IF(id2 = collision(type bubble_sprite))
                        IF (id2.kill == 0)
                            chainpop = TRUE;
                            id2.kill = 2;
                            id2.multiplr = multiplr;
                            id2.popid = popid;

                        END
                    END

                    IF(id2 = collision(type bubble_sprite))
                        IF (id2.kill == 0)
                            chainpop = TRUE;
                            id2.kill = 2;
                            id2.multiplr = multiplr;
                            id2.popid = popid;

                        END

                    END
                END

            END
            m_add[multiplr] = chainpop;
        END
    END

    //who checked to stop each bubble pushing each other in a endless jam
    //will cancel each others inertia out otherwise and we would get no
    //bubbles been shoved around
    IF ((id2 > 0 AND who <> id2) OR (id2 > 0 AND detman == TRUE))

        dist = get_dist(id2);

        IF ((pushtest (dist) == TRUE) OR (bobble == TRUE AND dist < 24))

            xdist = get_distx(get_angle(id2), get_dist(id2));
            ydist = get_disty(get_angle(id2), get_dist(id2));

            IF (bobble == TRUE AND xdist <= 4) //to stop bubbles merging into one position
                xdist = rand (-2,2); //random shove value left or right
            END

            inertia_to_other(id2,dist, xdist, ydist);
            id2.who = id;
            facing = id2.facing; //way dino is facing for water/fire/lightning
            who = 0;             //clear this now we have what we want
        END

    END
END

//kill the bubbles if trap bubble and on a potion level or secret room

//END of BUBBLE LOOP
UNTIL (kill != 0 OR bubble_alldie == TRUE OR (bub_type == trapbub OR bub_type == extrbub AND level_type >= lv_potion))
    total_bubs--; //total bubbles on screen decrease
    signal (son, s_kill);

    IF (level_type == lv_end) RETURN; END

    SWITCH (bub_type)
        CASE normbub:       //normal empty bubble
            IF (kill >= 2 AND popid != 0 AND level_type != lv_demo AND level_type != lv_instr)
                bubbob[ret_dino_num(popid)].score +=10;
                spec_Items[1].counter++; //blue sweet counter for empty bubbles popped
            END
                s_trigger[e_popn] = TRUE;
        END

        CASE extrbub:       //EXTEND
            IF (kill >= 2 AND level_type != lv_demo)
                s_trigger[e_collect] = TRUE;
                Extendcol(popid, bub_att);
                IF (last_lev_extra > 0) last_lev_extra--; END
            END
        END
//Do the special bubble effects
//and increase the item counters if popped by a player
        CASE specbub:       //SPECIAL
            IF (popid !=0) facing = popid.facing; END //for which way to do special bubbles - water, fire, lightning

            SWITCH (bub_att)
                CASE bubwater:
                    IF (kill == 2 AND popid != 0 AND level_type != lv_demo) //popped by player
                        bubbob[ret_dino_num(popid)].score +=100;
                        spec_Items[6].counter++; //umbrella items
                        spec_Items[7].counter++; //umbrella items
                        spec_Items[8].counter++; //umbrella items
                    END

                    count_water--; //Number of water bubbles on screen decrease

                    IF (check_onscr_y(y) == TRUE)
                        Water_gen(x, y, facing); //Generate Water
                    END
                END
                CASE bubfire:
                    IF (kill == 2 AND popid != 0 AND level_type != lv_demo) //popped by player
                        bubbob[ret_dino_num(popid)].score +=100; //score add
                        spec_Items[5].counter++;   //Bomb item
                    END
                    s_trigger[e_popn] = TRUE;      //Pop Sound

                    count_fire--;                 //Number of Fire bubbles on screen decrease
                    IF (check_onscr_y(y) == TRUE)
                        Fire_gen(x, y, facing);   //Generate Fire
                    END

                END
                CASE bublight:
                    IF (kill == 2 AND popid != 0 AND level_type != lv_demo) //popped by player
                        bubbob[ret_dino_num(popid)].score +=100;
                        spec_Items[4].counter++; //clock item
                    END
                    s_trigger[e_popn] = TRUE; //Pop Sound

                    count_light--;  //Number of Lightning bubbles on screen decrease

                    IF (check_onscr_y(y) == TRUE)
                        Lightning (x, y, facing); //Generate Lightning
                    END
                END
            END
        END

//ID3 = baddie asleep
        CASE trapbub:       //TRAP
          IF (baddie_alldie == mkill_bomb OR
              baddie_alldie == mkill_water_cross OR
              baddie_alldie == mkill_book)
            //magenta diamonds for above items when baddie is trapped
                baddie_kill(x, y, bub_att+1, id3.facing, multi, mkill_necklace);
                signal (id3, s_kill);
          ELSE
            IF (kill == FALSE) //bubble time out
                id3.angry = 1; //angry
                id3.jump = FALSE;
                id3.xpos = x;
                id3.ypos = y;
                signal (id3, s_wakeup);
            ELSE
            s_trigger[e_popmulti] = TRUE; //sound trigger

            //killed = animation/multipop go
                IF (multi == 0)
                    IF (ret_dino_num2(popid) == 1)
                        multi = multiadd1(id);//store the id of this bubble and returns the current mulit count
                    ELSE
                        IF (ret_dino_num2(popid) == 2)//popped bythe other player
                            multi = multiadd2(id);
                        ELSE
                            multi = 0;
                        END
                    END

                    IF (popid != 0 AND level_type != lv_demo AND level_type != lv_instr)
                        bubbob[ret_dino_num(popid)].score +=1000;
                    END
                        baddie_kill(x, y, bub_att+1, id3.facing, multi, mkill_trap);
                        signal (id3, s_kill);
                        //do kill sprite
                    END
             END
           END//baddie all die trapped baddies

        END//CASE trap bubble
    END//SWITCH

    Pop_Bubble(x,y, bub_type); //bubble type passed for falling foods
END




//returns which dino for a given id
PROCESS Ret_Dino_Num(id2)
BEGIN
        IF (bubbob[0].sprite_id == id2)
            RETURN (0);
        END

        IF (bubbob[1].sprite_id == id2)
            RETURN (1);
        END
END

//returns 1 or 2 or 0 for no player found
PROCESS Ret_Dino_Num2(id2)
BEGIN
    IF (id2 == bubbob[0].sprite_id AND bubbob[0].lives > 0)
        RETURN (1);
    ELSE
        IF (id2 == bubbob[1].sprite_id AND bubbob[1].lives > 0)
            RETURN (2);
        ELSE
            RETURN (0);
        END
    END
END

PROCESS Fire_Bubble(xloc, yloc, pop_r_away)
PRIVATE
    lifetime;
    animframe;
    cur_frame; //current frame for up down animation
    animdir;   //for doing animation up and down of frames on trap bubbles
    id2;
    detman;
    plr;
    ini_Del;

BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;
    x = xloc;
    y = yloc;
    z = pri_bubbles;
    total_bubs++;  //total allowed on screen at one time

    animframe = bub_fire; //load start animation frame

    FLAGS = see_through(); //for transparent bubbles
    GRAPH = animframe;

    animdir = 1;  //initialise animation direction for trap special bubbles

//POP Right away, maximum reached on screen
   IF (pop_r_away != 0)
       kill = 2;
   END

    bubbler_mov(); //make a bubble movement process for this sprite

//START OF SPRITE LOOP
    REPEAT

    xstop = FALSE;
    ystop = FALSE;

   IF (timer[5] == 0)
       cur_frame+=animdir;                 //update current frame
       IF (cur_frame <=0 OR cur_frame >=6) //check bounds
           animdir = NEG animdir; //make the animation go the other way by negating the add value
       END
   GRAPH = animframe + cur_frame;
   END

    ydmov = 0;
    yumov = 0;
    xmov  = 0;

    x = son.x;
    y = son.y;
    id2 = 0;

    ini_Del++;
    IF(ini_Del >=2) //delay to allow main movement routine to catch up
      ini_del = 0;
      xinertia = 0;
      yinertia = 0;
    END

    //check bubble then man process
    //others can be added
    IF (id2 = collision(type man))
         detman = TRUE;
         kill = 2;
         plr = ret_dino_num(id2);
    END

    FRAME;

//kill the bubbles if trap bubble and on a potion level or secret room
UNTIL (kill != 0 OR bubble_alldie == TRUE OR game_state == gs_adv_level)
//END of BUBBLE LOOP
    total_bubs--; //total bubbles on screen decrease
    signal (son, s_kill);

    IF (kill >= 2)
         s_trigger[e_collect] = TRUE;
         bubbob[plr].score +=100000;
         bubbob[plr].special_fireball = 16;
         bubbob[plr].special_fbcount  = 4;
    END

//ID3 = baddie asleep
    pop_bubble(x,y, firebub); //bubble type passed for falling foods
END


PROCESS Pop_Bubble(x,y, bub_type)
PRIVATE
    lifetime;
    animframe;
    anim_s;
    animdir;   //for doing animation up and down of frames on trap bubbles
    lcount; //loop for checking all the sprites

BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;
//bubble pop anim
    lifetime = 0;
    GRAPH = bub_pop;

    REPEAT
         FRAME;
         lifetime++;
    UNTIL (lifetime > 5 OR baddie_alldie != 0)

    GRAPH++;
    lifetime = 0;

    REPEAT
         FRAME;
         lifetime++;
    UNTIL (lifetime > 5 OR baddie_alldie != 0)

    lifetime = 0;
    anim_s = bub_pop2;

    animframe = anim_s;
    GRAPH = animframe;
    lcount = 0;
//POP Anim
    REPEAT

         IF (lcount > 5)
            lcount= 0;
            animframe++;
            IF(animframe>anim_s+1)
                animframe = anim_s;
            END
            GRAPH = animframe;
         END
         lcount++;
         FRAME;
         lifetime++;

    UNTIL (lifetime > 30 OR baddie_alldie != 0)

//bubble all die end of level = TRUE
//food fall level or falling food conditions met
//do only normal bubbles
    IF(bubble_alldie == TRUE AND ffall_level == TRUE AND bub_type == normbub AND game_state != gs_adv_level)

        IF (out_region (id, 1) == FALSE) //check if on screen
            SWITCH (ffall_type)
            CASE ffall_t_level:
                Food (x, y, ff_sprid, fd_fall);  // Falling level
            END
            CASE ffall_t_ccane:
                Food (x, y, ff_sprid, fd_big);  // Candy cane collected
            END
            CASE ffall_t_score1:
                Food (x, y, ff_sprid, fd_mat1);  // Score matched nn0 eg 000, 110..990
            END
            CASE ffall_t_score2:
                Food (x, y, ff_sprid, fd_mat2);  // score to other player n10..n90
            END
            END
        END
    END
END

//called at the setup level process to see if its a falling food level
PROCESS Level_Fall_Food(level_num)
PRIVATE
    ind; //index for searching
BEGIN
    ffall_level = FALSE; //global variable to check when a bubble pops at the end of a level
    ff_sprid = 0;        //id of the sprite

    //IF (level_potion = TRUE)

    FOR (ind = 0; ind < 14; ind++)
        IF (level_falling[ind] == level_num)
           ff_sprid = ind;
           ffall_level = TRUE; //level is a falling food level
           ffall_type = ffall_t_level;
           BREAK;
        END
    END

    FRAME;
END

//    multi;    //used by the trap bubbles for pop fruit types 1-7
//    popid;    //dino who popped this bubble

PROCESS MultiStart(x, y, plr)
BEGIN
    m_add[plr] = FALSE;

    IF (plr == 1 AND get_id(type multipop1) == FALSE)
        multipop1(x, y, plr);
    ELSE
        IF (plr == 2 AND get_id(type multipop2)== FALSE)
            multipop2(x, y, plr);
        ELSE
            RETURN;
        END
    END

END

//Adds trap bubble id values to multipop array 1
PROCESS MultiAdd1(val)
PRIVATE
    m_timer;
    m_new;
    m_count;
BEGIN

    FOR (m_count = 0; m_count <= 7; m_count++) //search for id in 1 to 7 cells of the array
           IF(val == m_array1[m_count]) //already stored this id so quit the loop
                BREAK;
           END

           IF (m_array1[m_count] == 0)   //new id not already stored
                m_array1[m_count] = val; //store the trap bubbles Id
                m_add[1] = TRUE;         //added a value so multi go
                m_score[1] = m_count;    //what multi score to do
                BREAK;
           END
     END

     RETURN (m_count); //return multi pop count of what fruit to do

END

//Adds values to multipop array 1
PROCESS MultiAdd2(val)
PRIVATE
    m_timer;
    m_new;
    m_count;
BEGIN

    FOR (m_count = 0; m_count <= 7; m_count++)
           IF(val == m_array2[m_count])
                BREAK;
           END

           IF (m_array2[m_count] == 0)
                m_array2[m_count] = val;
                m_add[2] = TRUE;
                m_score[2] = m_count;
                BREAK;
           END
     END

     RETURN (m_count);

END

//keeps adding trap bubbles until a time out has occured
PROCESS MultiPop1(x, y, plr)
PRIVATE
    m_timer;
    m_new;
    m_count;
BEGIN
    //clears old values in the multipop array
    FOR (m_count = 0; m_count <= 7; m_count++)
        m_array1[m_count] = 0;
    END

    //reset what score to do
    m_score[1] = 0;
    REPEAT
         IF (m_add[1] == TRUE) //trap bubble added
            m_timer = 0;       //clear the time out
            m_add[1] = FALSE;  //clear added trap bubble switch
         END
    FRAME;
        m_timer++;
    UNTIL (m_timer > 5) //wait loop

    m_add[1] = FALSE;

    //calc score and update score, but not on instruction or demo levels
    IF (m_score[1] != 0 AND level_type != lv_demo AND level_type != lv_instr)
        bubbob[0].score += score_mult(m_score[1]);
        scorebig (x, y, 1, plr-1, m_score[1]);

        IF (extra_items == TRUE AND m_score[1] >= 1)
            lev_multi = TRUE;        //multi pop of 3 done
            missed_multi = 0;        //4 levels without multi set extra item - trap all monsters
            spec_items[60].counter = 0; //clear counter
        END
    END

END

PROCESS MultiPop2(x, y, plr)
PRIVATE
    m_timer;
    m_new;
    m_count;
BEGIN
    FOR (m_count = 0; m_count <= 7; m_count++)
        m_array2[m_count] = 0;
    END
    m_score[2] = 0;

    REPEAT
         IF (m_add[2] == TRUE)
            m_timer = 0;
            m_add[2] = FALSE;
         END

    FRAME;
        m_timer++;
    UNTIL (m_timer > 10) //wait loop
            m_add[2] = FALSE;

    //calc score and update score
    //calc score and update score, but not on instruction or demo levels
    IF (m_score[2] != 0 AND level_type != lv_demo AND level_type != lv_instr)
        bubbob[1].score += score_mult(m_score[2]);
        scorebig (x, y, 1, plr-1, m_score[2]);
    END

    IF (extra_items == TRUE AND m_score[2] >= 1)
        lev_multi = TRUE;        //multi pop of 3 done
        missed_multi = 0;        //4 levels without multi set extra item - trap all monsters
        spec_items[60].counter = 0; //clear counter
    END

END

//muli pop of nasties
PROCESS Score_Mult(value)
BEGIN
    IF (value > 6) value = 6; END
    //last_lev_extra
    RETURN (multi_score[value]);
END

//KILL BADDIES
//coords, baddie number, facing which way, multipop number for trap food
//kill for item weapon kill
PROCESS Baddie_Kill(x, y, badid, rway, multi, killtype)
PRIVATE
    animdel;
    animfrm;
    angadd;  //speed of rotation
    id3;
    gojump;
    vel;
    grav;
    vel_dec;
    velst;
    sjumpy;
    rndacc;
    xstart;
    diam_id; //for item weapon kills
BEGIN
    angadd = 45000;
    region = 1; //needed for clipping the sprite when it goes off the playfield

      bad_on_screen--;   //number on screen
    //last baddie popped flag to detect we have stored the time level took to complete
      IF (bad_on_screen == 0 AND level_type != lv_instr)
        game_state = gs_level_completed;
        level_stop_what = 0; //start timer again
      END

    file = sprites;
    GRAPH = baddie_anims[badid].die;

    IF (level_type != lv_instr)
      rndacc = rand (0, 2);
      xstart = rand (2, 6);
    ELSE
      rndacc = 2; //Level intruction make all arcs the same
      xstart = 6;
    END

    IF (rway == 1)
        xmov = -xstart;
    ELSE
        xmov = xstart;
    END

    gojump = 0; // = rand (0,1);

    vel =     jumpup[rndacc].vel;     //jump up used for pop anim
    grav =    jumpup[rndacc].grav;
    vel_dec = jumpup[rndacc].vel_dec;

    velst = vel;    //vel start used to stop jump at bottom of jump
    sjumpy = y;     //start jump pos to stop when
    gojump = TRUE;

REPEAT
IF (level_stop_what != stop_everything) //HURRY UP Freeze game

    animdel++;
    IF(animdel > 4)
        animdel = 0;

    IF (rway == 1)
        FLAGS = 1;
        angle+=angadd;
    ELSE
        FLAGS = 0;
        angle-=angadd;
    END
    END


    IF (gojump == TRUE)  //part of jump routine used for this pop animation
       ydmov = vel/grav;
       IF (ydmov == 0) ydmov = 1; END //to stop zero stoping movement
           vel = vel + vel_dec;

       IF (y > sjumpy-4  AND vel > 0)
            gojump = FALSE;
            ydmov = 4;
       END

       IF (xmov != 0) //bounce off side of screen

         IF (xmov < 0)    //left side
            IF (x< xpos_l+xstart+5) //adjustment using xstart to get side of screen position
                xmov = NEG xmov;
                rway = 2;
            END

         ELSE
            IF (xmov > 0) //right left
                IF (x > xpos_r-xstart-5)
                    xmov = NEG xmov;
                    rway = 1;
                END
            END
         END
       END

        x += xmov;

    ELSE
        IF (xcolfind(x+xmov, y+24 +ydmov) == TRUE AND
            xblockfind(x+xmov, y+16+ydmov) == FALSE)
            xstop = TRUE;
        END
    END

    y += ydmov;
    IF (ydmov < 0 AND y < y_up_stop)
        y = y_dn_stop-16;
    END

    IF (ydmov > 0 AND y > y_dn_stop)
        y = 0;

    END
END
    FRAME;

UNTIL (xstop == TRUE OR baddie_alldie == mkill_do_nothing OR game_state == gs_adv_level) //baddie all die to stop infinite fall through of nastie error
    IF (killtype >=10)
        diam_id = killtype-10; //for item weapon kills gives a diamond 6k-9k
    END

    SWITCH (killtype)
        CASE mkill_trap:
            //coors, sprite id, food type
            Food (x, y, multi, fd_trap); //do food and which from what multi the trapped bubble was counted up to
        END

        CASE mkill_heart:
            Food (x, y, (heart_cor[badid-1])-1, fd_hrt);
        END

        DEFAULT:
            Food (x, y, diam_id, fd_diam); //do red diamonds from fireball kill, lightning
        END

    END

END


/*
FOOD TYPE=
fd_norm = 1;  //normal level food
fd_trap = 2;  //trap food mulitpler val in sprid
fd_big  = 3;  //candy cane food 700 points
fd_diam = 4;  //diamonds from killing monsters
fd_mat1 = 5;  //score match1
fd_mat2 = 6;  //score match2
fd_fall = 7;  //levels with 5 in them mostly 700 points
fd_hrt  = 8;  //food items heart
*/

PROCESS Food (x, y, sprid, foodtype)
PRIVATE
    end_time;
    timergo;  //time start when it hits a platform
    ltime;    //life time of food
    id2;      //for getting man id when dino collides
    score;        //score value of this food
    score_speed;  //speed score goes up the screen
    frate;        //for saving frames
BEGIN

    IF (level_type == lv_extend)
      RETURN;
    END
    region = 1; //needed for clipping the sprite when it goes off the playfield

    file = fooditems;
    ystop   = FALSE;   //top stop falling
    timergo = FALSE; //once it hits a platform the food has a time before it disapears

    ltime = 860;
    score_speed = 1;
    z = pri_items;
    frate = 100;

  SWITCH (foodtype)
    CASE fd_norm:   //normal level food
        ltime = 1000;
        end_time = timer[4] + ltime;
        timergo = TRUE;
        score = food_points[sprid-1];
        score_speed = 0;
        GRAPH = norm_food + sprid-1;
        ystop = TRUE;
    END

    CASE fd_trap:   //trap food mulitpler val in sprid
        GRAPH = sprid+1;
        IF(sprid>7) sprid = 7; END
        score = food_pop[sprid];
        score_speed = 0;
        FLAGS = rand(0,1); //face the food randomly left or right
    END

    CASE fd_big:    //candy cane food 700 points
        GRAPH = big_food2[sprid];
        score = 700;
    END

    CASE fd_diam:   //diamonds from killing monsters
        GRAPH = small_diamonds[sprid]; //get diamond id, not stored in order so hence the array
        score = 6000 + (sprid*1000);
    END

    CASE fd_mat1:   //score match1
        GRAPH = food_match1[sprid];
        score = 700;
    END

    CASE fd_mat2:   //score match2
        GRAPH  = food_match2 + sprid;
        score = 700;
    END

    CASE fd_fall:   //levels with 5 in them mostly, 700 points
        GRAPH = food_falling[sprid];
        score = 700;
    END

    CASE fd_hrt:    //food items heart
        score = food_pop[sprid];
        IF (sprid == 6) sprid = 79; END
        IF (sprid == 7) sprid = 77; END

        GRAPH = trap_food + sprid;
    END

  END

    REPEAT

       IF (ystop == FALSE)

            IF (map_get_pixel(platdata, plt_hrd, x+4, y+24) ==0 AND
                map_get_pixel(platdata, plt_hrd, x+24,y+24) ==0 OR y < 80)

                y += 3;
                IF (y > y_dn_stop) y = 0; END
            ELSE                //hit a plat stop
                ystop = TRUE;
                y += 15-(y mod 16);
                frate = 500;
                end_time = timer[4] + ltime;
                timergo = TRUE;
            END
       END

       FRAME(frate);

    IF (timergo == TRUE AND timer[4] > end_time) //food timed out
        anim(x, y-16, dis_star, 5,30,8,1);
        BREAK;
    END

    IF (id2 = collision (type man))
        Scoresmall (x, y, id2, score, score_speed);
        SWITCH (foodtype)
         CASE fd_trap, fd_hrt:
            spec_Items[14].counter++; //dead nasty food flashing heart
            s_trigger[e_popfood] = TRUE;
         END

         CASE fd_norm:
            spec_Items[19].counter++; //normal food for yellow cross
            s_trigger[e_food] = TRUE;
         END
         DEFAULT:  //fd_fall, fd_mat1,fd_mat2, fd_diam
            s_trigger[e_food] = TRUE;

         END
        END
        BREAK;
    END
          //kill it hit platform or when new level
    UNTIL (level_type == lv_extend OR level_type == lv_end) //advancing a level or timer started for next level

END

PROCESS Item (x, y, sprid)
PRIVATE
    end_time;
    timergo;
    ltime;
    id2;
    score;
    hrt_anim;
BEGIN
    file = fooditems;
    z = pri_items; //screen sprite priority
    region = 1; //needed for clipping the sprite when it goes off the playfield

    end_time = timer[4] + 1000;
    score = spec_Items[sprid].points;
    GRAPH = spec_Items[sprid].grf_id;

    IF (GRAPH == hrt_frm1)
        hrt_anim = TRUE;
    END

    REPEAT

    IF (timer[4] > end_time AND level_type != lv_boss) //Item timed out but not on level 100
        anim(x, y-16, dis_star, 5,30,8,1);
        BREAK;
    END
    IF (hrt_anim == TRUE AND timer[2] == 0)
        IF(GRAPH == hrt_frm1)
            GRAPH = hrt_frm2;
        ELSE
            GRAPH = hrt_frm1;
        END
    END

    IF (id2 = collision (type man))
        s_trigger[e_item] = TRUE;
        IF (score != 0 OR level_type != lv_boss) //Dont make potion appear on other levels
            Scoresmall (x, y, id2, score, 0);
            spec_Items[18].counter++; //items collected = blue cross
            clr_item_counter(sprid); //collected this item clear the pointer
        END
        Item_collected(id2, sprid); //do effects or update players attributes eg speed up bubbles etc

        BREAK;
    END
       FRAME;
          //kill it hit platform or when new level
    UNTIL (game_state == gs_adv_level OR level_next != 0) //advancing a level or timer started for next level

END

//Item has been collected
PROCESS Clr_Item_Counter(sprid)
PRIVATE
    inc_this; //increase this counter on collected
BEGIN
    spec_Items[sprid].counter = 0;

    IF (sprid >=6 AND sprid <=8)  //water bubble counters
        spec_Items[6].counter = 0;
        spec_Items[7].counter = 0;
        spec_Items[8].counter = 0;
    END

    IF (sprid >=9 AND sprid <=13)  //wrap around counters
        spec_Items[9].counter = 0;
        spec_Items[10].counter = 0;
        spec_Items[11].counter = 0;
        spec_Items[12].counter = 0;
        spec_Items[13].counter = 0;
    END

    IF (spec_Items[sprid].on_col_inc_id != 0) //for items which get other items to be displayed
       inc_this = spec_Items[sprid].on_col_inc_id;
       spec_Items[inc_this].counter++;
    END

END

//ITEMS COLLECT BY PLAYERS
PROCESS Item_Collected(id2, sprid) //sprite id, item index number
PRIVATE
    plr;
BEGIN
    plr = ret_dino_num2(id2);

  IF (plr != 0) //Player Items
    plr--;
    SWITCH (sprid)
    CASE 1:
        bubbob[plr].bubfast = TRUE;
    END
    CASE 0:
        bubbob[plr].bublong = TRUE;
    END
    CASE 2:
        bubbob[plr].bubrapid = TRUE;
    END

    CASE 3: //fast shoes
        IF (bubbob[plr].shoes => 4)
            IF (bubbob[plr].shoes < 8)        //increases up to speed 8
            bubbob[plr].shoes ++;
            id2.man_speed = bubbob[plr].shoes;

            END
        ELSE
            bubbob[plr].shoes = 4;
            id2.man_speed = bubbob[plr].shoes;  //speed bub bob moves across the screen
        END
    END

    //Purple Lantern
    CASE 23:
         Purple_Lantern();
    END
    //Bomb
    CASE 5:
         Bomb(id2.x, id2.y);
    END
    //Book
    CASE 25:
         Book(id2.x, id2.y);
    END

    CASE 24,22: //Yellow & Red lantern - all sweets
        bubbob[plr].bubfast = TRUE;
        bubbob[plr].bublong = TRUE;
        bubbob[plr].bubrapid = TRUE;
        IF (sprid == 22)
            //All rings
            bubbob[plr].special_rings = sp_ring_all;
        END
    END

    CASE 15: //light blue ring - move a step
         bubbob[plr].special_rings = sp_ring_blue;
    END
    CASE 16: //purple ring - 500 points per jump
         bubbob[plr].special_rings = sp_ring_purple;
    END

    CASE 17: //red ring - 100 points per bubble blown
         bubbob[plr].special_rings = sp_ring_red;
    END

    CASE 21: //Light blue lantern - all rings
         bubbob[plr].special_rings = sp_ring_all;
    END

    CASE 20: //Red Cross
         bubbob[plr].special_fireball = 16; //fireball counter 16
         //bubbob[plr].special_item = sprid;  //number of item collected
    END

    CASE 54: //Lightning potion
        bubbob[plr].bubble_type = blow_lightn;

        IF (level_type == lv_boss) //Set if on boss level - used to check if displayed
            bosspotion[plr] = B_Potion_Col; //On screen
        END
    END

    CASE 57: //Water Bubbles potion
        bubbob[plr].bubble_type = blow_water;
    END

    CASE 58: //Fire Bubbles potion
        bubbob[plr].bubble_type = blow_fire;
    END

    CASE 55: //Auto fire
        auto_item--; //apears twice if 2 players on the screen
        IF (auto_item > 0 AND players_on_screen == 2)
            spec_Items[sprid].counter = 1;
        END
        bubbob[plr].autofire = TRUE;
    END

    CASE 48: //Chilli can be killed by other players fireball
        fireball_deadly = TRUE; //player can be killed by the other player
        bubbob[plr].special_fireball = 16; //fireball counter 16
    END

    CASE 51:
        trap_player = TRUE;     //can trap other player in a bubble like a nastie.
    END

    CASE 56: //Trap all nasties
        Trap_Nasties(id2, plr);
    END

    CASE 60: //Missing Extend letters
        Missing_letters(id2 ,plr);
    END

    CASE 61: //Disguise
        bubbob[plr].invincible = TRUE; //cant be killed
    END

    CASE 62: //Superman - keep powerups + all powerups
        bubbob[plr].superman = TRUE;
        bubbob[plr].bubfast = TRUE;
        bubbob[plr].bublong = TRUE;
        bubbob[plr].bubrapid = TRUE;
        bubbob[plr].shoes = 4;
        id2.man_speed = bubbob[plr].shoes;  //speed bub bob moves across the screen
    END

    CASE 63: //yellow shoes
        bubbob[plr].shoes = 5;
        id2.man_speed = bubbob[plr].shoes;  //speed bub bob moves across the screen
    END

    CASE 50: //Level umbrella - grey
        Goto_Level(plr);
    END


   END//SWITCH Player special item
  END//IF END

    //Umbrellas and Gold Door
    IF (sprid =>6 AND sprid <= 8 OR sprid == 47)
           last_completed_time = level_timer;
           //level_next_go = TRUE; //advance level
           level_next = 0;       //reset next level timer
           game_state = gs_start_adv_level;
           baddie_alldie = mkill_do_nothing; //kill all baddie processes

           SWITCH (sprid)
           CASE 6:
                level_advance = 3;     //one level advance by 3 screens
           END
           CASE 7:
                level_advance = 5;     //one level advance by 5 screens
           END
           CASE 8:
                level_advance = 7;     //one level advance by 7 screens
           END

           CASE 47: //gold door warp to Level 70
                level_advance = 70 - act_level;
           END

           END
    END

  SWITCH (sprid)
    CASE 9..13: //potions
        Potion_vs (sprid-9);
    END

    CASE 34..39:    //Candy canes collected
         ffall_type = ffall_t_ccane;
         ffall_level = TRUE; //make the bubbles into falling items
         ff_sprid = sprid-34;
         Big_Food_Sprite(39-sprid, 1);
    END

    CASE 27: //Red necklace
        last_lev_extra+=10; //10 free extend bubbles
    END

    CASE 29..33:    //Treasure chests collected
         ffall_type = ffall_t_ccane;
         ffall_level = TRUE; //make the bubbles into falling items
         ff_sprid = (sprid-29)+6;
         big_food_sprite((33-sprid)+6, 2);
    END

    //Crystal Ball - Food and items appear right away;
    CASE 41:
        got_crystal_ball = TRUE;
    END

    //Water cross
    CASE 18:
        Flood();
    END

    CASE 4:
       Clock();
    END

    CASE 14:
       Heart();
    END

    CASE 26:
       Tiara();
    END

    CASE 40:
        got_bell = TRUE;   //Flash the screen if there is a special item to be done
        Bell(1);
        //uses the anim() procedure at screen go
    END

    //Necklace
    CASE 28:
        pinball_star (id2.x, id2.y);
    END

    CASE 19: //Yellow Cross - Big lightning bolt
        Big_Lightning();
    END

    CASE 43: //Skull - comet then instant hurry up and skel
      Comet();
    END

    CASE 44..46;//secret room
        secret_room (sprid-44);
    END

    CASE 49: //Easy Kill Boss item
        boss_set_health = 5;  //100 hits to kill boss
    END

    CASE 53: //Cheat mode on
        cheat_mode = TRUE;      //Cheat mode on, will allow player to get into cheat screen from options screen
    END

    CASE 52: //Do extra items
       extra_items = TRUE;
    END

    CASE 59: //Firebubble
       fire_bubble_go = TRUE;
    END


   END //Player items end

   FRAME;

END

//Grey umbrella can jump to any level
PROCESS Goto_Level(plr)
PRIVATE
   select_id1;
   select_id2;
   select_id3;

   time_3;
   time_4;
   d_time;
   level_j; //display level
BEGIN
   level_j = cur_level+1; //to display level to screen

   select_id1 = write(font_s,ret_xtext(16),ret_ytext(13),4,"SELECT LEVEL:");
   select_id2 = write(font_s,ret_xtext(16),ret_ytext(14),4,"THEN PRESS FIRE");
   select_id3 = write_int(font_s,ret_xtext(22),ret_ytext(13),3, &level_j);

   //Store timers for level/game and bubble delays
   time_3 = timer[3];
   time_4 = timer[4];

//Level events to sleep
   Signal (type Level_Events, s_sleep);

//stop all the sprites
   level_stop_what = stop_everything;
//Wait until space is pressed
   LOOP
        //decrease level
        IF (keys_pressed[plr].pl_left == TRUE AND level_j > cur_level)
           level_j--;
        END

        //increase level
        IF (keys_pressed[plr].pl_right == TRUE AND level_j < 100)
           level_j++;
        END

        //pressed fire so now quit loop and goto the level selected by the player
        IF (keys_pressed[plr].pl_fire == TRUE AND level_j != cur_level)
            BREAK;
        END

      FRAME(500);
   END
   Delete_text(select_id1);
   Delete_text(select_id2);
   Delete_text(select_id3);

//restore timers
   timer[3] = time_3;
   timer[4] = time_4;
//wake up level events
   Signal (type Level_Events, s_wakeup);
//start moving all the sprites again
   level_stop_what = stop_nothing;

   level_advance = level_j - act_level;
   level_next = 0;       //reset next level timer
   game_state = gs_start_adv_level;
   baddie_alldie = mkill_do_nothing; //kill all baddie processes

END

//Gives the player the missing extend letters that they need
PROCESS Missing_letters(id2 ,plr)
PRIVATE
    bubind;
    g_delay;
BEGIN
    REPEAT
        g_delay--;

        IF (g_delay < 0) //delay for getting missing bubbles
            g_delay = 25;

            IF (bubextend[plr].collected[bubind] == 0)
                s_trigger[e_collect] = TRUE;
                Extendcol(id2, bubind); //dino id, bubble number 0-5
            END
            bubind++;
        END

        FRAME;
    UNTIL (bubind> 5)

END

PROCESS Trap_Nasties(id3,plr) //Traps all the nasties on screen into bubbles
PRIVATE
    id2;
    t_nastie;
BEGIN
   REPEAT
        SWITCH (t_nastie)
          CASE 0:
            id2 = get_id (type norm_baddie);
          END
          CASE 1:
            id2 = get_id (type diag_baddie);
          END
          CASE 2:
            id2 = get_id (type spring_baddie);
          END
          CASE 3:
            id2 = get_id (type invader_baddie);
          END
        END

        IF (id2 != 0)
            signal (id2, s_sleep);
            Bubble_sprite(id2.x, id2.y, trapbub, (id2.badnum)-1, plr, id2, 0); //Trapped
        ELSE
            t_nastie++;
        END
   UNTIL (t_nastie > 3)

END

PROCESS Comet()
PRIVATE
    gfxnum;      //gets what graphic to display next
    st_frm;      //cur anim frame
    maxfrm;      //max anim frame
    an_start;    //animation start graph number
    xsp;
    id2;
BEGIN
    file = sprites;

    GRAPH = Comet_gph;
    region = 1;

//Start Movement initialation
    xpos = 142;

    x = 500;
    xpos = x;
    xsp = -54;

    s_trigger[e_comet] = TRUE;

    IF (level_type == lv_end)
        z = pri_endcomet;
    END

REPEAT

//Movement
    xmov+=xsp;
    x =xpos+xmov/10; //divide by 10 to get a angle
    y+=8;

//Make Monsters angry if we hit them
    IF (id2 = collision (type norm_baddie))
       id2.angry = mon_angry;
    END
    IF (id2 = collision (type diag_baddie))
       id2.angry = mon_angry;
    END

    IF (id2 = collision (type invader_baddie))
       id2.angry = mon_angry;
    END

    IF (id2 = collision (type spring_baddie))
       id2.angry = mon_angry;
    END

    FRAME;

UNTIL (x < 92 or y > y_dn_stop OR game_state == gs_adv_level)

   //do hurry and skel ten seconds later
     act_hurry = level_timer;
     act_skel  = level_timer + 10;
END




/*
      "IF YOU WANT THE EXTRA LEVELS ALS"
      "INTO THE HIGHSCORE,DIB AUTOFIRE"
      "BOS FOR EASY KILL END BOSS"

      "DOC GOTO LEVEL. PLR TRAP OTHER"
      "PLAYER, FIR PL FIREBALL DEADLY"
      "  PED FOR EXTENDED ITEMS..."

      "S.B CHEAT MODE - FUNCTION TEN"
      "THEN SELECT FROM THE MENU OR"
      "HAVE YOU BEEN USING THIS... "
*/

//Secret room
PROCESS Secret_Room (roomid)
PRIVATE
//   drawloc;
//   drawloc2;
   id2;
   dloc_x1;//for drawing diamond line top
   dloc_y1;
   dloc_x2;//for drawing diamond line bottom
   dloc_y2;
   dloc_add;//next diamond location
   d_count; //diamond draw count
   door1;   //door process ids
   door2;
   torchids[1];
BEGIN
   fade_off();

   IF ((cur_level MOD 2 ) == 0)
       drawloc = 512;
//       drawloc2 = 80;
   ELSE
       drawloc = 48;
//       drawloc2 = 544;
   END

   IF (platdata != 0)   //unload the map if its there
       unload_fpg(platdata);
   END

    platdata = load_fpg(platfloc);   //platform graphics data
    file = platdata;

    baddie_alldie = mkill_do_nothing; //Kill all alive nasties on the screen
    bubble_alldie = TRUE;             //Kill all the bubbles on the screen - dont do any food

    level_type = lv_secret; //secret level or extend - to get rid of random bubble
    ffall_level = FALSE;    //falling food disable
    secret_num = roomid+1;  //used to do the secret room ghosts

    bubbob[0].bubble_type = blow_none;
    bubbob[1].bubble_type = blow_none;

// file, dest, orig, x, y, ang, size, flags
//RESIZE Hardness Map 340,288

    scroll.y1 += 464;
    FRAME;

    map_xput(platdata, plt_hrd, secret_plat, Resize_x, Resize_y , 0, Resize_amt, 0); // file, dest, orig, x, y, ang, size, flags

//resize screen clearer
    map_xput(blocksfile, scr_graf, grpclr_secret, 0, 0 , 0, 2000, 0);
    convert_palette(blocksfile, scr_graf, offset pal); //clear the screen
    refresh_scroll(0);                                 //update the scroll display buff

//put the screen to the screen buffer
    map_put(blocksfile, scr_graf, s_room_scr+roomid, 0, drawloc);

//Clip The Screen
    map_put(blocksfile, scr_graf, 2, 0, 0);
    map_put(blocksfile, scr_graf, 2, 0, 464);


    refresh_scroll(0);

//Torches
    torch(x_torch_l, y_torch);
    torchids[0] = get_id (type torch);
    torch(x_torch_r, y_torch);
    torchids[1] = get_id (type torch);

//Set Dino attributes to start location and disable bubble or jump
     IF (player_alive(0))
        id2 = bubbob[0].sprite_id;
        id2.xpos = x_pl1;
        id2.ypos = y_pl_sr;
        bubbob[0].bubtimer = 25; //to stop blowing or jumping when dino process is awoke
        bubbob[0].bubkey = FALSE;
        id2.facing =2;
        //signal (id2, s_wakeup);
     END

     IF (player_alive(1))
        id2 = bubbob[1].sprite_id;
        id2.xpos = x_pl2;
        id2.ypos = y_pl_sr;
        bubbob[1].bubtimer = 25; //to stop blowing or jumping when dino process is awoke
        bubbob[1].bubkey = FALSE;
        id2.facing =1;
        //signal (id2, s_wakeup);
     END

//Draw the 32 diamonds
   dloc_x1 =  x_dsr_st;
   dloc_y1 =  y_dsr_st1;
   dloc_x2 =  x_dsr_st+x_dsr_right;
   dloc_y2 =  y_dsr_st1;

   //dloc_add;
   FOR (d_count = 1; d_count <=2; d_count++)
      SR_Diamonds (dloc_x1+dloc_add, dloc_y1, 0);
      SR_Diamonds (dloc_x1+dloc_add, dloc_y1+y_next_lev1, 0);

      SR_Diamonds (dloc_x2+dloc_add, dloc_y1, 0);
      SR_Diamonds (dloc_x2+dloc_add, dloc_y1+y_next_lev1, 0);

   dloc_add+=32;
   END
//Diamonds
   dloc_add = 0;
   dloc_x1 =  x_def;
   dloc_x2 =  x_def+x_dsr_right2;
   dloc_y1 =  y_dsr_st2;

   FOR (d_count = 1; d_count <=4; d_count++)
      SR_Diamonds (dloc_x1+dloc_add, dloc_y1, 4);
      SR_Diamonds (dloc_x1+dloc_add, dloc_y1+y_next_lev1, 3);

      SR_Diamonds (dloc_x2+dloc_add, dloc_y1, 4);
      SR_Diamonds (dloc_x2+dloc_add, dloc_y1+y_next_lev1, 3);

   dloc_add+=32;
   END
//Diamonds
   dloc_add = 0;
   dloc_x1 =  x_def;
   dloc_x2 =  x_def+x_dsr_right3;
   dloc_y1 +=  y_next_lev2;

   FOR (d_count = 1; d_count <=6; d_count++)
      SR_Diamonds (dloc_x1+dloc_add, dloc_y1, 1);
      SR_Diamonds (dloc_x2+dloc_add, dloc_y1, 1);
      dloc_add+=32;
   END

   SR_Door1(roomid);
   door1 = get_id(type SR_Door1);
   SR_Door2();
   door2 = get_id(type SR_Door2);

//Level Timer Reset
   act_skel  = 30; //level_timer + level_skel;
   level_timer = 0;
   s_trigger[e_sroom] = TRUE; //music secret room

//Secret Room Anim effects
   SWITCH (roomid)
      CASE 0:
         Tiara();
      END
      CASE 1:
         Big_lightning();
      END
      CASE 2:
         Tiara();
      END
   END
   fade_on();

   LOOP
      IF(door2.kill == TRUE OR sr_player_died == TRUE) //until exit entered or dino killed by the ghost
         BREAK;
      END
      FRAME;
   END


//kill processes

   signal (door1, s_kill);
   signal (door2, s_kill);
   signal (torchids[0], s_kill);
   signal (torchids[1], s_kill);
   bubbob[0].bubble_type = blow_normal;
   bubbob[1].bubble_type = blow_normal;

   pl_died_skhurry = TRUE; //to get rid of the ghost
   game_state = gs_start_adv_level;

   kill_secret_eff = TRUE; //to kill off the pinball and star sprites in the secret room

   FRAME;
   pl_died_skhurry = FALSE; //need to set this back or Hurry up wont work until player dies

END

//Secret room Diamonds
PROCESS SR_Diamonds (x, y, sprid)
PRIVATE
    id2;      //for getting man id when dino collides
    score;        //score value of this food
    score_speed;  //speed score goes up the screen
BEGIN
    file = fooditems;
    z = pri_items;
    GRAPH = small_diamonds[sprid]; //get diamond id, not stored in order so hence the array
    score = 10000;
    secret_total +=1;
    REPEAT

      FRAME(500);

      IF (id2 = collision (type man))
        Scoresmall (x, y, id2, 10000, 1); //x,y, score, scorespeed 0 or 1
        s_trigger[e_food] = TRUE; //sound effect
        BREAK;
      END
          //kill it hit platform or when new level
    UNTIL (sr_player_died == TRUE)

    secret_total --; //decrease secret room diamond count
END

PROCESS SR_Door1(roomid)
PRIVATE
    an_delay;
    an_start;
    fcount;
    id2;
BEGIN
    file = blocksfile;
    fcount = s_room_door+(roomid*7);
    an_start = s_room_door+(roomid*7);
    x = x_door1;
    y = y_door1;
    z = pri_doors;
    GRAPH = fcount;

//Closed Door
    LOOP
      IF (secret_total <=12) BREAK; END //pause on closed until players have collected 24 diamonds
      FRAME;
    END
//Door open Animation
    REPEAT
      an_delay++;
     IF (an_delay > 10)
         an_delay = 0;
         fcount++; //change current frame
         GRAPH = fcount;
     END

     FRAME;
    UNTIL (fcount => an_start + 6)

//Door open and dino collision dection
    LOOP
        id2 = collision(type man);
        IF (id2 != 0)
            id2.ypos += (block_res*8);
        END
      FRAME;
    END

END

//Exit Door
PROCESS SR_Door2()
PRIVATE
    an_delay;
    an_start;
    fcount;
    id2;
BEGIN
    file = blocksfile;
    fcount = s_room_exit;
    an_start = s_room_exit;
    x = x_door2;
    y = y_door2;
    z = pri_doors;
    GRAPH = fcount;

//Closed Door
    LOOP
      IF (secret_total <=0) BREAK; END //pause on closed until players have collected 36 diamonds
      FRAME;
    END
//Door open Animation
    REPEAT
      an_delay++;
     IF (an_delay > 10)
         an_delay = 0;
         fcount++; //change current frame
         GRAPH = fcount;
     END

     FRAME;
    UNTIL (fcount => an_start + 4)

//Door open and dino collision dection
    LOOP
        id2 = collision(type man);
        IF (id2 != 0)
           kill = TRUE;
        END
      FRAME;
    END
END


PROCESS Torch(xloc, yloc)
PRIVATE
    an_delay;
    an_start;
    fcount;
BEGIN
    file = blocksfile;
    fcount = s_room_torch;
    an_start = s_room_torch;
    x = xloc;
    y = yloc;
    z = pri_doors;
    REPEAT

    GRAPH = fcount;
    an_delay++;

    IF (an_delay > 5)
       an_delay = 0;
       fcount++; //change current frame

       IF (fcount > an_start + 1) //frame number over end of animation
          fcount = an_start; //reset animation
       END
    END

    FRAME;

    UNTIL (kill == TRUE)
END


//Potions
PROCESS Potion_VS (sprid)
PRIVATE
    frm_count;
    anim_way;
    total_screen;
    time;
    time_last;
    gph_st;
    anim_end;
    anim_frms;
    count_x; //draw count for potions
    count_y;
    p_x_loc; //sprite placement location on the screen
    p_y_loc;
    p_det_x; //detection location for checking the hardness map
    p_det_y;
    total_food;
    textids[5]; //4 for display text 2 for scrolling totals at the end of the level
    id_count; //for clearing screen text
    plr_1_alive; //gets T/F player 1 alive
    plr_2_alive; //gets T/F player 2 alive
    anim_ids[3]; //ids of animation 500x and Perfect
    //used by movement of totals + perfect
    move_y1;       //position of anim 500x
    move_y2;       //text loc
    move_y3;       //perfect
    delay_time;
    perfect;       //display perfect?
    eff_channel;
BEGIN


    level_type = lv_potion; //to stop hurry up and Skel and kills the trap bubbles
    act_hurry = level_timer + 100;
    act_skel  = level_timer + 100;

    file = fooditems;
    x = x_vs;
    y = y_vs;
    z = pri_items; //screen sprite priority

    plr1_score = 0; //count of how many potion foods the dinos have collected
    plr2_score = 0; //global vars

    textids[0] = write(font_r, x_time, y_time,3,"TIME");
    textids[1] = write_int(font_s,  x_pl2_sc ,y_time, 5, &time);
    textids[2] = write_int(font_gr, x_pl1_sc ,y_pl_sc, 5, &plr1_score);
    textids[3] = write_int(font_b,  x_pl2_sc ,y_pl_sc, 5, &plr2_score);

    time = potion_time;
    anim_way = 1;
    GRAPH = vs_graph;

    gph_st = potion_food[sprid].gph;
    anim_end = gph_st + potion_food[sprid].frames;
    anim_frms = potion_food[sprid].frames;

    //Potion_Food
    //x, y, sprid, gph_st, anim_end, anim_frms
    p_x_loc = x_pot_st; //sprite placement location on the screen
    p_y_loc = y_pot_st;

    p_det_x = x_pot_det; //detection location for checking the hardness map
    p_det_y = y_pot_det;

    baddie_alldie = mkill_do_nothing; //kill all baddie processes
    ffall_level = FALSE;

    s_trigger[e_extend2] = TRUE; //trigger potion music

    FOR (count_y = 1; count_y <= pot_num_y; count_y++)

      FOR (count_x = 1; count_x <= pot_num_x; count_x++)
         IF (Food_detection(p_det_x, p_det_y) == FALSE)
            P_Food(p_x_loc, p_y_loc, sprid, gph_st, anim_end, anim_frms);
            total_food++;
         END
         p_det_x +=2;
         p_x_loc+=32;
      END
      p_x_loc = x_pot_st; //reset potion sprite x draw location
      p_y_loc +=32;
      p_det_x = x_pot_det;
      p_det_y +=2;
    END

    REPEAT
    IF (time_last != level_timer)
        time--;
        time_last = level_timer;
    END
      IF (timer[2] == 0)
         IF (anim_way == 1)
            GRAPH++;
            frm_count++;
            IF (frm_count>7)
               anim_way = 2;
               frm_count = 0;
            END
         ELSE
           GRAPH--;
            frm_count++;
            IF (frm_count>7)
               anim_way = 1;
               frm_count = 0;
            END

         END
      END

      FRAME;
          //kill it hit platform or when new level
    UNTIL (time <= 0 OR (plr1_score + plr2_score == total_food) OR game_state == gs_adv_level)


//end of potion food display kill processes
    kill = 1;
//used to check what totals to display
    plr_1_alive = Player_alive (0); //gets T/F player 1 alive
    plr_2_alive = Player_alive (1); //gets T/F player 2 alive

//    plr1_score = total_food;
//TOTALS
    move_y1 = y_pot500;

    IF (plr_1_alive == TRUE)
      static_anim2(x_pot500, y_pot500, pri_potion, pot_500);
      anim_ids[0] = get_id (type static_anim2);
      textids[4] = write_int(font_pg, x_pot1_sc ,y_pot_sc, 5, &plr1_score);
    END

    IF (plr_2_alive == TRUE)
      static_anim2(x_pot500 + x_pot2_add, y_pot500, pri_potion, pot_500+1);
      anim_ids[1] = get_id (type static_anim2);
      textids[5] = write_int(font_pb,  x_pot1_sc + x_pot2_add, y_pot_sc, 5, &plr2_score);
    END

//perfect level score?
//Do Graphic if perfect
    IF (plr1_score + plr2_score == total_food)
       perfect = TRUE;
       IF (plr_1_alive == TRUE)
         IF (plr1_score >= plr2_score)
            static_anim2(x_pot500, y_pot500+32, pri_potion, pot_perfect+1);
         ELSE
            static_anim2(x_pot500, y_pot500+32, pri_potion, pot_perfect);
         END
         anim_ids[2] = get_id (type static_anim2);
       END

       IF (plr_2_alive == TRUE)
         IF (plr2_score >= plr1_score)
            static_anim2(x_pot500 + x_pot2_add, y_pot500+32, pri_potion, pot_perfect+pot_badd+1);
         ELSE
            static_anim2(x_pot500 + x_pot2_add, y_pot500+32, pri_potion, pot_perfect+pot_badd);
         END
         anim_ids[3] = get_id (type static_anim2);
       END

    END

    bubble_alldie = TRUE;

//move totals and 500x up
    REPEAT
         IF (anim_ids[0] != 0) //Green Player
            anim_ids[0].y -=y_pot_add;                        //move graphic 500x
            move_text(textids[4],x_pot1_sc, y_pot_sc-move_y2);//move score
         END

         IF (anim_ids[1] != 0) //Blue Player
            anim_ids[1].y -=y_pot_add;
            move_text(textids[5], x_pot1_sc + x_pot2_add, y_pot_sc-move_y2);
         END
          move_y1-=y_pot_add;
          move_y2+=y_pot_add;

       FRAME;
    UNTIL (move_y1 <= y_pot_stop_loc1)

//move up Perfect
IF (perfect == TRUE)
    REPEAT
         IF (anim_ids[2] != 0) //Green Player
            anim_ids[2].y -=y_pot_add;       //move graphic perfect
         END
         IF (anim_ids[3] != 0) //Blue Player
            anim_ids[3].y -=y_pot_add;
         END
          move_y3+=y_pot_add;

       FRAME;
    UNTIL (move_y3 >= y_pot_stop_loc2)
END

//add 50,000 or 100,000 to each player if they have collected the whole lot off food
   IF (plr1_score + plr2_score == total_food)
      IF (plr_1_alive == TRUE)
         IF (plr1_score >= plr2_score)
            //100,000
            bubbob[0].score +=100000; //add 10,000 to player 1 score
         ELSE
            //50,000
            bubbob[0].score +=50000; // add 50,000 to player 1 score
         END
      END

      IF (plr_2_alive == TRUE)
         IF (plr2_score >= plr1_score)
            //100,000
            bubbob[1].score +=100000; //add 10,000 to player 1 score
         ELSE
            //50,000
            bubbob[1].score +=50000; // add 50,000 to player 1 score
         END
      END
   END //end dino add perfect scores

//Move the whole lot off the screen
    REPEAT
         IF (anim_ids[0] != 0) //Green Player
            anim_ids[0].y -=y_pot_add;                        //move graphic 500x
            move_text(textids[4],x_pot1_sc, y_pot_sc-move_y2);//move score
         END

         IF (anim_ids[1] != 0) //Blue Player
            anim_ids[1].y -=y_pot_add;
            move_text(textids[5], x_pot1_sc + x_pot2_add, y_pot_sc-move_y2);
         END

         IF (anim_ids[2] != 0) //Green Player
            anim_ids[2].y -=y_pot_add;       //move graphic perfect
         END
         IF (anim_ids[3] != 0) //Blue Player
            anim_ids[3].y -=y_pot_add;
         END

          move_y1-=y_pot_add;
          move_y2+=y_pot_add;
          move_y3+=y_pot_add;

       FRAME;
    UNTIL (move_y1 <= -80)

//DELETE TEXT
//delete the Top potion screen text
    FOR (id_count = 0; id_count <=3; id_count++)
      delete_text(textids[id_count]);
    END
//player 1 big text total
    IF (textids[4] != 0)
      delete_text(textids[4]);
    END
//player 2 big text total
    IF (textids[5] != 0)
      delete_text(textids[5]);
    END

//kill Graphics
    FOR (id_count = 0; id_count <=3; id_count++)
      IF (anim_ids[id_count] !=0)
         signal(anim_ids[id_count], s_kill);
      END
    END

//Set back to level normal so song will restart
    level_type = lv_normal;

    level_next = level_timer + 1;

//The song will restart now
       IF (do_song != 0)
         eff_channel = using_channel[Pri_1]; //get effect id playing

         IF (is_playing_sound (eff_channel) == Yes AND eff_channel !=0)
             stop_sound (eff_channel);
         END
       END

    restore_type = partial_restore;
    FRAME;
    restore_type = no_restore;       //speeds the game up conciderably

END

PROCESS Food_detection(x, y)
PRIVATE
    blockdet;
BEGIN
    blockdet = map_get_pixel(platdata, plat_start, x, y-1);
    blockdet+= map_get_pixel(platdata, plat_start, x+1, y-1);

    blockdet+= map_get_pixel(platdata, plat_start, x, y);
    blockdet+= map_get_pixel(platdata, plat_start, x+1, y);
    blockdet+= map_get_pixel(platdata, plat_start, x, y+1);
    blockdet+= map_get_pixel(platdata, plat_start, x+1, y+1);

    IF (blockdet > 0)
      RETURN (TRUE);
    ELSE
      RETURN (FALSE);
    END
END

//Potion Food
PROCESS P_Food (x, y, sprid, gph_st, anim_end, anim_frms)
PRIVATE
   anim_count;
   anim_time;
   cur_gph;
   id2;
   player_num; //which player to add
   cur_size;
BEGIN
   file = fooditems;
   region = 1; //needed for clipping the sprite when it goes off the playfield


   cur_gph = gph_st;
   GRAPH = gph_st;
   size = cur_size;

   LOOP
      IF (cur_size >=100) BREAK; END
      cur_size += 10;
      size = cur_size;
      FRAME(250);
   END

   IF(sprid == 0 OR sprid ==2) //1 frame of animation rotate the graphic
      REPEAT
         IF (anim_time >= 5)
            anim_time = 0;
            angle += 10000;
         END
         anim_time++;
         id2 = collision(type man);
         kill = father.kill;

      FRAME(200);
      UNTIL (id2 != 0 OR kill == 1)

   ELSE

      REPEAT
        IF (anim_time >= 5) //animation with multiple frames
        anim_time = 0;
        cur_gph++;
        IF(cur_gph >= anim_end)
            cur_gph = gph_st;
        END
        GRAPH = cur_gph;
        END
        anim_time++;
        id2 = collision(type man);
        kill = father.kill;
      FRAME(200);
      UNTIL (id2 != 0 OR kill == 1 OR game_state == gs_adv_level)
   END

   IF (id2 != 0)
   player_num = ret_dino_num(id2); //which player to add
   bubbob[player_num].score +=500; //add 500 to players score
   s_trigger[e_popfood] = TRUE;    //trigger Sound Effect

      IF (player_num == 0)
         plr1_score++;
      ELSE
         plr2_score++;
      END
   ELSE
      IF (kill == 1)
         cur_size = 100;
         LOOP
            IF (cur_size <=0) BREAK; END
            cur_size -= 10;
            size = cur_size;
            FRAME(250);
         END
      END
   END

END


PROCESS Big_Lightning()
PRIVATE
    gfxnum;      //gets what graphic to display next
    st_frm;      //cur anim frame
    maxfrm;      //max anim frame
    an_start;    //animation start graph number
    xsp;
    id2;
BEGIN
    file = sprites;
    region = 1; //needed for clipping the sprite when it goes off the playfield

    an_start = BL_Graph;
    maxfrm = an_start + BL_Frames;
    gfxnum = an_start;

//Start Movement initialation
    spec_weapon_go = spec_go_light;
    xpos = 142;
REPEAT
    x = 142 + (100 * RAND (0,4));
    xpos = x;
    xsp = -14;
    xmov = 0;
    s_trigger[e_lning2] = TRUE;

    REPEAT

     IF (Timer[5]==0 AND level_stop_what == 0)
         gfxnum++;
         IF (gfxnum >= maxfrm) gfxnum = an_start; END
     END

    GRAPH = gfxnum;
IF (level_stop_what != stop_everything) //HURRY UP Freeze game

//Movement
    IF (level_stop_what == 0)
        xmov+=xsp;
        x =xpos+xmov/10; //divide by 10 to get a angle
        y+=8;
    END

//write to sprites coords
END
    FRAME;
        id2 = collision(type Bubble_sprite);
        IF (id2 != 0) id2.kill = 1; END

    UNTIL (x < 92 or y > y_dn_stop OR game_state == gs_adv_level OR level_next != 0)
    x = 142;
    y = -50;
    FRAME;

UNTIL (game_state == gs_adv_level OR level_next != 0)

    spec_weapon_go = 0;
END

//X pos, Y pos
PROCESS Pinball_Star (xpos, ypos)
PRIVATE
    gfxnum;      //gets what graphic to display next
    st_frm;      //cur anim frame
    maxfrm;      //max anim frame
    anim_time;   //this counts up
    an_start;    //animation start graph number
    anim_dir;    //animation direction
    golr;        //which way left/right
    goud;        //up/down
    id2;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield

    file = sprites;

    fall = 0;
    jump = FALSE;

    an_start = N_Star_Pinball;
    maxfrm = an_start + N_Star_P_Frms;
    gfxnum = an_start;

//Start Movement initialation
    golr = RAND (1,2); //left right
    goud = RAND (1,2); //up down

    spec_weapon_go = spec_go_pinball;
    x = xpos;
    y = ypos;
    man_speed = 4;//Speed of pinball star
    anim_dir = 2;
    REPEAT

IF (level_stop_what != stop_everything) //HURRY UP Freeze game

    anim_time++; //increase it by one

     IF (anim_time >= 10 AND level_stop_what == 0)
         anim_time = 0;

         IF (anim_dir == 2)
            gfxnum++;
            IF (gfxnum >= maxfrm) anim_dir = 1; END
         END

         IF (anim_dir == 1)
            gfxnum--;
            IF (gfxnum <= an_start) anim_dir = 2; END
         END

     END

    GRAPH = gfxnum;

    xmov = 0; //clear x y stop local variables
    xstop = FALSE;
    ystop = FALSE;

//Movement

IF (level_stop_what == 0)
   //left
   IF (golr == 1)
       xmov = -man_speed;
   END

   //right
   IF (golr == 2)
       xmov = man_speed;
   END

   //up
   IF (goud == 1)
       ydmov = -man_speed;
   END

   //down
   IF (goud == 2)
       ydmov = man_speed;
   END
END

//   fall = man_speed;

//Detect platforms
   get_hard_col2();

//update x position
    xpos += xmov;
//update y coords
    ypos += ydmov;

//hit a platform turn around

    IF (xstop == TRUE)
        IF (golr == 1)
           golr = 2;
            s_trigger[e_firesph] = TRUE;

        ELSE
           golr = 1;
            s_trigger[e_firesph] = TRUE;
        END
    END

//hit a platform above below move the other way
    IF (ystop == TRUE)
        IF (goud == 1) //swap movement
            goud = 2;
            s_trigger[e_firesph] = TRUE;
        ELSE
            goud = 1;
            s_trigger[e_firesph] = TRUE;
        END
    END

//bottom of screen fall though to top
    IF (ypos > 30 * 16)
        ypos = y_def -16;
    END
//up to the bottom of the screen
    IF (ypos < 32)
       ypos = 474;
    END


//write to sprites coords

    x = xpos;
    y = ypos;
END
    FRAME;
        id2 = collision(type Bubble_sprite);
        IF (id2 != 0) id2.kill = 1; END

UNTIL (game_state == gs_adv_level OR level_next != 0)

    spec_weapon_go = 0;

END


PROCESS Bell(del)
BEGIN
    s_trigger[e_bell] = TRUE; //Trigger water Flood sound

    anim(bell1_x, bell_y, Bell_frame, 2, 50, 10, del);
    anim(bell2_x, bell_y, Bell_frame, 2, 50, 10, del);

END

PROCESS Tiara()
PRIVATE
    xstart;
    rndway;
    nextstar;
BEGIN
    x = x_def;
    y = y_def-32;

    //Turn on extra sprite detection in the sprites for tiara stars
    spec_weapon_go = spec_go_tiara;

    LOOP

    IF (nextstar <= 0 AND multi < 20)
        nextstar = rand (1,15);

        xstart = RAND (x_tiara_l, x_tiara_r);
        IF (xstart <=x_scr_middle)
            rndway = RAND (1,30);   //movement left if less than the middle of the screen
        ELSE
            rndway = RAND (-1,-30); //movement right if greater than the middle of the screen
        END

        IF (secret_num == 3)          //secret room number 1 or 3
           T_Pinball_Sprites(xstart,y,rndway); //do pinball Star
        ELSE
           T_Star_Sprites(xstart,y,rndway); //do a star
        END

    END
    nextstar--;
    IF (level_next != 0 OR kill_secret_eff == TRUE ) BREAK; END //stop if next level timer started, means last baddie killed

    FRAME;
    END
//    debug;
    spec_weapon_go = 0; //Turn off extra sprite detection

END

//Tiara Star sprites

PROCESS T_Star_Sprites(x,y, xsp)
PRIVATE
    stanim;
    animframe;
    rot_way;
    id2;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;
    stanim = T_Stars;
    GRAPH = stanim;
    animframe = stanim;
    z = pri_effects;

    xpos = x;
    father.multi++;

    IF (xsp < 0)
        rot_way = 4500;
    ELSE
        rot_way = -4500;
    END

    LOOP
        angle += rot_way;

        IF (timer[5] == 0)
            animframe++;
            IF (animframe >= stanim +T_Stars_Frms)
                 animframe = stanim;
            END
        END
        GRAPH = animframe;

        xmov+=xsp;
        x =xpos+xmov/10; //divide by 10 to get a angle
        y+=4;

        IF (check_xbounds(x)== TRUE OR kill_secret_eff == TRUE OR y > y_dn_start) BREAK; END

        //all other dection is done in the nastie sprites for speed reasons
        id2 = collision(type Bubble_sprite);
        IF (id2 != 0) id2.kill = 1; END

        FRAME;

    END

    father.multi--; //to count how many on the screen

END


PROCESS T_Pinball_Sprites(x,y, xsp)
PRIVATE
    an_start;
    maxfrm;
    gfxnum;
    anim_dir;
    anim_time;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;
    z = pri_effects;
    father.multi++;
    xpos = x;

    an_start = N_Star_Pinball;
    maxfrm = an_start + N_Star_P_Frms;
    gfxnum = an_start;

    GRAPH = an_start;
//Start Movement initialation

    man_speed = 4;//Speed of pinball star
    anim_dir = 2;

    REPEAT
    anim_time++; //increase it by one

     IF (anim_time >= 10)
         anim_time = 0;

         IF (anim_dir == 2)
            gfxnum++;
            IF (gfxnum >= maxfrm) anim_dir = 1; END
            GRAPH = gfxnum;
         END

         IF (anim_dir == 1)
            gfxnum--;
            IF (gfxnum <= an_start) anim_dir = 2; END
            GRAPH = gfxnum;
         END

     END

     //movement
     xmov+=xsp;
     x =xpos+xmov/10; //divide by 10 to get a angle
     y+=4;

     FRAME;

     UNTIL (y > y_dn_start OR check_xbounds(x)== TRUE OR kill_secret_eff == TRUE OR game_state == gs_adv_level OR game_state == gs_level_anims)

    father.multi--; //to count how many on the screen

END


//Clock stop time
PROCESS Heart()
BEGIN
    level_stop_what = stop_heart;
    baddie_what = mon_heart;
    heart_timer = level_timer + 13;
    s_trigger[e_heart] = TRUE;

    act_hurry = act_hurry + 13;
    act_skel  = act_skel  + 13;

    LOOP
        IF (level_timer > heart_timer)
           BREAK;
        END
    FRAME;

    END

    //Set the nasties back to normal
    heart_finished = TRUE;

    //Do other timers or will give an error
    //act_hurry = level_timer + level_hurry;
    //act_skel  = level_timer + level_skel;
    baddie_what = mon_norm; //back to normal

    IF (doing_effect[pri_1] != e_normal AND level_type == lv_normal)
        s_trigger[e_normal] = TRUE;
    END

    FRAME;
    heart_finished = FALSE;

END

//Clock stop time
PROCESS Clock()
PRIVATE
    c_time_out;
BEGIN
    level_stop_what = stop_monsters;
    s_trigger[e_clock] = TRUE;
    c_time_out = level_timer + 300; //5 minutes timer out
    LOOP
       FRAME;
       IF (level_next!= 0) BREAK; END

       IF (level_timer >= c_time_out) //time out or can stop the game forever
           level_stop_what = stop_nothing;
           act_hurry = level_timer + level_hurry;
           act_skel  = level_timer + level_skel;
           effects[e_clock].stop_effect = TRUE;
           BREAK;
       END
    END

END

//Floods the screen with water and drowns the nasties
PROCESS Flood()
PRIVATE
     y_dest;
     x_dest;
     ysize;
     drawcount;
     scount;

     cpy_y_loc;
BEGIN

    file = blocksfile;
    y_dest = lastdrawloc+400; //get where the background display scroll plane is

    drawcount = 0;
    ysize = 16;

    s_trigger[e_wcross] = TRUE; //Trigger water Flood sound

    cpy_y_loc = 27 * block_res;

    REPEAT

    //file, dest graphic, x dest, y dest, origin gph, x, y, width, height
        x_dest = 0;
        FOR (scount = 0; scount < 8; scount++)
            map_block_copy (blocksfile, scr_bgrd, x_dest, y_dest, flood_grp, 0, cpy_y_loc ,64, 16);
            x_dest+=64;
        END
        refresh_scroll(0);
        y_dest -= 16;
        drawcount++;
        cpy_y_loc -= 16;

    FRAME;

    UNTIL (drawcount >28)


//    refresh_scroll(0);

    IF (exits_open[0].ex_status != s_ext_closed AND
        exits_open[0].ex_size == 4)
        Flood_Sprites(exits_open[0].ex_st);
    END

    IF (exits_open[1].ex_status != s_ext_closed AND
        exits_open[1].ex_size == 4)
        Flood_Sprites(exits_open[1].ex_st);
    END

    baddie_alldie = mkill_water_cross; //kill monsters and turn them into blue diamonds
    bubble_alldie = TRUE;              //kill bubbles and trapped monsters

END //Flood

//for gaps in the screen above, does waves animation
PROCESS Flood_Sprites(x_start)
PRIVATE
    stanim;
    animframe;
BEGIN
    file = blocksfile;
    stanim = flood_anim;

    GRAPH = stanim;
    animframe = stanim;

    x = 92 + x_start*block_res;
    y = 48;

    z = pri_flood;

    REPEAT
        IF (timer[5] == 0)
            animframe++;
            IF (animframe > stanim+3)
                 animframe = stanim;
            END
            GRAPH = animframe;
        END
        FRAME;

    UNTIL (game_state == gs_adv_level OR game_state == gs_level_anims)

END //Flood Sprites

//Book Explosion frames
//5 explosions, 6 frames each
//colours Red, orange, green, blue, purple
//    book_st_frm  = 704; //Red
//    book_frms    = 6; //number of frames
//    book_exp_num = 5; //number of them

PROCESS Book (xst, yst)
PRIVATE
    runtime;
    time_del;
    number_onscr;
    rndx;
    rndy;
    expcolour;
    expcount;
BEGIN

    Shake(); //Shake the screen
    baddie_alldie = mkill_book;
    bubble_alldie = TRUE;              //kill bubbles and trapped monsters

    REPEAT

    IF (runtime > time_del)
        expcolour = book_frms * RAND (0,book_exp_num-1); //randomize the colour
        rndx = xst+RAND (-100,100);                      //randomize the x coord
        rndy = yst+RAND (-100,100);                      //randomize the y coord

//Check bounds of screen
        IF (rndx > xpos_l+32 AND rndx < xpos_r AND
            rndy > y_def AND rndy < 480)
        //do explosion
        s_trigger[e_explos] = TRUE;

        anim(rndx, rndy, book_st_frm+expcolour, book_frms, 30, 5, 1);
        expcount++;              //explosions done count +1
        time_del = Rand (1, 15); //randomize when next explosion will take place
        runtime = 0;             //reset timer
        END
    END
    runtime++;

    FRAME;

    UNTIL (expcount > 10)

END

//Shake the screen up and down
PROCESS Shake()
PRIVATE
      shakespeed;
      shkind;
BEGIN
     REPEAT
     shakespeed = shaketable[shkind]; //movement value

        //shake both scrollplanes
        scroll.y0 += shakespeed;
        scroll.y1 += shakespeed;
        shkind++;
        FRAME;
     UNTIL (shkind > num_shk) //do all the array of the shake values in the array

     father.ani_finish++; //to say animation finished

END

PROCESS Bomb(xloc, yloc);
BEGIN
    s_trigger[e_boom] = TRUE;

    Shake(); //Shake the screen
//Burn the players retiners out with a stupidly big explosion
    Restore_it();
    Anim(xloc, yloc, bomb_anim, 7, 35, 5, 1);
//kill baddies
    baddie_alldie = mkill_bomb;
    bubble_alldie = TRUE;             //kill bubbles and trapped monsters

END

//Restores the screen after a bomb animation
PROCESS Restore_It()
PRIVATE
    res_count;
BEGIN
    restore_type = complete_restore; //restore all of the screen
    LOOP
        IF (timer[5] == 0)
            res_count++;
        END
       IF (res_count > 20) BREAK; END
       FRAME;
    END
    restore_type = no_restore; //speeds the game up conciderably

END

//purple lantern explosion
PROCESS Purple_Lantern();
PRIVATE
     animframe;
     animst;
BEGIN

    x = x_scr_middle;
    y = y_scr_middle;
    file = sprites;
    animframe = spw_lan_star;
    animst = animframe;

    s_trigger[e_boom] = TRUE; //sound trigger

    REPEAT
        GRAPH = animframe;
        IF (timer[2] == 0)
            animframe--;
        END

    FRAME;
    UNTIL (animframe < animst-1)
//explosion animation
    PL_Fire_ball(x, y, 1, 0);
    PL_Fire_ball(x, y, -1, 0);
    PL_Fire_ball(x, y, 0, -1);
    PL_Fire_ball(x, y, 0, 1);

    PL_Fire_ball(x, y, 1, 1);
    PL_Fire_ball(x, y, -1, -1);
    PL_Fire_ball(x, y, 1, -1);
    PL_Fire_ball(x, y, -1, 1);

//kill baddies
    baddie_alldie = mkill_purp_lantern;
    bubble_alldie = TRUE;             //kill bubbles and trapped monsters

END
//lantern explosion animation
PROCESS PL_Fire_ball(x, y, xmov, ymov)
PRIVATE
    xspeed;
    yspeed;
BEGIN
    GRAPH = spw_lan_fireball;
    file = sprites;
    xspeed = xmov;
    yspeed = ymov;
    region = 1;
    REPEAT

        IF (xmov<0)
           xspeed--;
            IF (x < xpos_l+16);
            xstop = TRUE;
            END
        END
        IF (xmov>0)
          xspeed++;
        IF (x > xpos_r);
            xstop = TRUE;
        END
        END

        IF (ymov<0)
            yspeed--;
            IF (y < y_def);
            ystop = TRUE;
            END
        END
        IF (ymov>0)
            yspeed++;
            IF (y > 480);
            ystop = TRUE;
            END
        END
        x+=xspeed;
        y+=yspeed;

        FRAME;

   UNTIL (xstop == TRUE OR ystop == true)

END


PROCESS Big_Food_Sprite(spr_id, bf_type)
PRIVATE
    id2;
    score;
    rand_eff;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield

    file = fooditems;
    x = x_def+block_res*13;
    y = y_def-56;
    ystop = FALSE;

    //s_trigger[e_burp] = TRUE; //bigfood sound

    rand_eff = RAND (e_laugh1, e_burp); //randomise effect when big food eaten

    LOOP //makes it invisible and off the screen
        FRAME;
        IF (level_next != 0) BREAK; END
    END
    s_trigger[e_bigfood] = TRUE; //bigfood sound

    //load the grpahic and drop it down the screen
    GRAPH = big_food+(spr_id);
    REPEAT
        IF (ystop == FALSE)
            IF (y >= 444)
                ystop = TRUE;
                y += 16-(y MOD 16);
            ELSE
                y+=4;
            END
        END //Movement end


        IF (id2 = collision (type man)) //when collected do score
            s_trigger[rand_eff] = TRUE; //trigger eaten sound effect
            ScoreBig2 (x, y, id2, spr_id,bf_type);
            BREAK;

        END
        FRAME;
    UNTIL (game_state == gs_adv_level OR game_state == gs_level_anims OR level_type != lv_normal)

END

//Point display frames
//    greenfruit = 243; //the 10k points graphics
//    pointsadd  = 100; //what to add to do the blue ones


PROCESS ScoreBig2 (x, y, id2, spr_id, bigtype) //big type = 1 candy cane, 2 chest,
PRIVATE
    scoretime;
    whichdino;
    getgraph;
    score;
    movecount; //records how far we have moved up the screen
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = fooditems;
    whichdino = ret_dino_num(id2);
    score = big_food_score[spr_id];

    IF (level_type != lv_demo AND level_type != lv_instr)
      bubbob[whichdino].score += score;
    END

    spr_id --;
    y = y - 32;

//locate the proper graphic
    getgraph = greenfruit; //10k points start
    getgraph+=(whichdino*pointsadd);
    IF (score>10000)
        getgraph+=(score/10000)-1;
    END

    GRAPH = getgraph;

    REPEAT
       y=y-4; //move score up the screen
       IF (y < y_up_stop) y = y_dn_stop; END //loop around the screen
       movecount++;
       FRAME;

    UNTIL (movecount > 23*4)

END


//Big score - MULTIPOP
PROCESS ScoreBig (x, y, stype, plr, score)
PRIVATE
    getgraph;
    movecount;
    moveadd;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = fooditems;
    moveadd = 8;

   last_lev_extra = 0; //last level multi pop highest  2 = trap 3 = trap * players

    IF (stype == 1)
       getgraph = greenbig;
       IF (score >=2)
          last_lev_extra += score; //last level multi pop highest  2 = trap 3 = trap * players
       END

    ELSE
       getgraph = greenfruit;
    END

    getgraph+=(plr*pointsadd);

    GRAPH = getgraph+score-1;

    REPEAT

       FRAME;
       y=y-4;

       IF (y < y_up_stop) y = y_dn_stop; END

       movecount++;

    UNTIL (movecount > 23*4)
END

//Point display frames
//    greenstart = 200;
//    greenbig   = 237;
//    greenfruit = 243;
//    pointsadd  = 100; //what to add to do the blue ones

    //food appear
    //pop
    //falling = 700 points
    //items

PROCESS Scoresmall (x, y, id2, in_score, stype)
PRIVATE
    scorespeed;
    scoretime;
    whichdino;
    getgraph;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = fooditems;
    whichdino = ret_dino_num(id2);
    IF (level_type != lv_demo AND level_type != lv_instr)
      bubbob[whichdino].score += in_score;
    END

    z = pri_score;
    y = y -8;
//norm
    IF (stype == 0)    //slow one for normal popped food, items, food
        scorespeed = 1;
        scoretime =  80;  //5*(block_res/scorespeed);
    ELSE
        scorespeed = 2;
        scoretime =  56;  //7*(block_res/scorespeed);
    END

//locate the proper graphic

    SWITCH (in_score)
        CASE 10..90:
            getgraph = (greenstart+in_score/10)-1;
        END

        CASE 100..950:
            getgraph = greenstart+((in_score/10)/5)+7;
        END

        CASE 1000..9000:
            getgraph = 226+(in_score/1000);
        END

        CASE 10000:
             getgraph = 236;
        END

    END

    getgraph+=(whichdino*pointsadd);

    GRAPH = getgraph;

    REPEAT

       FRAME;
       y=y -scorespeed;
       scoretime--;

    UNTIL (scoretime <= 0)

END

//WATER ANIMATION
PROCESS Water_Gen(xp, yp, facing)
PRIVATE
    cr_count; //creation of water counter
BEGIN
    IF (get_id (type water_head)==0 AND yp > 0)
    //create water
        s_trigger[e_wpop] = TRUE;
        water_head(xp, yp);
    END
END

PROCESS Water_Head(xw, yw)
PRIVATE
    alivetime;
    animdel;
    way;
    blstart;
    stway;
    jamcount;
    id2;
    mdelay;
    w_add;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;

    x = xw;
    y = yw;
    alivetime = 400;
    animdel = 0;
    way = father.facing;
   //Water flow count
    num_water = 0;

    // if popped without dino through a bubble it jams as cannot find which way to go
    // so do a random one
    IF (way == 0) way = rand (1,2); END

    stway  = way;
    //Fall through blocks if water starts on a block
    jamcount = 0;
    y +=8;
    y = y - y mod 16;

    REPEAT
        blstart = map_get_pixel(platdata, plt_hrd, x , y+8);
        FRAME;
        mdelay++;
        IF (mdelay >= 5)
            IF (blstart !=0) y+=8; END //advance it down the screen
            mdelay = 0;
        END
    UNTIL (blstart == 0)

    w_add = 8;
    z = pri_water;
    //Create rest of the water
    water(10, pri_water+1);
    //do our graphic
    GRAPH = water_anim;
    mdelay = 0;

LOOP
    xmov = 0;
    ydmov = FALSE;
    fall = FALSE;
IF (level_stop_what != stop_everything) //HURRY UP Freeze game

    IF(map_get_pixel(platdata, plt_hrd, x+16,y+16) != 0 OR y < 64)
        LOOP
            IF (map_get_pixel(platdata, plt_hrd, x+16, y+16) !=0 OR y < 64)
                y+=w_add;
                ydmov = TRUE;
            ELSE
                BREAK;
            END //advance it down the screen
            FRAME;
        END
    END

//do FALL movement
    IF ((map_get_pixel(platdata, plt_hrd, x+8, y + 26) == 0 AND way == 1) OR
    (map_get_pixel(platdata, plt_hrd, x+16, y + 26) == 0 AND way == 2))
        fall = TRUE;
        y+=w_add;
        ydmov = TRUE;

        IF (way == 2)
        GRAPH = water_ldown+1;
        ELSE
        GRAPH = water_rdown+1;
        END

        way = stway;
    ELSE
        fall = FALSE;
    END
//FALL END


    IF (fall == FALSE)
//adjust to be on a block
        x = x + x mod 8;
        x = x - 4;

//check side of screen
    IF (x <= 103) way = 1; END
    IF (x > 524) way = 2; END
       //right
       IF (way == 2)
            IF (map_get_pixel(platdata, plt_hrd, x +6, y+16) == 0 AND x > 16)
                x-=w_add;
                GRAPH = water_aleft;
                xmov = TRUE;
            ELSE
                way = 1;
            END
       ELSE
       //left
       IF (way == 1)
            IF (map_get_pixel(platdata, plt_hrd, x + 26, y+16) == 0)
                x+=w_add;
                GRAPH = water_aright;
                xmov = TRUE;
            ELSE
                way = 2;
            END
       END
       END

    END
//this stops the water from freezing in mid flow or at the bottom of the screen
    IF (xmov == 0 AND ydmov == 0)
        jamcount++;
    ELSE
        jamcount = 0;
    END
END
    FRAME;

    alivetime --;
    IF (alivetime < 20) y  = 500; END
    IF (alivetime < 0 OR y > y_dn_start + 160 OR jamcount > 20) BREAK; END

    IF (game_state == gs_adv_level OR level_type == lv_secret OR level_type == lv_extend) BREAK; END
END
    //kill all the water
    kill = TRUE;
    FRAME;

    id2 = get_id (type waterend);
    IF (id2 != 0) signal (id2, s_kill); END

END

PROCESS Water(num, cur_pri)
PRIVATE
    dist;
    aframe;
    id2;
    alivetime;
    jamcount;
    mdelay;
    //cur_pri;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    xpos = father.x;
    ypos = father.y;
    z = cur_pri;

    IF (num > 0 )
        water(num - 1, cur_pri+1);
        //cur_pri--;
        num_water++;
    ELSE
       waterend (cur_pri+1);
    END

    who = 1;
    file = sprites;
    ydmov = 0;
    alivetime = 400;

    LOOP

      aframe = water_anim;
      x = xpos;
      y = ypos;
//      GRAPH = aframe;

IF (level_stop_what != stop_everything) //HURRY UP Freeze game

      kill = father.kill;
      xpos = father.x;
      ypos = father.y;
      xmov = 0;

      IF (x> 16)

      IF (x > xpos)
         who = 1;
         xmov = TRUE;
      END

      IF (x < xpos)
         who = 2;
         xmov = TRUE;
      END

      IF (y < ypos) //moved down

        IF (ydmov == 0)  //First movement down do a rounded corner
            SWITCH (who)
                CASE 1: aframe = water_aleft; END  //left corner
                CASE 2: aframe = water_aright; END //right corner
            END
            ydmov = 1; //Set to moved down
        ELSE
            SWITCH (who)
                CASE 1: aframe = water_ldown; END
                CASE 2: aframe = water_rdown; END
            END
            ydmov = 1; //Set to moved down
        END
      ELSE
        ydmov = 0; //No down movement
      END

      ELSE
      aframe = 57;
//      aframe = water_anim;
      END

      GRAPH = aframe;

//This grabs the player and sweeps them down the screen
     id2 = collision(type man);
     IF(id2 != 0)
         water_dino(id, id2);
     END


//this stops the water from freezing in mid flow or at the bottom of the screen
    IF (xmov == 0 AND ydmov == 0)
        jamcount++;
    ELSE
        jamcount = 0;
    END

        alivetime --;
        IF (alivetime < 20) y  = 500; END
        IF (alivetime < 0 OR y > y_dn_start + 80 OR jamcount > 20
            OR game_state == gs_adv_level OR level_type == lv_secret OR level_type == lv_extend)
           BREAK;
        END

END//Pause animation
      FRAME;
    END

    kill = TRUE;
    FRAME;
END

//the end bit of the water flow
PROCESS WaterEnd(new_pri)
PRIVATE
    dist;
    aframe;

BEGIN
    xpos = father.x;
    ypos = father.y;

    who = 1;
    file = sprites;
    ydmov = 0;
    region = 1; //needed for clipping the sprite when it goes off the playfield

    LOOP

    aframe = water_anim;
    x = xpos;
    y = ypos;
    z = new_pri;
    kill = father.kill;

IF (level_stop_what != stop_everything) //HURRY UP Freeze game

      xpos = father.x;
      ypos = father.y;

      IF (x> 16)

      IF (x > xpos)
         who = 2;
      END

      IF (x < xpos)
         who = 1;
      END

        SWITCH (who)
           CASE 1: aframe = water_aleft; END  //left corner
           CASE 2: aframe = water_aright; END //right corner
        END

        IF (y < ypos) //moved down
            SWITCH (who)
                CASE 1: aframe = water_top+1; END
                CASE 2: aframe = water_top; END
            END
        END

      ELSE
      aframe = 0;
      END

      GRAPH = aframe;
END
    FRAME;
    IF (kill == TRUE OR game_state == gs_adv_level OR level_type == lv_secret OR level_type == lv_extend) BREAK; END
    END //loop end

END


//WATER KILL BADDIES
//coords, baddie number, kill for item weapon kill
PROCESS Baddie_Water_Kill(x, y, badid, id2)
PRIVATE
    animdel;
    animfrm;
    angadd;  //speed of rotation
    gojump;
    xstart;
    diam_id; //for item weapon kills
    rway;
    initial_x; //diamond drop where nastie died
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    angadd = 45000;
    file = sprites;
    GRAPH = baddie_anims[badid].die;

    x = id2.x;
    y = id2.y -16;
    initial_x = x; //diamond drop where nastie died

REPEAT
IF (level_stop_what != stop_everything) //HURRY UP Freeze game
    animdel++;
    IF(animdel > 4)
        animdel = 0;

    IF (rway == 1)
        FLAGS = 1;
        angle+=angadd;
    ELSE
        FLAGS = 0;
        angle-=angadd;
    END
    END

    IF (id2 != 0)
      x = id2.x;
      y = id2.y -16;

      IF (x > xpos)
          rway = 1;
      ELSE
          rway = 0;
      END
      xpos = x;
    END

END //stop movement end if
    FRAME;

UNTIL (id2.kill == TRUE OR y >= y_dn_stop OR baddie_alldie != 0) //baddie all die to stop infinite fall through of nastie error)

    bad_on_screen--;   //number on screen

    //last baddie popped flag to detect we have stored the time level took to complete
    IF (bad_on_screen == 0)
        game_state = gs_level_completed;
        level_stop_what = 0; //start timer again
    END

    diam_id = mkill_water_bubble-10; //for item weapon kills gives a diamond 6k-9k
    Food (initial_x, 0, diam_id, fd_diam); //do red diamonds from fireball kill, lightning

END

//generate a fire drop and animate it down the screen
PROCESS Fire_Gen(x, y, facing)
PRIVATE
    animdir;
    animframe;
    animend;
    frstart;
    frstart2;

BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield

    file = sprites;
    animdir = 1;
    animend = fire_drop +2;
    animframe = fire_drop;
    y = y + y mod 2;

    REPEAT

    y+=2;
    GRAPH = animframe;
    IF (y > y_up_start+64)
        frstart = map_get_pixel(platdata, plt_hrd, x+8, y+16);
        frstart2 = map_get_pixel(platdata, plt_hrd, x+8, y+8);
    END

    IF (timer[2] == 0)
        animframe+= animdir;
    END

//animation goes up to 3 frames then back down again
//high anim check
    IF (animframe >= animend AND animdir == 1)
        animdir = -1;
    END

//lowest anim check
    IF (animframe <= animend - 2 AND animdir == -1)
        animdir = 1;
    END

    FRAME;

    UNTIL (frstart != 0 AND frstart2 == 0 OR y > y_dn_start)

    y=y-8;
    //x = x + x mod 8;

//check to see if on screen
    IF (y < y_dn_start - 16)
        fire(x,y, 16);
    END
END

//does a stream of fire across a platform
PROCESS Fire(x, y, num)
PRIVATE
    animdir;
    animframe;
    animend;
    frstart;
    frstart2;
    ftimer;
    xadd;
    id2;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;
    animdir = 1;
    animend = fire_rage +2;
    animframe = fire_rage;
    facing = father.facing;

    xpos = x+16;
    ypos = y + 16;

    //add to do left or right spread of fire
    IF (facing == 2)
        xadd = -16;
    ELSE
        xadd = 16;
    END

    //detect platforms and walls and sides of screen
    //fire below
    frstart = map_get_pixel(platdata, plt_hrd, xpos + xadd , ypos + 8);
    //fire above
    frstart2 = map_get_pixel(platdata, plt_hrd, xpos + xadd, ypos - 2);

    SWITCH (facing)
     CASE 1:
        IF (num > 0 AND xpos < 540 AND frstart !=0 AND frstart2 == 0)
            fire (x + 16, y, num - 1);
        END
     END
     CASE 2:
        IF (num > 0 AND xpos > 24 AND frstart != 0 AND frstart2 == 0)
            fire (x - 16, y, num - 1);
        END
     END
    END

//this animates the fire now its spread as far as possible
    REPEAT

    GRAPH = animframe;

    IF (timer[2] == 0)
        animframe+= animdir;
        ftimer++;
    END
//animation goes up to 3 frames then back down again
//high anim check
    IF (animframe >= animend AND animdir == 1)
        animdir = -1;
    END

//lowest anim check
    IF (animframe <= animend - 2 AND animdir == -1)
        animdir = 1;
    END

        id2 = collision(type norm_baddie);
        IF (id2 != 0) id2.kill = mkill_firebubble; END
        id2 = collision(type diag_baddie);
        IF (id2 != 0) id2.kill = mkill_firebubble; END
        id2 = collision(type invader_baddie);
        IF (id2 != 0) id2.kill = mkill_firebubble; END
        id2 = collision(type spring_baddie);
        IF (id2 != 0) id2.kill = mkill_firebubble; END

    id2 = collision(type man);
        IF (id2 != 0)
            zzap_dino(id2);
        END

    FRAME;

    UNTIL (ftimer > 6 OR y > y_dn_start OR y < y_up_start)

    animframe = fire_die;
    animend = fire_diend;

    REPEAT

    GRAPH = animframe;

    IF (timer[2] == 0)
        animframe++;
    END

    FRAME;

    UNTIL (animframe > fire_diend OR y > y_dn_start OR y < y_up_start)

END

//Lightning animation
PROCESS Lightning (x, y, facing)
PRIVATE
    animdir;
    animframe;
    animend;
    id2;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;

    animdir = 1;
    animend = lning_main +2;
    animframe = lning_main;
    facing = father.facing;
    z = pri_effects;

    IF (facing == Face_Right)
        x = x - 16;
    ELSE
        x = x + 16;
    END

    REPEAT

    GRAPH = animframe;
IF (level_stop_what != stop_everything) //HURRY UP Freeze game

    IF (timer[2] == 0)
        animframe+= animdir;
    END
//animation goes up to 3 frames then back down again
//high anim check
    IF (animframe >= animend AND animdir == 1)
        animdir = -1;
    END

//lowest anim check
    IF (animframe <= animend - 2 AND animdir == -1)
        animdir = 1;
    END
//    mkill_lning_bubble = 12;

IF (level_type != lv_boss)
    id2 = collision(type norm_baddie);
    IF (id2 != 0)
        zzapp();  //zzapp animation puts this main lighning process to sleep whilst it animates
        id2.kill = mkill_lning_bubble;
    END

    id2 = collision(type diag_baddie);
    IF (id2 != 0)
        zzapp();  //zzapp animation puts this main lighning process to sleep whilst it animates
        id2.kill = mkill_lning_bubble;
    END
    id2 = collision(type invader_baddie);
    IF (id2 != 0)
        zzapp();  //zzapp animation puts this main lighning process to sleep whilst it animates
        id2.kill = mkill_lning_bubble;
    END
    id2 = collision(type spring_baddie);
    IF (id2 != 0)
        zzapp();  //zzapp animation puts this main lighning process to sleep whilst it animates
        id2.kill = mkill_lning_bubble;
    END
ELSE
    id2 = collision(type boss_baddie);
    IF (id2 != 0)
        zzapp();  //zzapp animation puts this main lighning process to sleep whilst it animates
        kill = TRUE;
        boss_health --; //decrease boss health by one
    END

END //end check level 100

    id2 = collision(type man);
        IF (id2 != 0)
        zzapp();
        zzap_dino(id2);
        END
END
    FRAME;

    IF (facing == Face_Right) //fly across the screen
        x-=6;
        IF (x < xpos_l-16) xstop = TRUE;END

    ELSE
        x+=6;
        IF (x > xpos_r+32) xstop = TRUE; END
    END

    UNTIL (xstop == TRUE OR kill == TRUE) //stop when hits the sides of the screen or hits boss
END

//Does a zapp of the lightning bolt
//puts the lightning bolt to sleep animates then awakens it again
PROCESS Zzapp()
PRIVATE
    animdir;
    animframe;
    animend;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;
    x = father.x;
    y = father.y;

    animdir = 1;
    animend = lning_zzap +2;
    animframe = lning_zzap;

//put lightening to sleep
    signal (father, s_sleep);
//    s_lning1    =14;

    s_trigger[e_lning1] = TRUE;

    LOOP

    GRAPH = animframe;

    IF (timer[2] == 0)
        animframe+= animdir;
    END

    IF (animframe >= animend AND animdir == 1)
        animdir = -1;
    END

//lowest anim check then quit
    IF (animframe <= animend - 2 AND animdir == -1)
        BREAK;
    END

    FRAME;

    END //main loop

//Boss hit of lightning
    IF (father.kill == TRUE)
      animframe = lning_boss;
      LOOP
      GRAPH = animframe;

         IF (timer[2] == 0)
            animframe++;
            IF (animframe > lning_boss+2) BREAK; END
         END

      FRAME;
      END
    END

    //make it run across the screen again
    signal (father, s_wakeup);
END

//animate the player zapped by lightening or fire
PROCESS Zzap_Dino(id2)
PRIVATE
    zcount;
    animdir;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;
    signal (id2, s_sleep);

    x = id2.x;
    y = id2.y;

    IF (id2 == bubbob[0].sprite_id)
    GRAPH = 20;
    ELSE
    GRAPH = 50;
    END

    animdir = 0;
    REPEAT

    FLAGS = animdir;

    IF (timer[2] == 0)
        IF (animdir == 0)
        animdir = 1;
        ELSE
        animdir = 0;
        END
        zcount++;
    END

    FRAME;

    UNTIL (zcount > 4)
    signal (id2, s_wakeup);

END

//Player lives as eggs at the bottom of the screen
PROCESS Player_Lives(plr_num)
PRIVATE
    lives;
    id2;
    grph_add;
    num_to_dis;
BEGIN

    file = sprites;
    grph_add = plr_num *5; //add 5 to get blue dino eggs

    //Locations on screen
    IF (plr_num == 0)
        x = d_egg_x1; //player 1 lifes
    ELSE
        x = d_egg_x2; //player 2 lifes
    END

    y = d_egg_y;

    LOOP
    lives = bubbob[plr_num].lives; //read current lives counter

    //number to display greater than displayed?
    IF (lives > 5)
        num_to_dis = 4;
    ELSE
        num_to_dis = lives - 2;
    END

        IF (lives > 1)
            GRAPH = player_eggs + grph_add + num_to_dis; //graphic for dino eggs 1 less egg displayed than lifes
        ELSE
            GRAPH = player_eggs_blank; //1 life or none display blank graphic
        END

        IF (lives <= 0) //Quit loop if lifes = 0
            BREAK;
        END

        FRAME(1000); //EVERY 10 frames

    END //PROCESS LOOP END

END

//Kill Player from Laser and fireball
PROCESS Kill_Player2(plr, id2)
PRIVATE
    st_frm;
    maxfrm;
    gfxnum;
    gfxadd;
    gtimer;
    fdelay;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;
    signal (id2, s_sleep); //send dino to sleep

    pl_died_skhurry = TRUE; //gets rid of skel hurry right away
    //player died global does it after this animation which cayses a bug after hurry up
    player_died = TRUE;

    IF (alwaysSR == FALSE) //always go in secret room
        game_died = TRUE; //for secret rooms - player reaches a certain level without dieing
    END

    who = id2; //who made this kill sprite

    x = id2.x; //process to dinos coords
    y = id2.y;

    facing = id2.facing; //get which way dino is facing

    IF (facing == 1)     //which way to face
         FLAGS = 1;
    ELSE
         FLAGS = 0;
    END

    IF (plr == 1) //player 2 graphics
       gfxadd = b_offset_fire;
    END

 //Animation frame initialiasation
    st_frm = bubanim[10].a_start + gfxadd; //new start anim frame
    maxfrm = bubanim[10].a_end + gfxadd;   //to this anim frame
    fdelay = bubanim[10].a_del;           //delay for next frame

    gfxnum = st_frm;                      //load graphic counter

    s_trigger[e_firedie] = TRUE;
    //s_trigger[e_lning1] = TRUE;

    LOOP
    GRAPH = gfxnum;
        IF (gtimer > fdelay)
            gtimer = 0;
            gfxnum++;
            IF (gfxnum > maxfrm) BREAK; END //animation at a end break the loop
        END

        FRAME;
        gtimer++;
    END
    pl_died_skhurry = FALSE; //gets rid of skel hurry

//UPDATE Dino
    IF (bubbob[plr].inf_lives == FALSE) //infinite lives on T/F
        bubbob[plr].lives--; //Players lives decrease by one
    END

    id2.inv = 180; //Flash 3 seconds

    IF (plr == 0)          //players back to start positions
        id2.xpos = x_pl1;
        id2.ypos = y_pl;
        id2.facing = Face_Right;
    ELSE
        id2.xpos = x_pl2;
        id2.ypos = y_pl;
        id2.facing = Face_Left;
    END
    Reset_Player(plr); //After kill rests players attributes. gets rid of players special item

    IF (doing_effect[pri_1] != e_normal)
       s_trigger[e_normal] = TRUE;
    END

    signal (id2, s_wakeup);
END

//Kill player normal - rotate sprite then seeing stars
PROCESS Kill_Player(plr, id2)
PRIVATE
    st_frm;
    maxfrm;
    gfxnum;
    gfxadd;
    rot_timer;
    rot_count;
    anim_count;
    gtimer;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;

    pl_died_skhurry = TRUE; //gets rid of skel hurry right away

    //player died global does it after this animation which causes a bug after hurry up
    player_died = TRUE;

    who = id2; //who made this kill sprite

   //Bug if last extend bubble collected and one player has died
   IF (anim_x_plr1 == TRUE OR anim_x_plr2 == TRUE)
     RETURN;
   END

IF (level_type != lv_secret)

    signal (id2, s_sleep); //send dino to sleep

    IF (alwaysSR == FALSE) //always go in secret room
        game_died = TRUE;       //for secret rooms - player reaches a certain level without dieing
    END

    x = id2.x; //process to dinos coords
    y = id2.y;

    facing = id2.facing; //get which way dino is facing

    IF (facing == Face_Left)     //which way to face
         FLAGS = 1;
    ELSE
         FLAGS = 0;
    END

    IF (plr == 1) //player 2 graphics
       gfxadd = b_offset;
    END

//For stars animation
    st_frm = bubanim[8].a_start + gfxadd; //new start anim frame
    maxfrm = bubanim[8].a_end + gfxadd;   //to this anim frame
    gfxnum = st_frm;                      //load graphic counter

    GRAPH = bubanim[7].a_start + gfxadd; //rotate die frame
    s_trigger[e_Die] = TRUE; //die sound

//Rotate the dino sprite animation
    LOOP
       rot_timer++;

        IF (rot_timer > 10)
           angle += 27000;  //rotate the same way as flipping the graph makes it rotate the other way
           rot_count+=1;
        END

        IF (xcolfind(x, y + 32) == FALSE) //player falls?
            y+=2;
        END

        FRAME;

        IF (rot_count > 32) BREAK; END
    END
    angle = 0;
    pl_died_skhurry = FALSE; //gets rid of skel hurry

//Dino on his back seeing stars
    REPEAT
    GRAPH = gfxnum;
        IF (gtimer > 4)
            gtimer = 0;
            gfxnum++;
            IF (gfxnum > maxfrm)
                gfxnum = st_frm;
                anim_count++;
            END

        END

        FRAME;
        gtimer++;

        IF (xcolfind(x, y + 32) == FALSE) //player falls?
            y+=2;
        END

//Loop to top of the screen
    IF (y > y_b_loop)
      y = y_bt;
    END

    UNTIL (anim_count > 2)

    gfxnum = dis_star;
    anim_count = 1;
    gtimer = 0;

    REPEAT

        GRAPH = gfxnum;

        IF (gtimer > 4)
            gtimer = 0;
            anim_count++;
            gfxnum++;
        END

        FRAME;
        gtimer++;

    UNTIL (anim_count > 4)

END
    IF (bubbob[plr].inf_lives == FALSE) //infinite lives on T/F
        bubbob[plr].lives--; //Players lives decrease by one
    END

    id2.inv = 180; //Flash 3 seconds

    IF (plr == 0)          //players back to start positions
        id2.xpos = x_pl1;
        id2.ypos = y_pl;
        id2.facing = 2;
    ELSE
        id2.xpos = x_pl2;
        id2.ypos = y_pl;
        id2.facing = 1;
    END

    Reset_Player(plr); //After kill rests players attributes. gets rid of players special item

    IF (level_type == lv_boss) //Level 100 make potion reappear
       IF (bosspotion[plr] == B_Potion_Col) //On screen
          bosspotion[plr] = B_Potion_Dis; //Display the potion for the player
       END
    END

    //Check for fast speed music, yes then restart slow music
    IF (doing_effect[pri_1] != e_normal AND level_type == lv_normal)
        s_trigger[e_normal] = TRUE;
    END

    //wake up the sleeping dino!
    signal (id2, s_wakeup);

END

PROCESS Reset_Player(plr) //After kill rests players attributes. gets rid of players special item
BEGIN
   IF (bubbob[plr].superman == FALSE)
    got_bell = FALSE;         //do animation if there is a special item to be done
    got_crystal_ball = FALSE; //items appear
    bubbob[plr].special_rings = 0;
    bubbob[plr].special_fireball = 0; //fireball counter
    bubbob[plr].bubfast = FALSE;
    bubbob[plr].bublong = FALSE;
    bubbob[plr].bubrapid = FALSE;
    bubbob[plr].shoes = 3;
    bubbob[plr].bubble_type = blow_normal; //bubbles back to normal
   END
END

//check dino is alive Returns:
//TRUE =  Alive
//FALSE = Dead
PROCESS Player_Alive(player)
BEGIN
    IF (bubbob[player].sprite_id != 0 AND bubbob[player].lives > 0)
        RETURN (TRUE);
    ELSE
        RETURN (FALSE);
    END
END

//checks players are alive and does the bubbled animations
PROCESS Players_Start()
BEGIN
    //player 1
    IF (Player_Alive(0) == TRUE)
        Bubbled_Player(0);
    END

    //player 2
    IF (Player_Alive(1) == TRUE)
        Bubbled_Player(1);
    END
END

//Return true if we have an ID Stored
//players alive
//used in the bubble routine
PROCESS Ret_who (theid)
BEGIN
    IF (bubbob[0].sprite_id == theid OR bubbob[1].sprite_id == theid)
        RETURN (TRUE);
    ELSE
        RETURN (FALSE);
    END
END


//Returns:
//1 for player 1
//2 for player 2
//0 dead or not found
PROCESS Ret_dino_player (theid)
BEGIN

    IF (bubbob[0].sprite_id == theid)     //player 1
        RETURN (1);
    ELSE
        IF (bubbob[1].sprite_id == theid) //player 2
            RETURN (2);
        ELSE
            RETURN (0); //players dead
        END
    END
END

//bubbled dino animation to start positions
//moves players to the following coordinates
//x_pl1 = player 1 start coords
//x_pl2 = player 2 start coords
//y_pl  = same for both players
PROCESS Bubbled_Player (player)
PRIVATE
    st_frm;
    maxfrm;
    gfxadd;
    gfxnum;
    x_end;
    acount;
    id2;
    id_otherplr;
    other_ind;
    xadd;
    yadd;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield

     IF (bubbob[player].bubbled != 0) //check not bubbled already? holds the id of the bubbled sprite
         RETURN;
     END

     file = sprites;

//X End Coords
     x_end = x_pl1;
     other_ind = 1; //player 2's index

     IF (player > 0) //player 2 x start coord and Blue dino
          gfxadd = b_offset;
          x_end = x_pl2;
          other_ind = 0; //player 1's index
     END

//Put this sprite to where Dino is on screen
     id2 = bubbob[player].sprite_id;
     x = id2.x;
     y = id2.y;

     who = id2; //dunno why I have done this

     st_frm = bubanim[0].a_start + gfxadd; //new start anim frame
     maxfrm = bubanim[0].a_end + gfxadd;   //to this anim frame
     gfxnum = st_frm; //load graphic counter

//Dino to sleep
     signal (id2, s_sleep);
     xadd = 2;
     yadd = 2;

     bubbob[player].bubbled = id; //for checking the other bubbled dino
FRAME;

  LOOP
    xmov = 0;

    GRAPH = gfxnum;

    //Get the index of the other player if they have joined the game
    IF (players_on_screen >1 AND id_otherplr == 0)
      id_otherplr = bubbob[other_ind].bubbled; //bubbled holds the bubbled sprite id
    END

    IF (Timer[2]==0)
        gfxnum++;
            IF (gfxnum > maxfrm)
            gfxnum = st_frm; //load graphic counter
            END
    END

    IF (x > x_end) //move left for player 1
        x-=xadd;
        xmov = 1; //moved
        //for slowing down the players bubble
        IF (x < x_end-50) xadd = 1; END
    END

    IF (x < x_end) //move right for player 2
        x+=xadd;
        xmov = 1; //moved
        //for slowing down the players bubble
        IF (x > x_end-50) xadd = 1; END
    END

    IF (y < y_pl)
        y+=yadd;
        xmov = 1;
        //for slowing down the players bubble when it gets near the start position
        IF (y > y_pl-100) yadd = 1; END
    END

    IF (y > y_pl)
        y-=yadd;
        xmov = 1;
         //slow down the players bubble
        IF (y > y_pl-100) yadd = 1; END
    END

    FRAME;

    IF (act_level >= dest_level AND game_state != gs_level_anims AND game_state != gs_adv_level)

        IF (id_otherplr != 0) //2 players on the screen ?
            IF (xmov == 0 AND id_otherplr.xmov == 0) BREAK; END //check that other player is at his start position
        ELSE
            IF (xmov == 0) BREAK; END //only one player so check that this sprite has finished moving
        END
    END //exit bubble routine once scroll has stopped

 END //Move loop

     GRAPH = maxfrm+1;

     REPEAT      //bubble pop anim frame
        FRAME;
        acount++;
     UNTIL (acount > 10)

//Set Dino attributes to start location and disable bubble or jump
     id2.xpos = x;
     id2.ypos = y;
     bubbob[player].bubtimer = 25;             //to stop blowing or jumping when dino process is awoke
     bubbob[player].bubkey = FALSE;
     keys_pressed[player].pl_fire = FALSE;     //to stop bubble being blown after player is awoke
     keys_pressed[player].pl_jump = FALSE;
     id2.jump = FALSE;                         //jump switch to off
     bubbob[player].bubbled = 0;               //so player cant be bubbled twice
     IF (level_type >= lv_demo)
        bubbob[player].level_reached = act_level; //for end level
     END

     IF (act_level > level_max[player])
         level_max[player] = act_level;
     END

     IF (player ==1)  //to get the dinos facing the right way when their inter level bubbles pop
        id2.facing =1;
     ELSE
        id2.facing =2;
     END

     signal (id2, s_wakeup);

END //Bubbled Player process

//Does Fireball for the player instead of a bubble
PROCESS Dino_Fireball(id2, fastfire)
PRIVATE
    animdel;
    animfrm;
    firespd;
    id3;
    id4;
    plr;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    x = id2.x;
    y = id2.y;

    y += 4;

// IF ((xpos > x_side1 AND rway == 1) OR (xpos < x_side2 AND rway == 2))

    IF (fastfire == FALSE)
        firespd = 6;    //fireball speed
    ELSE
        firespd = 10;
    END

//fireball direction of movement from where the dino is facing
    IF (id2.facing == 1)
        xmov = -firespd;
        FLAGS = 1;        //flip horizontal for left
        x -=8;
    ELSE
        xmov = firespd;
        x +=8;
    END

    file = sprites;
    animfrm = fireball; //use fireball sprite of hairy monster
    //z = 500;
    xstop = 0;
    GRAPH = animfrm;

//start animation increase from 20% size
    size = 20;
    animfrm = 20;
    LOOP
        size = animfrm;
        IF (animfrm == 100) BREAK; END
        x += xmov;
        animfrm+=20;

    FRAME;
    END
//100% size

    animdel = 5;
    animfrm = fireball;
    s_trigger[e_fireball] = TRUE;

REPEAT //Main Loop

    GRAPH = animfrm;
IF (level_stop_what != stop_everything) //HURRY UP Freeze game

//left hit platforms then set destroy xstop = TRUE
    IF (xmov < 0)
        IF (x < xpos_l);
            xstop = TRUE;
        END
    END

//Right platforms
    IF (xmov > 0)
        IF (x > xpos_r);
            xstop = TRUE;
        END
    END

    x += xmov;

    animdel--;

    IF (animdel < 0)
        animfrm++;
        animdel = 5;
        IF (animfrm > fireball+1) animfrm = fireball; END
    END

//nastie sprite detection
//use id4 or id2 will be cleared, which holds the dino id of the player doing fireball
        id4 = collision(type norm_baddie);
        IF (id4 != 0) id4.kill = mkill_fireball; END
        id4 = collision(type diag_baddie);
        IF (id4 != 0) id4.kill = mkill_fireball; END
        id4 = collision(type invader_baddie);
        IF (id4 != 0) id4.kill = mkill_fireball; END
        id4 = collision(type spring_baddie);
        IF (id4 != 0) id4.kill = mkill_fireball; END

//cheat kill the other player
    IF (fireball_deadly == TRUE) //player can be killed by the other player
        IF (id3 = collision (type man))
            IF (id3.inv <= 0 AND id2 != id3) //check to see if invunrable
                id3.kill = Kill_D_FireInv; //Kill the dino
                plr = ret_dino_num(id2);
                bubbob[plr].score += 1000; //get points for killing other player
                //BREAK;
                IF (extra_items == TRUE)
                    spec_items[59].counter++; //Fire bubble
                END
            END
        END
    END
END
    FRAME;

UNTIL (xstop == TRUE)

//die fireball decrease to nothing in size
    GRAPH = fireball;
    animfrm = 100;
    LOOP
        size = animfrm;
        IF (animfrm <= 0) BREAK; END
        animfrm-=20;
    FRAME;

    END

//END

END

//    blocks_hd1 = 1; //normal plat no bubbles drift up
//    blocks_hd2 = 2; //bubbles hit and drift up
//    blocks_hd3 = 3; //invisible

//normal bubble movement left/right find
PROCESS YBub_Bl_Find(xst, yst); //x,y, top and bottom side adjusments to stop sticking
PRIVATE
    bl1[hd_num];
BEGIN

    bl1[map_get_pixel(platdata, plt_hrd, xst, yst)] = 1;
    bl1[map_get_pixel(platdata, plt_hrd, xst, yst + 15)] = 1;
    bl1[map_get_pixel(platdata, plt_hrd, xst, yst + 31)] = 1;

    IF (bl1[1] == hd_stop OR bl1[2] == hd_stop) //return true found a wall
        RETURN(true);
    ELSE
        RETURN(false);
    END
END


//x, y, lenth of move, bubble speed, which way to go, bub colour, who blowing
//BLOW A BUBBLE
PROCESS Bubble_Blow(x, y, len, xmov, facing, bcolour, id3)
PRIVATE
    lifetime;
    mcount;    //movement count
    b_animframe;
    b_anim1;
    b_anim2;
    achange;
    id2;
    id4;
    x_point;
    y_point;

    modadj;
    popit;     //to pop bubbles right away this gets an id of the dino blowing the bubble
    blow_this; //gets what the player will blow from bubble_type[1]
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;
//    xmov = 12;

    lifetime = (len*8)/xmov; //speed
    b_anim1 = lifetime/10;
    b_anim2 = b_anim1;

    z = pri_bubbleb;

    //get colour of the bubble
    b_animframe = blow_bubbles[bcolour].Blow;

    mcount = 0;
    achange = 1;

//check to see if player can blow a bubble
//secret rooms and heart item stop you from blowing a bubble

//blow_none, blow normal,blow_lightn, blow_water,blow_extend, blow_player

IF  (bubbob[bcolour].bubble_type != blow_none)

//what bubble the player can blow
//blow_this = bubble_type[bcolour];

    blow_this = bubbob[bcolour].bubble_type;

    GRAPH = b_animframe;

    spec_Items[0].counter++; //magenta sweet counter for bubbles blown

    REPEAT
    mcount++;
    xstop = FALSE;

   //To Stop the bubble from leaving the edge of the screen
   IF (x == 107) x = 112; END
   IF (x >= 525) x = 524; END

    ypos = y;

    IF (y >= y_dn_block) ypos = y_dn_block; END //Repeat blocks off the screen
    IF (y <= y_up_block2) ypos = y_up_block2;END

//Animation Frame Change
    IF (mcount => b_anim2)
        achange++;
        b_animframe++;
        b_anim2 = b_anim1*achange;
        GRAPH = b_animframe;
    END

    IF(xstop == FALSE)
        IF (facing == Face_Left) //Left movement
             IF (ybub_bl_find(x-xmov, ypos) == 0)
                x-= xmov;
             ELSE
                x -= ((x+4) MOD 16); //block adjustment so it rests against a block
                xstop = TRUE; //set stopped flag
             END
        ELSE //Right movement
             IF (ybub_bl_find(x + 31+xmov, ypos)==0)
                x+= xmov;
             ELSE
             //hit a block right
                IF ((x+4) MOD 16!= 0) //block adjustment so it rests against a block
                   x += 16-((x+4) MOD 16);
                END
             xstop = TRUE;   //set stopped flag
             END
        END
    END

//nastie sprite detection
        id4 = collision(type norm_baddie);
        IF (id4 != 0) BREAK; END
        id4 = collision(type diag_baddie);
        IF (id4 != 0) BREAK; END
        id4 = collision(type invader_baddie);
        IF (id4 != 0) BREAK; END
        id4 = collision(type spring_baddie);
        IF (id4 != 0) BREAK; END

        IF (trap_player == TRUE AND level_next == 0)
            id2 = collision(type man);
            IF (id2 != id3 AND id2 !=0)
                blow_this = blow_player;
                Dino_Bubble_Sprite(x, y, bcolour, id2);
                Signal(id2, s_sleep); //send sprite to sleep
                BREAK;
            END

        END

    FRAME;

    UNTIL (mcount > lifetime OR xstop == TRUE)

    IF (total_bubs > max_bubs)
       popit = id3;
    END


//popit = id dino pops bubble right away

    IF (id4 != 0)
        signal(id4, s_sleep); //send nastie sprite to sleep
        Bubble_sprite(x, y, trapbub, (id4.badnum)-1, bcolour, id4, popit); //Trapped
    ELSE
        SWITCH (blow_this)
           CASE blow_normal:
                Bubble_sprite(x, y, normbub, 0 , bcolour, 0, popit);        //NORMAL BUBBLE
           END
           CASE blow_water:
                Bubble_sprite(x, y, specbub, bubwater , bcolour, 0, popit); //WATER BUBBLE
           END
           CASE blow_lightn:
                Bubble_sprite(x, y, specbub, bublight, bcolour,0,0);        //Lightning - LEVEL 100
           END
           CASE blow_fire:
                Bubble_sprite(x, y, specbub, bubfire, bcolour, 0, 0);        //Fire Bubble
           END
           CASE blow_extend:
               Bubble_sprite(x, y, extrbub, rand (0, 5) , 0, 0, 0);         //Extend Bubbles - cheat
           END
        END

    END
END// check for no bubble blow

END //Blow bubble process

//Initialiasation routine to blow a bubble calls function above
PROCESS Blow_Bubble(w_dino, id2)
PRIVATE
    w_dino;
    bubble_dir;
    xhrd;
    yhrd;
    maxtime;
    bublen;
    bubspeed;
BEGIN

//      bubbob[plr].special_item = sprid;  //number of item collected

      IF (bubbob[w_dino].bubrapid == FALSE)
            bubbob[w_dino].bubtimer = 25;
        ELSE
            bubbob[w_dino].bubtimer = 10;
        END

        bublen = 16;
        bubspeed = 6;
//check which player blew the bubble
//and alter for bubble long
        IF (bubbob[w_dino].bublong)
            bublen = bublen * 2;
        END
//and bubble fast
        IF (bubbob[w_dino].bubfast)
            bubspeed = bubspeed * 2;
        END

//clear the bubble pressed key
    bubbob[w_dino].bubkey = FALSE;

    IF (bubbob[w_dino].special_fireball > 0) //fireball counter 16
      IF ((id2.x > x_side1-16 AND id2.facing == Face_Left) OR (id2.x < x_side2+32 AND id2.facing == Face_Right))
          dino_fireball(id2, bubbob[w_dino].bubfast);
          bubbob[w_dino].special_fireball--;
      END
    ELSE

      Bubble_blow(father.x, father.y, bublen, bubspeed, father.facing, w_dino, id2);

      s_trigger[e_bubble] = TRUE; //Sound

      IF (bubbob[w_dino].special_rings == sp_ring_red OR //special item points for red/blue lantern and red ring
        bubbob[w_dino].special_rings == sp_ring_all)
        bubbob[w_dino].score += 100;
      END
    END

END

//EXTRA LIFE PROCESS:
//runs only when player is alive
    //30,000
    //100,000
    //then every 400,000
PROCESS Extra_lifes (player)
PRIVATE
    next_life_at;
    life_acc;     //extra life accumulator: 0 = 30,000 1 = 400,000
    lifes_now;
    score_now;
BEGIN

    next_life_at = Extra_lives[life_set].first; //first life at 30,000 to 50,000

    LOOP

    IF (bubbob[player].score > next_life_at)


        life_acc++;
        lifes_now = bubbob[player].lives;

        IF (life_acc == 1)
            next_life_at = Extra_lives[life_acc].second;
            bubbob[player].lives++;
            s_trigger[e_life] = TRUE; //trigger extra life sound
        ELSE
            next_life_at = bubbob[player].score + Extra_lives[life_set].thrid; //every 500,000
            bubbob[player].lives++;
            s_trigger[e_life] = TRUE; //trigger extra life sound
        END
    END

       FRAME(1000);
    END
END

PROCESS Player_Join_Game(plr)
PRIVATE
    id2;
    player_check;
    lcount;
BEGIN
   IF ((level_type != lv_normal OR level_type != lv_boss) AND game_state >= gs_completed
      AND game_state != gs_level_anims) //dont let the player join if completed game, game over
      RETURN;                           //boss anims, secret room and potion screen
   END

   Man(plr); //create new player

   IF (plr == 0)
       spec_Items[21].counter++; //blue lantern
   ELSE
       spec_Items[22].counter++; //red lantern
   END

   //player joined the game when anims were going etc so bubble up the player
   IF (game_state != gs_level_go)
      Bubbled_Player(plr); //normal start position
   END
END


PROCESS Dino_Init(dino)
BEGIN
    //Dont Clear the score if on instruction or Demo levels
    IF (level_type != lv_demo AND level_type != lv_instr)
      bubbob[dino].score = 0;
    END

    bubbob[dino].lives = Start_lives;
    bubbob[dino].bubfast = FALSE;
    bubbob[dino].bublong = FALSE;
    bubbob[dino].bubrapid = FALSE;
    bubbob[dino].shoes = 3;

    bubbob[dino].special_rings = 0;

    IF (level_type >= lv_demo)
        bubbob[dino].level_reached = 1;
    END

    bubbob[dino].bubtimer = 0;

END

PROCESS Man(d_index) //dino index which player are we?
PRIVATE
    gfxnum;
    g_ind;  //index of current animation frame
    n_ind;  //each movement uses a different index if this chages the
            //animation changes.
            //will need add for bob - blue dino
    st_frm;      //cur anim frame
    maxfrm;      //max anim frame
    anim_time;   //this counts up

    grav;     //gravity
    vel;      //velocity of jump
    velst;    //velocity start used to tell if jump finished
    vel_dec;
    sjumpy;

    fadj1;       //for end of fall
    fadj2;       //to compare if MOD 16
    bubble;      //for bubble blow anim
    gfxadd;      //to alter sprites to be blue if man is player2

    //for shoving bubbles
    dist;
    xdist;
    ydist;

    id2;       //other sprite ids
    joveride;  //jumping on bubbles
    hrt_switch;//for alternating the heart animation frames
    hrt_timer; //for slowing the flashing down
    dist_run;  //for shoes items
    water_inv; //no kill if in water flow
    id3;
BEGIN
    file = sprites;
    bubbob[d_index].sprite_id = id;

    dino_init(d_index);
    region = 1; //needed for clipping the sprite when it goes off the playfield

    gfxnum = 0;
    g_ind = 1;
    n_ind = 2;

    players_on_screen += 1;   //number of players on screen
    z = pri_player;

    ypos = y_pl;

    LOOP
    id2 = get_id (type enter_coin_dino);
       IF (id2 == 0) BREAK; END
       FRAME;
    END

    IF (d_index == 0)
        xpos = x_pl1;
        IF (game_state != gs_level_go AND game_state != gs_comp_dino_mv)
           xpos = x_p1_intro;
           ypos = y_intro;
        END
        IF (level_type == lv_instr)
           ypos = y_intro+(96);
        END
        facing = Face_Right;
    ELSE
        xpos = x_pl2;
        IF (game_state != gs_level_go AND game_state != gs_comp_dino_mv)
           xpos = x_p2_intro;
           ypos = y_intro;
        END
        facing = Face_Left;
    END
        bubbob[d_index].bubtimer = 25;
        bubbob[d_index].bubkey = FALSE;
        keys_pressed[d_index].pl_fire = FALSE;
        keys_pressed[d_index].pl_jump = FALSE;


    fall = 0;
    jump = FALSE;
    bubble = FALSE; //bubble blow
//    man_speed = bubbob[d_index].shoes;  //speed bub bob moves across the screen

    IF (d_index > 0)
        gfxadd = b_offset;
    END

//LIVES display process runs whilst player is alive
//and not on demo,instruction or boss level
IF (level_type > lv_demo AND level_type < lv_end)
    Player_lives(d_index);
    Extra_lifes(d_index);
END

   IF (level_type >= lv_demo AND
       game_state >= gs_level_go)
       inv =180; //invunrability
   END

//Player sprite Loop
REPEAT

IF (level_stop_what != stop_everything) //HURRY UP Freeze game

    //man_speed = bubbob[d_index].shoes;  //speed bub bob moves across the screen
//Kill the player
IF (water_inv == TRUE OR game_state == gs_adv_level)
   kill = FALSE;
END
    man_speed = bubbob[d_index].shoes;  //speed bub bob moves across the screen

    IF (kill != 0)
      IF (bubbob[d_index].invincible == FALSE)
        IF (kill == Kill_D_norm)
            Kill_player(d_index, id);
        ELSE//Kill from monster fireball
            Kill_player2(d_index, id);
        END

        kill = FALSE;
        bubbob[d_index].bubtimer = 25;
        bubbob[d_index].bubkey = FALSE;
        keys_pressed[d_index].pl_fire = FALSE;
        keys_pressed[d_index].pl_jump = FALSE;
        jump = FALSE;    //jump switch to off
      ELSE
        kill = FALSE;
      END
    END

//Bubble Key Pressed
    IF (bubbob[d_index].bubtimer <=0)
        IF (bubbob[d_index].bubkey == TRUE)
            bubble = TRUE;
            blow_bubble(d_index, id);
        END
    ELSE
       bubbob[d_index].bubtimer --;
    END

        IF (bubble == TRUE) n_ind = 3; END

        IF (g_ind <> n_ind) //current anim grap index is diff to new grap index
            g_ind = n_ind;
            st_frm = bubanim[g_ind].a_start + gfxadd; //new start anim frame
            maxfrm = bubanim[g_ind].a_end + gfxadd;   //to this anim frame
            gfxnum = st_frm;                 //load graphic counter
            anim_time = 99; //force reload animation
        END

        anim_time+= 2;

        IF (anim_time >= bubanim[g_ind].a_del)
            anim_time = 0;
            gfxnum++;
            IF (gfxnum > bubanim[g_ind].a_end + gfxadd)
                gfxnum = bubanim[g_ind].a_start + gfxadd;
                IF (bubble == TRUE)
                    bubble = FALSE;
                END
            END
        END

    IF (inv > 0 )
        inv--; //invunrable decrease
        //flash graphic
        IF (GRAPH != player_flash)
            GRAPH = player_flash;
        ELSE
            GRAPH = gfxnum;
        END
    ELSE
        GRAPH = gfxnum; //normal graphic reset end of invunrablitity
    END

    IF (level_stop_what == stop_heart AND inv == 0)
        IF (level_timer < heart_timer)
        hrt_timer++; //for slowing the flashing down
            IF (hrt_timer>4)
            hrt_timer = 0; //reset the flash delay timer
            hrt_switch = hrt_switch XOR 1;
            END

            IF (hrt_switch == 0)
                IF (d_index == 0)
                    GRAPH += hrt_dino1;
                ELSE
                    GRAPH += hrt_dino2;
                END
            END
        END
    END

//    GRAPH = 998;   //test graphic

    n_ind = 1; //set anim as waiting
    IF (id2 = collision(type Bubble_sprite))

        dist = get_dist(id2);
        xdist = get_distx(get_angle(id2), get_dist(id2));
        ydist = get_disty(get_angle(id2), get_dist(id2));

    //shove em left or right
        IF (pushtest (dist) == TRUE)

            IF (xmov != 0) //Shove bubble when moving
               IF (xdist > 0)
                  id2.xinertia = man_speed;
               ELSE
                  id2.xinertia = -man_speed;
               END
            END
       //jump on a bubble
            IF (ydist > 0)
                IF (keys_pressed[d_index].pl_jump AND ydmov > 0)
                joveride = TRUE;
                id2.yinertia = 2;
                ELSE
       //not moving pop it
                  IF (ABS (xdist) <= 16) //only if 16 pixels in the middle of the bubble
                  id2.kill = 1;
                  END
                END
            END
        END

        //fall or jump into bubble pop
        IF (ABS (xdist) <= 16)
            IF (ydmov != 0)  //Fall movement pop
                IF (ABS(ydist) < 24) id2.kill = 1; END
            ELSE
                //no fall pop when in 8 pixels of the centre of a bubble
                IF (ABS (ydist) <= 8)
                  id2.kill = 1;
                END
            END
        END
        id2.who = id;
    END

//check for jump key
//checking for fall == false stops jumping in mid air
//joveride - does jumping on bubbles

    IF ((keys_pressed[d_index].pl_jump AND jump == 0 AND fall == 0) OR joveride == TRUE)

        joveride = FALSE;                     //does jumping on bubbles

        s_trigger[e_jump] = TRUE; //trigger jump sound

        vel =     jumpup[man_speed].vel;     //jump up
        grav =    jumpup[man_speed].grav;
        vel_dec = jumpup[man_speed].vel_dec;
        velst = vel;    //vel start used to stop jump at bottom of jump
        jump = TRUE;    //jump switch to on
        sjumpy = y;     //start jump pos to stop when hit this point

        spec_Items[2].counter++; //jumped up item counter add

        IF (bubbob[d_index].special_rings == sp_ring_purple OR //special item ring or red lantern
            bubbob[d_index].special_rings == sp_ring_all)
            bubbob[d_index].score += 500;
        END

    END

    IF (jump == TRUE)
        IF (vel == 0 AND grav == 0)
           jump = FALSE;
        ELSE
            ydmov = vel/grav;
            IF (ydmov == 0) ydmov = 1; END //to stop zero stoping movement
            vel = vel + vel_dec;

            IF (y > sjumpy-4  AND vel > 0)
               jump = FALSE;
               fall = 1;
               ydmov = 0;
            END
        n_ind = 4;
        END
    END

//End of fall jump down movement

//left right movement
    xmov = 0; //clear x y stop local variables
    xstop = FALSE;

//left
    IF (keys_pressed[d_index].pl_left)
        IF (jump == TRUE)
            IF(man_speed == 3) //adjust run speed when jumping
                xmov = -2;      //normal speed
            ELSE
                xmov = -3;     //speed up
            END
        ELSE
            xmov -=man_speed;
        END

        IF (fall !=0) xmov = -1; END
        facing = Face_Left;
        n_ind = 2;
    END

//right
    IF (keys_pressed[d_index].pl_right)
        IF (jump == TRUE OR fall > 0)
            IF(man_speed == 3) //adjust run speed when jumping
                xmov = 2;     //normal speed
            ELSE
                xmov = 3;     //speed up
            END
        ELSE
            xmov = man_speed;
        END

    IF (fall !=0) xmov = 1; END
        facing = Face_Right;
        n_ind = 2;
    END

//swap the sprites grpahic for which way its facing.
//facing is a local variable
    IF (facing == Face_Left)
        FLAGS = 1; //left
    ELSE
        FLAGS = 0; //right
    END

//for pushing player from bubbles!
    IF (xmov == 0 AND xinertia != 0)
        IF ((facing == Face_Right AND xinertia > 0 ) OR
           (facing == Face_Left AND xinertia < 0))
           who.kill = 1; //kill bubble
           xinertia = 0;
           who = 0;      //clear who or it keeps trying to kill
        ELSE
        //Push player if facing to the bubble
        xmov += xinertia;//update the movement on x
        xinertia = 0;   //zero out the push amount
        n_ind = 6;      //push graphic
        END
    END

//PLATFORM DETECTION
    get_hard_col();

//Fall/jump down animation
    IF (ydmov > 0)
        n_ind = 5;
    END

//Special Item counters
    IF (xmov != 0)
        dist_run++; //for shoes items
        IF (dist_run>=256)
            dist_run = 0;
            spec_Items[3].counter++; //shoes items for running along the floor
        END
        IF (jump == FALSE AND fall == FALSE)
            IF (bubbob[d_index].special_rings == sp_ring_blue OR //special item ring or red lantern
                bubbob[d_index].special_rings == sp_ring_all)
            bubbob[d_index].score += 10;
            END
        END
    END

    xpos += xmov;
    ypos += ydmov;
    water_inv = FALSE; //no kill if in water flow

//Water flow movement
    id2 = bubbob[d_index].water_id; //is there a water_dino process for this player?
    IF(id2 !=0)
      IF (jump == TRUE AND id2.who == TRUE) //allow jump out of water
         id2.kill = TRUE;
      ELSE
         //move with the water down the screen
         IF (id2.x != 0 AND id2.y != -8)
            xpos = id2.x;
            ypos = id2.y-8;
            water_inv = TRUE; //no kill if in water flow
         END
      END

      id3 = collision (type water); //kill water_dino process if we have jumped out of the water
      IF(id3 == 0)
         id2.kill = TRUE;
      END
    END

//bottom of screen fall though to top
    IF (ypos > y_b_loop)
        spec_Items[9].counter++; //potions for fall throughs
        spec_Items[10].counter++;
        spec_Items[11].counter++;
        spec_Items[12].counter++;
        spec_Items[13].counter++;
        ypos = y_bt;
    END



//write to sprites coords
    x = xpos;
    y = ypos;
END
    FRAME;

UNTIL (bubbob[d_index].lives <= 0) //until no lifes left
    players_on_screen -= 1;        //number of players on screen decrease

    bubbob[d_index].invincible = FALSE;
    bubbob[d_index].superman   = FALSE;

    bubbob[d_index].sprite_id = 0; //Clear the sprite id
    signal (son, s_kill);
END


PROCESS Water_Dino(wtr_id, plr_id)
PRIVATE
    whichdino;//which player
    id3;
    h20_xrun_count;
BEGIN
    file = sprites;
    z = pri_water2; //behind the water bit infront of the dino
    x = father.x;   //place onto water which has created this process
    y = father.y;
    region = 1;

    whichdino = Ret_dino_player (plr_id); //which player has the water hit
    kill = FALSE;                         //init kill local var

   IF (whichdino !=0) //error check above process returns zero if no dino found
       whichdino--;   //adjust to
                                        //just a error check in case this process is called in error
   IF (bubbob[whichdino].water_id == 0) //do the loop if no process for this dino
       bubbob[whichdino].water_id = id; //store id for compare in water process
       GRAPH = water_detect;            //do the graphic now

      LOOP

         id3 = collision (type man);      //check for jumping out of water
         IF (id3 == 0 AND id3 != plr_id)  //not hitting water
            kill = TRUE;
         END

         IF (kill == TRUE OR out_region(id,1)==TRUE)  //not hitting water
            bubbob[whichdino].water_id = 0;
            x = father.x;                  //process hides behind the water and advances down the screen
            y = father.y;
            BREAK;
         ELSE

            IF (out_region(id,1)==FALSE)
            x = father.x;                  //process hides behind the water and advances down the screen
            y = father.y;
            kill = FALSE;
            who = FALSE;

            IF (ypos == y and xpos <> x) //who is used to check that we can jump out of the water flow
               h20_xrun_count++;
               IF(h20_xrun_count>5) //to test that the water is running along the floor
                  who = TRUE;       //used by the man process to see if we can jump out of the water
               ELSE
                  who = FALSE;      //no jump water falling
               END
            ELSE
               h20_xrun_count = 0;  //reset x plane run count as water is falling
               who = FALSE;
            END

            ypos = y; //for movement compare of jump out of water
            xpos = x;
            END
         END

      FRAME;

      END //LOOP
   END
   END
END

PROCESS Get_Hard_Col();
PRIVATE
    xcolpos;
    xcolpos2;
    ycolpos;
    fcol1;
    fcol2;
    fadj;
    chkplat;
    fspeed;
    x_j_adj;
BEGIN

    xmov  = father.xmov;
    yumov = father.yumov;
    ydmov = father.ydmov;

    //start locs adjust to be on hardness map
    xcolpos = father.xpos+ xmov;
    xcolpos2 = father.xpos;
    ycolpos =  father.ypos;

    fall = father.fall;
    jump = father.jump;
    man_speed = father.man_speed;
    fspeed = man_speed;

//repeating blocks off the screen creates an error disabled now
    IF (ycolpos >= y_dn_block) ycolpos = y_dn_block; END //Repeat blocks off the screen
    IF (ycolpos <= y_up_block) ycolpos = y_up_block; END

//Fall
    IF (jump == FALSE)
//test ycolpos for Top of screen fall though

        IF (xcolfind(xcolpos2, ycolpos + 31 + man_speed) == FALSE OR ycolpos < topblock)
            IF (man_speed > 3)
               fspeed = man_speed;
            END

            fall++;
            ydmov = fspeed;        //fall amount
            father.ydmov = fspeed; //update main y coord
            ycolpos += fspeed;      //this needed to stop sticking between blocks
        ELSE
            fall = 0;
            ydmov = 16 - (ycolpos MOD 16); //for mid air adjustment to be on block
            IF (ydmov == 16) ydmov = 0; END
            father.ydmov = ydmov;
        END
    END

//Jump
    IF (jump == TRUE AND ydmov > 0)
        x_j_adj = 0;
        IF (father.facing == Face_Left) //left adjust cause of when sprite faces left if falls through platforms
            x_j_adj = 1;
        END

    fcol1 = xcolfind(xcolpos2+x_j_adj, ycolpos + 31 + ydmov);
    fcol2 = xblockfind(xcolpos2+x_j_adj, ycolpos + 31);

        IF (fcol1 == TRUE AND fcol2 == FALSE)
            father.ydmov = 0;
            jump = FALSE;
            father.jmov = FALSE; //left right jump move
        END
    END

//Left
    IF (xmov < 0)
        chkplat = ycolfind(xcolpos, ycolpos); //check platforms
        IF (chkplat == TRUE);
            father.xstop = TRUE;
            father.xmov = 0;
            IF ((xcolpos2+5) MOD 16 != 0)
                fadj = -((xcolpos2+5) MOD 16);
                father.xmov = fadj;
            END

        END
    END

//Right
    IF (xmov > 0)
         chkplat = ycolfind(xcolpos + 31, ycolpos);
         IF (chkplat== TRUE);
             father.xmov = 0;
             father.xstop = TRUE;
             IF ((16 - xcolpos2+4) MOD 16 != 0)
                fadj = 16 - ((xcolpos2+4) MOD 16);
                IF (fadj < xmov)
                    father.xmov = fadj;
                END
             END
         END
    END
//jump and fall go
    father.fall = fall;
    father.jump = jump;
END


//running into a platform wall
PROCESS XColFind(xst, yst);
// xstart, ystart
PRIVATE
    blockdet; //not zero if block found
    blockadj; //to adjust for speed 3 which sticks if size of band not adjusted to test
    mvspeed;
BEGIN
    //gets 1 if speed 3 else will be zero so no adjustment in pixels

    mvspeed = father.man_speed;

    SWITCH (mvspeed)
        CASE 1, 2, 3:
            blockadj = mvspeed MOD 2;
            blockadj++;
        END

        CASE 4,5,6,8:
            blockadj = 4;
        END

        CASE 7:
            blockadj = 5;
        END
    END


    blockdet = map_get_pixel(platdata, plt_hrd, xst+blockadj, yst);
    blockdet = blockdet OR map_get_pixel(platdata, plt_hrd, xst + 16, yst);
    blockdet = blockdet OR map_get_pixel(platdata, plt_hrd, xst + 31-blockadj, yst);

    IF (blockdet > 0)
         RETURN(TRUE);
    ELSE
         RETURN(FALSE);
    END

END


PROCESS XBlockFind(xst, yst);
// xstart, ystart
//gets blocks left and right for fall though of sprite
PRIVATE
    blockdet; //both of these may be not zero if block found
    blockdet2;
    blockdet3;

BEGIN
    blockdet = 0;
    blockdet2 = 0;

    //left block
    blockdet = map_get_pixel(platdata, plt_hrd, xst, yst);
    blockdet+= map_get_pixel(platdata, plt_hrd, xst + 15, yst);

    //right block
    blockdet2 = map_get_pixel(platdata, plt_hrd, xst + 16, yst);
    blockdet2+= map_get_pixel(platdata, plt_hrd, xst + 31, yst);

    //if any found set found block
    //yst tested for fall though top most block on screen
    IF (blockdet => 1 OR blockdet2 => 1 OR yst < topblock+18)
         RETURN(TRUE);
    ELSE
         RETURN(FALSE);
    END
END


PROCESS YColFind(xst, yst);
//same as the procedure above apart from this one goes down
//xstart, ystart
PRIVATE
    blockdet; //gets current block id for comparison
    jdet = 0;
BEGIN

    //test for jump and fall 2 blocks to the side

    //TOP BLOCK
    jdet = map_get_pixel(platdata, plt_hrd, xst, yst);
    jdet = jdet OR map_get_pixel(platdata, plt_hrd, xst, yst + 15);

    //LOWER BLOCK
    blockdet = map_get_pixel(platdata, plt_hrd, xst, yst + 31);

    //For jumping through blocks
    IF (father.jump == TRUE)
        IF (jdet == 1 AND blockdet == 0)
            RETURN(FALSE);
        END

        //Jump against a platform down
        IF ((blockdet => 1) AND ((jdet => 1) OR (jdet == 0 AND yst > topblock)))
             RETURN(TRUE);
        END
    ELSE
    //Fall detection
        IF (father.fall != 0)
            IF (jdet == 1 OR blockdet != 0 )
                RETURN(TRUE);
            END
        ELSE
        //no fall no jump left right plat detection
            IF (blockdet != 0)
                RETURN(TRUE);
            END
        END
    END
END

//    demo_plat     = 902; //demo screen hardness map
//    extend_plat   = 904; //extend room hardness map

PROCESS Extend_Demo_Level()
PRIVATE
    drawcount;
    block;     //for the graphics for these screens
    new_h_map; //to locate hardness maps for these 2 screens
    this_draw_loc; //this procedures draw location we dont want to destroy the main global
BEGIN
    fade_off();

    //IF (doing_effect[pri_1] != e_normal)
    //   s_trigger[e_normal] = TRUE;
    //END
    game_state = gs_adv_level;

    scrollspeed = 8; //really fast advance for >=8 levels GOLD DOOR! 70 - level on

    IF (platdata != 0)   //unload the map if its there
        unload_fpg(platdata);
    END

    platdata = load_fpg(platfloc);   //platform graphics data
    file = platdata;

//get graphics and hardness map locations
    IF(level_type == lv_extend)
       block = ext_sm_loc;      //extend screen blocks
       new_h_map = extend_plat; //extend room hardness map
    ELSE
       block = dmo_sm_loc;      //demo screen blocks
       new_h_map = demo_plat;   //demo screen hardness map
    END

    sm_block_grf = block;   //platform blocks
    bg_block_grf = block+1; //side screen blocks

// file, dest, orig, x, y, ang, size, flags
//RESIZE Hardness Maps to 340,288
    map_xput(platdata, plt_hrd, new_h_map, Resize_x, Resize_y , 0, Resize_amt, 0); // file, dest, orig, x, y, ang, size, flags
    map_xput(platdata, bub_hrd, new_h_map+1,  Resize_x, Resize_y , 0, Resize_amt, 0);

    drawcount = 0;
//find where on the scroll plane to draw the next screen been drawn
    IF ((cur_level MOD 2 ) == 1 OR level_type == lv_instr)
      drawloc = 48;
    ELSE
      drawloc = 512;
    END

    this_draw_loc = drawloc;
    lastdrawloc = drawloc2;  //for doing the flood graphics

    IF (level_type == lv_instr)
        Background_Draw(80);
    ELSE
        IF (drawloc2 != 80)
            Background_Draw(80);
        ELSE
            Background_Draw(544);
        END
    END
//clears the screen
    do_scr_clearscreen(drawloc);
    convert_palette(blocksfile, scr_graf, offset pal);

//Draw the platforms and borders
    REPEAT
        do_scr_bline(drawcount,this_draw_loc, new_h_map);
        drawcount+= 2;
        this_draw_loc  += 32;
    UNTIL (drawcount >= blocks_dwn)


//Clip The Screen
    map_put(blocksfile, scr_graf, 2, 0, 0);
    map_put(blocksfile, scr_graf, 2, 0, 464);

//update what weve drawn

    refresh_scroll(0);
    fade_on();

END //Extend Demo screen draw

//    plt_hrd = 800; //platform hardness map loc
//    bub_hrd = 801; //bubble hardness map loc

//    norm_plat_st = 1;    //normal levels start
//    extra_plat_st = 101; //extra levels start
//    norm_bub_st = 201;   //bubble paths start
//    extra_bub_st = 301;  //extra bubble paths start
PROCESS Next_Level()
PRIVATE
//    drawcount;
//globals
//    drawloc;  //forescreen draw location
//    drawloc2; //background screen draw location

    scr_adj;  //to adjust the screen when we do scroll speed 3 or 6
    boss_lev;
    eff_channel;
    from_ext_secret;
BEGIN

    Players_Start();
    game_state = gs_adv_level;
    bubble_alldie = TRUE;
    Signal (type food, s_kill);

    Topborder();

    IF (level_type == lv_secret OR level_type == lv_extend)
        noscrolldraw = TRUE;
        fade_off();
        REPEAT
            FRAME;
        UNTIL (NOT fading)
        from_ext_secret = TRUE;
        level_type = lv_normal;
    END

    IF (doing_effect[pri_1] != e_normal AND (do_music == TRUE OR do_song != 0))
       s_trigger[e_normal] = TRUE;
    END

    //super umbrella = goto n screens infront
    //level warp  = any screen

    SWITCH (level_advance) //normal next level and umbellas
    CASE 1:
        scrollspeed = 3; //slow advance for next level
    END
      CASE 2..4:
        scrollspeed = 4; //meduim advance for 3 levels
      END

      CASE 5..7:
        scrollspeed = 6; //fast advance for 5 levels
      END

      CASE 100:
        scrollspeed = 2;   //for end of the game
        level_advance = 1;
      END

      DEFAULT:
        scrollspeed = 8; //really fast advance for >=8 levels GOLD DOOR! 70 - level on
      END

    END

    //scrollspeed = 3;
//    scr_adj = 4;

    dest_level = act_level+level_advance;
    level_advance = 0; //clear how many to advance by

    IF (platdata != 0)   //unload the map if its there
        unload_fpg(platdata);
    END

REPEAT

    platdata = load_fpg(platfloc);   //platform hardness map data
    file = platdata;

//Locate Screen Graphics
    sm_block_grf = act_sm_loc + ((cur_level-1) *2);
    bg_block_grf = act_bg_loc + ((cur_level-1) *2);
    boss_lev = FALSE; //do big boss on scroll of this level?


//This copys the hardness map to the fpg used to draw the screen
    Copy_To_Maps();

//find where on the scroll plane to draw the next screen been drawn

    IF ((cur_level MOD 2 ) == 1)
      drawloc = 512; //Odd Levels 1,3,5,7 etc
    //  drawloc2 = 80;
    ELSE
      drawloc = 48;     //Even Levels 2,4,6,8 etc
    //  drawloc2 = 544;
    END

    lastdrawloc = drawloc2; //for doing the flood graphics

//clears the screen
    do_scr_clearscreen(drawloc);
    convert_palette(blocksfile, scr_graf, offset pal);

    Border_left (drawloc);

//BACKGROUNDS
//    IF (do_bgrounds == TRUE)
        Background_Draw(drawloc2);
//    END

//DRAW the Platforms and Right Border
    Do_Scr_Bline_NLevel(drawloc, drawloc2); //draw all the platforms to the screen

//update what weve drawn
    refresh_scroll(0);

    cur_level++; //draw level counter
    scrollcount = 0;
    scroll.speed = scrollspeed;

    act_level++; //for sprites & other data

    IF (scrollspeed == 6 OR scrollspeed == 3)
        scr_adj = 3;
    END

//Big bosses
    IF (act_level >= dest_level AND act_level MOD 12 == 0)
         boss_lev = TRUE;
         game_state = gs_level_anims; //stops the level starting until the level anims are done
         ingame_bosses(act_level / 12);
    END

//Scroll the screen
    REPEAT
        scroll.y0 += scrollspeed;
        scroll.y1 += scrollspeed;
        scrollcount += scrollspeed;

        IF (noscrolldraw == FALSE) //this is set to true to get screen drawn in one go
            FRAME;
        END
    UNTIL (scrollcount >= 464 - scr_adj)
//End Scroll


    IF (from_ext_secret == TRUE) //(level_type == lv_secret OR level_type == lv_extend)
       fade_on();

       REPEAT
            FRAME;
       UNTIL (NOT fading)
       s_trigger[e_normal] = TRUE;

       IF (do_song != 0)
         eff_channel = using_channel[Pri_1]; //get effect id playing

         IF (is_playing_sound (eff_channel) == Yes AND eff_channel !=0)
             stop_sound (eff_channel);
         END
       END
    END

    IF (noscrolldraw == TRUE)
        noscrolldraw = FALSE;
    END

    IF(scr_adj == 3)
       scroll.y0 += 2;
       scroll.y1 += 2;
    END
    FRAME;

//Secret Room Doors
//will set it even if we warp past the level where it appears
   IF (game_died == FALSE)

      SWITCH (act_level)
         CASE 20:
            IF (Secret_R_Done[0] == FALSE) //Secret room 1 displayed?
               spec_Items[44].counter = 1; //Set room item to appear
               Secret_R_Done[0] = TRUE;    //clear the dispayed counter
            END
         END

         CASE 30:
            IF (Secret_R_Done[1] == FALSE) //Secret room 2
               spec_Items[45].counter = 1;
               Secret_R_Done[1] = TRUE;
            END
         END
         CASE 40:
            IF (Secret_R_Done[2] == FALSE) //Secret room 3
               spec_Items[46].counter = 1;
               Secret_R_Done[2] = TRUE;
            END
         END
         CASE 50:
            IF (Secret_R_Done[3] == FALSE) //Secret room 4
               spec_Items[47].counter = 1;
               Secret_R_Done[3] = TRUE;
            END
         END


      END
   END

    //This is to unload the current fpg so we only have one in memory
    //will create an error later on in the game
    IF (act_level < dest_level)   //unload the map if we havnt reached the level
        unload_fpg(platdata);
    END

    IF (drawloc2 == 80)
      drawloc2 = 544;
    ELSE
      drawloc2 = 80;
    END

UNTIL (act_level >= dest_level)

//RESIZE Hardness Maps to 340,288
    map_xput(platdata, plt_hrd, plat_start, Resize_x, Resize_y , 0, Resize_amt, 0); // file, dest, orig, x, y, ang, size, flags
    map_xput(platdata, bub_hrd, bub_start,  Resize_x, Resize_y , 0, Resize_amt, 0);

    IF (boss_lev == FALSE) //no ingame bosses so set level reached into game state
        game_state = gs_level_reached;
    END

    FRAME;

END //Next_Level

//Copy hardness map to fpg hardness maps
PROCESS Copy_To_Maps()
PRIVATE
   x_count;
   y_count;
   x_loc;
   y_loc;
   block_to_do_plat; //block to copy from platform map
   block_to_do_bub;  //block to copy from bubble map
BEGIN

   x_loc = act_level*28;
   y_loc = 0;

   FOR (y_count = 0; y_count < blocks_dwn; y_count++)
      FOR (x_count = 0; x_count < blocks_acr; x_count++)

            block_to_do_plat = map_get_pixel (0, plat_map, x_loc, y_loc); //get block colour 1 = plat, 2 bubb drift up, 3 hidden
            block_to_do_bub = map_get_pixel (0, bubble_map, x_loc, y_loc); //get block colour

            IF (block_to_do_plat != blocks_hd4) //if a block copy it to the platform map but not a invisable one
               map_put_pixel (platdata, plat_start, x_count+5, y_count+4, block_to_do_plat); // +5 to miss out side of screen band
            END

            // +5 to miss out side of screen bands
            map_put_pixel (platdata, bub_start, x_count+5, y_count+4, block_to_do_bub);

       x_loc++;
      END
      x_loc = act_level*28; //reset x position
      y_loc++;
   END

END


PROCESS Background_Draw(yloc)
PRIVATE
    xloc;
    dx_count; //across draw loop counter
    dy_count; //down the screen draw counter
    b_graph;
BEGIN
    xloc = 32;
    y = yloc;

    //Shadows are placed on later with the platform draw routine
    //locate the correct graphic for this level
    IF(do_bgrounds == TRUE)
      SWITCH (level_type)
        CASE lv_extend:
          b_graph = 422; //star backdrop
        END
        CASE lv_instr:
          b_graph = bground_intr; //graphic to do instruction background
        END
        DEFAULT:
         b_graph = bgrounds + ((cur_level-1)*2);
        END
      END
    ELSE
      //blank to do no backgrounds - will remove flood graphics
      b_graph = bgroundnone;
    END

    FOR (dy_count = 0; dy_count < 7; dy_count ++)
      x = xloc;
      FOR (dx_count = 0; dx_count < 8; dx_count ++)
         map_put(blocksfile, scr_bgrd, b_graph, x, y);
         x +=64;
      END
      y += 64;
    END
END


//Have to do all of the left border first to stop pat of the platforms geting rubbed out
PROCESS Border_left (yloc)
PRIVATE
    dr_count;
BEGIN
    REPEAT
      //left hand side big block
      map_put(blocksfile, scr_graf, bg_block_grf, big_xloc, big_yloc + yloc);

      dr_count+=2;
      yloc+=32;  //Move down 32 pixels to next block draw location

    UNTIL (dr_count >= blocks_dwn)

END

//Draws a line of platforms across the screen
//including the borders
//Extend screen, Demo title level
PROCESS Do_Scr_Bline_NLevel(yloc, yloc2) // platform hardness location, screen y fground, y background
PRIVATE
    lcount;      //count for drawing one line
    bl_dect1;    //line 1 platforms
    bl_dect2;    //line 2 platforms
    x_drwloc;    //location on the screen
    at_gfx;
    shadow_grph; //shadow of the platforms for the background screen
    drawcount;   //screen draw counter does Y
    y_side;
    x_loc;       //x location on the hardness map
    act_yloc;    //y location on the hardness map
    clip_y_placement; //where to blank the graphics off the screen
BEGIN

    shadow_grph = bgrounds + ((cur_level-1)*2);
    shadow_grph ++;

    IF (do_bgrounds == TRUE)
      y_side = yloc2-24;
      FOR (lcount = 0; lcount < blocks_dwn; lcount++)
         map_xput(blocksfile, scr_bgrd, shadow_grph, sml_xloc2 -16, sml_yloc + y_side, 0, 100, 4);
         y_side+= block_res;
      END
    END

    //Clips graphics from the between screen gap on the background
    IF (yloc == 48)
      clip_y_placement = 464;
//    ELSE
//      clip_placement = 0;
    END

    REPEAT

    x_drwloc = 0;
    x_loc = act_level*28;

    FOR (lcount = 0; lcount < blocks_acr; lcount++)

        bl_dect1 = map_get_pixel (0, plat_map, x_loc, act_yloc); //get block colour 1 = plat, 2 bubb drift up, 3 hidden
        bl_dect2 = map_get_pixel (0, plat_map, x_loc, act_yloc + 1); //get block colour 1 = plat, 2 bubb drift up, 3 hidden

//      draw if block 1(normal), 2(block bubble drift or 4  secret paths
        IF (bl_dect1 != 0 AND bl_dect1 != blocks_hd3)
           //Platform block
           map_put(blocksfile, scr_graf, sm_block_grf, sml_xloc + x_drwloc, sml_yloc + yloc);
           //Shadow Block
           IF (do_bgrounds == TRUE)
               map_xput(blocksfile, scr_bgrd, shadow_grph, sml_xloc2 + x_drwloc, sml_yloc2 + yloc2, 0, 100, 4);
           END
        END

//second line
//      draw if block 1(normal), 2(block bubble drift or 4  secret paths
        IF (bl_dect2 != 0 AND bl_dect2 != blocks_hd3)
           //Platform block
           map_put(blocksfile, scr_graf, sm_block_grf, sml_xloc + x_drwloc, bl_even_line + sml_yloc + yloc);
           //Shadow Block
           IF (do_bgrounds == TRUE)
               map_xput(blocksfile, scr_bgrd, shadow_grph, sml_xloc2 + x_drwloc,bl_even_line + sml_yloc2 + yloc2, 0, 100, 4);
           END
        END
        x_loc++;
        x_drwloc += block_res; //add 16 pixels
    END

//Right Side of screen Big Block
      map_put(blocksfile, scr_graf, bg_block_grf, big_xloc + 480, big_yloc + yloc);

      drawcount+= 2; //draw loop counter
      act_yloc+=2;   //update hardness y location to get the next line
      yloc+=32;      //draw location of the platform graphics
      yloc2+=32;

      //right hand side big block

    UNTIL (drawcount >= blocks_dwn) //Loop Y end

    map_put(blocksfile, scr_graf, 2, 0, clip_y_placement);


END //Do Scr Bline




//Draws a line of platforms across the screen
//including the borders
//Extend screen, Demo title level
PROCESS Do_Scr_Bline(act_yloc, yloc, lev_plat_data)
PRIVATE
    lcount; //count for drawing one line
    bl_dect1;
    bl_dect2;
    x_drwloc; //location on the screen
//    at_gfx;
BEGIN

    //left hand side big block
    map_put(blocksfile, scr_graf, bg_block_grf, big_xloc, big_yloc + yloc);

    x_drwloc = 0;
    FOR (lcount = 0; lcount < blocks_acr; lcount++)
        bl_dect1 = map_get_pixel(platdata, lev_plat_data, lcount+5, act_yloc + 4);
        bl_dect2 = map_get_pixel(platdata, lev_plat_data, lcount+5, act_yloc + 5);

        IF (bl_dect1 == blocks_hd1 OR bl_dect1 == blocks_hd2)
           map_put(blocksfile, scr_graf, sm_block_grf, sml_xloc+x_drwloc, sml_yloc + yloc);
        END

        IF (bl_dect2 == blocks_hd1 OR bl_dect2 == blocks_hd2)
            map_put(blocksfile, scr_graf, sm_block_grf, sml_xloc+x_drwloc, bl_even_line + sml_yloc + yloc);
        END
        x_drwloc+=16;
    END

    //right hand side big block

    map_put(blocksfile, scr_graf, bg_block_grf, big_xloc + 480, big_yloc + yloc);

END //Do Scr Bline



//clears a line across the screen of blocks
PROCESS Do_Scr_Clearscreen(yloc)
PRIVATE
    lcount; //count for drawing one line
    x_drwloc; //location on the screen
    cl_count;
BEGIN
    cl_count = 0;
    REPEAT

        x_drwloc = 0;
        FOR (lcount = 0; lcount < (blocks_acr+6)/2; lcount++)
            map_put(blocksfile, scr_graf, scr_clearer, x_drwloc, yloc);
            x_drwloc+=32;
        END

    cl_count+=2;
    yloc+=32;

    UNTIL (cl_count > blocks_dwn)
END


//every 12 levels display a big boss to remind the player why you are on this quest
PROCESS Ingame_Bosses(boss_num)
PRIVATE
   b_timer;
   process_ids[5];
   pro_count;
   m_way;
   move_count;
   move_add;
BEGIN
//    level_anims = TRUE; //this stops the bubbled player from poping

//Big Bosses
    //x, y, facing, number of baddie
    bosses (xboss_l, yboss_l, 1, boss_num);
    process_ids[0] = get_id (type bosses);

    bosses (xboss_r, yboss_r, 0, boss_num);
    process_ids[1] = get_id (type bosses);

//Help graphic
    //x, y, z, graphic
    static_anim(xhelp_l, yhelp_l, 10, help_gph);
    process_ids[2] = get_id (type static_anim);

    static_anim(xhelp_r, yhelp_r, 10, help_gph+1);
    process_ids[3] = get_id (type static_anim);

//Trapped players
   //x, y, z, an_start, an_frames, adelay

    anim2(xtrapped_l_1, ytrapped_l_1, 20, trapped_gph, 2, 10);
    process_ids[4] = get_id (type anim2);

    anim2(xtrapped_r_1, ytrapped_r_1, 20, trapped_gph+2, 2, 10);
    process_ids[5] = get_id (type anim2);

    process_ids[0].y -= 1;

    move_add = 2;
    move_count = 0;

//move up the screen
   REPEAT
      FOR (pro_count = 0; pro_count <=5; pro_count++) //do all the boss processes
         process_ids[pro_count].y -= 1;
      END
      FRAME(100);
      move_count+= move_add;
   UNTIL (move_count >= 464) //middle of the screen

//Delay
    LOOP
      IF(b_timer > 100) BREAK; END
      b_timer++;
      FRAME;
    END

    move_count = 0;
//move down the screen
    REPEAT
      FOR (pro_count = 0; pro_count <=5; pro_count++)
            process_ids[pro_count].y += 2;
      END
      FRAME;
      move_count+= move_add;
   UNTIL (move_count >= 300) //off the screen

//Kill the processes
   FOR (pro_count = 0; pro_count <=5; pro_count++)
       signal (process_ids[pro_count], s_kill);
   END

   game_state = gs_level_anims_done; //level anims keep players bubbled
   FRAME;

END

//big boss graphic animation for ingame boss 'help'
//and title screen bosses
PROCESS Bosses (x, y, facing, b_spr_num)
PRIVATE
    spr_st;
    spr_end;
    spr_gp_st;
    anim_fr;
    anim_del;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = titlesfile; //holds

    FLAGS = facing;
    spr_gp_st = 100;

    SWITCH (b_spr_num)
        CASE 1,2,3:
            spr_gp_st += (b_spr_num-1)*4;
            spr_end=spr_gp_st+3;
        END
        CASE 4,5,6,7,8:
            spr_gp_st += 12;
            spr_gp_st += (b_spr_num-4)*2;
            spr_end += spr_gp_st+1;
        END
    END
    anim_fr = spr_gp_st;
    GRAPH = spr_gp_st;

    REPEAT
        IF (anim_del >= 10)
            anim_fr++;
            anim_del = 0;
            IF (anim_fr > spr_end)
                anim_fr = spr_gp_st;
            END
            GRAPH = anim_fr;
        END
        anim_del++;

        FRAME;
    UNTIL (kill == TRUE)

END

PROCESS Anim(xloc, yloc, an_start, an_frames, showfor, adelay, delstart)
//Does stand alone animation
PRIVATE
    an_count;
    an_delay;
    fcount;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;
    fcount = an_start;
    x = xloc;
    y = yloc;
    z = pri_effects;

//Delay starting
    IF (delstart > 0)

    REPEAT
        an_count++;
        FRAME;
    UNTIL (an_count > delstart)
    END

    an_count = 0;

//animation
    REPEAT

    GRAPH = fcount;
    an_count++;
    an_delay++;

    IF (an_delay > adelay)
       an_delay = 0;
       fcount++; //change current frame

       IF (fcount => an_start + an_frames) //frame number over end of animation
          fcount = an_start; //reset animation
       END
    END

    FRAME;

    UNTIL (an_count > showfor)

    father.ani_finish++; //

END //Anim

PROCESS Anim2(xloc, yloc, zpri, an_start, an_frames, adelay) //unlike anim process this doesnt timeout
PRIVATE
    an_count;
    an_delay;
    fcount;
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;
    fcount = an_start;

    x = xloc;
    y = yloc;
    z = zpri;

    an_count = 0;

    REPEAT

    GRAPH = fcount;
    an_count++;
    an_delay++;

    IF (an_delay > adelay)
       an_delay = 0;
       fcount++; //change current frame

       IF (fcount => an_start + an_frames) //frame number over end of animation
          fcount = an_start; //reset animation
       END
    END

    FRAME;

    UNTIL (kill == TRUE)
END

//Displays a graphic on the screen with no animation
PROCESS Static_Anim(xloc, yloc, zpri, an_start)
//Does stand alone animation
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;

    x = xloc;
    y = yloc;
    z = zpri;

    GRAPH = an_start;

    REPEAT
       FRAME;
    UNTIL (father.kill == TRUE or kill == TRUE)

END //Anim2

//Displays a graphic on the screen with no animation
PROCESS Static_Anim2(xloc, yloc, zpri, an_start)
//Does stand alone animation
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = fooditems;

    x = xloc;
    y = yloc;
    z = zpri;

    GRAPH = an_start;

    REPEAT
       FRAME;
    UNTIL (kill == TRUE)

END

PROCESS Extend_Dino(d_index) //dino index which player are we?
PRIVATE
    gfxnum;
    g_ind;  //index of current animation frame
    n_ind;  //each movement uses a different index if this chages the
            //animation changes.
            //will need add for bob - blue dino
    st_frm;      //cur anim frame
    maxfrm;      //max anim frame
    anim_time;   //this counts up
    grav;     //gravity
    vel;      //velocity of jump
    velst;    //velocity start used to tell if jump finished
    vel_dec;  //decrease velocity
    sjumpy;
    fadj1;       //for end of fall
    fadj2;       //to compare if MOD 16
    bubble;      //for bubble blow anim
    gfxadd;      //to alter sprites to be blue if man is player2
    id2;       //other sprite ids
    joveride;  //jumping on bubbles
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;

    gfxnum = 0;
    g_ind = 1;
    n_ind = 2;

    z = pri_player;
    ypos = y_pl_extend;

    IF (d_index == 0)
        xpos = x_pl1_extend;
        facing = 1; //face left
    ELSE
        xpos = x_pl2_extend;
        facing = 2; //face right
    END

    fall = 0;
    jump = FALSE;
    bubble = FALSE; //bubble blow
    bubbob[d_index].bubtimer = 25;
    bubbob[d_index].bubkey = FALSE;
    keys_pressed[d_index].pl_fire = FALSE;
    keys_pressed[d_index].pl_jump = FALSE;

    man_speed = 3; //bubbob[d_index].shoes;  //speed bub bob moves across the screen

    IF (d_index > 0)
        gfxadd = b_offset;
    END

REPEAT
    IF (g_ind <> n_ind) //current anim grap index is diff to new grap index
        g_ind = n_ind;
        st_frm = bubanim[g_ind].a_start + gfxadd; //new start anim frame
        maxfrm = bubanim[g_ind].a_end + gfxadd;   //to this anim frame
        gfxnum = st_frm;                 //load graphic counter
        anim_time = 99; //force reload animation
    END

        anim_time+= 2;

        IF (anim_time >= bubanim[g_ind].a_del)
            anim_time = 0;
            gfxnum++;
            IF (gfxnum > bubanim[g_ind].a_end + gfxadd)
                gfxnum = bubanim[g_ind].a_start + gfxadd;
                IF (bubble == TRUE)
                    bubble = FALSE;
                END
            END
        END

    GRAPH = gfxnum; //get new graphic

    n_ind = 1; //set anim as waiting
    IF (id2 = collision(type Extend_Bubble))
        IF (keys_pressed[d_index].pl_jump AND ydmov > 0)
            joveride = TRUE;
        END
    END

//check for jump key
//checking for fall == false stops jumping in mid air
//joveride - does jumping on bubbles

    IF ((keys_pressed[d_index].pl_jump AND jump == 0 AND fall == 0) OR joveride == TRUE)

        joveride = FALSE;                     //does jumping on bubbles

        s_trigger[e_jump] = TRUE; //trigger jump sound

        vel =     -90;  //velocity
        grav =    10;   //grav;
        vel_dec = 5;    //vel_dec;

        velst = vel;    //vel start used to stop jump at bottom of jump
        jump = TRUE;    //jump switch to on
        sjumpy = y;     //start jump pos to stop when hit this point

    END

    IF (jump == TRUE)
        IF (vel == 0 AND grav == 0)
           jump = FALSE;
        ELSE
            ydmov = vel/grav;
            IF (ydmov == 0) ydmov = 1; END //to stop zero stoping movement
            vel = vel + vel_dec;

            IF (y > sjumpy-4  AND vel > 0)
               jump = FALSE;
               fall = 1;
               ydmov = 0;
            END
        n_ind = 4;
        END
    END

//End of fall jump down movement

//left right movement
    xmov = 0; //clear x y stop local variables
    xstop = FALSE;

//left
    IF (keys_pressed[d_index].pl_left)
        IF (jump == TRUE)
            IF(man_speed == 3) //adjust run speed when jumping
                xmov = -2;     //normal speed
            ELSE
                xmov = -3;     //speed up
            END
        ELSE
            xmov -=man_speed;
        END
        facing = 1;
        n_ind = 2;
    END

//right
    IF (keys_pressed[d_index].pl_right)
        IF (jump == TRUE OR fall > 0)
            IF(man_speed == 3) //adjust run speed when jumping
                xmov = 2;     //normal speed
            ELSE
                xmov = 3;     //speed up
            END
        ELSE
            xmov = man_speed;
        END
        facing = 2;
        n_ind = 2;
    END



//swap the sprites grpahic for which way its facing.
//facing is a local variable
    IF (facing == 1)
        FLAGS = 1;
    ELSE
        FLAGS = 0;
    END

    get_hard_col();

//Fall/jump down animation
    IF (ydmov > 0)
        n_ind = 5;
    END

    xpos += xmov;
    ypos += ydmov;

//bottom of screen fall though to top
    IF (ypos > 30 * 16)
        ypos = y_def -32;
    END

//write to sprites coords
    x = xpos;
    y = ypos;

    FRAME;

UNTIL (game_state == gs_start_adv_level) //until

END

PROCESS Extend_screen(player)
PRIVATE
   b_x_locs;
   bub_no;
//   drawloc;      //where to draw on the scroll plane
   rndx;        //locations to put the random items on the background
   rndy;
   rnd_index;   //random 5 items to put to the back of the screen
   r_st;        //gets the start graphic
   r_end;       //end random item graphic
   tw_id;       //for killing the twinkle anims
   t_kill_loop; //loop counter to kill twinkle anims
   dinoid;      //gets the dino extend process id to find out when the dino hits the botom of the screen
   a_delay;     //delay the screen animation
   a_put;       //loop for puting sprites to screen
   d_eggs;      //gets how many lives left
   d_egg_x;
   d_star_id;   //for the invisible process where the star moves to in the lives bar
   a_id;        //id for the last animation star, when it finishes life +1
   nice_id;     //id of the nice anim
   keys_id;
   timer_er;    //sometimes all the bubbles dont get popped
BEGIN
   //fade off
   fade_off();
   level_stop_what = stop_nothing;

   //sleep dinos
   IF (Player_Alive(0) == TRUE)
      signal (bubbob[0].sprite_id, s_sleep);
   END

   IF (Player_Alive(1) == TRUE)
      signal (bubbob[1].sprite_id, s_sleep);
   END

//send keys to sleep as this will cancel out the autoplay
   keys_id = get_id (type Do_Keys);
   Signal (keys_id, s_sleep);

//Get rid off all the bubbles and baddies
    baddie_alldie = mkill_do_nothing;
    bubble_alldie = TRUE;

    level_type = lv_secret; //secret level or extend - to get rid of random bubble
    ffall_level = FALSE;    //falling food disable

//set level to Extend level
   level_type = lv_extend;

//Dino Automatic player
   Extend_Dino(player);

//find how many lives the player has
    d_eggs = bubbob[player].lives; //get how many lives left
    IF (d_eggs >5) d_eggs = 5; END

    d_eggs--;         //adjust to 0 to 4
    d_eggs = d_eggs*16; //find the xlocation

    IF (player == 0)
        d_egg_x = d_egg_x1 + d_eggs;
    ELSE
        d_egg_x = d_egg_x2 - d_eggs;
    END

//draw extend screen
    Extend_Demo_Level();

//   record_demo(1);
//   game_state = gs_level_go;

    IF (player == 0)
       load (extend_d1, OFFSET autoplay1);
       Auto_Play(player);
    ELSE
       load (extend_d2, OFFSET autoplay2);
       Auto_Play(player);
    END


//   Record_Demo(player);

   //locate random items for extend screens background
   rnd_index = rand(0,5);
   r_st  = Extend_items[rnd_index].s_item_no; //start item
   r_end = Extend_items[rnd_index].e_item_no; //end item

   //do massive extend bubbles
   b_x_locs = 116;
   FOR (bub_no = 1; bub_no < 7; bub_no++)
      Extend_bubble(b_x_locs, 240, bub_no);
      b_x_locs+=80;
   END


   //random items - map put
    IF ((cur_level MOD 2 ) == 0)
      drawloc = 448+32;
    ELSE
      drawloc = 16;
    END

    FOR (count = 0; count < 300; count++)
      rndx = rand (0, block_res*28);
      rndy = rand (0, block_res*24);
      map_xput(blocksfile, scr_graf, rand(r_st,r_end), 32+rndx, y_def+drawloc+rndy,0,100,rand(0,1));
    END
    refresh_Scroll(0);
    game_state = gs_level_go;
    timer_er = level_timer;

    extend_popped = 0;
    LOOP
//check all popped

      IF(extend_popped => 6 OR level_timer - timer_er>6) BREAK; END
    FRAME;
    END

//Wait until dino hits the bottom platform
    dinoid = get_id(type Extend_Dino);
    LOOP
      IF (dinoid.y == 432) BREAK; END
      FRAME;
    END
    kill = 1;

//where to move the 6 stars to - above the NICE 1P/2P
    Invisible_Process(x_nice, y_nice_star);
    who = get_id (Type Invisible_Process);

//where to move the lone star to on the lives bar
    Invisible_Process(d_egg_x+8, d_egg_y+8);
    d_star_id = get_id (Type Invisible_Process);

//Wait until hits the bottom of the screen
    kill = 2; //kill extend bubble letters - which places the twinkle stars

//NICE 1P NICE2P
    Static_Anim (x_nice, y_nice, 0, e_nice+player);

//kill all the twinkle anims
    LOOP
    tw_id = get_id(type Twinkle); //for twinkle sprites
      IF (tw_id == 0)
         BREAK;                  //quit the loop as no more are on the screen
      ELSE
         signal (tw_id, s_kill); //kill the twinkle anim found running
      END
    END

//6 Stars inplace of the EXTEND letters
    FOR (a_put = 1; a_put <= 6; a_put++)
       Anim(34 + (82*a_put-1),240, e_star, 2, 100, 3, 0);
    END

//Delay before movement of stars
    LOOP
       a_delay++;
       IF (a_delay > 100) BREAK; END
       FRAME;
    END

//Lone star above NICE
    Anim(x_nice, y_nice_star, e_star, 2, 39, 3, 18);

//Stars movement animations
   FOR (a_put = 1; a_put <= 6; a_put++)
      Extend_Star(34 + (82*a_put-1), 240, who);
   END

//Wait until they stop moving
   a_delay = 0;
    LOOP
       a_delay++;
       IF (a_delay > 58) BREAK; END
       FRAME;
    END
//Now move star to where the extra life will appear
   Extend_Star(x_nice, y_nice_star, d_star_id);
//Animation of star where star will appear
   Anim(d_egg_x+8, d_egg_y+8, e_star, 2, 20, 3, 50);

   LOOP
       IF (get_id(type Extend_Star) == 0) BREAK; END
       FRAME;
   END

   bubbob[player].lives += 1;
   s_trigger[e_life] = TRUE; //trigger extra life sound

   nice_id = get_id(type static_anim);

   a_delay = 0;
    LOOP
       a_delay++;
       IF (a_delay > 100) BREAK; END
       FRAME;
    END

   fade_off();


//Adjustment of scroll plane 2 to be correct when level advances
   scroll.y1 += 462;

   signal (nice_id, s_kill);
   signal (who, s_kill);       //kill Extend Dino process
   signal (d_star_id, s_kill);

//set to do next level
   level_advance = 1; //for scroll speed;
   game_state = gs_start_adv_level;

   signal (keys_id, s_wakeup);

   //awaken dinos
   IF (Player_Alive(0) == TRUE)
      signal (bubbob[0].sprite_id, s_wakeup);
   END

   IF (Player_Alive(1) == TRUE)
      signal (bubbob[1].sprite_id, s_wakeup);
   END

END //Extend Screen

PROCESS Invisible_Process(x,y)
BEGIN
    LOOP
      FRAME;
    END
END

//    e_bubble_big = 648;
//    e_bubble_pop = 654;
//    e_star = 646;
//    e_twinkle = 644;
//    e_letters = 638;
//    e_nice = 644;

//Big Extend Bubbles

PROCESS Extend_Star(x, y, id2)
PRIVATE
   x_dist;  //distance to circle centre
   y_dist;
   a_delay; //animation delay
   anim_gph;//graphic to do
   adsp;
BEGIN
   region = 1; //needed for clipping the sprite when it goes off the playfield
   file = sprites;
   z = pri_effects;

//Star Graphic animation
   a_delay = 0;
   GRAPH = e_star;
   anim_gph = e_star;

   Pro_Angle(x, y, id2);

   REPEAT

    a_delay++;
    IF (a_delay > 3)
       anim_gph++;
       a_delay = 0;
       IF (anim_gph > e_star+1)
         anim_gph = e_star;
       END
       GRAPH = anim_gph;
    END

    FRAME;
   UNTIL (kill == TRUE)
   father.kill = 3;
END

PROCESS Pro_Angle(x, y, id2)
PRIVATE
     dist;
     id3; //Extend screen process id uesd to get kill==3 for starting
BEGIN
   LOOP
      IF (y >= y_nice_star)
      dist = get_dist (id2);
      IF (dist <= 8) BREAK; END
         angle = get_angle(id2);
         advance(8);
         father.x = x;
         father.y = y;
      ELSE
         BREAK;
      END
   FRAME;

   END
   father.kill = TRUE;

END

PROCESS Extend_bubble(xloc, yloc, bub_number)
PRIVATE
   x_dist;  //distance to circle centre
   y_dist;
   me_deg;  //degrees of the circle 0-360
   rot_way; //which way to move the bubble
   id2;
   a_delay; //animation delay
   anim_gph;//graphic to do
BEGIN
    region = 1; //needed for clipping the sprite when it goes off the playfield
    file = sprites;

    x = xloc;
    y = yloc;
    z = pri_bubbles - bub_number MOD 2;

    GRAPH = e_bubble_big+(bub_number-1);
    me_deg = rand (1, 359); //random degrees start position
    rot_way = rand (0,1);   //random clockwise/anticlockwise

    REPEAT
    //me_deg = degrees around the circle

      IF (rot_way == 1)
         IF (me_deg > 360) //rotate clockwise
            me_deg = 0;
         ELSE
            me_deg+=2;
         END
      ELSE
         IF (me_deg < 0) //rotate clockwise
            me_deg = 360;
         ELSE
            me_deg-=2;
         END
      END

      x_dist = get_distx((me_deg*k), 8);
      y_dist = get_disty((me_deg*k), 8);

      x = x_dist + xloc;
      y = y_dist + yloc;


    FRAME;
      id2 = collision (type Extend_Dino);

    UNTIL (id2 != 0 OR father.kill != 0)

    extend_popped ++;
    FRAME;

    //Pop graphic
    GRAPH = e_bubble_pop;
    FRAME(500);

//Extend Letter
//locate correct letter graphic
    GRAPH = e_letters+(bub_number-1);

//Alter the letters so that they appear in a line evenly spaced
    y = 240;
    x = 34 + (82*bub_number-1);

//Glitter anim
    // xloc, yloc, an_start
    Twinkle(x, y-32, e_twinkle-1);
    Twinkle(x, y+32, e_twinkle);

    REPEAT
    kill  = father.kill;
       FRAME;
    UNTIL (kill != 0)


END

PROCESS Twinkle(xloc, yloc, an_start)
PRIVATE
    an_count;
    an_delay;
    max_delay;
    fcount;
BEGIN
    file = sprites;
    fcount = an_start;

    x = xloc;
    y = yloc;
    z = pri_effects;

    an_count = 0;

    REPEAT

    IF (extend_popped < 6)
       max_delay = 5;
    ELSE
       max_delay = 3;
    END

    GRAPH = fcount;
    an_count++;
    an_delay++;

    IF (an_delay > max_delay)
       an_delay = 0;
       fcount++; //change current frame

       IF (fcount => an_start + 2) //frame number over end of animation
          fcount = an_start; //reset animation
       END
    END

    FRAME;

    UNTIL (father.kill != 0)
END

PROCESS Topborder() //To Blank the top bit of the screen off
BEGIN
    x = 60;
    z = 1;
    file = blocksfile;
    GRAPH = 2;
    LOOP
        FRAME;
        IF (game_state == gs_level_reached)
           BREAK;
        END
    END

END

/*
STRUCT HiSc_Cheats[n_hs_cheats]
   string comptxt;
   item_num;
END=
"ALS",99,  //make it run extra levels - dont do item
"BOS",49, //Easy kill boss
"PLR",51, //trap other player in a bubble
"DOC",50, //goto any level
"S.B",53, //cheat mode
"PED",52, //extra items
"FIR",48, //fire ball deadly
"WAT",57, //Blow Water bubbles
"HOT",58, //Blow Fire bubbles
"ZAP",54, //Blow Lightning bubbles
"DIB",55; //Auto fire
*/
PROCESS Hiscore_Cheats(hi_loc)
PRIVATE
    cht_ind; //index of the cheat
    item_ind;
BEGIN
    FOR (cht_ind == 0; cht_ind <= n_hs_cheats; cht_ind++)

        IF (hs_table[hi_loc].h_name == HiSc_Cheats[cht_ind].comptxt) //Compare hiscore name with cheat table names
            item_ind = HiSc_Cheats[cht_ind].item_num; //Get item to appear
            s_trigger[e_laugh1] = TRUE;

            IF (item_ind == 55) //Autofire item, makes it appear twice
                auto_item = 2;
            END

            IF (item_ind !=99) //set item to appear unless ALS - extra levels
                spec_Items[item_ind].counter = 1;
            ELSE //ALS - Extra levels
                //debug;
                do_levels = lev_extend;
                Load_levels();
            END
            BREAK;
        END
    END //Find loop


END



//Checks and enter
PROCESS Check_Score()
PRIVATE
    hi_loc1;
    hi_loc2;
    id_kill; //for setting bubble spitter to die
BEGIN
   hi_loc1 = find_hisc_loc(bubbob[0].score);
   hi_loc2 = find_hisc_loc(bubbob[1].score);

   bubble_alldie = TRUE;             //kill all bubbles

   IF(hi_loc1 == hisc_terminator AND hi_loc2 == hisc_terminator)
     Dis_non_enter_score();
   ELSE
     fade_on();
   //One player has a high score
   //Check First player
    s_trigger[e_hisc] = TRUE;

//    rbub_random rbub_strobe rbub_white

    Bubble_Spitter_2(rbub_strobe);
    id_kill = get_id (type Bubble_Spitter_2); //to kill the bubbles when score has been entered

      IF(hi_loc1 != hisc_terminator)
        enter_score(1, bubbob[0].score); //enter score process for player 1
        //Wait till player 1s score has been entered
        LOOP
           IF (kill == TRUE)
               BREAK;
           END
           FRAME;
        END
        kill = FALSE;

        //Wait 5 seconds before advancing only if player 2 has a score to enter
        IF (hi_loc2 != hisc_terminator)
            Auto_Adv_Kill(5); //Advance and set kill in this process to true after 5 seconds
            LOOP
              IF (kill == TRUE) BREAK; END
              FRAME;
            END
        ELSE

           Auto_Adv_After(5); //Advance and set kill in this process to true after 5 seconds
           LOOP
              IF (timer[9]/10 >= 32) BREAK; END
              FRAME;
           END
           id_kill.kill = TRUE;
        END
      END

      //Check player 2 Score
      IF(hi_loc2 != hisc_terminator)
          Delete_text(all_text);
          Score_displays();
          Enter_score(2, bubbob[1].score); //enter score process for player 2
          //Wait till player 2s score has been entered
          LOOP
             IF (kill == TRUE)
                BREAK;
             END
          FRAME;
          END

          Auto_adv_after(5); //secs_till next screen
          LOOP
             IF (timer[9]/10 >= 32) BREAK; END
             FRAME;
          END
          id_kill.kill = TRUE;
      END

   END //Display or Enter 1 or 2 player score

END

PROCESS Dis_Non_Enter_Score();
PRIVATE
    hi_loc;   //how many in the char table
BEGIN
    ypos = ystpos;
    xpos = xstpos;

        write(font_r,ret_xtext(5),ret_ytext(7),3, "@@@ THE BEST 5 SCORES @@@");

        write(font_g,ret_xtext(xpos+6),ret_ytext(ypos),3, "SCORE");
        write(font_g,ret_xtext(xpos+12),ret_ytext(ypos),3, "ROUND");
        write(font_g,ret_xtext(xpos+19),ret_ytext(ypos),3, "NAME");

        ypos+=2;


    FOR (count = hisc_items-1; count => 0; count--)
            write(font_s,ret_xtext(xpos),ret_ytext(ypos),3, hs_placings[count]);
            write_int(font_s,ret_xtext(xpos+6),ret_ytext(ypos),3, &hs_table[count].h_score);

         IF (hs_table[count].h_level <= 100)
            write_int(font_s,ret_xtext(xpos+14),ret_ytext(ypos),3, &hs_table[count].h_level);
         ELSE
            write(font_r,ret_xtext(xpos+14),ret_ytext(ypos),3, "ALL");
         END
            write(font_s,ret_xtext(xpos+19),ret_ytext(ypos),3, hs_table[count].h_name);
        ypos +=2;
    END
    Fade_on();

    auto_adv_after(5); //secs_till next screen

END

PROCESS Enter_Score(plr_in, in_score);
PRIVATE
    xst;      //to reset x position (x start)
    hi_loc;   //how many in the char table
    txt_mov;  //have has the text moved up or down
    dis_text;
    txt_loc;  //location of cursor text in char array
    txt_id;   //cursor text id pointer
    txt_id2;  //name text id poionter
    entered;  //how many entered
    txt_last; //last key entered
    y_enter_pos; //where on the screen to dump the gold initials
    hi_sc_time; //time in seconds player has left to enter a name
    lev_plr_reached;
    key_plr;    //to read different keys of the players from the do_key() process
BEGIN
    key_plr = plr_in - 1;

    ypos = ystpos;
    xpos = xstpos;

        write(font_s,ret_xtext(xpos+6),ret_ytext(ypos),3, "SCORE");
        write(font_s,ret_xtext(xpos+12),ret_ytext(ypos),3, "ROUND");
        write(font_s,ret_xtext(xpos+19),ret_ytext(ypos),3, "NAME");
        ypos+=2;

   hi_sc_time = 30;

   write(font_s,ret_xtext(0),ret_ytext(25),3, "TIMER:");
   write_int(font_s,ret_xtext(6),ret_ytext(25),3, &hi_sc_time);

   hi_loc = find_hisc_loc(in_score); //Place where to enter hiscore initials

   IF (plr_in == 1)
      lev_plr_reached = bubbob[0].level_reached;
   ELSE
      lev_plr_reached = bubbob[1].level_reached;
   END

    FOR (count = hisc_items-1; count => 0; count--) //hisc_items = 5

//Not reached players ranking yet
        IF (hi_loc != count)
            write(font_s,ret_xtext(xpos),ret_ytext(ypos),3, hs_placings[count]);
            write_int(font_s,ret_xtext(xpos+6),ret_ytext(ypos),3, &hs_table[count].h_score);

            //Display Score or red ALL instead
            IF (hs_table[count].h_level <= 100)
               write_int(font_s,ret_xtext(xpos+14),ret_ytext(ypos),3, &hs_table[count].h_level);
            ELSE
               write(font_r,ret_xtext(xpos+14),ret_ytext(ypos),3, "ALL");
            END

            //Display players initials
            write(font_s,ret_xtext(xpos+19),ret_ytext(ypos),3, hs_table[count].h_name);

        ELSE
//Enter Players Hiscore Location
            write_int(font_s,ret_xtext(xpos+2),ret_ytext(yst2),3, &hs_table[count].h_score);
            IF (lev_plr_reached <= 100)
               write_int(font_s,ret_xtext(xpos+10),ret_ytext(yst2),3, &hs_table[count].h_level); //Level reached Top
               write_int(font_g,ret_xtext(xpos+14),ret_ytext(ypos),3, &hs_table[count].h_level); //Level reached Table
            ELSE
               write(font_s,ret_xtext(xpos+10),ret_ytext(yst2),3, "ALL"); //ALL
               write(font_g,ret_xtext(xpos+14),ret_ytext(ypos),3, "ALL");
            END

            //Table Display
            write(font_g,ret_xtext(xpos),ret_ytext(ypos),3, hs_placings[count]); //1ST 2ND 3RD 4TH 5TH
            write_int(font_g,ret_xtext(xpos+6),ret_ytext(ypos),3, &hs_table[count].h_score); //Score
            y_enter_pos = ypos;

        END
        ypos +=2;
    END

    IF (hi_loc != hisc_terminator)  //Hiscore terminator gets 999 if find_hisc_loc cant input players hiscore
        //Diplay which player is entering their hiscore
        IF (plr_in == 1)
            write(font_gr,ret_xtext(5),ret_ytext(5),3,"1UP ENTER YOUR INITIALS !");
            lev_plr_reached = bubbob[0].level_reached;
        ELSE
            write(font_b,ret_xtext(5),ret_ytext(5),3,"2UP ENTER YOUR INITIALS !");
            lev_plr_reached = bubbob[1].level_reached;
        END

        write(font_g,ret_xtext(7),ret_ytext(7),3,"SCORE  ROUND     NAME");


        update_hiscore(hi_loc, lev_plr_reached, in_score); //Hiscore Location, Level Reached, The players Score

        ypos = 9;
        xpos = 20;
        xst = xpos;

        txt_loc = 1;
        txt_id = write(font_s,ret_xtext(xpos),ret_ytext(ypos),3, &hi_chars[1]);
        entered = 0;
        timer[9]=0; //Delay Left and right movement
        timer[8]=0; //Timer To enter score

        //diplay what is in the highscore array, initally nothing
        //but we need an textid to update the display
        txt_id2 = write(font_b,ret_xtext(xpos),ret_ytext(ypos),3, hs_table[2].h_name);
        REPEAT

            //Hiscore Enter Time Check
            IF (timer[8] > 100)  //Test to see if weve done 1 second in time
                timer[8] = 0;    //reset Hi score timer for another second
                hi_sc_time--;
                IF (hi_sc_time <= 0) BREAK; END //Times over
            END

            IF (timer[9] > 10)                 //delay movement or its impossible to select what you need
                timer[9] = 0;                  //reset timer
                txt_mov = FALSE;

                //Key press left
                IF (keys_pressed[key_plr].pl_left == TRUE)
                //IF (key(_left))
                   txt_loc --;
                   txt_mov = TRUE;

                   IF(txt_loc <= 0)
                      txt_loc = hi_many; //end of array of chars the user can cycle through
                   END
                IF (entered >= num_to_enter)
                    IF (txt_loc <= txt_rub)
                        txt_loc = txt_end;
                    END
                    IF (txt_loc >= txt_rub)
                        txt_loc = txt_rub;
                    END
                END

                END

                IF (keys_pressed[key_plr].pl_right == TRUE)
                    IF(txt_loc >= hi_many)  //text loc over the end of array of chars the user can cycle through
                        txt_loc = 0;         //set text location to start of characters
                    END
                IF (entered >= num_to_enter)
                    IF (txt_loc <= txt_rub)
                        txt_loc = txt_end;
                    END
                    IF (txt_loc >= txt_rub)
                        txt_loc = txt_rub;
                    END
                END
                    txt_loc++;
                    txt_mov = TRUE;
                END

            //Cursor for cycle through chars
            delete_text(txt_id);
             //displaying cycle through chars
            txt_id = write(font_s,ret_xtext(xpos),ret_ytext(ypos),3, &hi_chars[txt_loc]);

            txt_last = 0;

            //ENTER! - Select Char key Pressed so store
                IF (keys_pressed[key_plr].pl_fire == TRUE)

                IF (txt_loc == txt_rub) //rub text from array and screen
                    IF (entered > 0)
                        entered--;
                        xpos--;
                        strdel (&hs_table[hi_loc].h_name,0,1);
                    END
                ELSE
                    IF (txt_loc == txt_end)
                        txt_last = txt_end;
                        delete_text(txt_id); //remove text and update screen
                    ELSE
                        strcat (&hs_table[hi_loc].h_name, hi_chars[txt_loc]); //add char to highscore table name
                        entered++; //number chars entered increase by one
                        xpos++;    //cursor location update
                        txt_last = txt_loc; // to check if we have entered the end to quit entering initials
                        IF (entered == num_to_enter) txt_loc = txt_end;END
                    END
                END

                //update the
                IF (entered>=0 AND entered < num_to_enter AND txt_loc != txt_end)
                    delete_text(txt_id); //remove text and update screen
                    delete_text(txt_id2);
                    //cursor display text
                    txt_id = write(font_s,ret_xtext(xpos),ret_ytext(ypos),3, &hi_chars[txt_loc]);
                    //score table name
                    txt_id2 = write(font_s,ret_xtext(xst),ret_ytext(ypos),3, &hs_table[hi_loc].h_name);
                END
            END

            END //Timer Delay

            FRAME;

        UNTIL (txt_last == txt_end)

        //Name To Screen in gold
        write(font_g,ret_xtext(xst+4),ret_ytext(y_enter_pos),3, hs_table[hi_loc].h_name);
    END
    Hiscore_Cheats(hi_loc); //Check for cheat been entered
    father.kill = TRUE; //signal main


END

//This sets up all the chars which the user can select in the hiscore
//entry screen
//It also modifys hi_many giving how many the user can cycle through
PROCESS Setupchars();
PRIVATE
    sel_loc;
    STRING outchar;
BEGIN
        hi_many = strlen (hisc_chars); //Get length of the string of hiscore letters "ABCDEFG... "
        //sel_loc = 0;

        //Get all the char ascii numbers into hi_chars[] array
        FOR (sel_loc = 0; sel_loc <= hi_many; sel_loc++)    //loops for how many in the array
            strcpy (outchar, hisc_chars);                   //copy all the string into outchar
            strdel (outchar, sel_loc-1, hi_many - sel_loc); //remove all but the current char
            hi_chars[sel_loc] = char(outchar);              //char number into hi_chars
        END

    txt_rub = strstr (hisc_chars, chr_rub); //find erase character location
    txt_end = strstr (hisc_chars, chr_end); //find end character location
    txt_rub++;
    txt_end++;

END

//Updates the Hiscore Table and level reached
PROCESS Update_HiScore(hi_loc, in_level, in_score)
PRIVATE
    s_count; //shift counter
BEGIN
    WHILE (s_count < hi_loc)
        hs_table[s_count].h_name = hs_table[s_count+1].h_name;   //shift items down in the score table
        hs_table[s_count].h_score = hs_table[s_count+1].h_score;
        hs_table[s_count].h_level = hs_table[s_count+1].h_level;
        s_count++; //update index
    END
    hs_table[s_count].h_name = ""; //Remove Last players name
    hs_table[s_count].h_score = in_score; //write new score into table
    hs_table[s_count].h_level = in_level; //write new level reached into table

END

//Finds where to put the players score in the hiscore table
PROCESS Find_HiSc_Loc(in_score)
PRIVATE
    sc_loc;
//    found_loc;
    first;
    second;
BEGIN
    sc_loc = 0;

//    found_loc = false;

    first = hs_table[sc_loc].h_score;    //Get first score
    second = hs_table[sc_loc+1].h_score; //get second score in the table

    //table goes from the lowest to highest. so if score is less than first
    //Then its lower than the lowest score on the table
    IF (in_score <= first)
       RETURN(hisc_terminator); //End of the table no entry of score
    END

    WHILE (sc_loc < hisc_items-1) //loop though the table checking for between scores
        IF (in_score > first AND in_score < second)
           RETURN(sc_loc);          //Between 2 scores in the table
        END
        sc_loc++;

        first = hs_table[sc_loc].h_score;
        second = hs_table[sc_loc+1].h_score;
    END

    RETURN(sc_loc); //return top loc if greater than all of them
END


PROCESS Update_High_Level() //updates the highest levels reached today
BEGIN
//Update Max Level reached
    IF (level_max[0] > lev_today) //Update max level today for player 1
        lev_today = level_max[0];
    END

    IF (level_max[1] > lev_today) //Update max level today for player 1
        lev_today = level_max[1];
    END

END

PROCESS Level_Reached_adv()
PRIVATE
    txt;
    txt_1;
    txt_2;
    y_loc; //start pos of text
BEGIN
    Signal (type Bubble_Field, s_kill);
    Signal (type Bubble_Spitter_2, s_kill);

    //Level Reached Background
    put (titlesfile, Lev_Reached_Gph, 64, 8);
    fade_on();

    update_high_level();         //Update Highest Level Reached today
    tscreen_done_anim = 2;       //anims to finish before moving on
    tscreen_done_anim_count = 0; //anims finished count

    girlfriends(); // Girlfriends at the bottom of the screen
    //Green Banner
    Banners(1); //Big Arrow pointer sprite which moves down the screen and displays level reached
    //Blue Banner
    Banners(2);
    txt = write(font_s,ret_xtext(3),ret_ytext(3),3, "TODAY'S RECORD IS");

    LOOP
        IF (tscreen_done_anim_count >= tscreen_done_anim)       //anims to finish before moving on
            BREAK;
        END
        IF (key(_space)) //quit if space pressed by the user - can be annoying seeing all
           kill = TRUE;
           BREAK;
        END

        FRAME;
    END

    IF (bubbob[0].level_reached > 100 OR
       bubbob[1].level_reached > 100)
       txt_1 = write(font_r,ret_xtext(19),ret_ytext(3),3, "ROUND ALL!");
       titles(txt_1, ret_xtext(19), ret_ytext(3));
    ELSE
       txt_1 = write(font_r,ret_xtext(19),ret_ytext(3),3, "ROUND ");
       txt_2 = write_int(font_r,448,ret_ytext(3),3, &lev_today);
       titles(txt_2, 448, ret_ytext(3));
       titles(txt_1, ret_xtext(19), ret_ytext(3));
    END

   Auto_Adv_Kill(10); //in seconds how long to auto advance the titlescreen
   LOOP

   FRAME;
      IF (kill == TRUE) BREAK; END
   END

   fade_off();
   clear_screen();
   delete_text(txt);

   IF (txt_1 != 0) delete_text(txt_1); END //check that we have text on screen
   IF (txt_2 != 0) delete_text(txt_2); END
   FRAME (500);

   tscreen_adv = TRUE;

END

PROCESS Titles(txt, xint, yint); //flashes text
PRIVATE
     frate;
BEGIN
     timer[3] = 0; // timer for flash text
     frate = 200;
     LOOP
        IF (timer[3] >= frate) timer[3] = 0; END
        IF (timer[3] == 0) move_text (txt, xint, yint); END
        IF (timer[3] >= frate/2) move_text (txt, 640, 640);  END

        IF(father.kill == TRUE) BREAK; END
        FRAME(200);
     END

END


//Banner arrow pointer to level reached sprite
PROCESS Banners(plr)
PRIVATE
    txt_id;
    txt_x;
    level_no;
    level_to_goto;
    loc_count;
    y_last;
    y_fin;
    all_completed; //End boss level completed

BEGIN
    file = titlesfile;
    x = x_ban_lev1;
    y = y_ban_lev;
    z = pri_banners;

    level_no = 0;
    y_fin = FALSE;

    IF (plr == 1)     //set up the text displaying the level number
        GRAPH = lv_ban;
        txt_x = x_txt_lev1;
        txt_id = write_int(font_lev, x_txt_lev1, y_txt_lev,5,&level_no);
        level_to_goto = bubbob[0].level_reached; //last level reached by player 1
    ELSE
        GRAPH = lv_ban+1;
        txt_x = x_txt_lev2;
        x = x_ban_lev2;
        txt_id = write_int(font_lev, x_txt_lev2, y_txt_lev,5,&level_no);
        level_to_goto = bubbob[1].level_reached; //last level reached by player 2
    END
    dino_bars(plr);  //level last reached by player
    level_bars(plr); //max level reached magenta bars
    dino_levs(plr);  //dinos

    IF (level_to_goto > 100)
       level_to_goto = 100;  //level 101 means game has been completed
       all_completed = TRUE; //End boss level completed - display Magenta - Clear 100 when banner stops moving

    END

    LOOP

        y_last = y;

        IF (level_no < level_to_goto)
            loc_count+=10;
            level_no = loc_count/32;
            y+=1;
            move_text(txt_id, txt_x, y_txt_lev+loc_count/10); //Move the big gold level text down the screen
        END
            IF (y_fin == FALSE AND y_last == y) //Sets the global animation to done if the banner has stoped moving
                y_fin = TRUE;                   //set the flag to stop this from running more than once
                tscreen_done_anim_count++;
                IF (all_completed == TRUE) //End boss level completed - display Magenta - Clear 100 when banner stops moving

                  IF (plr == 1) //Magenta Clear 100 sprite
                    Static_Anim_Titles(x_comp_all1, y_comp_all, pri_clear100, Lev_Clear100); //Clear 100
                  ELSE
                    Static_Anim_Titles(x_comp_all2, y_comp_all, pri_clear100, Lev_Clear100); //Clear 100
                  END
                END

            END
        kill = father.kill;
        FRAME;
        IF (kill == TRUE) BREAK; END
    END
    delete_text(txt_id);
END


//Level_Reached Today
PROCESS Level_Bars(plr) //max level reached today
PRIVATE
    gph_st;
    gph_y_loc;
    gph_way;
    del_anim;
BEGIN
    file = titlesfile;
    x = father.x;
    y = father.y;
    z = 100;
    gph_st = lv_bar_hi;

    IF (plr == 1)
        gph_y_loc = level_max[0];
        x+=33;
    ELSE
        gph_y_loc = level_max[1];
        x-=31;
    END

    IF (gph_y_loc > 100) //Level 101 means the game has been completed
       gph_y_loc--;      //adjustment so bar is on the level 100's place
    END

    y+= (gph_y_loc*99)/31; //Find Correct location down the shaft
    y++;
    GRAPH = gph_st;

    LOOP
       del_Anim++;
       IF (del_anim > 5)
          del_anim = 0;
          GRAPH ++;
          IF (GRAPH > gph_st+13)
             GRAPH = gph_st;
          END
       END

       IF (father.kill == TRUE) BREAK; END

       FRAME;
    END
END

PROCESS Dino_Bars(plr) //blue or green bars which follow the level banner down
PRIVATE
    gph_st;
BEGIN
    file = titlesfile;
    x = father.x;
    y = father.y;

    IF (plr == 1)
        gph_st = lv_bub_bar;
        x+=33;
    ELSE
        gph_st = lv_bob_bar;
        x-=31;
    END

    GRAPH = gph_st;

    LOOP
    y = father.y;

    IF (Timer[8]  == 0)
        IF (GRAPH == gph_st)
            GRAPH = gph_st+1;
        ELSE
            GRAPH = gph_st;
        END
    END
    IF (father.kill == TRUE) BREAK; END
       FRAME;
    END
END

PROCESS Dino_Levs(plr) //dancing dinos down the level reached pits
PRIVATE
    gph_st;
BEGIN
    file = titlesfile;
    x = father.x;
    y = father.y;

    IF (plr == 1)
        gph_st = lv_bub;
        x+=33;
    ELSE
        gph_st = lv_bob;
        x-=31;
    END

    GRAPH = gph_st;

    LOOP
    y = father.y-20;

    IF (Timer[8]  == 0)

        IF (GRAPH == gph_st)
            GRAPH = gph_st+1;
        ELSE
            GRAPH = gph_st;
        END
    END
    IF (father.kill == TRUE) BREAK; END
       FRAME;
    END
END


PROCESS Girlfriends()
BEGIN
    file = titlesfile;
    x = 321;
    y = 423;
    GRAPH = lv_gf;
    Timer[1] = 0;

    LOOP

    IF (Timer[8] > 40)
        timer[8] = 0;
        IF (GRAPH == lv_gf)
            GRAPH = lv_gf+1;
        ELSE
            GRAPH = lv_gf;
        END
    END
    IF (father.kill == TRUE) BREAK; END
    FRAME;
    END
END



//Displays a graphic on the screen with no animation
//But with Titles FPG
PROCESS Static_Anim_Titles(xloc, yloc, zpri, an_start)
//Does stand alone animation
BEGIN
    //region = 1; //needed for clipping the sprite when it goes off the playfield
    file = titlesfile;

    x = xloc;
    y = yloc;
    z = zpri;

    GRAPH = an_start;

    REPEAT
       FRAME;
       kill = father.kill;
    UNTIL (kill == TRUE)

END //Anim2

//PROCESS Destroy_Them_All();
//BEGIN

//END


PROCESS Test_Info()
BEGIN
//TEST information
   write_int(0,100,40,0,&test);
   write_int(0,100+30,40,0,&test2);
   write_int(0,100+60,40,0,&test3);
   write_int(0,100+90,40,0,&test4);
   write_int(0,100+120,40,0,&test5);
//   write_int(0,100,60,0,&test6);
//   write_int(0,100+30,60,0,&test7);
//   write_int(0,100+60,60,0,&test8);
//   write_int(0,100+90,60,0,&test9);
//   write_int(0,100+120,60,0,&test10);
END

PROCESS Button_norm(but_ind)
PRIVATE
   b_grf;
   but_num;
   but_type;
   key_to_read;
   mse_id;
   click_hld_del;
BEGIN
   file = sprites;

   x = buttons[but_ind].x_loc;
   y = buttons[but_ind].y_loc;
   but_num = buttons[but_ind].b_graph;  //graphic for the button
   but_type = buttons[but_ind].b_type;  //type of button
   key_to_read = buttons[but_ind].key_p;//scan for this shortcut key

   b_grf =  button_gfx[but_num];
   GRAPH = b_grf;

   LOOP
   mse_id  = collision (type mouse);

      IF (key_to_read != 0)
        IF (key(key_to_read) OR (mse_id != 0 AND mouse.left))
          b_clicked  = TRUE;
        ELSE
          b_clicked  = FALSE;
        END
      ELSE
        IF (mse_id != 0 AND mouse.left)
          b_clicked  = TRUE;
        ELSE
          b_clicked  = FALSE;
        END
      END

      IF (b_clicked == TRUE)
          GRAPH = b_grf+2; //left mouse clicked
            //b_selected = TRUE;
          IF (b_selected == FALSE OR (but_type == bt_click_hold AND click_hld_del == 0)) //check for click hold
             b_selected = TRUE;
             Button_Event_Handler (buttons[but_ind].b_event);
          END
      ELSE
          b_selected = FALSE;
          GRAPH = b_grf+1; //mouse over button
      END

      IF (mse_id == 0 AND b_selected == FALSE)
         GRAPH = b_grf;      //no mouse over
      END

      click_hld_del++;
   IF (click_hld_del >5)
      click_hld_del = 0;
   END
//   IF (level_type != lv_options) BREAK; END

      FRAME;
   END
END //Button normal


PROCESS Button_Tog(but_ind, sel_def_val) //value on off
PRIVATE
   b_grf;
   but_num;
   but_type;
   key_to_read;
   mse_id;
   b_released;
BEGIN
   file = sprites;

   x = buttons[but_ind].x_loc;
   y = buttons[but_ind].y_loc;

   but_num = buttons[but_ind].b_graph;  //graphic for the button
   key_to_read = buttons[but_ind].key_p;//scan for this shortcut key

   b_grf =  button_gfx[but_num];

   IF (sel_def_val == FALSE)
       GRAPH = b_grf; //Not Selected
   ELSE
      GRAPH = b_grf+2; //Selected
      b_selected = TRUE;
   END

   LOOP
   mse_id  = collision (type mouse);

      //Shortcut Key
      IF (key_to_read != 0)
        IF (key(key_to_read) AND b_released == TRUE)
          b_clicked  = TRUE;
          b_released = FALSE;
        END
      END

      //Mouse click
      IF (mse_id != 0 AND mouse.left AND b_released == TRUE)
          b_clicked  = TRUE;
          b_released = FALSE;
      ELSE
          b_clicked  = FALSE;
      END

      IF (mouse.left == FALSE)
         IF (key_to_read !=0)
            IF (NOT key(key_to_read))
            b_released = TRUE;
            END
         ELSE
            b_released = TRUE;
         END
      END

//do mouse over colour if not selected
      IF (b_selected == FALSE)
         IF (mse_id !=0)
            GRAPH = b_grf+1;    //mouse over
         ELSE
            GRAPH = b_grf;      //no mouse over
         END
      END

//Process toggle button graphic and update vars
      IF (b_clicked == TRUE)
         IF (b_selected == FALSE)
            b_selected = TRUE;
            GRAPH = b_grf+2; //left mouse clicked
            Button_Event_Handler (buttons[but_ind].b_event);
         ELSE
            b_selected = FALSE;
            GRAPH = b_grf;      //no mouse over
            Button_Event_Handler (buttons[but_ind].b_event);
         END
      END
//      IF (level_type != lv_options) BREAK; END

      FRAME;
   END

END //Toggle



PROCESS Button_Event_Handler (but_event)
BEGIN

   SWITCH (but_event)
    CASE but_Backgrounds:
      IF (do_bgrounds == FALSE)
          do_bgrounds = TRUE;  //graphics behind the screen on scroll plane 2
      ELSE
          do_bgrounds = FALSE;
      END
        IF (do_bgrounds == TRUE)   //graphics behind the screen on scroll plane 2
            Write(font_ed, ret_xtext(8)+8,ret_ytext(5),3,"On");
        ELSE
            Write(font_ed, ret_xtext(8)+8,ret_ytext(5),3,"Off");
        END
    END

    CASE but_Levels:
        IF (do_levels == lev_normal)  //levels normal
            do_levels = lev_extend;
        ELSE
            do_levels = lev_normal;
        END

        IF (do_levels == lev_normal)  //levels normal
            Write(font_ed, ret_xtext(8)-8,ret_ytext(8),3,"Original");
        ELSE
            Write(font_ed, ret_xtext(8)-8,ret_ytext(8),3,"New Levels");
        END
        Load_Levels();
    END

    CASE but_Frame_Dn: //Frame rate
        IF (frm_rate > 10) frm_rate --; END
    END
    CASE but_Frame_Up:
        IF (frm_rate < 200) frm_rate ++; END
    END

    CASE but_Skip_Dn: //Frame skip down
        IF (frm_skip > 0) frm_skip--; END
    END

    CASE but_Skip_Up: //Frame skip down
        IF (frm_skip < 20) frm_skip++; END
    END

    CASE but_Diff_set: //Game Difficult setting
        game_diff++;
        IF (game_diff>4)
            game_diff = 1;
        END
        Write(font_ed, ret_xtext(10),ret_ytext(11),3,Game_diff_Text[game_diff-1]);
    END
    CASE but_Extra_Lives: //Extra life setting
         life_set++;                //increase lives awarded difficulty
         IF (life_set>3)
            life_set = 0;
         END
         Write_int(font_ed,ret_xtext(9)-8,ret_ytext(12) ,3,&Extra_lives[life_set].first);
         Write_int(font_ed,ret_xtext(12)-8,ret_ytext(12) ,3,&Extra_lives[life_set].second);
         Write_int(font_ed,ret_xtext(15),ret_ytext(12) ,3,&Extra_lives[life_set].thrid);

    END

    CASE but_lives_Dn: //Lives to start 1-5 def 3
        IF (Start_lives >1)
            Start_lives--;
        END
    END

    CASE but_lives_Up:
        IF (Start_lives < 5 OR cheat_mode == TRUE)
            Start_lives++;
        END
    END

    CASE but_Rest_Hi:     //Hiscore reset
        Reset_Hiscore();
        Save (game_h, OFFSET hs_table, SIZEOF(hs_table) + SIZEOF (level_max) + 1); //Save Hiscore Table, Level max, Hiscore
    END

    CASE but_clr_items:   //Item counters clear
        Reset_Counters();
        Save (game_c, OFFSET spec_Items, SIZEOF(spec_Items));
    END

    CASE but_reset_keys:  //Player keys reset
        Restore_Keys();
        Save_Keys();      //Save Keys to Disk
    END

    CASE but_Credits_Dn://Credits available
        IF (Start_coins > 1)
            Start_coins--;
        END
    END

    CASE but_Credits_Up:
        Start_coins++;
    END

    CASE but_level_dn:
        IF (start_level > 1)
            start_level--;
        END
    END

    CASE but_level_up:
        IF (start_level < 100)
            start_level++;
        END
    END
    CASE but_cheat_screen:
        cur_tscreen = t_cheat;
        Main_logic();
    END

    CASE but_reset_all:
        Next_Rnd_Time = time_rnd_bub;        //2.7 secs for next random bubble
        life_set = 0;                //lives awarded difficulty
        game_diff_value = game_norm; //game difficulty initial value
        Game_difficulty();           //set game difficulty
        frm_rate = 60;
        frm_skip = 0;
        Set_FPS(frm_rate, frm_skip); //Frames per second
        cheat_rst();
    END

    CASE but_cheat_reset://clear all cheats
        cheat_rst();
    END
    CASE but_invince_P1:
        IF (bubbob[0].invincible == FALSE)
            bubbob[0].invincible = TRUE;
        ELSE
            bubbob[0].invincible = FALSE;
        END
    END
    CASE but_invince_P2:
        IF (bubbob[1].invincible == FALSE)
            bubbob[1].invincible = TRUE;
        ELSE
            bubbob[1].invincible = FALSE;
        END
    END

    CASE but_lives_P1:
        IF (bubbob[0].inf_lives == FALSE)
            bubbob[0].inf_lives = TRUE;
        ELSE
            bubbob[0].inf_lives = FALSE;
        END
    END
    CASE but_lives_P2:
        IF (bubbob[1].inf_lives == FALSE)
            bubbob[1].inf_lives = TRUE;
        ELSE
            bubbob[1].inf_lives = FALSE;
        END
    END
    CASE but_autofire_P1:
        IF (bubbob[0].autofire == FALSE)
            bubbob[0].autofire = TRUE;
        ELSE
            bubbob[0].autofire = FALSE;
        END
    END
    CASE but_autofire_P2:
        IF (bubbob[1].autofire == FALSE)
            bubbob[1].autofire = TRUE;
        ELSE
            bubbob[1].autofire = FALSE;
        END
    END
    CASE but_power_P1: //keep powerups
        IF (bubbob[0].superman == FALSE)
            bubbob[0].superman = TRUE;
        ELSE
            bubbob[0].superman = FALSE;
        END
    END
    CASE but_power_P2: //keep powerups
        IF (bubbob[1].superman == FALSE)
            bubbob[1].superman = TRUE;
        ELSE
            bubbob[1].superman = FALSE;
        END
    END
    CASE but_alwaysSR:
        IF (alwaysSR == FALSE)
            alwaysSR = TRUE;
            Write(font_ed, ret_xtext(11)+8,ret_ytext(9),3,"Yes");
        ELSE
            alwaysSR = FALSE;
            Write(font_ed, ret_xtext(11)+8,ret_ytext(9),3,"No");
        END
    END

    CASE but_extraitems: //extra items on/off
        IF (extra_items == FALSE)
            extra_items = TRUE;
            Write(font_ed, ret_xtext(8),ret_ytext(11),3,"On");
        ELSE
            extra_items = FALSE;
            Write(font_ed, ret_xtext(8),ret_ytext(11),3,"Off");
        END
    END

    CASE but_level_umb: //level umbrella
       IF (spec_items[50] == 0)
           spec_items[50] = 1;
           Write(font_ed, ret_xtext(9),ret_ytext(12),3,"On");
       ELSE
           Write(font_ed, ret_xtext(9),ret_ytext(12),3,"Off");
           spec_items[50] = 0;
       END
    END

    CASE but_potion_Dn: //Potion time
        IF (potion_time >2)
           potion_time--;
        END
    END

    CASE but_potion_Up:
         potion_time++;
    END
    CASE but_maxbub_Dn: //Bubbles on screen
        IF (max_bubs >2)
            max_bubs--;
        END
    END
    CASE but_maxbub_Up:
         max_bubs++;
    END
    CASE but_boss_Dn: //Boss health
        IF (boss_set_health >2)
            boss_set_health--;
        END
    END
    CASE but_boss_Up:
       boss_set_health++;
    END

    CASE but_fireBub: //fire bubble freq
        int_FB_val++;
        IF (int_FB_val > 11) int_FB_val = 0; END
        fire_bubble_rnd = f_bubble_rndval[int_FB_val];
        //2,4,8,16,32,64,128,256,512,1024,2048,4096;
    END

    CASE but_itemkey: //cheat item key on f10
        IF (item_key == FALSE)
            item_key = TRUE;
            Write(font_ed, ret_xtext(8)+8,ret_ytext(10),3,"On");
        ELSE
            item_key = FALSE;
            Write(font_ed, ret_xtext(8)+8,ret_ytext(10),3,"Off");
        END
    END
    CASE but_Trap_Dino:
        IF (trap_player == TRUE)     //can trap other player in a bubble like a nastie.
            trap_player = FALSE;
            Write(font_ed, ret_xtext(11)-8,ret_ytext(17),3,"No");
        ELSE
            trap_player = TRUE;
            Write(font_ed, ret_xtext(11)-8,ret_ytext(17),3,"Yes");
        END
    END

   END
END

PROCESS cheat_rst()
BEGIN
        cheat_mode = FALSE;
        Start_coins = 20;            //Coins available to play 1 continous game
        Start_lives = 3;             //Lives player starts with
        max_bubs = 16;               //Max Bubbles on screen
        potion_time = pot_def_time;  //potion level time default 30 seconds
        start_level = 1;             //level the game starts at
        int_FB_val = 10;              //Fire bubble value
        fire_bubble_rnd = f_bubble_rndval[10]; //2,4,8,16,32,64,128,256,512,1024,2048,4096;
        fireball_deadly = FALSE; //player can be killed by the other player
        trap_player = FALSE;     //can trap other player
        extra_items = FALSE;
        item_key = FALSE;       //F10 disabled for get items
        boss_set_health = boss_init_health;  //100 hits to kill boss

        bubbob[0].invincible = FALSE;
        bubbob[0].superman   = FALSE;
        bubbob[0].autofire   = FALSE;
        bubbob[1].invincible = FALSE;
        bubbob[1].superman   = FALSE;
        bubbob[1].autofire   = FALSE;
END

PROCESS Save_Settings()
BEGIN
   Save (game_s, OFFSET frm_rate, 8);
END

//This process has no graphic is a hidden process which gets rotated in a circle
//to spit bubbles
PROCESS Bubble_Spitter_2(b_type)
PRIVATE
    x_pos;
    y_pos;
    me_deg;
    x_dist;
    y_dist;
    bub_del;
    bub_timer;
    bub_time_max;
    del_change; //for running the colours up to purple from red as a strobe
    bub_colour; //colour to randomise
BEGIN

    x = x_scr_middle; //middle of the screen
    y = y_scr_middle;
    xpos = x;
    ypos = y;

    bub_time_max = 2;
    IF (b_type == rbub_white)
        bub_time_max = 5;
    END

    bub_colour = 4; //default blue

    LOOP

    IF (b_type == rbub_random)
        bub_colour = rand(0,6);
    END

    IF (b_type == rbub_strobe) //cycles colours of bubbles
        del_change++;
        IF (del_change > 50)   //check delay timer
            del_change = 0;    //reset timer
            bub_colour++;      //increase bubble colour
            IF (bub_colour >5) //loop bubble colour
                bub_colour = 0;
            END
        END
    END

    IF (bub_del >= bub_time_max) //check bubble spit delay
      me_deg += rand (0, 360);
      x_dist = get_distx((me_deg*k), rand (30,55));
      y_dist = get_disty((me_deg*k), rand (30,55));

      x = x_dist + x_pos;
      y = y_dist + y_pos;

      Bubble_Field(x_dist, y_dist, bub_colour); //do a bubble

      bub_del = 0;
    END
    bub_del++;

    IF (kill == TRUE OR tscreen_adv == TRUE) BREAK; END

    FRAME;

    END //process loop
//    kill = TRUE;
//    FRAME (300);

END

PROCESS Bubble_Field(x_sp, y_sp, which)
PRIVATE
    x_sp;
    y_sp;
    alive_time;
BEGIN
    file = sprites;

    x = x_scr_middle; //middle of the screen
    y = y_scr_middle;
    z = 30;
    xpos = x;
    ypos = y;
    size = 30;

    //Does Rainbow intro bubbles if cheat mode is on
    SWITCH (which)
        CASE 0..5:
            GRAPH = rainbow_bubbles+which;
        END

        DEFAULT:
            GRAPH = intro_bubbles; //clear bubble
        END
    END

    REPEAT

    IF (x <0 OR x => 680) BREAK; END
    IF (y< -40 OR y > 480) BREAK; END

    xmov +=x_sp;
    ymov +=y_sp;

    x = xpos + xmov/10; //divide by 10 to get a angle
    y = ypos + ymov/10;
    alive_time++;

    IF (alive_time MOD 2 == 0)
       size+= 2;
    END

    IF (size >90)
      IF (x_sp<0) x_sp--; END
      IF (x_sp>0) x_sp++; END
      IF (y_sp<0) y_sp--; END
      IF (y_sp>0) y_sp++; END

    END

       FRAME;

    UNTIL (kill == TRUE OR tscreen_adv == TRUE)

END


PROCESS Scroll_Bubbles()
PRIVATE
    ids[3]; //for killing the bubble processes
BEGIN
    Define_Region (1, 0, 0, 640, 480);
    Start_Scroll(0, titlesfile, 300, 301, 1, 10);

    Rand_Pop_Bubs(50,30,50 , lv_title);  //rand freq, rand start delay ,end delay
    Rand_Pop_Bubs(50,60,100, lv_title);

    Bubble_Stream(108, 480, 30); //x, y, delay
    Bubble_Stream(532, 480, 20);

    ids[0] = Get_id(type Rand_Pop_Bubs);
    ids[1] = Get_id(type Rand_Pop_Bubs);
    ids[2] = Get_id(type Bubble_stream);
    ids[3] = Get_id(type Bubble_stream);

    LOOP
        scroll.y0 += 2;
        scroll.y1 += 1;
        IF (level_type != lv_title) BREAK; END //not on main title kill
    FRAME;
    END

//kill bubbler processes
    signal (ids[0], s_kill);
    signal (ids[1], s_kill);
    signal (ids[2], s_kill);
    signal (ids[3], s_kill);

//*******
//    Stop_scroll(0);

END

PROCESS Bubble_Stream(x, y,Rate)
BEGIN
   Rate *=100;
   //Pop_Bubbles(x, y, g_speed, int_speed, speed_inc, speed_del, max_speed, m_speed_when)
//                        5          1         1          1          80        500
   LOOP
      Pop_Bubbles(x,y, 5,1,1,1,80,500);
      FRAME(Rate);
   END
END

PROCESS Rand_Pop_Bubs(end_freq, st_rnd_speed, end_rnd_speed, lv_in)
PRIVATE
   rnd_x;       //random x position of the bubble
   del_next;    //timer of this process, reset to zero when bubble goes
   del_next_go; //random time to do a bubble
BEGIN

   rnd_x = rand (16, 620); //randomize start x bubble position
   del_next_go = rand (0, end_freq);

   LOOP
   del_next++;
       IF (del_next > del_next_go)
           del_next_go = rand (0, end_freq); //randomize frequency by passed in var

           del_next = 0;
           IF (level_type == lv_title)
              Full_Bubble(rnd_x ,512, rand(st_rnd_speed,end_rnd_speed));
           ELSE
              OptionScr_Bubbles(rnd_x ,512,rand(st_rnd_speed,end_rnd_speed));
           END

           rnd_x = rand (16, 620);
       END

       //screen changed? then kill
       IF (level_type != lv_in) BREAK; END

       FRAME;
   END
END


PROCESS OptionScr_Bubbles(x,y,speed)
PRIVATE
   r_colour; //to do white and rainbow coloured ones for options screen
BEGIN
   file = sprites;
   //z = ;
   r_colour = rand (0,7);

   LOOP
      IF (level_type == lv_options)
        IF (r_colour < 6)
            GRAPH = rainbow_bubbles+r_colour; //Yellow - cheat screen
        ELSE
            GRAPH = intro_bubbles;            //White - Options Screen
        END

      ELSE
        GRAPH = rainbow_bubbles+2; //Yellow - cheat screen
      END

      y -= speed/10;

      IF (y < -32 OR level_type == lv_title) BREAK; END //if back to main then exit

      FRAME;
   END
END

//Main Title screen bubbles
PROCESS Full_Bubble(x,y,speed)
PRIVATE
   cur_frm;
BEGIN

   file = titlesfile;
   cur_frm = (coke_bub+coke_frms) - rand (0,6);
   //z = ;

   LOOP
      GRAPH = cur_frm;
      y -= speed/10;
      IF (y < -32 OR level_type != lv_title) BREAK; END //stop process if not on main title screen

      FRAME;
   END
END

PROCESS Pop_Bubbles(x, y, g_speed, int_speed, speed_inc, speed_del, max_speed, m_speed_when)
PRIVATE
   frm_del;
   cur_frm;
   max_frm;
   speed;
   m_timer;  //current movement timer
   g_timer;  //animation delay timer
   sd_timer; //speed delay

BEGIN

   //z = ;
   file = titlesfile;
   cur_frm = coke_bub;
   max_frm = cur_frm + coke_frms;
   speed = int_speed;
   GRAPH = cur_frm;

   LOOP
      m_timer++;
      g_timer++;
      sd_timer++;

      IF (g_timer > g_speed) //Check grow speed animation delay
         g_timer = 0;
         IF (cur_frm < max_frm) //check for max frame
            cur_frm++;
         END
         GRAPH = cur_frm;
      END

      IF (m_timer > m_speed_when)
         speed = max_speed;
      END

      IF (sd_timer >= speed_del)
         sd_timer = 0;
         IF (speed < max_speed)
            speed+= speed_inc;
         END
      END


      y -= speed/10;
      IF (y < -32 OR level_type != lv_title) BREAK; END
      FRAME;
   END
END

//Puts lines of scroll text to the screen
//returns how many lines put to screen
PROCESS Put_Scroll_Text(y_start) //y block location start
PRIVATE
    scr_loc;
    new_x;
    fnt;
    t_loc;
    t_on_screen;
    txt_y;
BEGIN
   y = y_start;

REPEAT
   fnt = 0;
   SWITCH (Scroll_Txt[t_loc].txt_fnt)
      CASE f_silver:
         fnt = font_s;
      END
      CASE f_gold:
         fnt = font_g;
      END
      CASE f_red:
         fnt = font_r;
      END
      CASE f_green:
         fnt = font_gr;
      END
      CASE f_blue:
         fnt = font_b;
      END
   END

   IF (fnt > 0)
       x = ret_xtext(Scroll_Txt[t_loc].txt_x);
       txt_y = ret_ytext(y);

       //Store coords for scrolling text later
       Scroll_info[t_on_screen].txt_x = x;
       Scroll_info[t_on_screen].txt_y = txt_y;

       //Write to screen storing the id of the text for moving the text
       Scroll_info[t_on_screen].txt_id = Write(fnt, x, txt_y, 3, Scroll_Txt[t_loc].txt_text);
       t_on_screen++;
   END

   IF (Scroll_Txt[t_loc].txt_fnt == l_feed) //line feed down the screen by number in txt_x
      y+=Scroll_Txt[t_loc].txt_x; //holds how many line feeds to do
   ELSE
       IF (Scroll_Txt[t_loc].txt_line_feed == TRUE) //end of line - if false it stays on this x line to do more text
           y++;
       END
   END

   t_loc++; //locate next text in the scroll text array

   FRAME;

UNTIL (Scroll_Txt[t_loc].txt_fnt == t_end) //if terminator found quit putting text to screen
    sc_txt_num = t_on_screen;

END

//Scrolls the text up the screen
PROCESS Scroll_The_Text()
PRIVATE
    t_loc;
BEGIN
//Scrolls the text the text up the screen
    LOOP
        t_loc = 0;
        REPEAT
            Scroll_info[t_loc].txt_y -=1; //Move text up the screen
            Move_text(Scroll_info[t_loc].txt_id, Scroll_info[t_loc].txt_x, Scroll_info[t_loc].txt_y);
            t_loc++;

        UNTIL (t_loc >= sc_txt_num)

        FRAME(200);

        IF (kill == TRUE) BREAK; END
    END

    sc_txt_num = 0;
//Clear the scroll text array
    REPEAT
        Scroll_info[t_loc].txt_id = 0;
        Scroll_info[t_loc].txt_x  = 0;
        Scroll_info[t_loc].txt_y  = 0;
        t_loc++;
    UNTIL (t_loc >= sc_txt_num)
END
