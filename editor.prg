
COMPILER_OPTIONS _extended_conditions;

PROGRAM Bubble_Bobble_Editor;

//Bubble bobble Editor
//Written By: Paul E Darby
//Using: DIV 2 Games Studio
//Graphics: Paul E Darby
//2004

//screen dimentions
//28 blocks across - 16 pixels + 2x32 blocks at each side
//26 blocks down - 16 pixels + 32 unseen write to area
//making a display area of 480x448
//screen resolution of 640x480

//IMPORT "\bubdiv\MMPAINT.DLL"; //fill DLL

CONST
//GRAPHIC FILE LOCATION CONSTANTS
    blocksfloc = "\bubdiv\fpg\bb_block.fpg";
    platfloc   = "\bubdiv\fpg\bb_plbub.fpg";
    sprfloc    = "\bubdiv\fpg\bb_spr.fpg";
    editfloc   = "\bubdiv\fpg\editor.fpg";

//Palette
    palfloc    = "\bubdiv\bbob.pal";    //for the game and title screen
//Fonts
    silverfnt  = "\bubdiv\fonts\silver.fnt";
    redfnt     = "\bubdiv\fonts\red.fnt";
    bluefnt    = "\bubdiv\fonts\blue.fnt";
    goldfnt    = "\bubdiv\fonts\gold.fnt";
    grnfnt     = "\bubdiv\fonts\green.fnt";
    edit_fnt   = "\bubdiv\fonts\Editor.fnt";

//Level and Baddie Data Locations and Names
   level_n = "\bubdiv\gamedata\level1.dat";
   level_e = "\bubdiv\gamedata\level2.dat";
   bad_n   = "\bubdiv\gamedata\Nasties1.dat";
   bad_e   = "\bubdiv\gamedata\Nasties2.dat";

   p_map1 = "\bubdiv\fpg\levplat1.map";
   p_map2 = "\bubdiv\fpg\levplat2.map";
   p_bub1 = "\bubdiv\fpg\levbub1.map";
   p_bub2 = "\bubdiv\fpg\levbub2.map";


   blocks_acr = 28;
   blocks_dwn = 26;

//which levels to do
    lev_normal = 1;
    lev_extend = 2;
    num_levels = 100;
    prop_y = 208; //for adjusting coords of data of monsters/food/items

//LEVEL EDITOR CONSTS
    sm_block_size = 8;
    b_bl_size = 16;

    x_draw_bl = 196-4;
    y_draw_bl = 116-4;

    x_draw_bl2 = 198;
    y_draw_bl2 = 118;

//Draw constants
    drw_line       = 1;
    drw_rect       = 2;
    drw_rectfill   = 3;
    drw_circle     = 4;
    drw_circlefill = 5;

    drw_opacity    = 15; //want draw solid not translucent

//screen copy for line, fill and draw circle and rectangle
    cpy_buf_x = 611;
    cpy_buf_y = 16;

    cpy_drw_x = 582;
    cpy_drw_y = 16;


//block colour types for the copying to the bubble map
    block_type_b1 = 1; //block
    block_type_b2 = 2; //bubble block
    block_type_b3 = 3; //invisable
    block_type_b4 = 4; //block fall through

 //graphics for diplaying level screen blocks to edit window
    ed_plat_bl   = 12;
    ed_plat_invs = 220; //invisable

    ed_plat_hrd  = 13;
    ed_plat_bub  = 17;
 //grid
    del_grp = 46; //lighter one is 47

    lv_ed_rect   = 2; //editor block rectangle

    mousepointer = 11;  //Arrow
    mousehidden  = 48;  //hidden
    mousefill    = 10;  //fill
    mouseother   = 219; //other draw

    mg_pointer = 0;
    mg_hide    = 1;
    mg_fill    = 2;
    mg_other   = 3;


//sprite graphics
    fd_gph = 55;
    it_gph = 57;


//Text Size
    edtxtsz_x = 10;
    edtxtsz_y = 14;

//editor square block display
    spr_edit   = 0;
    plat_edit  = 1;
    bub_edit   = 2;
    food_edit  = 3;
    item_edit  = 4;

    ed_squ_x = 192;
    ed_squ_y = 112;
    ed_squ_sz_x = blocks_acr*8;
    ed_squ_sz_y = blocks_dwn*8;

    num_buttons = 51;
    dir_sprite  = 187;
    dir_sprite_sm = 188;

    spr_nums = 59;

    but_scr = 68; //number to do onscreen

    no_nast_nums = 480; //for which nastie sprite is selected+1

//button types
    bt_click_once = 1; //increases a var once
    bt_click_hold = 2; //increases a var as long as its held down
    bt_toggle     = 3; //toggles part of a group
    bt_group      = 4; //part of larger group
    bt_click_win  = 5; //opens a window

//groups of buttons together
   grp_levels    = 1; //levels to edit
   grp_edit_win  = 2; //bar at top of editor screen what to edit in the window
   grp_nasties   = 3; //nastie number to edit
   grp_plats     = 4; //platform paths draw icon buttons
   grp_bubs      = 5; //bubble paths icon buttons
   grp_draw      = 6; //draw what on screen

//button events
   but_level_dn   = 0;
   but_level_up   = 1;
   but_edit_norm  = 2;
   but_edit_extra = 3;
   but_edit_nast  = 4;
   but_edit_plat  = 5;
   but_edit_bubb  = 6;
   but_edit_food  = 7;
   but_edit_item  = 8;
   but_grid       = 9;
   but_snap       = 10;
   but_load       = 11;
   but_save       = 12;
   but_quit       = 13;
   but_normal     = 14;
   but_extra      = 15;
   but_hurry_mi   = 16;
   but_hurry_pl   = 17;
   but_skel_mi    = 18;
   but_skel_pl    = 19;
   but_bubsp_mi   = 20;
   but_bubsp_pl   = 21;
   but_trp_mi     = 22;
   but_trp_pl     = 23;
   but_sbw_mi     = 24;
   but_sbw_pl     = 25;
   but_sbf_mi     = 26;
   but_sbf_pl     = 27;
   but_sbl_mi     = 28;
   but_sbl_pl     = 29;
   but_nas_scr_mi  = 30;
   but_nas_scr_pl  = 31;
   but_nas_spd_mi  = 32;
   but_nas_spd_pl  = 33;
   but_nastie1    = 34;
   but_nastie2    = 35;
   but_nastie3    = 36;
   but_nastie4    = 37;
   but_nastie5    = 38;
   but_nastie6    = 39;
   but_nastie7    = 40;
   but_nas_t_mi   = 41;
   but_nas_t_pl   = 42;
   but_nas_nums   = 43;
   but_nas_way    = 44;

   but_nas_x_mi   = 45;
   but_nas_x_pl   = 46;
   but_nas_y_mi   = 47;
   but_nas_y_pl   = 48;
   but_nas_d_mi   = 49;
   but_nas_d_pl   = 50;
   but_show_all   = 51;
   but_copy_to_plt   = 52;
   but_copy_to_bub   = 53;
   but_exit_none     = 54;
   but_exit_all      = 55;
   but_exit_up       = 56;
   but_exit_down     = 57;
   but_cls           = 58;
   but_cls_plat      = 59;
   but_cls_bub       = 60;
   but_do_line       = 61;
   but_do_fill       = 62;
   but_do_arrows     = 63;
   but_box           = 64;
   but_box_fill      = 65;
   but_circle        = 66;
   but_circle_fill   = 67;
   but_norm          = 68;
   but_cpy_map       = 69;
   but_pas_map       = 70;
   but_origgraph     = 71;

//but_graphics
   bg_l_arrow    = 0;
   bg_r_arrow    = 1;
   bg_normal     = 2;
   bg_extra      = 3;
   bg_nastie     = 4;
   bg_platform   = 5;
   bg_bubble     = 6;
   bg_food       = 7;
   bg_item       = 8;
   bg_grid       = 9;
   bg_snap       = 10;
   bg_nast_nums  = 11;
   bg_dec_val    = 12;
   bg_inc_val    = 13;
   bg_arrow_nas  = 14;
   bg_load       = 15;
   bg_save       = 16;
   bg_quit       = 17;
   bg_reset      = 18;
   bg_clear      = 19;
   bg_plat       = 20;
   bg_bub        = 21;
   bg_fill       = 22;
   bg_line       = 23;
   bg_cls        = 24;
   bg_paste      = 25;
   bg_cancel     = 26;
   bg_yes        = 27;
   bg_no         = 28;
   bg_test       = 29;
   bg_drop       = 30;
   bg_stop       = 31;
   bg_pause      = 32;
   bg_1          = 33;
   bg_2          = 34;
   bg_3          = 35;
   bg_4          = 36;
   bg_5          = 37;
   bg_6          = 38;
   bg_7          = 39;
   bg_box        = 40;
   bg_show_all   = 41;
   bg_exit_none  = 42;
   bg_exit_all   = 43;
   bg_exit_up    = 44;
   bg_exit_down  = 45;
   bg_box_un        = 46;
   bg_circle_un     = 47;
   bg_circle_fill   = 48;
   bg_draw_norm     = 49;
   bg_copy          = 50;
   bg_origgraph     = 51;


//bubble max
   max_sp_bubs = 15; //maximum to allow on screen

//block button graphics for draw
   block_but_pl = 583;
   block_but_bu = 91;

//Sprite Cursors
   big_csr_sp = 400; //Sprites
   big_csr_fd = 416; //Food
   big_csr_it = 408; //Items

   crs_w = 424; //white
   crs_r = 432; //red
   crs_b = 440; //blue
   crs_g = 448; //green
   crs_c = 456; //cyan
   crs_y = 464; //yellow
   crs_p = 472; //purple
   crs_br = 482; //brown
//display array

   dis_ht = 0; //hurry
   dis_sk = 1; //skel
   dis_bt = 6; //bubbled time
   dis_bs = 2; //bub speed
   dis_sw = 3; //water
   dis_sf = 4; //fire
   dis_sl = 5; //light
   dis_bn = 7; //bub num
   dis_bsp = 8;//bub speed
   dis_fx = 9;   //food coords
   dis_fy = 10;
   dis_ix = 11;  //item coords
   dis_iy = 12;

   act_sm_loc = 10; //where the gfx blocks start from
   act_bg_loc = 11; //big side blocks

GLOBAL

//FPG File pointers
    blocksfile;
//    platdata;
    sprites;
    fooditems;
    cursor_id;

//hardness map file pointers
    plat_map;
    bubble_map;

    ed_spr;       //FPG pointer
    font_ed;      //editor
    checkerboard; //TF checker board
    realgraphics; //TF platform real graphics
    grid_snap;    //Snap to drid when placing items, food or sprites
    edit_what;    //Sprites, plat, bubble
    cursor_awake;

    buttons_onscreen; //Number of buttons on screen

    cursor_type; //block, line, fill, food, item, sprite
    cursor_x;
    cursor_y;

    do_new_level;

    cursor_what;    //sprite, block, bubble, item, food
    cur_draw_block; //curent platform/bubble block
    cur_spr;         //current sprite selected
    cur_spr_arr_loc; //current sprite location in the baddie array
    dis_nast_nums;   //diplay the nastie numbers over the sprites
    dis_all_edit_spr;//display nasties, food and items on all edit windows
    dis_arr_spr;     //display nastie direction arrows above their heads, useful for pupul and invader
    block_x;         //screen draw hardness map draw location
    block_y;
    block_x_dis;  //screen draw location display +1 to show number of the block
    block_y_dis;
    exit_editor;

    bubble_frame;
    bubble_speed;
    bubble_rate;
    Bub_add;

    sm_block_grf;
    bg_block_grf;

//font file pointers
    font_s;       //silver
    font_r;       //red
    font_b;       //blue
    font_g;       //gold
    font_gr;      //green
    font_n;       //numbers for level

//level counters
    act_level = 0;          //actual level for arrays of sprites etc
    cur_level = 1;          //draw screen level counter
    level_type;
    test1;


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

STRUCT baddies[num_levels*7]
    mtype;
    mdelay;
    mx;
    my;
    dir;
END;

STRUCT buttons[but_scr]
  x_loc;
  y_loc;
  b_event; //event to do when the button is pressed
  b_graph; //grahic for the button
  b_type;  //type - click once, toggle, group
  b_group;
  key_p;
END =
11*b_bl_size, 5*b_bl_size, but_level_dn, bg_l_arrow, bt_click_once, 0 ,_pgdn, // level down
12*b_bl_size, 5*b_bl_size, but_level_up, bg_r_arrow, bt_click_once, 0 ,_pgup,  // level up
176,97,but_edit_nast, bg_nastie, bt_group, grp_edit_win, _f1,            // edit nasties
229,97,but_edit_plat, bg_platform, bt_group, grp_edit_win, _f2,          // edit platforms
292,97,but_edit_bubb, bg_bubble, bt_group, grp_edit_win, _f3,            // edit
337,97,but_edit_food, bg_food, bt_group, grp_edit_win, _f4,              // edit
370,97,but_edit_item, bg_item, bt_group, grp_edit_win, _f5,              // edit
21*b_bl_size+8, 22*b_bl_size, but_grid, bg_grid, bt_toggle, 0, _f7,            //grid display

25*b_bl_size, 20*b_bl_size+1, but_snap,bg_snap, bt_toggle, 0, _f8,             //snap to grid
11*b_bl_size , 3*b_bl_size, but_load, bg_load, bt_click_once, 0 ,_f9,         //load data
13*b_bl_size,  3*b_bl_size, but_save, bg_save, bt_click_once, 0 ,_f10,        //save changes
25*b_bl_size,  3*b_bl_size, but_quit, bg_quit, bt_click_once, 0 ,_f12,        //quit editor
3*b_bl_size , 3*b_bl_size, but_normal, bg_normal, bt_group, grp_levels ,_c,  //normal levels
6*b_bl_size+1,  3*b_bl_size, but_extra, bg_extra, bt_group, grp_levels ,_v,  //extra levels
7*b_bl_size , 7*b_bl_size, but_hurry_mi, bg_dec_val, bt_click_hold, 0 ,_h,    //hurry dec
8*b_bl_size , 7*b_bl_size, but_hurry_pl, bg_inc_val, bt_click_hold, 0 ,_j,    //hurry inc
7*b_bl_size , 8*b_bl_size, but_skel_mi, bg_dec_val, bt_click_hold, 0 ,_k,     //skel dec
8*b_bl_size , 8*b_bl_size, but_skel_pl, bg_inc_val, bt_click_hold, 0 ,_l,     //skel inc
7*b_bl_size , 10*b_bl_size, but_bubsp_mi, bg_dec_val, bt_click_once, 0 ,_b,   //bubble speed dec
8*b_bl_size , 10*b_bl_size, but_bubsp_pl, bg_inc_val, bt_click_once, 0 ,_n,   //bubble speed inc
7*b_bl_size , 14*b_bl_size, but_trp_mi, bg_dec_val, bt_click_hold, 0 ,_t,        //trap time dec
8*b_bl_size , 14*b_bl_size, but_trp_pl, bg_inc_val, bt_click_hold, 0 ,_y,        //trap time inc
7 , 19*b_bl_size, but_sbw_mi, bg_l_arrow, bt_click_once, 0 ,_z,                  //special bub water dec
23, 19*b_bl_size, but_sbw_pl, bg_r_arrow, bt_click_once, 0 ,_x,                  //special bub water inc
7 + 3*b_bl_size, 19*b_bl_size, but_sbf_mi, bg_l_arrow, bt_click_once, 0 ,_a,     //special bub fire dec
23+ 3*b_bl_size, 19*b_bl_size, but_sbf_pl, bg_r_arrow, bt_click_once, 0 ,_s,     //special bub fire inc
7 + 6*b_bl_size, 19*b_bl_size, but_sbl_mi, bg_l_arrow, bt_click_once, 0 ,_q,     //special bub lightning dec
23+ 6*b_bl_size, 19*b_bl_size, but_sbl_pl, bg_r_arrow, bt_click_once, 0 ,_w,     //special bub lightning inc

8*b_bl_size , 22*b_bl_size, but_nas_scr_mi, bg_dec_val, bt_click_once, 0 ,_t,    //nasties on screen dec
9*b_bl_size , 22*b_bl_size, but_nas_scr_pl, bg_inc_val, bt_click_once, 0 ,_y,    //nasties on screen inc
8*b_bl_size , 23*b_bl_size, but_nas_spd_mi, bg_dec_val, bt_click_once, 0 ,_t,    //nasties speed dec
9*b_bl_size , 23*b_bl_size, but_nas_spd_pl, bg_inc_val, bt_click_once, 0 ,_y,    //nasties speed inc

11*b_bl_size, 22*b_bl_size, but_nastie1, bg_1, bt_group, grp_nasties, _c_end,    // edit nastie 1
12*b_bl_size, 22*b_bl_size, but_nastie2, bg_2, bt_group, grp_nasties, _c_down,   // edit nastie 2
13*b_bl_size, 22*b_bl_size, but_nastie3, bg_3, bt_group, grp_nasties, _c_pgdn,   // edit nastie 3
14*b_bl_size, 22*b_bl_size, but_nastie4, bg_4, bt_group, grp_nasties, _c_left,   // edit nastie 4
15*b_bl_size, 22*b_bl_size, but_nastie5, bg_5, bt_group, grp_nasties, _c_center, // edit nastie 5
16*b_bl_size, 22*b_bl_size, but_nastie6, bg_6, bt_group, grp_nasties, _c_right,  // edit nastie 6
17*b_bl_size, 22*b_bl_size, but_nastie7, bg_7, bt_group, grp_nasties, _c_home,   // edit nastie 7

18*b_bl_size ,24*b_bl_size, but_nas_t_mi, bg_l_arrow, bt_click_once, 0 ,_control,   //nastie type dec
19*b_bl_size, 24*b_bl_size, but_nas_t_pl, bg_r_arrow, bt_click_once, 0 ,_alt,       //nastie type inc

19*b_bl_size, 22*b_bl_size, but_nas_nums, bg_nast_nums, bt_toggle, 0 ,_i,           //nastie number display

18*b_bl_size ,25*b_bl_size, but_nas_x_mi, bg_dec_val, bt_click_hold, 0 ,0,   //nastie x dec
19*b_bl_size, 25*b_bl_size, but_nas_x_pl, bg_inc_val, bt_click_hold, 0 ,0,       //nastie x inc
18*b_bl_size ,26*b_bl_size, but_nas_y_mi, bg_dec_val, bt_click_hold, 0 ,0,   //nastie y dec
19*b_bl_size, 26*b_bl_size, but_nas_y_pl, bg_inc_val, bt_click_hold, 0 ,0,       //nastie y inc
18*b_bl_size ,27*b_bl_size, but_nas_d_mi, bg_dec_val, bt_click_hold, 0 ,0,   //nastie delay dec
19*b_bl_size, 27*b_bl_size, but_nas_d_pl, bg_inc_val, bt_click_hold, 0 ,0,       //nastie delay inc
20*b_bl_size, 22*b_bl_size,but_show_all, bg_show_all, bt_toggle, 0, 0,           // show all edit sprites
27*b_bl_size+10, 12*b_bl_size, but_copy_to_plt, bg_plat, bt_click_once, 0 ,0,      // copy bubble map to plat
29*b_bl_size+10, 12*b_bl_size, but_copy_to_bub, bg_bub, bt_click_once, 0 ,0,       // copy plat map to bubble

27*b_bl_size+6,  14*b_bl_size, but_exit_none, bg_exit_none, bt_click_once, 0 ,0,   // no exits
29*b_bl_size+10, 14*b_bl_size, but_exit_all, bg_exit_all, bt_click_once, 0 ,0,     // all exits
27*b_bl_size+6,  14*b_bl_size+14, but_exit_up, bg_exit_up, bt_click_once, 0 ,0,    // exits up
29*b_bl_size+10, 14*b_bl_size+14, but_exit_down, bg_exit_down, bt_click_once, 0 ,0,// exits down

27*b_bl_size,   19*b_bl_size, but_cls,      bg_cls,  bt_click_once, 0 ,0,      // clear screen
28*b_bl_size+9, 19*b_bl_size, but_cls_plat, bg_plat, bt_click_once, 0 ,0,      // clr platform map
30*b_bl_size+9, 19*b_bl_size, but_cls_bub,  bg_bub,  bt_click_once, 0 ,0,      // clr bubble map
18*b_bl_size, 22*b_bl_size, but_do_arrows, bg_arrow_nas, bt_toggle, 0 ,0,    // nastie number display

27*b_bl_size, 7*b_bl_size, but_norm, bg_draw_norm, bt_group, grp_draw ,0,      // normal draw
28*b_bl_size, 7*b_bl_size, but_do_line, bg_line, bt_group, grp_draw ,0,        // line tool
29*b_bl_size, 7*b_bl_size, but_do_fill, bg_fill, bt_group, grp_draw ,0,        // fill

30*b_bl_size, 7*b_bl_size, but_box, bg_box_un, bt_group, grp_draw ,0,          // box unfilled
31*b_bl_size, 7*b_bl_size, but_box_fill, bg_box, bt_group, grp_draw ,0,        // box filled

32*b_bl_size, 7*b_bl_size, but_circle, bg_circle_un, bt_group, grp_draw ,0,        // circle
33*b_bl_size, 7*b_bl_size, but_circle_fill, bg_circle_fill, bt_group, grp_draw ,0, // circle filled

18*b_bl_size, 3*b_bl_size, but_cpy_map, bg_copy,  bt_click_once, 0 ,0,        // take copy of map
20*b_bl_size, 3*b_bl_size, but_pas_map, bg_paste, bt_click_once, 0 ,0,        // paste copy of map
22*b_bl_size+8, 22*b_bl_size, but_origgraph, bg_origgraph, bt_toggle, 0, _f7        //show game block graphics
;

button_gfx[num_buttons] =
4,     //right level arrow
7,     //left level arrow
25,    //normal levels
28,    //extra levels
37,    //Nastie Edit
31,    //Platform Edit
34,    //Bubble Edit
40,    //Food Edit
43,    //Item Edit
49,    //Grid
52,    //Snap to grid
73,    //Display Nastie numbers
76,    //increase value +
79,    //decrease value -
189,   //Show Nastie direction arrows
109,   //Load
112,   //Save
115,   //Quit
118,   //Reset level data
119,   //Clear level data
124,   //Plat (copy to)
127,   //Bub (copy to)
130,   //Fill with
133,   //Line
136,   //Clear Screen
142,   //Paste
145,   //Cancel
148,   //Yes
151,   //No
154,   //Test
157,   //Drop
160,   //Stop
163,   //Pause
166,   //1
169,   //2
172,   //3
175,   //4
178,   //5
181,   //6
184,   //7
195,   //Draw a box - unfilled
204,   //All - Show all sprites (food, item, nasties
207,   //exit none
210,   //exit both
213,   //exit up
216,   //exit down

192,   //Draw a box - filled
198,   //Draw a circle - unfilled
201,   //Draw a circle - filled
82,    //Cursor block draw
139,   //Copy
221;   //Orginal Graphics to editor window


//Which button is selected in the button groups
Button_Group_Sel[6];

plat_cursors[4] = crs_br, crs_r, crs_b, crs_w, crs_p;    //plat
bub_cursors [9] = crs_br, crs_r, crs_b, crs_g, crs_c, crs_y, crs_w, crs_w, crs_w;
dis[20];
dis_spr[4];

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

Nast_names [8] = "bubba-Skel", "Zen Chan", "Mighta", "Bubba", "Pulpul", "Banabou","Hidegonsu", "Drunk", "Invader";

mse_graphs [4] =
mousepointer,
mousehidden,
mousefill,
mouseother;

LOCAL
   but_group_sel;
   b_clicked;
   b_selected;
   kill;

BEGIN
   set_mode (m640x480);              //Screen Res
   set_fps (60,0);                    //Frames per second

//uesd for the fill and draw routines, which use the screen for a buffer
   define_region (1, cpy_drw_x, cpy_drw_y, 28, 26); //drawing
   define_region (2, cpy_buf_x, cpy_buf_y, 28, 26); //copy

//Load Graphics
   blocksfile = load_fpg(blocksfloc); //blocks graphics + screen area
   sprites    = load_fpg(sprfloc);    //sprite data
   ed_spr     = load_fpg(editfloc);

//Load Bubble Bobble Pallette
   load_pal (palfloc);

//load fonts
   font_s     = load_fnt(silverfnt);  //silver font load
   font_g     = load_fnt(goldfnt);    //gold font load
   font_ed    = load_fnt(edit_fnt);     //Editor

//INIT Editor
//whole main structure of the setup needs sorting out*************
   act_level = 0;          //actual level for arrays of sprites etc
   cur_level = 1;          //draw screen level counter

   exit_editor = FALSE;

   edit_what = spr_edit;      //edit tab to editing sprites
   level_type = lev_normal;   //levels normal/extended
   dis_nast_nums = FALSE;     //diplay the nastie numbers over the sprites
   dis_all_edit_spr = FALSE;  //display nasties, food and items on all edit windows
   dis_arr_spr = FALSE;     //display nastie direction arrows above their heads, useful for pupul and invader

   checkerboard = FALSE; //TF checker board
   realgraphics = FALSE; //TF platform real graphics

   load_levels(); //Load the level data

   write(font_g,16,00,0," BUBBLE BOBBLE LEVEL EDITOR V2.1");
   write(font_s,00,16,0,"$ DIB-SOFT  2004");

   write(font_s,00,88,3,"LEVEL:");
   write_int(font_s,16*6,88,3,&cur_level);
   write_int(0,18*edtxtsz_x+4,8*edtxtsz_y+8,4,&cur_level);

   put_screen (ed_spr, 1);

   mouse_pointer();  //mouse sprite
   cursor();         //editor window cursor

   food_sprite();
   item_sprite();
   nastie_sprite(0);
   nastie_sprite(1);
   nastie_sprite(2);
   nastie_sprite(3);
   nastie_sprite(4);
   nastie_sprite(5);
   nastie_sprite(6);

   write_int(0,187,329,3,&cursor_x);       //Cursor Coords
   write_int(0,186+30,329,3,&cursor_y);
   write_int(0,292,329,3,&block_x_dis);    //screen draw position
   write_int(0,292+30,329,3,&block_y_dis);

   //edit_what =plat_edit;
   update_editor_scr();
   Dis_Buttons();
   scrtext();

   //timer [0] = 0; //delay key repeats for click hold buttons

   LOOP

      IF (exit_editor == TRUE) BREAK; END

        IF (key(_1))
          do_new_level = 10;
        END
        IF (key(_2))
          do_new_level = 20;
        END
        IF (key(_3))
          do_new_level = 30;
        END
        IF (key(_4))
          do_new_level = 40;
        END
        IF (key(_5))
          do_new_level = 50;
        END
        IF (key(_6))
          do_new_level = 60;
        END
        IF (key(_7))
          do_new_level = 70;
        END
        IF (key(_8))
          do_new_level = 80;
        END
        IF (key(_9))
          do_new_level = 90;
        END

       IF (do_new_level != 0)
          act_level = do_new_level-1;
          cur_level = do_new_level;
          update_editor_scr();
          update_cur_sprites();
          do_new_level = 0;

       END

      FRAME;

   END
   let_me_alone();
   Exit("DIBSOFT 2004 - This Program is Freeware", 0);

END

//Load levels into arrays
//also hardness maps - plat n bubble
PROCESS load_levels()
BEGIN
   IF (level_type == lev_normal)   //levels normal
      plat_map = load_map (p_map1);
      bubble_map = load_map (p_bub1);
      load (level_n, OFFSET levels);
      load (bad_n, OFFSET Baddies);
   ELSE
      plat_map = load_map (p_map2);
      bubble_map = load_map (p_bub2);
      load (level_e, OFFSET levels);
      load (bad_e, OFFSET Baddies);
   END
END

PROCESS Save_levels()
BEGIN
   IF (level_type == lev_normal)   //levels normal

      save_map (0, plat_map, p_map1);
      save_map (0, bubble_map, p_bub1);
      save (level_n, OFFSET levels, SIZEOF (levels));
      save (bad_n, OFFSET Baddies, SIZEOF (Baddies));
   ELSE
      save_map (0, plat_map, p_map2);  //Save hardness plat map
      save_map (0, bubble_map, p_bub2);//Save hardness bubble map
      save (level_e, OFFSET levels, SIZEOF (levels)); //level data
      save (bad_e, OFFSET Baddies, SIZEOF (Baddies)); //baddie data

   END
END

//Sprite for editing placings on screen
PROCESS nastie_sprite(sprnum)
PRIVATE
   act_spr_loc;
   act_spr_num;
BEGIN
   file = ed_spr;
   Nastie_Anim(sprnum); //small nasties display on screen

   LOOP
      act_spr_loc = spr_nums +(sprnum*2); //graphic

      act_spr_num = sprnum + act_level*7;

      x = baddies[act_spr_num].mx + x_draw_bl-16;

   //hide the sprite if nast number is higher than the amount allowed on screen
   //or if ALL button is not selected and nastie tab is not selected
   IF (levels[act_level].badnum >= sprnum+1 AND (dis_all_edit_spr == TRUE OR edit_what == spr_edit))
      y = prop_y - baddies[act_spr_num].my+y_draw_bl;
   ELSE
      y = 500;
   END

    //display the current selected sprite to the front
    IF (cur_spr == sprnum)
       z = -51;
    ELSE
       z = 49;
    END

   IF (edit_what == spr_edit AND cur_spr == sprnum)
      IF (cursor_awake == true AND mouse.left)
            baddies[act_spr_num].mx = cursor_x;
            baddies[act_spr_num].my = cursor_y;
            //update display
            update_cur_sprites();
      END
         IF (dis_nast_nums == TRUE)    //diplay the nastie numbers over the sprites
            GRAPH = act_spr_loc;
         ELSE
            GRAPH = no_nast_nums+1;
         END
   ELSE
         IF (dis_nast_nums == TRUE)    //diplay the nastie numbers over the sprites
            GRAPH = act_spr_loc+1;
         ELSE
            GRAPH = no_nast_nums;
         END
   END

   FRAME;

   END
END

//Small screen nastie animations
PROCESS Nastie_Anim(sprnum)
PRIVATE
    an_delay;   //animation delay
    an_start;   //animation start frame
    an_frames;  //number of animation frames
    fcount;     //frame count
    nas_type;   //type of nastie

    new_monster_type; //monster type changed
    new_level;        //level changed;

    act_spr_num;
BEGIN
    file = sprites;

    act_spr_num = sprnum + act_level*7;

    nas_type =  baddies[act_spr_num].mtype;
    an_frames = baddie_anims[nas_type].num_frames;
    an_start  = baddie_anims[nas_type].astart;

    size = 50; //half size as editor screen is half the normal size

    fcount = an_start;

    z = 50;
    new_level = act_level;
    new_monster_type = nas_type; //check to see if monster type has changed

    Small_Dir_Arrow();

    REPEAT

    x = father.x+7;

    IF (levels[act_level].badnum >= sprnum+1) //hides the sprite if total on screen is less than this sprite
         y = father.y+8;
    ELSE
         y = 500;
    END

    //display the current selected sprite to the front
    //but behind the help sprite numbers
    IF (cur_spr == sprnum)
       z = -50;
    ELSE
       z = 50;
    END

    IF (new_level != act_level OR baddies[act_spr_num].mtype != nas_type)
      act_spr_num = sprnum + act_level*7; //locate new nastie sprite array location

      nas_type =  baddies[act_spr_num].mtype;         //nastie type
      an_frames = baddie_anims[nas_type].num_frames;  //get number of frames
      an_start  = baddie_anims[nas_type].astart;      //get frame to start with
      fcount = an_start; //initialise current frame to display

      new_level = act_level; //reset change counters
      new_monster_type = nas_type;

      GRAPH = fcount;
      an_delay = 0; //reset animation delay

    END

    IF (baddies[act_spr_num].dir == 1)
        FLAGS = 1;
    ELSE
        FLAGS = 0;
    END

    GRAPH = fcount;

    an_delay++;

    IF (an_delay > 10)
       an_delay = 0;
       fcount++; //change current frame

       IF (fcount => an_start + an_frames) //frame number over end of animation
          fcount = an_start; //reset animation
       END
    END

    FRAME;

    UNTIL (kill == TRUE)
END

PROCESS Small_Dir_Arrow()
BEGIN
   file = ed_spr;
   GRAPH = dir_sprite_sm;

   LOOP
      x = father.x;
      IF (dis_arr_spr == TRUE)     //display nastie direction arrows above their heads, useful for pupul and invader
         y = father.y -12;
      ELSE
         y = 500;
      END
      flags = father.flags;
      FRAME;
   END

END



PROCESS Nastie_Anim_big()
PRIVATE
    an_delay;   //animation delay
    an_start;   //animation start frame
    an_frames;  //number of animation frames
    fcount;     //frame count
    nas_type;   //type of nastie

    new_monster_type; //monster type changed
    new_level;        //level changed;

    mouse_release; //to check when the mouse is released

BEGIN
    file = sprites;

    nas_type =  baddies[cur_spr_arr_loc].mtype;
    an_frames = baddie_anims[nas_type].num_frames;
    an_start  = baddie_anims[nas_type].astart;

    fcount = an_start;
    x = b_bl_size*12;
    y = b_bl_size*25;
    GRAPH = an_start;

    z = 50;
    new_level = act_level;
    new_monster_type = nas_type; //check to see if monster type has changed
    mouse_release = TRUE; //to check when the mouse is released

    Dir_Arrow(x,y); //direction of sprite

    REPEAT

    IF (new_level != act_level OR baddies[cur_spr_arr_loc].mtype != nas_type)

      nas_type =  baddies[cur_spr_arr_loc].mtype;
      an_frames = baddie_anims[nas_type].num_frames;  //get number of frames
      an_start  = baddie_anims[nas_type].astart;      //get frame to start with
      fcount = an_start; //initialise current frame to display

      new_level = act_level; //reset change counters
      new_monster_type = nas_type;

      GRAPH = fcount;
      an_delay = 0; //reset animation delay

    END

    //Check for click on sprite to change direction of it

    IF (collision (type mouse) AND mouse.left OR key(_space))
      IF (mouse_release == TRUE)
        mouse_release = FALSE;
        IF (baddies[cur_spr_arr_loc].dir == 1)
            baddies[cur_spr_arr_loc].dir = 2;
        ELSE
            baddies[cur_spr_arr_loc].dir = 1;
        END
      END
    ELSE
        mouse_release = TRUE; //to check when the mouse is released
    END

    //Mirror the sprite to display the movement left
    IF (baddies[cur_spr_arr_loc].dir == 1)
        FLAGS = 1;
    ELSE
        FLAGS = 0;
    END

    GRAPH = fcount;

    IF (edit_what == spr_edit) //only animate if editing the sprites
    an_delay++;

      IF (an_delay > 10)
         an_delay = 0; //reset animation delay
         fcount++;     //change current frame

         IF (fcount => an_start + an_frames) //frame number over end of animation
          fcount = an_start; //reset animation
         END
      END
    END

    FRAME;

    UNTIL (kill == TRUE)
END

PROCESS Dir_Arrow(x,y)
BEGIN
   file = ed_spr;
   GRAPH = dir_sprite;
   y+= 24;

   LOOP
      flags = father.flags;
      FRAME;
   END
END

PROCESS food_sprite()
BEGIN
   file = ed_spr;
   LOOP

      x = (levels[act_level].foodx)+x_draw_bl-15;

      //Hide the sprite if the ALL button is not selected
      IF (dis_all_edit_spr == TRUE OR edit_what == food_edit OR edit_what == item_edit)
         y = prop_y-levels[act_level].foody+y_draw_bl;
      ELSE
         y = 500;
      END

      IF (edit_what == food_edit)
         GRAPH = fd_gph;
         IF (cursor_awake == true AND mouse.left)
            levels[act_level].foodx = cursor_x;
            levels[act_level].foody = cursor_y;

            dis[dis_fx] = levels[act_level].foodx; //update screen counters
            dis[dis_fy] = levels[act_level].foody;
         END

      ELSE
         GRAPH = fd_gph+1;
      END

   FRAME;

   END
END

PROCESS item_sprite()
BEGIN
   file = ed_spr;
   LOOP
      x = (levels[act_level].itemx)+x_draw_bl-16;

      //Hide the sprite if the ALL button is not selected
      IF (dis_all_edit_spr == TRUE OR edit_what == item_edit OR edit_what == food_edit)
         y = prop_y-(levels[act_level].itemy)+ y_draw_bl;
      ELSE
         y = 500;
      END

      IF (edit_what == item_edit)
         GRAPH = it_gph;
         IF (cursor_awake == true AND mouse.left)
            levels[act_level].itemx = cursor_x;
            levels[act_level].itemy = cursor_y;
            dis[dis_ix] = levels[act_level].itemx; //update screen counters
            dis[dis_iy] = levels[act_level].itemy;

         END
      ELSE
         GRAPH = it_gph+1;
      END

   FRAME;

   END
END

PROCESS mouse_pointer()
PRIVATE
   but_sel;
   map_cpy_id; //copy of edited map
   draw_id1;   //gets the id of the shape on screen been drawn
   draw_id2;   //the draw on the screen copy
   draw_what;  //what to draw on the map copy
   x_dr_st;       //draw from x coord
   y_dr_st;       //draw from y coord

   x_bl_st;       //block draw from x xblock coord
   y_bl_st;       //blockdraw from y yblock coord

   button_rel; //mouse button released

BEGIN
   FILE = ed_spr;
   GRAPH = mse_graphs[mg_pointer];
   z = -512;
   cursor_awake = TRUE;

//cursor for edit window
   LOOP

   x  = mouse.x;
   y  = mouse.y;

   IF (Mouse_bounds()== TRUE)
      Update_Block_cursor(); //Updates the cursor coords

      IF (Button_Group_Sel[grp_draw] != 0 AND (edit_what == plat_edit OR edit_what == bub_edit)) //DRAW Line, Fill, Circle, Box

         but_sel = Button_Group_Sel[grp_draw];

         //If key esc hit when drawing line/box/circle - go back to draw single block pen
         IF (key(_esc))
            Button_Group_Sel[grp_draw] = 0;

            IF (draw_id1 != 0)
               delete_draw(draw_id1);
               draw_id1 = 0;
               but_sel = 0;
            END
         END

         IF (but_sel == 2) //Draw Graphic to mouse graphic
            GRAPH = mse_graphs[mg_fill];
         ELSE
            GRAPH = mse_graphs[mg_other];
         END

         IF (grid_snap == TRUE) //Grid Snap for Mouse insead of cursor
            x = ((mouse.x/8)*8);
            y = ((mouse.y/8)*8);
         END

         //FILL
         IF (mouse.left AND but_sel == 2)
            Copy_to_screen(cpy_drw_x, cpy_drw_y);
            //mmfill (block_x + cpy_drw_x, block_y + cpy_drw_y, cur_draw_block);
            FRAME;

            Copy_From_screen(1); //region no 1 = draw buffer
            update_editor_scr();
            REPEAT
               FRAME;
            UNTIL (mouse.left == FALSE)

         END

         //Draw Shapes on screen
         IF (mouse.left AND but_sel != 0 aND draw_id1 == 0 AND but_sel != 2)
               x_dr_st = x;
               y_dr_st = y;
               x_bl_st = block_x;       //block draw from x xblock coord
               y_bl_st = block_y;       //blockdraw from y yblock coord

               SWITCH (but_sel)
               CASE 1:
                  draw_what = drw_line;
               END
               CASE 3:
                   draw_what = drw_rect;
               END
               CASE 4:
                  draw_what = drw_rectfill;
               END
               CASE 5:
                  draw_what = drw_circle;
               END
               CASE 6:
                  draw_what = drw_circlefill;
               END
               END

               //Draw shape over the screen editor window
               draw_id1 = draw (draw_what, 10, drw_opacity,0, x_dr_st, y_dr_st, x, y);

               REPEAT
                  FRAME;
               UNTIL (mouse.left == FALSE)

         ELSE
            IF (draw_id1 !=0)
               //moves the other end of the shape around
               move_draw (draw_id1, 15, drw_opacity, x_dr_st, y_dr_st, x, y);
               //until user clicks the left mouse to do a draw
               IF (mouse.left)
                  delete_draw(draw_id1); //get rid of editor window line/circle,box
                  draw_id1 = 0;
                  but_sel = 0;
                  Button_Group_Sel[grp_draw] = 0;

                  //copy map to the screen
                  Copy_to_screen(cpy_drw_x, cpy_drw_y);

                  //Draw to copy screen buffer
                  draw_id2 = draw (draw_what, cur_draw_block, drw_opacity,0,cpy_drw_x + x_bl_st,cpy_drw_y + y_bl_st, cpy_drw_x + block_x,cpy_drw_y + block_y);
                  FRAME;

                  //Copy_From_screen
                  Copy_From_screen(1); //region no 1 = draw buffer

                  //delete small draw object on the screen used to update the map
                  delete_draw(draw_id2);

                  update_editor_scr();

               END
            END

         END

      ELSE //NORMAL Block Draw, Sprites, Food, Item

         IF (cursor_awake == FALSE)
            signal (cursor_id, s_wakeup);
            cursor_awake = TRUE;
         END

         GRAPH = mse_graphs[mg_hide];

         //Adjustments to data to allow proper coords of arcade machine
         SWITCH (edit_what)
            CASE food_edit:
             cursor_x = cursor_x +15;
             cursor_y = 208 - cursor_y;
            END
            CASE item_edit, spr_edit:
             cursor_x = cursor_x +16;
             cursor_y = 208 - cursor_y;
            END
         END

      END

   ELSE  //mouse bounds
          GRAPH = mse_graphs[mg_pointer];

      IF (cursor_awake == TRUE)
          signal (cursor_id, s_sleep);
          cursor_awake = FALSE;
      END
   END

      FRAME;
   END
END



PROCESS Copy_to_screen(x_st, y_st)
PRIVATE
   x_count;
   y_count;
   x_loc;
   y_loc;
   block_to_do;
   map_to_edit;
BEGIN

   x_loc = act_level*28;
   y_loc = 0;
   x = x_st;
   y = y_st;

   IF (edit_what == bub_edit) //Copy only blocks from bubble map
      map_to_edit = bubble_map;
   ELSE
      map_to_edit = plat_map;
   END

   FOR (y_count = 0; y_count < blocks_dwn; y_count++)
      FOR (x_count = 0; x_count < blocks_acr; x_count++)

          block_to_do = map_get_pixel (0, map_to_edit, x_loc, y_loc); //get block colour
          put_pixel (x, y,block_to_do); //To the screen

          x_loc++;
          x++;
      END
      x_loc = act_level*28;
      x = x_st; //reset x location back to the start
      y_loc++;
      y++;

   END
END

PROCESS Copy_From_screen(region_no)
BEGIN
   //Copy_From_screen
   IF (edit_what == plat_edit)
       //Div function to copy the screen
       screen_copy(region_no, 0, plat_map, act_level*28, 0, 28, 26); //region 1
   END

   IF (edit_what == bub_edit)
       screen_copy(region_no, 0, bubble_map, act_level*28, 0, 28, 26); //region 1
   END
END


PROCESS Update_Block_cursor()
BEGIN
      cursor_x = mouse.x - ed_squ_x; //get proper coords relative to the editor window
      cursor_y = mouse.y - ed_squ_y;

      //Place sprites, food, items on a block
      IF (grid_snap == TRUE)
         cursor_x = block_x*8;
         cursor_y = block_y*8;
      END
      //find mouse location minus window x, divide by 8 to get the square
      block_x = (mouse.x - ed_squ_x)/8;
      block_y = (mouse.y - ed_squ_y)/8;

      //displaying what block we are on block_x and block_y used to draw to hardness map
      block_x_dis = block_x + 1;
      block_y_dis = block_y + 1;
END

//Checks to see if the mouse is in the level editor square
PROCESS Mouse_bounds()
BEGIN
   IF (mouse.x >= ed_squ_x AND mouse.x < ed_squ_x+ed_squ_sz_x AND
       mouse.y >= ed_squ_y AND mouse.y < ed_squ_y+ed_squ_sz_y)
       RETURN (TRUE);
   ELSE
       RETURN (FALSE);
   END

END

//Level editor square cursor
PROCESS cursor()
PRIVATE
   gfx_st;   //start frame
   anim_end;
   gfx_frm;  //current frame
   anim_del; //animation delay count
   anim_way;

   local_snap;     //for block and plat edit
   edit_last;      //dectecting change in edit
   curs_last;
BEGIN
   file = ed_spr;
   x = ed_squ_x;
   y = ed_squ_y;

   cursor_id = id;

      SWITCH (edit_what)
         CASE spr_edit:
            gfx_st= big_csr_sp;   //Sprite Edit
         END
         CASE food_edit:
            gfx_st= big_csr_fd;   //Food Edit
         END

         CASE item_edit:
            gfx_st = big_csr_it;   //Item Edit
         END
         CASE plat_edit:
            gfx_st = plat_cursors[cur_draw_block];
         END
         CASE bub_edit:
            gfx_st = bub_cursors[cur_draw_block];
         END
      END

      gfx_frm = gfx_st;     //current frame
      anim_end = gfx_st+7;
      anim_del = 0;         //animation delay count
      GRAPH = gfx_frm;

   LOOP
   //Snap to grid and
   //block draw
   IF (edit_last != edit_what OR curs_last != cur_draw_block)
      SWITCH (edit_what)
         CASE spr_edit:
            gfx_st= big_csr_sp;   //Sprite Edit
         END
         CASE food_edit:
            gfx_st= big_csr_fd;   //Food Edit
         END

         CASE item_edit:
            gfx_st = big_csr_it;   //Item Edit
         END
         CASE plat_edit:
            gfx_st = plat_cursors[cur_draw_block];
         END
         CASE bub_edit:
            gfx_st = bub_cursors[cur_draw_block];
         END
      END
      anim_way = 1; //forwards

      gfx_frm = gfx_st;     //current frame
      anim_end = gfx_st+7;
      anim_del = 0;         //animation delay count
   GRAPH = gfx_frm;

   END

   edit_last = edit_what;
   curs_last = cur_draw_block;

   IF (grid_snap == FALSE AND edit_what != plat_edit AND edit_what != bub_edit)
      x = mouse.x;
      y = mouse.y;
   ELSE
      //block edit/snap to grid
      x = (mouse.x/8)*8;
      y = (mouse.y/8)*8;
   END

   anim_del++;

   IF (anim_del >= 5)
       anim_del = 0;

       IF (anim_way == 1) //forwards
         gfx_frm++;

         IF (gfx_frm > anim_end)
            anim_way = 2;
            gfx_frm--;
         END
       ELSE
         gfx_frm--;
         IF (gfx_frm < gfx_st)
           anim_way = 1;
           gfx_frm++;
         END
       END

      //IF (gfx_frm > anim_end)
      //   gfx_frm = gfx_st;
      //END

      GRAPH = gfx_frm;
   END


   IF (mouse.left)
      IF (edit_what == plat_edit OR edit_what == bub_edit)
         put_block();
      END
   END

   IF (mouse.right)
      IF (edit_what == plat_edit OR edit_what == bub_edit)
         Remove_block();
      END
   END

   FRAME;

   END

END

//Block buttons for editing screen blocks
//2 graphic states - on or off
//uses a button group
PROCESS Block_Button(b_num, p_or_b)
PRIVATE
   gph_st;
   kill_when;
BEGIN
   file = ed_spr;

   IF (p_or_b == grp_plats)
      gph_st = block_but_pl + (b_num*2);
      kill_when = bub_edit; //kill process when bubble edit button pressed
   ELSE
      gph_st = block_but_bu + (b_num*2);
      kill_when = plat_edit;
   END

   GRAPH = gph_st+1;//darker coloured one

   IF (edit_what == plat_edit)
      x = 27*b_bl_size+(b_num*b_bl_size);
      y = 8*b_bl_size; //move next buttons down the screen
   ELSE
      IF (b_num <= 1)
         x = 27*b_bl_size+(b_num*b_bl_size);
         y = 8*b_bl_size; //move next buttons down the screen
      END

      IF (b_num >= 2 and b_num <= 6)
         x = 25*b_bl_size+(b_num*b_bl_size);
         y = 9*b_bl_size; //move next buttons down the screen
      END

      IF (b_num >= 6 and b_num <= 8)
         x = 21*b_bl_size+(b_num*b_bl_size);
         y = 10*b_bl_size; //move next buttons down the screen
      END

   END

   LOOP

   IF (collision (type mouse) AND mouse.left)
      Button_Group_Sel[p_or_b] = b_num; //platform of bubble group store this button as selected
      cur_draw_block = b_num; //which block to draw/cursor
   END

   IF (Button_Group_Sel[p_or_b] == b_num)
      cur_draw_block = b_num;
      GRAPH = gph_st; //selected graphic
   ELSE
      GRAPH = gph_st+1;   //none selected graphic
   END

      IF(edit_what == kill_when) BREAK; END

      FRAME;
   END
END


PROCESS Put_Block() //Put a block to the screen
PRIVATE
    x_loc;
    y_loc;
BEGIN
    IF (cur_draw_block == 0) //got the remove block
       Remove_Block();
       RETURN;
    END

    x_loc = act_level*28;
    x_loc += block_x;
    y_loc = block_y;

    IF (edit_what == plat_edit) //Platform Edit put Block
         IF (map_get_pixel (0, plat_map, x_loc, y_loc) != cur_draw_block)
            //Draw block to hardness map
            map_put_pixel (0, plat_map, x_loc, y_loc, cur_draw_block); //put block colour
            //Update the screen
            xput (ed_spr, ed_plat_hrd+(cur_draw_block-1), x_draw_bl+ (block_x*sm_block_size), y_draw_bl + (block_y*sm_block_size), 0, 100, 0, 0);
         END
    ELSE
         IF (map_get_pixel (0, bubble_map, x_loc, y_loc) != cur_draw_block)
            //Draw block to hardness map
            map_put_pixel (0, bubble_map, x_loc, y_loc, cur_draw_block); //put block colour
            //Update the screen
            xput (ed_spr, ed_plat_bub+(cur_draw_block-1), x_draw_bl+ (block_x*sm_block_size), y_draw_bl + (block_y*sm_block_size), 0, 100, 0, 0);
         END
    END
END

PROCESS Remove_block() //Removes a block and restores that squares background colour
PRIVATE
    x_loc;
    y_loc;
    del_block; //colour to delete the screen

BEGIN
     x_loc = act_level*28;
     x_loc += block_x;
     y_loc = block_y;

     IF (checkerboard == TRUE) //Checker board on the platform editor screen
         del_block = del_grp; //dark;
         IF (block_y MOD 2 == 0)
            IF (block_x MOD 2 == 0)
               del_block = del_grp+1;
            END
         ELSE
            IF (block_x MOD 2 == 1)
               del_block = del_grp+1;
            END
         END

     ELSE
         del_block = del_grp;
     END

     IF (edit_what == plat_edit)
         IF (map_get_pixel (0, plat_map, x_loc, y_loc) != 0)
            //Remove block from hardness map
            map_put_pixel (0, plat_map, x_loc, y_loc, 0); //put block colour
            //Update the screen
            xput (ed_spr, del_block, x_draw_bl+ (block_x*sm_block_size), y_draw_bl + (block_y*sm_block_size), 0, 100, 0, 0);
         END
     ELSE
         IF (map_get_pixel (0, bubble_map, x_loc, y_loc) != 0)
            //Remove block from hardness map
            map_put_pixel (0, bubble_map, x_loc, y_loc, 0); //put block colour
            //Update the screen
            xput (ed_spr, del_block, x_draw_bl+ (block_x*sm_block_size), y_draw_bl + (block_y*sm_block_size), 0, 100, 0, 0);
         END
     END
END

PROCESS update_editor_scr()
BEGIN
   update_counters();
   //cur_spr = 0;   //current sprite selected

   SWITCH (edit_what)
      CASE plat_edit:
         Dis_Plats_Bubs(TRUE); //plat form types display
      END
      CASE bub_edit:
         Dis_Plats_Bubs(FALSE); //bubble path arrows display
      END
      CASE spr_edit: //placing or moving sprites display
         Dis_Sprites();
      END
      DEFAULT:
         Dis_Sprites(); //Food Items
      END
   END
END

PROCESS Dis_Buttons()

BEGIN
   Button_norm(0);
   Button_norm(1);

   Button_group(2,0);
   Button_group(3,1);
   Button_group(4,2);
   Button_group(5,3);
   Button_group(6,4);

   Button_Tog(7);
   Button_Tog(8);
   Button_norm(9);
   Button_norm(10);
   Button_norm(11);

   Button_group(12,0);//norm levels
   Button_group(13,1);//extra

   Button_norm(14);//hurry
   Button_norm(15);
   Button_norm(16);//skel
   Button_norm(17);
   Button_norm(18);//bubble speed
   Button_norm(19);
   Button_norm(20);//trapped time
   Button_norm(21);
   Button_norm(22);//special bubble water number
   Button_norm(23);
   Button_norm(24);//special bubble fire number
   Button_norm(25);
   Button_norm(26);//special bubble lightning number
   Button_norm(27);
   Button_norm(28);//num nasties on screen
   Button_norm(29);
   Button_norm(30);//num nasties on screen
   Button_norm(31);

   Button_group(32,0);
   Button_group(33,1);
   Button_group(34,2);
   Button_group(35,3);
   Button_group(36,4);
   Button_group(37,5);
   Button_group(38,6);

   Button_norm(39);//num nasties on screen
   Button_norm(40);

   Button_Tog(41); //nastie number display
   Button_norm(42);
   Button_norm(43);
   Button_norm(44);
   Button_norm(45);
   Button_norm(46);
   Button_norm(47);

   Button_Tog(48); //show all sprites

   Button_norm(49); //copy to bub to plat map
   Button_norm(50); //copy to plat bubble map
   Button_norm(51); //exits all
   Button_norm(52); //exits
   Button_norm(53); //exits top
   Button_norm(54); //exits bottom

   Button_norm(55); //clear screen
   Button_norm(56); //clear platform map
   Button_norm(57); //clear bubble map

   Button_norm(58); //Direction arrows for sprites

   Button_Group(59,0); //normal draw
   Button_Group(60,1); //line tool
   Button_Group(61,2); //fill
   Button_Group(62,3); //Box unfilled
   Button_Group(63,4); //Box unfilled
   Button_Group(64,5); //Box unfilled
   Button_Group(65,6); //Box unfilled

   Button_norm(66); //copy of map
   Button_norm(67); //paste map
   Button_Tog(68);  //show game platform graphics

END
//    bt_click_once = 1; //increases a var once
//    bt_click_hold = 2; //increases a var as long as its held down
//    bt_toggle     = 3; //toggle on off
//    bt_group      = 4; //part of larger group
//    bt_click_win  = 5; //opens a window


PROCESS Button_Group(b_ind, bnum)
PRIVATE
   b_grf;
   bgfx_id;
   but_type;
   key_to_read;
   mse_id;
   b_group;
BEGIN
   file = ed_spr; //Editor FPG
   buttons_onscreen++; //Increase Number of buttons on screen counter

   x = buttons[b_ind].x_loc;
   y = buttons[b_ind].y_loc;

   bgfx_id = buttons[b_ind].b_graph;  //graphic for the button
   b_grf   = button_gfx[bgfx_id];
//b_event

   b_group = buttons[b_ind].b_group;
   key_to_read = buttons[b_ind].key_p;//scan for this shortcut key

   GRAPH = b_grf;

   LOOP
   mse_id  = collision (type mouse);

      //Shortcut Key
      IF (key_to_read != 0)
        IF (key(key_to_read))
          b_clicked  = TRUE;
        END
      END

      //Mouse click
      IF (mse_id != 0 AND mouse.left)
          b_clicked  = TRUE;
      ELSE
          b_clicked  = FALSE;
      END

      IF (b_clicked == TRUE AND Button_Group_Sel[b_group] != bnum)
          b_selected = TRUE;
          Button_Group_Sel[b_group] = bnum;
          Button_Event_Handler (buttons[b_ind].b_event);
      END

      IF (Button_Group_Sel[b_group] == bnum)
      //selected graphic
          GRAPH = b_grf+2; //left mouse clicked
      ELSE
          b_selected = FALSE;
         IF (mse_id != 0)
            GRAPH = b_grf+1; //mouse over button
         ELSE
            GRAPH = b_grf;      //no mouse over
         END
      END

      FRAME;
   END
END //Button Group

PROCESS Button_Tog(but_ind) //value on off
PRIVATE
   b_grf;
   but_num;
   but_type;
   key_to_read;
   mse_id;
   b_released;
BEGIN
   file = ed_spr; //Editor FPG
   buttons_onscreen++; //Increase Number of buttons on screen counter

   x = buttons[but_ind].x_loc;
   y = buttons[but_ind].y_loc;

   but_num = buttons[but_ind].b_graph;  //graphic for the button
   key_to_read = buttons[but_ind].key_p;//scan for this shortcut key

   b_grf =  button_gfx[but_num];

   GRAPH = b_grf;

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

      FRAME;
   END

END //Toggle

//Click once or click hold buttons
PROCESS Button_norm(but_ind)
PRIVATE
   b_grf;
   but_num;
   but_type;
   key_to_read;
   mse_id;
   click_hld_del;
BEGIN
   file = ed_spr; //Editor FPG
   buttons_onscreen++; //Increase Number of buttons on screen counter

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

      FRAME;
   END
END //Button normal

PROCESS Button_Event_Handler (but_event)
BEGIN

   SWITCH (but_event)
      CASE but_normal:
         level_type = lev_normal;   //levels normal/extended
         load_levels(); //Load the level data
         update_editor_scr();

      END

      CASE but_extra:
         level_type = lev_extend;   //levels normal/extended
         load_levels(); //Load the level data
         update_editor_scr();

      END

      CASE but_level_up:
         IF (cur_level < 100)
            act_level++;
            cur_level++;
            update_editor_scr();
            update_cur_sprites();
         END
      END
      CASE but_level_dn:
         IF (cur_level > 1)
            act_level--;
            cur_level--;
            update_editor_scr();
            update_cur_sprites();

         END
      END

      CASE but_edit_nast:
        edit_what = spr_edit;
        update_editor_scr();
      END
      CASE but_edit_plat:
        edit_what = plat_edit;
        block_button(0, grp_plats);
        block_button(1, grp_plats);
        block_button(2, grp_plats);
        block_button(3, grp_plats);
        block_button(4, grp_plats);

        IF (cur_draw_block > 1)
         cur_draw_block = 2;
        END
        update_editor_scr();
      END

      CASE but_edit_bubb:
         edit_what = Bub_edit;
         block_button(0, grp_bubs);
         block_button(1, grp_bubs);
         block_button(2, grp_bubs);
         block_button(3, grp_bubs);
         block_button(4, grp_bubs);
         block_button(5, grp_bubs);
         block_button(6, grp_bubs);
         block_button(7, grp_bubs);
         block_button(8, grp_bubs);
         update_editor_scr();
      END

      CASE but_edit_food:
        edit_what = Food_edit;
        update_editor_scr();
      END
      CASE but_edit_item:
        edit_what = Item_edit;
        update_editor_scr();
      END

      CASE but_snap: //Snap to grid
         IF (grid_snap == FALSE)
            grid_snap = TRUE;
         ELSE
            grid_snap = FALSE;
         END
      END

      CASE but_grid: //Snap to grid
         IF (checkerboard == FALSE)
            checkerboard = TRUE; //checker board on
         ELSE
            checkerboard = FALSE;
         END
         update_editor_scr();

      END

      CASE but_origgraph:
         IF (realgraphics == FALSE)
            realgraphics = TRUE; //checker board on
         ELSE
            realgraphics = FALSE;
         END
         update_editor_scr();

      END

      CASE but_load:
           Load_Levels();
           update_editor_scr();
           update_cur_sprites();
      END

      CASE but_save:
           Save_Levels();
      END

      CASE but_quit:
         exit_editor = TRUE;
      END

      CASE but_sbw_mi: //water bubbles -
          IF (levels[act_level].water > 0)
             levels[act_level].water--;
             update_counters();
          END
      END

      CASE but_sbw_pl:
          IF (levels[act_level].water < max_sp_bubs)
             levels[act_level].water++;
             update_counters();
          END
      END

      CASE but_sbf_mi: //fire bubbles -
          IF (levels[act_level].fire > 0)
             levels[act_level].fire--;
             update_counters();
          END
      END

      CASE but_sbf_pl:
          IF (levels[act_level].fire < max_sp_bubs)
             levels[act_level].fire++;
             update_counters();
          END
      END

      CASE but_sbl_mi: //fire bubbles -
          IF (levels[act_level].light > 0)
             levels[act_level].light--;
             update_counters();
          END
      END

      CASE but_sbl_pl:
          IF (levels[act_level].light < max_sp_bubs)
             levels[act_level].light++;
             update_counters();
          END
      END

      CASE but_hurry_mi:
          IF (levels[act_level].hurry_time > 0)
             levels[act_level].hurry_time--;
             update_counters();
          END
      END

      CASE but_hurry_pl:
          levels[act_level].hurry_time++;
          update_counters();
      END

      CASE but_skel_mi:
          IF (levels[act_level].bubba_time > 0)
             levels[act_level].bubba_time--;
             update_counters();
          END
      END

      CASE but_skel_pl:
          levels[act_level].bubba_time++;
          update_counters();
      END

      CASE but_trp_mi:
          IF (levels[act_level].bubbled_time > 0)
             levels[act_level].bubbled_time--;
             update_counters();
          END
      END

      CASE but_trp_pl:
         levels[act_level].bubbled_time++;
         update_counters();
      END

      CASE but_nas_scr_mi:
         IF (levels[act_level].badnum > 1)
            levels[act_level].badnum--;
            update_counters();
         END
      END

      CASE but_nas_scr_pl:
         IF (levels[act_level].badnum < 7)
            levels[act_level].badnum++;
            update_counters();
         END
      END

      CASE but_nas_spd_mi:
         IF (levels[act_level].baddie_speed > 1)
            levels[act_level].baddie_speed--;
            update_counters();
         END
      END

      CASE but_nas_spd_pl:
         IF (levels[act_level].baddie_speed < 7)
            levels[act_level].baddie_speed++;
            update_counters();
         END

      END

      CASE but_bubsp_mi:
         IF (levels[act_level].bub_speed >1)
            levels[act_level].bub_speed --;
            update_counters();
         END
      END

      CASE but_bubsp_pl:
            levels[act_level].bub_speed ++;
            update_counters();
      END

      CASE but_nastie1..but_nastie7:
           cur_spr = Button_Group_Sel[grp_nasties];
           update_cur_sprites();
      END

      CASE but_nas_way:
          IF (baddies[cur_spr_arr_loc].dir == 1)
            baddies[cur_spr_arr_loc].dir = 1;
          ELSE
            baddies[cur_spr_arr_loc].dir = 2;
          END
      END

      CASE but_nas_nums: //display number squares over nasties
         IF (dis_nast_nums == TRUE)
            dis_nast_nums = FALSE;
         ELSE
            dis_nast_nums = TRUE;
         END
      END

      CASE but_nas_t_mi:
         IF (baddies[cur_spr_arr_loc].mtype >1)
             baddies[cur_spr_arr_loc].mtype--;
             update_cur_sprites();
         END

      END

      CASE but_nas_t_pl:
         IF (baddies[cur_spr_arr_loc].mtype <8)
             baddies[cur_spr_arr_loc].mtype++;
             update_cur_sprites();
         END

      END

      CASE but_nas_x_mi:
          IF (baddies[cur_spr_arr_loc].mx > 0)
            baddies[cur_spr_arr_loc].mx--;
            update_cur_sprites();
          END
      END

      CASE but_nas_x_pl:
          IF (baddies[cur_spr_arr_loc].mx <235)
            baddies[cur_spr_arr_loc].mx++;
            update_cur_sprites();
          END
      END

      CASE but_nas_y_mi:
         baddies[cur_spr_arr_loc].my--;
         update_cur_sprites();
      END

      CASE but_nas_y_pl:
         baddies[cur_spr_arr_loc].my++;
         update_cur_sprites();
      END

      CASE but_nas_d_mi:
         IF (baddies[cur_spr_arr_loc].mdelay > 1)
            baddies[cur_spr_arr_loc].mdelay--;
            update_cur_sprites();
         END
      END

      CASE but_nas_d_pl:
          baddies[cur_spr_arr_loc].mdelay++;
          update_cur_sprites();
      END

      CASE but_show_all: //display nasties, food and items on all edit windows
          IF (dis_all_edit_spr == TRUE)
            dis_all_edit_spr = FALSE;
          ELSE
            dis_all_edit_spr = TRUE;
          END
      END

      CASE but_copy_to_plt: //copy platforms from bubble map to platform map
          Copy_To_Plats(TRUE);
      END

      CASE but_copy_to_bub: //copy platforms from platform map to bubble map
          Copy_To_Plats(FALSE);
      END

      CASE but_exit_none:
         op_cl_exits (FALSE, FALSE);
      END

      CASE but_exit_all:
         op_cl_exits (TRUE, TRUE);
      END

      CASE but_exit_up:
         op_cl_exits (TRUE, FALSE);
      END

      CASE but_exit_down:
         op_cl_exits (FALSE, TRUE);
      END

      CASE but_cls:      //clear screen
         clear_ed_scr(true,true);
      END

      CASE but_cls_plat: //clear platform screen
         clear_ed_scr(true,false);
      END

      CASE but_cls_bub:  //clear bubble screen
         clear_ed_scr(false,true);
      END

      CASE but_do_arrows:
         IF (dis_arr_spr == FALSE)
            dis_arr_spr = TRUE;     //display nastie direction arrows
         ELSE
            dis_arr_spr = FALSE;     //display nastie direction arrows
         END
      END

      CASE but_cpy_map:
            Copy_to_screen(cpy_buf_x, cpy_buf_y);
      END

      CASE but_pas_map:
           Copy_From_screen(2); //region no 2 = copy buffer
           update_editor_scr();
      END

   END//Switch

END


//Copy Bubble map to Platform map
PROCESS Copy_To_Plats(plat_copy)
PRIVATE
   x_count;
   y_count;
   x_loc;
   y_loc;
   block_to_do;
BEGIN

   x_loc = act_level*28;
   y_loc = 0;

   FOR (y_count = 0; y_count < blocks_dwn; y_count++)
      FOR (x_count = 0; x_count < blocks_acr; x_count++)

         IF (plat_copy == TRUE) //Copy only blocks from bubble map
            block_to_do = map_get_pixel (0, bubble_map, x_loc, y_loc); //get block colour 1 = plat

            IF (block_to_do == 1) //if a block copy it to the platform map
               map_put_pixel (0, plat_map, x_loc, y_loc,1);
            END

         ELSE
            block_to_do = map_get_pixel (0, plat_map, x_loc, y_loc); //get block colour 1 = plat, 2 bubb drift up, 3 hidden

            //check block colour types for the copying to the bubble map
            IF (block_to_do == block_type_b1 OR block_to_do == block_type_b3)
               map_put_pixel (0, bubble_map, x_loc, y_loc,1);
            END

         END

       x_loc++;
      END
      x_loc = act_level*28; //reset x position
      y_loc++;
   END

   update_editor_scr();

END


PROCESS clear_ed_scr(clr_p, clr_b) //Clear the Screen of all blocks
PRIVATE
   x_count;
   y_count;
   x_loc;
   y_loc;
   x_pos;
BEGIN
    x_pos = (act_level*28);  //left exit

    FOR (y_count = 0; y_count< 26; y_count++)
    x_loc = x_pos;
      FOR (x_count = 0; x_count< 28; x_count++)
        IF (clr_p == TRUE)
            map_put_pixel (0, plat_map, x_loc, y_loc, 0); //remove block colour
        END

        IF (clr_b == TRUE)
            map_put_pixel (0, bubble_map, x_loc, y_loc, 0); //remove block colour
        END

        x_loc++;
      END //x clear loop
      y_loc++;
    END//y clear loop

   update_editor_scr();

END

PROCESS Dis_Sprites()
PRIVATE
   x_count;
   y_count;
   x_loc;
   y_loc;
   block_to_do;
BEGIN
//   blocks_acr = 28;
//   blocks_dwn = 26;

   //Checkerboard background display or not
   IF (checkerboard == FALSE)
      put(ed_spr, lv_ed_rect, 176,112);
   ELSE
      put(ed_spr, lv_ed_rect+1, 176,112);
   END

   sm_block_grf = act_sm_loc + ((cur_level-1) *2);
   bg_block_grf = act_bg_loc + ((cur_level-1) *2);

   x_loc = act_level*28;
   y_loc = 0;
  IF (realgraphics == FALSE)
   //RED BLOCKS
   FOR (y_count = 0; y_count < blocks_dwn; y_count++)
      FOR (x_count = 0; x_count < blocks_acr; x_count++)
         //Check Hardness map for a block - (1pixel = 1block)
         block_to_do = map_get_pixel (0, plat_map, x_loc, y_loc);

         IF (block_to_do == block_type_b3)
            xput (ed_spr, ed_plat_invs, x_draw_bl+ (x_count*sm_block_size), y_draw_bl + (y_count*sm_block_size), 0, 100, 0, 0);
           ELSE
               IF (block_to_do != 0)
                  xput (ed_spr, ed_plat_bl, x_draw_bl+ (x_count*sm_block_size), y_draw_bl + (y_count*sm_block_size), 0, 100, 0, 0);
            END
         END

       x_loc++;
      END
      x_loc = act_level*28;
      y_loc++;
   END
  ELSE // REAL GRAPHICS

   FOR (y_count = 0; y_count < blocks_dwn/2; y_count++)
        xput (blocksfile, bg_block_grf, x_draw_bl-6, y_draw_bl+8 + (y_count*b_bl_size), 0, 50, 0, 0);
   END

   FOR (y_count = 0; y_count < blocks_dwn; y_count++)
      FOR (x_count = 0; x_count < blocks_acr; x_count++)
         //Check Hardness map for a block - (1pixel = 1block)
         block_to_do = map_get_pixel (0, plat_map, x_loc, y_loc);

         IF (block_to_do != 0 AND block_to_do != block_type_b3)
             xput (blocksfile, sm_block_grf, x_draw_bl2 + (x_count*sm_block_size), y_draw_bl2 + (y_count*sm_block_size), 0, 50, 0, 0);
         END

       x_loc++;
      END
      x_loc = act_level*28;
      y_loc++;
   END

   FOR (y_count = 0; y_count < blocks_dwn/2; y_count++)
        xput (blocksfile, bg_block_grf, x_draw_bl-6+240, y_draw_bl+8 + (y_count*b_bl_size), 0, 50, 0, 0);
   END

   put (ed_spr, 85, 176, 320); //background corection at the bottom of screen edit window
   put (ed_spr, 86, 432, 112); //background corection at the bottom of screen edit window
  END

END




PROCESS Dis_Plats_Bubs(plat_dis)
PRIVATE
   x_count;
   y_count;
   x_loc;
   y_loc;
   block_to_do;
BEGIN

   IF (checkerboard == FALSE)
      put(ed_spr, lv_ed_rect, 176,112);
   ELSE
      put(ed_spr, lv_ed_rect+1, 176,112);
   END

   x_loc = act_level*28;
   y_loc = 0;

   FOR (y_count = 0; y_count < blocks_dwn; y_count++)
      FOR (x_count = 0; x_count < blocks_acr; x_count++)

         IF (plat_dis == TRUE)
            block_to_do = map_get_pixel (0, plat_map, x_loc, y_loc); //get block colour 1 = plat, 2 bubb drift up, 3 hidden

            IF (block_to_do > 0)
               xput (ed_spr, ed_plat_hrd+(block_to_do-1), x_draw_bl+ (x_count*sm_block_size), y_draw_bl + (y_count*sm_block_size), 0, 100, 0, 0);
            END
         ELSE
            block_to_do = map_get_pixel (0, bubble_map, x_loc, y_loc); //get block colour 1 = plat, 2 bubb drift up, 3 hidden

            IF (block_to_do > 0)
               xput (ed_spr, ed_plat_bub+(block_to_do-1), x_draw_bl+ (x_count*sm_block_size), y_draw_bl + (y_count*sm_block_size), 0, 100, 0, 0);
            END

         END


       x_loc++;
      END
      x_loc = act_level*28;
      y_loc++;
   END
END


PROCESS scrtext()
BEGIN
   write(font_ed,00,46,0,"Levels");


   write(font_ed,432,94,0,"Screen Editing");

   write(font_ed,00,96+16,0,"Hurry Time:");
   write(font_ed,00,96+32,0,"Skel Time:");

   write(font_ed,00,96+64,0,"Bubble Speed:");
   write(font_ed,00,96+80,0,"Pixel Rate:");
   write(font_ed,00,96+96,0,"Frame Rate:");

   write(font_ed,00,96+128,0,"Trapped Time:");
   write_int(font_ed,88,96+128,0,&dis[6]);

   write_int(font_ed,88,96+16,0,&dis[0]);
   write_int(font_ed,88,96+32,0,&dis[1]);
   write_int(font_ed,88,96+64,0,&dis[2]);
   write_int(font_ed,88,96+80,0,&bubble_speed);
   write_int(font_ed,88,96+96,0,&bubble_frame);

   write_int(font_ed,24,295,4,&dis[3]);
   write_int(font_ed,24+48,295,4,&dis[4]);
   write_int(font_ed,24+96,295,4,&dis[5]);

   write(font_ed,4,334,0,"Nastie Editing");

   write(font_ed,4,352,0,"Num On Screen:");
   write_int(font_ed,104,352,0,&dis[7]);

   write(font_ed,4,368,0,"Nastie Speed:");
   write_int(font_ed,104,368,0,&dis[8]);

   write(font_ed,544,110,0,"Food");
   write(font_ed,544+32,110,0,"X:");
   write(font_ed,544+32,126,0,"Y:");

   write_int(font_ed,602,120,4,&dis[9]);
   write_int(font_ed,602,136,4,&dis[10]);

   write(font_ed,544,142,0,"Item");
   write(font_ed,544+32,142,0,"X:");
   write(font_ed,544+32,158,0,"Y:");

   write_int(font_ed,602,152,4,&dis[11]);
   write_int(font_ed,602,168,4,&dis[12]);

   write(font_ed,edtxtsz_x * 22-4,(edtxtsz_y *29)+2,3,"X:");
   write(font_ed,edtxtsz_x * 22-4,(edtxtsz_y *30)+4,3,"Y:");
   write(font_ed,edtxtsz_x * 22-2,(edtxtsz_y *31)+6,3,"Delay:");

   write_int(font_ed,edtxtsz_x * 23,(edtxtsz_y *29)+2,3,&dis[13]); //Nast X
   write_int(font_ed,edtxtsz_x * 23,(edtxtsz_y *30)+4,3,&dis[14]); //Nast Y
   write_int(font_ed,edtxtsz_x * 26-3,(edtxtsz_y *31)+6,3,&dis[15]); //Delay
   update_cur_sprites();
   Nastie_Anim_big();

END


PROCESS update_counters()
BEGIN
   B_Speed();
   dis[0] = levels[act_level].hurry_time;
   dis[1] = levels[act_level].bubba_time;
   dis[2] = levels[act_level].bub_speed;
   dis[6] = levels[act_level].bubbled_time; //total time trapped in seconds
   dis[3] = levels[act_level].water;
   dis[4] = levels[act_level].fire;
   dis[5] = levels[act_level].light;
   dis[7] = levels[act_level].badnum;
   dis[8] = levels[act_level].baddie_speed;
   dis[9] = levels[act_level].foodx;
   dis[10] = levels[act_level].foody;
   dis[11] = levels[act_level].itemx;
   dis[12] = levels[act_level].itemy;

END

PROCESS update_cur_sprites()
PRIVATE
   all_spr;
   spr_count;
   l_sc;

BEGIN

   cur_spr_arr_loc = cur_spr + act_level*7; //store global selected sprite location

   dis[13] = baddies[cur_spr_arr_loc].mx;
   dis[14] = baddies[cur_spr_arr_loc].my;
   dis[15] = baddies[cur_spr_arr_loc].mdelay;

//    edtxtsz_x = 10;
//    edtxtsz_y = 14;

   write(font_ed,edtxtsz_x * 22-4, edtxtsz_y *28,3,Nast_names [baddies[cur_spr_arr_loc].mtype]);

//   Nast_names [baddies[cur_spr_arr_loc].mtype]

   //dis[17] = baddies[act_level].dir;


   //change all sprite displays

   //FOR ()
   //dis_spr_all[]

   //update name
   //update facing = dir

END

//puts exits on the screen or removes them
PROCESS op_cl_exits (doexits_top, doexits_bottom)
PRIVATE
xpos1;
xpos2;
drw_count;
BEGIN

    xpos1 = (act_level*28);  //left exit
    xpos2 = (act_level*28)+21; //right exit

    //side of screen draw
    FOR (drw_count = 1; drw_count <= 7; drw_count++)
         exit_put_block(xpos1, 0);
         exit_put_block(xpos1, 25);
         exit_put_block(xpos2, 0);
         exit_put_block(xpos2, 25);
         xpos1++;
         xpos2++;
    END

    xpos1 = (act_level*28)+11;  //left exit

    FOR (drw_count = 1; drw_count <= 6; drw_count++)
         exit_put_block(xpos1, 0);
         exit_put_block(xpos1, 25);
         xpos1++;
    END

    xpos1 = (act_level*28)+7;  //left exit
    xpos2 = (act_level*28)+17; //right exit

    FOR (drw_count = 0; drw_count < 4; drw_count++)

      IF (doexits_top == FALSE) //exits close or open
         exit_put_block(xpos1, 0);
         exit_put_block(xpos2, 0);
      ELSE
         exit_clr_block(xpos1, 0);
         exit_clr_block(xpos2, 0);
      END

      IF (doexits_bottom == FALSE) //exits close or open
         exit_put_block(xpos1, 25);
         exit_put_block(xpos2, 25);
      ELSE
         exit_clr_block(xpos1, 25);
         exit_clr_block(xpos2, 25);
      END

      xpos1++; //move drawing coords over by one
      xpos2++;
    END //draw/clr loop

    update_editor_scr();

END


PROCESS exit_clr_block(x_loc, y_loc)
BEGIN
    //clear platform map square
    IF (map_get_pixel (0, plat_map, x_loc, y_loc) > 0) //if a block present
        map_put_pixel (0, plat_map, x_loc, y_loc, 0); //remove block colour
    END

    //clear bubble map square
    IF (map_get_pixel (0, bubble_map, x_loc, y_loc) == 1) //if a block present
        map_put_pixel (0, bubble_map, x_loc, y_loc, 0); //remove block colour
    END
END

PROCESS exit_put_block(x_loc, y_loc)
BEGIN
    //put plat map square
    map_put_pixel (0, plat_map, x_loc, y_loc, 1);   //put block colour to platmap

    //put bubble map square
    map_put_pixel (0, bubble_map, x_loc, y_loc, 1); //put block colour to bubble map
END


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

PROCESS B_Speed()
//Does the frame rate and the bubbles pixel speed
PRIVATE
    bframer;
BEGIN
    bubble_rate  = levels[act_level].bub_speed; //rate of bubble movement
    bubble_speed = ((bubble_rate-1)/4)+1;
    bframer = bubble_rate MOD 4;

    //Bub_add = speed_adj (bubble_speed); //speed adjust for platforms

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

