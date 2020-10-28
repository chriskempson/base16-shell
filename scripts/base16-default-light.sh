#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Default Light scheme by Chris Kempson (http://chriskempson.com)

export base16_color00="f8/f8/f8" # Base 00 - Black
export base16_color01="ab/46/42" # Base 08 - Red
export base16_color02="a1/b5/6c" # Base 0B - Green
export base16_color03="f7/ca/88" # Base 0A - Yellow
export base16_color04="7c/af/c2" # Base 0D - Blue
export base16_color05="ba/8b/af" # Base 0E - Magenta
export base16_color06="86/c1/b9" # Base 0C - Cyan
export base16_color07="38/38/38" # Base 05 - White
export base16_color08="b8/b8/b8" # Base 03 - Bright Black
export base16_color09=$base16_color01 # Base 08 - Bright Red
export base16_color10=$base16_color02 # Base 0B - Bright Green
export base16_color11=$base16_color03 # Base 0A - Bright Yellow
export base16_color12=$base16_color04 # Base 0D - Bright Blue
export base16_color13=$base16_color05 # Base 0E - Bright Magenta
export base16_color14=$base16_color06 # Base 0C - Bright Cyan
export base16_color15="18/18/18" # Base 07 - Bright White
export base16_color16="dc/96/56" # Base 09
export base16_color17="a1/69/46" # Base 0F
export base16_color18="e8/e8/e8" # Base 01
export base16_color19="d8/d8/d8" # Base 02
export base16_color20="58/58/58" # Base 04
export base16_color21="28/28/28" # Base 06
export base16_color_foreground="38/38/38" # Base 05
export base16_color_background="f8/f8/f8" # Base 00

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
  put_template_custom Pg 383838 # foreground
  put_template_custom Ph f8f8f8 # background
  put_template_custom Pi 383838 # bold color
  put_template_custom Pj d8d8d8 # selection color
  put_template_custom Pk 383838 # selected text color
  put_template_custom Pl 383838 # cursor
  put_template_custom Pm f8f8f8 # cursor text
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
