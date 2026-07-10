/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* เพิ่มความหนาขอบหน้าต่างเล็กน้อยให้เห็นเด่นชัด */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   
static const unsigned int systrayonleft = 0;       
static const unsigned int systrayspacing = 2;   
static const int systraypinningfailfirst = 1;   
static const int showsystray        = 1;     /* เปิดใช้งาน Systray ค้างไว้สำหรับ Blueman/Network */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */

/* 🎨 อัปเกรดฟอนต์คู่ใจ: รองรับทั้งไอคอนเท่ๆ และสระภาษาไทยไม่ระเบิด */
static const char *fonts[]          = { "JetBrainsMono Nerd Font:size=11", "IBM Plex Sans Thai:size=11" };
static const char dmenufont[]       = "JetBrainsMono Nerd Font:size=11";

/* 🎨 ปรับโทนสีระบบใหม่ (Nord Modern Theme) ให้สะอาดยกชุด */
static const char col_bg[]          = "#2e3440"; /* สีพื้นหลังเทาเข้มแบบสบายตา */
static const char col_border_norm[] = "#4c566a"; /* สีขอบหน้าต่างปกติ */
static const char col_fg[]          = "#d8dee9"; /* สีตัวอักษรขาวนวล */
static const char col_active[]      = "#88c0d0"; /* สีฟ้าสว่างไฮไลท์จุดที่เลือก */

static const char *colors[][3]      = {
    /*               fg          bg          border   */
    [SchemeNorm] = { col_fg,     col_bg,     col_border_norm },
    [SchemeSel]  = { col_bg,     col_active, col_active      },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
    /* class      instance    title       tags mask     isfloating   monitor */
    { "Gimp",     NULL,       NULL,       0,            1,           -1 },
    { "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* ปรับเป็น 0 เพื่อบังคับให้หน้าต่าง Terminal ขยายเต็มช่องไม่มีช่องว่างขอบ */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "[]=",      tile },    /* default layout */
    { "><>",      NULL },    /* floating behavior */
    { "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
    { MODKEY,                           KEY,      view,           {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask,               KEY,      toggleview,     {.ui = 1 << TAG} }, \
    { MODKEY|ShiftMask,                 KEY,      tag,            {.ui = 1 << TAG} }, \
    { MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* commands */
/* เปลี่ยนเมาส์คลิกบนบาร์สถานะให้เปิดเข้าใช้ Kitty Terminal โดยตรง */
static const char *termcmd[]  = { "kitty", NULL };

#include "selfrestart.c"

static Key keys[] = {
    /* modifier                     key        function        argument */
    /* ⚠️ เอาบรรทัดปุ่มเรียก dmenu ออก เพื่อยกหน้าที่ให้ sxhkd จัดการอย่างไร้ข้อขัดแย้ง */
    { MODKEY,                       XK_b,      togglebar,      {0} },
    { MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
    { MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
    { MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
    { MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
    { MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
    { MODKEY,                       XK_Tab,    view,           {0} },
    { MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
    { MODKEY,                       XK_g,      setlayout,      {.v = &layouts[2]} },
    { MODKEY,                       XK_space,  setlayout,      {0} },
    { MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
    { MODKEY,                       XK_0,      view,           {.ui = ~0 } },
    { MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
    { MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
    { MODKEY,                       XK_period, focusmon,       {.i = +1 } },
    { MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
    { MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
    TAGKEYS(                        XK_1,                      0)
    TAGKEYS(                        XK_2,                      1)
    TAGKEYS(                        XK_3,                      2)
    TAGKEYS(                        XK_4,                      3)
    TAGKEYS(                        XK_5,                      4)
    TAGKEYS(                        XK_6,                      5)
    TAGKEYS(                        XK_7,                      6)
    TAGKEYS(                        XK_8,                      7)
    TAGKEYS(                        XK_9,                      8)
    { MODKEY|ShiftMask,             XK_r,      self_restart,   {0} },
    { MODKEY,                       XK_q,      killclient,     {0} },
    { MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
static Button buttons[] = {
    /* click                event mask      button          function        argument */
    { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
    { ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
    { ClkWinTitle,          0,              Button2,        zoom,           {0} },
    { ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } }, /* คลิกเมาส์กลางบนบาร์เปิด Kitty */
    { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
    { ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
    { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
    { ClkTagBar,            0,              Button1,        view,           {0} },
    { ClkTagBar,            0,              Button3,        toggleview,     {0} },
    { ClkTagBar,            **MODKEY**,         Button1,        tag,            {0} },
    { ClkTagBar,            **MODKEY**,         Button3,        toggletag,      {0} },
};
