#!/bin/sh
# Base16 Flat - Shell color setup script
# Chris Kempson (http://chriskempson.com)

if [ "${TERM%%-*}" = 'linux' ]; then
    # This script doesn't support linux console (use 'vconsole' template instead)
    return 2>/dev/null || exit 0
fi

color00="2C/3E/50" # Base 00 - Black
color01="E7/4C/3C" # Base 08 - Red
color02="2E/CC/71" # Base 0B - Green
color03="F1/C4/0F" # Base 0A - Yellow
color04="34/98/DB" # Base 0D - Blue
color05="9B/59/B6" # Base 0E - Magenta
color06="1A/BC/9C" # Base 0C - Cyan
color07="e0/e0/e0" # Base 05 - White
color08="95/A5/A6" # Base 03 - Bright Black
color09=$color01 # Base 08 - Bright Red
color10=$color02 # Base 0B - Bright Green
color11=$color03 # Base 0A - Bright Yellow
color12=$color04 # Base 0D - Bright Blue
color13=$color05 # Base 0E - Bright Magenta
color14=$color06 # Base 0C - Bright Cyan
color15="EC/F0/F1" # Base 07 - Bright White
color16="E6/7E/22" # Base 09
color17="be/64/3c" # Base 0F
color18="34/49/5E" # Base 01
color19="7F/8C/8D" # Base 02
color20="BD/C3/C7" # Base 04
color21="f5/f5/f5" # Base 06
color_foreground="e0/e0/e0" # Base 05
color_background="2C/3E/50" # Base 00
color_cursor="e0/e0/e0" # Base 05

if [ -n "$TMUX" ]; then
  # tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template="\033Ptmux;\033\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033Ptmux;\033\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033Ptmux;\033\033]%s%s\007\033\\"
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template="\033P\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033P\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033P\033]%s%s\007\033\\"
else
  printf_template="\033]4;%d;rgb:%s\033\\"
  printf_template_var="\033]%d;rgb:%s\033\\"
  printf_template_custom="\033]%s%s\033\\"
fi

# 16 color space
printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15

# 256 color space
printf $printf_template 16 $color16
printf $printf_template 17 $color17
printf $printf_template 18 $color18
printf $printf_template 19 $color19
printf $printf_template 20 $color20
printf $printf_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  printf $printf_template_custom Pg e0e0e0 # forground
  printf $printf_template_custom Ph 2C3E50 # background
  printf $printf_template_custom Pi e0e0e0 # bold color
  printf $printf_template_custom Pj 7F8C8D # selection color
  printf $printf_template_custom Pk e0e0e0 # selected text color
  printf $printf_template_custom Pl e0e0e0 # cursor
  printf $printf_template_custom Pm 2C3E50 # cursor text
else
  printf $printf_template_var 10 $color_foreground
  printf $printf_template_var 11 $color_background
  printf $printf_template_var 12 $color_cursor
fi

# clean up
unset printf_template
unset printf_template_var
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
unset color_foreground
unset color_background
unset color_cursor
