#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Bespin scheme by Jan T. Sott

export base16_color00="28/21/1c" # Base 00 - Black
export base16_color01="cf/6a/4c" # Base 08 - Red
export base16_color02="54/be/0d" # Base 0B - Green
export base16_color03="f9/ee/98" # Base 0A - Yellow
export base16_color04="5e/a6/ea" # Base 0D - Blue
export base16_color05="9b/85/9d" # Base 0E - Magenta
export base16_color06="af/c4/db" # Base 0C - Cyan
export base16_color07="8a/89/86" # Base 05 - White
export base16_color08="66/66/66" # Base 03 - Bright Black
export base16_color09=$base16_color01 # Base 08 - Bright Red
export base16_color10=$base16_color02 # Base 0B - Bright Green
export base16_color11=$base16_color03 # Base 0A - Bright Yellow
export base16_color12=$base16_color04 # Base 0D - Bright Blue
export base16_color13=$base16_color05 # Base 0E - Bright Magenta
export base16_color14=$base16_color06 # Base 0C - Bright Cyan
export base16_color15="ba/ae/9e" # Base 07 - Bright White
export base16_color16="cf/7d/34" # Base 09
export base16_color17="93/71/21" # Base 0F
export base16_color18="36/31/2e" # Base 01
export base16_color19="5e/5d/5c" # Base 02
export base16_color20="79/79/77" # Base 04
export base16_color21="9d/9b/97" # Base 06
export base16_color_foreground="8a/89/86" # Base 05
export base16_color_background="28/21/1c" # Base 00

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
  put_template_custom Pg 8a8986 # foreground
  put_template_custom Ph 28211c # background
  put_template_custom Pi 8a8986 # bold color
  put_template_custom Pj 5e5d5c # selection color
  put_template_custom Pk 8a8986 # selected text color
  put_template_custom Pl 8a8986 # cursor
  put_template_custom Pm 28211c # cursor text
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
