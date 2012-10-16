#!/bin/sh
# Base16 Solarized - Console color setup script
# Ethan Schoonover (http://ethanschoonover.com/solarized)

color00="002b36" # Base 00 - Black
color01="dc322f" # Base 08 - Red
color02="859900" # Base 0B - Green
color03="b58900" # Base 0A - Yellow
color04="268bd2" # Base 0D - Blue
color05="6c71c4" # Base 0E - Magenta
color06="2aa198" # Base 0C - Cyan
color07="93a1a1" # Base 05 - White
color08="657b83" # Base 03 - Bright Black
color09=$color01 # Base 08 - Bright Red
color10=$color02 # Base 0B - Bright Green
color11=$color03 # Base 0A - Bright Yellow
color12=$color04 # Base 0D - Bright Blue
color13=$color05 # Base 0E - Bright Magenta
color14=$color06 # Base 0C - Bright Cyan
color15="fdf6e3" # Base 07 - Bright White
color16="cb/4b/16" # Base 09
color17="d3/36/82" # Base 0F
color18="07/36/42" # Base 01
color19="58/6e/75" # Base 02
color20="83/94/96" # Base 04
color21="ee/e8/d5" # Base 06

# Bright colors that are actually bright!
# color09="ffa4ac" # Base XX - Bright Red
# color10="c6e9a5" # Base XX - Bright Green
# color11="ffdabf" # Base XX - Bright Yellow
# color12="b1ecf7" # Base XX - Bright Blue
# color13="ffd4f4" # Base XX - Bright Magenta
# color14="bbffef" # Base XX - Bright Cyan

# 16 color space
printf "\e]P0$color00\e\\"
printf "\e]P1$color01\e\\"
printf "\e]P2$color02\e\\"
printf "\e]P3$color03\e\\"
printf "\e]P4$color04\e\\"
printf "\e]P5$color05\e\\"
printf "\e]P6$color06\e\\"
printf "\e]P7$color07\e\\"
printf "\e]P8$color08\e\\"
printf "\e]P9$color09\e\\"
printf "\e]PA$color10\e\\"
printf "\e]PB$color11\e\\"
printf "\e]PC$color12\e\\"
printf "\e]PD$color13\e\\"
printf "\e]PE$color14\e\\"
printf "\e]PF$color15\e\\"

# 256 color space
if [ "$TERM" != linux ]; then
  printf "\e]4;16;rgb:$color16\e\\"
  printf "\e]4;17;rgb:$color17\e\\"
  printf "\e]4;18;rgb:$color18\e\\"
  printf "\e]4;19;rgb:$color19\e\\"
  printf "\e]4;20;rgb:$color20\e\\"
  printf "\e]4;21;rgb:$color21\e\\"
fi
