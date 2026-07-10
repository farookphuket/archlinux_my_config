--- 

## 11 Jul 2026

วินัย ช่วยตรวจสอบหาข้อผิดพลาดที่อาจจะทำให้ script พวกนี้ไม่ทำงานตามที่ต้องการ หรืออาจจะทำงานขัดแย้งกันอย่างร้ายแรง
ในไฟล์เหล่านี้ให้หน่อย 


======================= 


file dwm/config.def.h

/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;   	/* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=16" };
static const char dmenufont[]       = "monospace:size=16";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };

#include "selfrestart.c"

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },

	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },

	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },

	{ MODKEY,                       XK_Tab,    view,           {0} },

/* need to remove "t" to bind with `Super+t` to spawn `Thunar file manager`
 * { MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} }, 
 * */
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

	{ MODKEY,             XK_q,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

==================== END 



file dmenu/config.h.def

/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=18"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#bbbbbb", "#222222" },
	[SchemeSel] = { "#eeeeee", "#005577" },
	[SchemeOut] = { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";



---
ตอนนี้ใน CONFIG_DIR ที่จะเก็บพวกไฟล์ต่างๆ จะมีประมาณนี้ 
❯ ll                                                                                                                                  ─╯
.rw-r--r--  104 farook  7 Nov  2025 󱆃 .bash_profile
.rw-r--r-- 4.6k farook  7 Nov  2025 󱆃 .bashrc
drwxr-xr-x    - farook 23 May 13:16  .config
drwxr-xr-x    - farook  7 Nov  2025  .dwm
.rw-r--r-- 4.3k farook 28 Jun 06:14 󱁻 .tmux.conf
.rw-r--r-- 4.5k farook  7 Nov  2025  .tmux.conf.old
drwxr-xr-x    - farook  5 Jan 05:46  .vim
.rw-r--r--  129 farook  5 Jan 05:52  .vimrc
.rw-r--r-- 6.8k farook  7 Nov  2025  .Xresources
.rw-r--r-- 2.9k farook  5 Feb 08:21 󱆃 .zshrc
.rw-r--r--  396 farook  7 Nov  2025 󱁻 10-synaptics.conf
.rw-r--r--  309 farook  7 Nov  2025 󱁻 30-touchpad.conf
drwxr-xr-x    - farook  7 Nov  2025  alacritty
drwxr-xr-x    - farook  7 Nov  2025  dmenu
drwxr-xr-x    - farook 12 Nov  2025  dwm
.rw-r--r-- 4.0k farook  7 Nov  2025  install_arch_my_step.txt
drwxr-xr-x    - farook  7 Nov  2025  networks
drwxr-xr-x    - farook 23 May 13:58  nvim
drwxr-xr-x    - farook  7 Nov  2025  perl-clipboard
drwxr-xr-x    - farook  7 Nov  2025  powerline
.rw-r--r--   27 farook  7 Nov  2025 󱁻 psmouse.conf
drwxr-xr-x    - farook  7 Nov  2025  ranger
drwxr-xr-x    - farook  7 Nov  2025  slstatus
drwxr-xr-x    - farook  7 Nov  2025  st
.rwxr-xr-x  282 farook 12 Jan 20:15  sync_music.sh
drwxr-xr-x    - farook  7 Nov  2025  xsessions

วินัยช่วยตรวจสอบหน่อยนะว่า script ตอนนี้ัมันมีอะไรที่อาจจะทำงานผิดพลาด หรือว่าไม่ทำงานตามที่ต้องทำบ้าง 
อันนี้จะเป็นเมนู file sxhkdrc ซึ่งผมก็ไม่แน่ใจว่าแอพอะไรบ้าง

#super + Return
#	alacritty --working-directory ~/


# I like to use konsole as my favorite terminal
super + Return
#	konsole --workdir ~/
	xfce4-terminal --default-working-directory=~/


# open rofi like pop-os
super + slash
    xfce4-appfinder --collapsed
    # change this on 12 Aug 2022
    #rofi modi -show drun -theme fancy.rasi


# show theme selector 
super + r 
    rofi-theme-selector


super + shift + Return
    urxvt -e ranger ~/ 

super + F1
    brave 

super + F2
	firefox -no-default-browser-check

super + F3
    chromium -no-default-browser-check

super + F4
    google-chrome-stable  -no-default-browser-check

super + F5 
    vivaldi-stable -no-default-browser-check

super + F6 
    vlc

super + shift + h
    urxvt -e btop

#(install i3exit on 31 Dec 2021)
super + shift + l
    blurlock

super + d
#	rofi -show drun -theme fancy
#	rofi -show drun -theme sidebar
#	rofi -show drun -theme dmenu
	rofi -show drun -theme arthur


super + shift + b
	blueman-manager

super + m 
    urxvt -e "cmus" ; sleep 5s ; cmus-remote -C "update-cache -f"

super + x
  rofi -show power-menu -modi power-menu:rofi-power-menu
		# sh -c "~/.config/dwm/custom_script/stop.sh"
    # urxvt -e python /usr/share/archlinux-logout/archlinux-logout.py
    # urxvt -e sh ~/.config/dwm/scripts/archlinux-logout.sh    
    #urxvt -e sh ~/.config/dwm/custom_script/exit.sh 


super + v
   pavucontrol 

Print 
    spectacle


# restart keyboard
super + alt 
    ~/.config/dwm/custom_script/set_kb.sh

#Picom Toggle
ctrl + alt + o
    ~/.config/dwm/scripts/picom-toggle.sh

# thunar file manager 10 Apr 2024
super + t 
  thunar ~/

# open yazi 
super + shift +f 
  alacritty -e yazi ~/Downloads

# open terminal in sudo mode
super + shift + t
	sudo xfce4-terminal --default-working-directory=/




เดี๋ยวนะ! วินัยรู้ได้ไงว่าผมซดกาแฟอยู่ วินัยมองเห้นผมเหรอ
