#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Brush Trees Dark scheme by Abraham White &lt;abelincoln.white@gmail.com&gt;

base16_color00="48/58/67" # Base 00 - Black
base16_color01="b3/86/86" # Base 08 - Red
base16_color02="87/b3/86" # Base 0B - Green
base16_color03="aa/b3/86" # Base 0A - Yellow
base16_color04="86/8c/b3" # Base 0D - Blue
base16_color05="b3/86/b2" # Base 0E - Magenta
base16_color06="86/b3/b3" # Base 0C - Cyan
base16_color07="B0/C5/C8" # Base 05 - White
base16_color08="82/99/A1" # Base 03 - Bright Black
base16_color09=$base16_color01 # Base 08 - Bright Red
base16_color10=$base16_color02 # Base 0B - Bright Green
base16_color11=$base16_color03 # Base 0A - Bright Yellow
base16_color12=$base16_color04 # Base 0D - Bright Blue
base16_color13=$base16_color05 # Base 0E - Bright Magenta
base16_color14=$base16_color06 # Base 0C - Bright Cyan
base16_color15="E3/EF/EF" # Base 07 - Bright White
base16_color16="d8/bb/a2" # Base 09
base16_color17="b3/9f/9f" # Base 0F
base16_color18="5A/6D/7A" # Base 01
base16_color19="6D/82/8E" # Base 02
base16_color20="98/AF/B5" # Base 04
base16_color21="C9/DB/DC" # Base 06
base16_color_foreground="B0/C5/C8" # Base 05
base16_color_background="48/58/67" # Base 00

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_var() { printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_custom() { printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' $@; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' $@; }
  put_template_var() { printf '\033P\033]%d;rgb:%s\007\033\\' $@; }
  put_template_custom() { printf '\033P\033]%s%s\007\033\\' $@; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ $1 -lt 16 ] && printf "\e]P%x%s" $1 $(echo $2 | sed 's/\///g'); }
  put_template_var() { true; }
  put_template_custom() { true; }
else
  put_template() { printf '\033]4;%d;rgb:%s\033\\' $@; }
  put_template_var() { printf '\033]%d;rgb:%s\033\\' $@; }
  put_template_custom() { printf '\033]%s%s\033\\' $@; }
fi

# 16 color space
put_template 0  $base16_color00
put_template 1  $base16_color01
put_template 2  $base16_color02
put_template 3  $base16_color03
put_template 4  $base16_color04
put_template 5  $base16_color05
put_template 6  $base16_color06
put_template 7  $base16_color07
put_template 8  $base16_color08
put_template 9  $base16_color09
put_template 10 $base16_color10
put_template 11 $base16_color11
put_template 12 $base16_color12
put_template 13 $base16_color13
put_template 14 $base16_color14
put_template 15 $base16_color15

# 256 color space
put_template 16 $base16_color16
put_template 17 $base16_color17
put_template 18 $base16_color18
put_template 19 $base16_color19
put_template 20 $base16_color20
put_template 21 $base16_color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg B0C5C8 # foreground
  put_template_custom Ph 485867 # background
  put_template_custom Pi B0C5C8 # bold color
  put_template_custom Pj 6D828E # selection color
  put_template_custom Pk B0C5C8 # selected text color
  put_template_custom Pl B0C5C8 # cursor
  put_template_custom Pm 485867 # cursor text
else
  put_template_var 10 $base16_color_foreground
  if [ "$BASE16_SHELL_SET_BACKGROUND" != false ]; then
    put_template_var 11 $base16_color_background
    if [ "${TERM%%-*}" = "rxvt" ]; then
      put_template_var 708 $base16_color_background # internal border (rxvt)
    fi
  fi
  put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset -f put_template
unset -f put_template_var
unset -f put_template_custom
unset base16_color00
unset base16_color01
unset base16_color02
unset base16_color03
unset base16_color04
unset base16_color05
unset base16_color06
unset base16_color07
unset base16_color08
unset base16_color09
unset base16_color10
unset base16_color11
unset base16_color12
unset base16_color13
unset base16_color14
unset base16_color15
unset base16_color16
unset base16_color17
unset base16_color18
unset base16_color19
unset base16_color20
unset base16_color21
unset base16_color_foreground
unset base16_color_background
