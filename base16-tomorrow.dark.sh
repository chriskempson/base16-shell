#!/bin/sh
# Base16 Tomorrow - Console color setup script
# Chris Kempson (http://chriskempson.com)

color00="1d1f21" # Base 00 - Black
color01="cc6666" # Base 08 - Red
color02="b5bd68" # Base 0B - Green
color03="f0c674" # Base 0A - Yellow
color04="81a2be" # Base 0D - Blue
color05="b294bb" # Base 0E - Magenta
color06="8abeb7" # Base 0C - Cyan
color07="c5c8c6" # Base 05 - White
color08="969896" # Base 03 - Bright Black
color09=$color01 # Base 08 - Bright Red
color10=$color02 # Base 0B - Bright Green
color11=$color03 # Base 0A - Bright Yellow
color12=$color04 # Base 0D - Bright Blue
color13=$color05 # Base 0E - Bright Magenta
color14=$color06 # Base 0C - Bright Cyan
color15="ffffff" # Base 07 - Bright White
color16="de/93/5f" # Base 09
color17="a3/68/5a" # Base 0F
color18="28/2a/2e" # Base 01
color19="37/3b/41" # Base 02
color20="b4/b7/b4" # Base 04
color21="e0/e0/e0" # Base 06

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

# clean up
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
