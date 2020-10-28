#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Atelier Forest scheme by Bram de Haan (http://atelierbramdehaan.nl)

export base16_color00="1b/19/18" # Base 00 - Black
export base16_color01="f2/2c/40" # Base 08 - Red
export base16_color02="7b/97/26" # Base 0B - Green
export base16_color03="c3/84/18" # Base 0A - Yellow
export base16_color04="40/7e/e7" # Base 0D - Blue
export base16_color05="66/66/ea" # Base 0E - Magenta
export base16_color06="3d/97/b8" # Base 0C - Cyan
export base16_color07="a8/a1/9f" # Base 05 - White
export base16_color08="76/6e/6b" # Base 03 - Bright Black
export base16_color09=$base16_color01 # Base 08 - Bright Red
export base16_color10=$base16_color02 # Base 0B - Bright Green
export base16_color11=$base16_color03 # Base 0A - Bright Yellow
export base16_color12=$base16_color04 # Base 0D - Bright Blue
export base16_color13=$base16_color05 # Base 0E - Bright Magenta
export base16_color14=$base16_color06 # Base 0C - Bright Cyan
export base16_color15="f1/ef/ee" # Base 07 - Bright White
export base16_color16="df/53/20" # Base 09
export base16_color17="c3/3f/f3" # Base 0F
export base16_color18="2c/24/21" # Base 01
export base16_color19="68/61/5e" # Base 02
export base16_color20="9c/94/91" # Base 04
export base16_color21="e6/e2/e0" # Base 06
export base16_color_foreground="a8/a1/9f" # Base 05
export base16_color_background="1b/19/18" # Base 00

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
  put_template_custom Pg a8a19f # foreground
  put_template_custom Ph 1b1918 # background
  put_template_custom Pi a8a19f # bold color
  put_template_custom Pj 68615e # selection color
  put_template_custom Pk a8a19f # selected text color
  put_template_custom Pl a8a19f # cursor
  put_template_custom Pm 1b1918 # cursor text
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
