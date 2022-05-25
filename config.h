#define CMDLENGTH 60
#define DELIMITER "  "
#define CLICKABLE_BLOCKS

const Block blocks[] = {
//	BLOCK("sh ~/.config/dwmblocks/scripts/pad.sh", 0, 1),
    BLOCK("sh ~/.config/dwmblocks/scripts/bluetooth.sh", 5, 4),
	BLOCK("sh ~/.config/dwmblocks/scripts/updates.sh", 3600, 2),
	BLOCK("sh ~/.config/dwmblocks/scripts/bcklt.sh", 0, 12),
	BLOCK("sh ~/.config/dwmblocks/scripts/vol.sh", 0, 11),
	BLOCK("sh ~/.config/dwmblocks/scripts/bat.sh", 3, 1),
	BLOCK("sh ~/.config/dwmblocks/scripts/date.sh", 1, 3),
	BLOCK("sh ~/.config/dwmblocks/scripts/pad.sh", 0, 1),
};
