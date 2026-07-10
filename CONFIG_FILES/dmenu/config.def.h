/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* 🎨 ซิงค์ขนาดฟอนต์ให้เข้าล็อกกับตัว DWM บาร์ด้านบน ไม่ให้ UI ขยายเหลื่อมล้ำ */
static const char *fonts[] = {
    "JetBrainsMono Nerd Font:size=11",
    "IBM Plex Sans Thai:size=11"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */

/* 🎨 คุมโทนสีดรอปดิ่งเข้าคู่ Nord Theme เรียบหรู สะอาดตา */
static const char *colors[SchemeLast][2] = {
    /*     fg         bg       */
    [SchemeNorm] = { "#d8dee9", "#2e3440" }, /* ตัวอักษรขาวนวล บนพื้นเทาเข้ม */
    [SchemeSel]  = { "#2e3440", "#88c0d0" }, /* แถบไฮไลท์สีฟ้าสว่าง ตัวหนังสือตัดเข้มเด่นชัด */
    [SchemeOut]  = { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 * ปรับให้ขยายการลบคำเว้นวรรคใน CLI ให้เรียบร้อยขึ้น
 */
static const char worddelimiters[] = " /?\"&[]";
