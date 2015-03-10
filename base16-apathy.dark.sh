#!/bin/sh
# Base16 Apathy - Shell color setup script
# Jannik Siebert (https://github.com/janniks)

if [ "${TERM%%-*}" = 'linux' ]; then
    # This script doesn't support linux console (use 'vconsole' template instead)
    return 2>/dev/null || exit 0
fi

color00="03/1A/16" # Base 00 - Black
color01="3E/96/88" # Base 08 - Red
color02="88/3E/96" # Base 0B - Green
color03="3E/4C/96" # Base 0A - Yellow
color04="96/88/3E" # Base 0D - Blue
color05="4C/96/3E" # Base 0E - Magenta
color06="96/3E/4C" # Base 0C - Cyan
color07="81/B5/AC" # Base 05 - White
color08="2B/68/5E" # Base 03 - Bright Black
color09=$color01 # Base 08 - Bright Red
color10=$color02 # Base 0B - Bright Green
color11=$color03 # Base 0A - Bright Yellow
color12=$color04 # Base 0D - Bright Blue
color13=$color05 # Base 0E - Bright Magenta
color14=$color06 # Base 0C - Bright Cyan
color15="D2/E7/E4" # Base 07 - Bright White
color16="3E/79/96" # Base 09
color17="3E/96/5B" # Base 0F
color18="0B/34/2D" # Base 01
color19="18/4E/45" # Base 02
color20="5F/9C/92" # Base 04
color21="A7/CE/C8" # Base 06
color_foreground="81/B5/AC" # Base 05
color_background="03/1A/16" # Base 00
color_cursor="81/B5/AC" # Base 05

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
  printf $printf_template_custom Pg 81B5AC # forground
  printf $printf_template_custom Ph 031A16 # background
  printf $printf_template_custom Pi 81B5AC # bold color
  printf $printf_template_custom Pj 184E45 # selection color
  printf $printf_template_custom Pk 81B5AC # selected text color
  printf $printf_template_custom Pl 81B5AC # cursor
  printf $printf_template_custom Pm 031A16 # cursor text
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
