#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Atelier Savanna Light scheme by Bram de Haan (http://atelierbramdehaan.nl)

export base16_color00="ec/f4/ee" # Base 00 - Black
export base16_color01="b1/61/39" # Base 08 - Red
export base16_color02="48/99/63" # Base 0B - Green
export base16_color03="a0/7e/3b" # Base 0A - Yellow
export base16_color04="47/8c/90" # Base 0D - Blue
export base16_color05="55/85/9b" # Base 0E - Magenta
export base16_color06="1c/9a/a0" # Base 0C - Cyan
export base16_color07="52/60/57" # Base 05 - White
export base16_color08="78/87/7d" # Base 03 - Bright Black
export base16_color09=$base16_color01 # Base 08 - Bright Red
export base16_color10=$base16_color02 # Base 0B - Bright Green
export base16_color11=$base16_color03 # Base 0A - Bright Yellow
export base16_color12=$base16_color04 # Base 0D - Bright Blue
export base16_color13=$base16_color05 # Base 0E - Bright Magenta
export base16_color14=$base16_color06 # Base 0C - Bright Cyan
export base16_color15="17/1c/19" # Base 07 - Bright White
export base16_color16="9f/71/3c" # Base 09
export base16_color17="86/74/69" # Base 0F
export base16_color18="df/e7/e2" # Base 01
export base16_color19="87/92/8a" # Base 02
export base16_color20="5f/6d/64" # Base 04
export base16_color21="23/2a/25" # Base 06
export base16_color_foreground="52/60/57" # Base 05
export base16_color_background="ec/f4/ee" # Base 00

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
  put_template_custom Pg 526057 # foreground
  put_template_custom Ph ecf4ee # background
  put_template_custom Pi 526057 # bold color
  put_template_custom Pj 87928a # selection color
  put_template_custom Pk 526057 # selected text color
  put_template_custom Pl 526057 # cursor
  put_template_custom Pm ecf4ee # cursor text
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
