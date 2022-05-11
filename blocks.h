//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {

    /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    {"", "sh ~/.config/dwmblocks/scripts/vol.sh", 0, 11},
    {"", "sh ~/.config/dwmblocks/scripts/bat.sh", 10, 1},
    {"", "sh ~/.config/dwmblocks/scripts/date.sh", 1, 2},


};

static char delim[] = " | ";
static unsigned int delimLen = 5;
