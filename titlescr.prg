PROGRAM Title_Screen;
CONST
    silverfnt  = "\bubdiv\fonts\silver.fnt";
    redfnt     = "\bubdiv\fonts\red.fnt";
    bluefnt    = "\bubdiv\fonts\blue.fnt";
    goldfnt    = "\bubdiv\fonts\gold.fnt";
    grnfnt     = "\bubdiv\fonts\green.fnt";
    sprfloc    = "\bubdiv\fpg\bb_spr.fpg";
    blocksfloc = "\bubdiv\fpg\bb_block.fpg";

    levfnt     = "\bubdiv\fonts\lev.fnt"; //level screen
    sprfloc3   = "\bubdiv\fpg\titles.fpg";
//screen text location start
    x_txt_st = 60;
    y_txt_st = 10;
    block_res = 16;
    x_def = 108;
    y_def = 54;
    y_def2 = 64;

    x_scr_middle = x_def + (block_res*13);
    y_scr_middle = y_def + (block_res*12);

    rainbow_bubbles = 734; //clear intro rainbow bubble graphic
    intro_bubbles = 100; //clear intro bubble graphic
    scr_Stars   = 840; //Stars Start of game

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
//Font type for array
    f_silver = 1;
    f_gold   = 2;
    f_green  = 3;
    f_red    = 4;
    f_blue   = 5;
    //only used by the scroll text routine
    l_feed   = 9; //line feed no
    t_end  = 10;  //end of scrolling text

    x_scr_middle = x_def + (block_res*13);
    y_scr_middle = y_def + (block_res*12);
    k = 1000;

    pri_effects = -10;

//NEW
    dibsoft_letter = 270;
    ds_sparkle = 210;
    ds_sp_dis  = 226;
    st_remake  = 17;

GLOBAL
    blocksfile;   //graphics file of blocks and screen scroll buffers
    platdata;     //platform graphics data
    hardness;     //hardness blocks file pointer
    sprites;      //sprites file pointer
    fooditems;    //food and items file pointer
    titlesfile;
    id_song;
    count;
    font_s;
    font_r;
    font_b;
    font_g;
    font_gr;
    Hi_Score;
    font_lev;
    Titles_timer;
    level_type;

    sc_txt;
//to enter into main program
STRUCT Pres_anim[7]
    x_pos;
    y_pos;
    a_st;
    a_fr;
END =
222, 214, 302, 8,   //P
249, 223, 310, 9,   //r
277, 223, 319, 10,  //e
304, 223, 329, 9 ,  //s
332, 223, 338, 10,  //e
361, 223, 348, 10,  //n
389, 214, 358, 11,  //t
414, 223, 369, 9 ;  //s

DS_G_Add[6] =
0,31,61,104,150,193,233;

LOCAL
    kill;
    xpos;
    ypos;
    xmov;
    ymov;
    who;
    ani_finish;
BEGIN
    set_fps(60,0);                    //Frames per second
    set_mode (m640x480);
//load fonts
    font_s     = load_fnt(silverfnt);  //silver font load
    font_r     = load_fnt(redfnt);     //red font load
    font_b     = load_fnt(bluefnt);    //blue font load
    font_g     = load_fnt(goldfnt);    //gold font load
    font_gr    = load_fnt(grnfnt);     //green font

    font_lev = load_fnt(levfnt);       //level reached font

    titlesfile  = load_fpg(sprfloc3);   //Title screen graphics
    sprites     = load_fpg(sprfloc);    //sprite data
    blocksfile = Load_fpg(blocksfloc); //blocks graphics + screen area

//    Score_Displays();
    fade_on();

    DS_Animation();

    LOOP
        FRAME;
    END

    fade_off();
    clear_screen();
    delete_text(all_text);
    let_me_alone(); //kill all the sprites off

    exit ("Program has ended", 0);
END


PROCESS DS_Animation()
PRIVATE
  a_count;
  n_anim;
  a_del;
BEGIN
    D_Anim(a_count);

    a_count = 0;
    LOOP
        //ani_finish
        IF (a_count != ani_finish)
            n_anim++;
            a_count++;
            IF (a_count >=7) BREAK; END
            D_Anim(a_count);
        END
        FRAME;
    END


    a_count = 0;
    ani_finish = 0;
    n_anim = 0;
    SparkleDisAnim(a_count);

    LOOP
        a_del++;
        IF (a_del >30)
            a_del = 0;
            a_count++;
            IF (a_count >=11) BREAK; END
            SparkleDisAnim(a_count);
        END

        FRAME;
    END

    LOOP
       IF (ani_finish >= 11) BREAK; END
       FRAME;
    END
    clear_screen();
    ani_finish = FALSE;

    Presents();
    LOOP
       IF (ani_finish == TRUE) BREAK; END
       FRAME;
    END

    x = x_scr_middle;
    y = y_scr_middle+32;

    GRAPH = st_remake;
    size = 0;
    LOOP
        size +=2;
        IF (size >= 100) BREAK; END
    FRAME(200);
    END

    LOOP
       FRAME;
    END

//    fade_off();
//    Signal (type P_Anim, s_kill);

END

//Stand alone titlesfile runonce animation
PROCESS T_Anim(x, y, st_frm, an_frames, del)
PRIVATE
    an_count;
    an_delay;
    fcount;
BEGIN
    file = titlesfile;
    GRAPH = st_frm;

    LOOP
        an_delay++;

        IF (an_delay > del)
            an_delay = 0;
            st_frm++;   //change current frame
            an_count++; //anim frame count

            IF (an_count => an_frames) //frame number over end of animation
                BREAK;
            END
        GRAPH = st_frm;
        END

    FRAME;
    END


    father.ani_finish++;

END

//DIBSOFT Letters anim
PROCESS D_Anim(a_ind)
PRIVATE
    f_count;
    a_delay;
    a_frame;
BEGIN
    file = titlesfile;
    a_frame = a_ind+dibsoft_letter;
    x = 199+DS_G_Add[a_ind];
    y = 214;

    T_Anim(x, y, ds_sparkle, 8, 8);

    LOOP
       IF (a_delay >10)
          a_delay = 0;
          xput(titlesfile, a_frame, x,y, 0, 100, 4, 0);
          f_count++;
          IF (f_count >4) BREAK; END
       END
       a_delay++;

    FRAME;

    END

    xput(titlesfile, a_frame, x,y, 0, 100, 0, 0);

    father.ani_finish++;
END

PROCESS SparkleDisAnim(a_ind)
PRIVATE
    an_delay;
    fcount;
    an_count;
BEGIN
    file = titlesfile;
    fcount = ds_sp_dis;

    x = 199+(a_ind * 24);
    y = 214;

    z = pri_effects;

LOOP
    GRAPH = fcount;
    an_delay++;

    IF (an_delay > 10)
       an_delay = 0;
       fcount++; //change current frame
       an_count++;
       IF (an_count >= 16) BREAK; END
    END

    FRAME;

    END

    xput(titlesfile, fcount-1, x,y, 0, 100, 0, 0);

    father.ani_finish++;

END


PROCESS Presents()
PRIVATE
   cur_anim;
   last_a;
BEGIN

   P_Anim (cur_anim);
   cur_anim++;

 LOOP
   IF (who != last_a)
       last_a++;
       IF (cur_anim >7) BREAK; END
       P_Anim (cur_anim);
       cur_anim++;
   END
 FRAME;

 END

 father.ani_finish = TRUE;

END

PROCESS P_Anim(a_ind) //Presents - animation
PRIVATE
    an_frames;
    an_count;
    an_delay;
    fcount;
BEGIN
    file = titlesfile;

    x = Pres_anim[a_ind].x_pos;
    y = Pres_anim[a_ind].y_pos;
    z = 20;
    an_count = 0;

    fcount = Pres_anim[a_ind].a_st;    //animation start frame
    an_frames = Pres_anim[a_ind].a_fr; //number of frames
    GRAPH = fcount;

    LOOP
        an_delay++;

        IF (an_delay > 5)
            an_delay = 0;
            fcount++;   //change current frame
            an_count++; //anim frame count

            IF (an_count => an_frames) //frame number over end of animation
                BREAK;
            END
        GRAPH = fcount;
        END

    FRAME;
    END
        father.who++;
    LOOP
        FRAME;
    END

END

PROCESS Static4()
BEGIN
    file = titlesfile;
    GRAPH = 53;
    x = x_scr_middle;
    y = y_scr_middle-32;

    LOOP
        FRAME;
    END
END


PROCESS Score_Displays()
BEGIN
   write(font_r,ret_xtext(11)+8,ret_ytext(0),3,"HIGH SCORE");
   write_int(font_s, ret_xtext(16),ret_ytext(1),4,50000);

   write(font_gr,ret_xtext(4),ret_ytext(0),3,"1UP");
   write_int(font_s, ret_xtext(8),ret_ytext(1),5,0);

   write(font_b,ret_xtext(25),ret_ytext(0),3,"2UP");
   write_int(font_s, ret_xtext(29),ret_ytext(1),5,0);
END

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

