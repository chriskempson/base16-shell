#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell Hendrik Peter vd Meulen (https://www.picoreclame.nl)
# Firesparks scheme by dsalychev

color00="14/14/14" # Base 00 - Black
color01="CF/6A/4C" # Base 08 - Red
color02="8F/9D/6A" # Base 0B - Green
color03="DC/C9/73" # Base 0A - Yellow
color04="E1/B1/6A" # Base 0D - Blue (changed to variation of red)
color05="C8/A9/72" # Base 0E - Magenta (changed to variation of yellow)
color06="EA/32/23" # Base 0C - Cyan (changed to variation of deep red)
color07="D0/D0/D0" # Base 05 - White
color08="5E/5E/5E" # Base 03 - Grey
color09="EA/95/60" # Base 08 - Bright Red (changed to variation of orange)
color10="D7/D6/91" # Base 0B - Bright Green
color11=$color10   # Base 0A - Bright Yellow (same as bright green)
color12=$color04   # Base 0D - Bright Blue (changed to red)
color13=$color05   # Base 0E - Bright Magenta (changed to variation of yellow)
color14=$color06   # Base 0C - Bright Cyan (changed to variation of deep red)
color15="FF/FF/FF" # Base 07 - Bright White
color16=$color09   # Base 09
color17=$color01   # Base 0F
color18="21/21/21" # Base 01
color19="35/35/35" # Base 02
color20="C9/CC/D3" # Base 04
color21="D5/DB/E5" # Base 06
color_foreground=$color07 # Base 05
color_background=$color00 # Base 00

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
put_template 0  $color00
put_template 1  $color01
put_template 2  $color02
put_template 3  $color03
put_template 4  $color04
put_template 5  $color05
put_template 6  $color06
put_template 7  $color07
put_template 8  $color08
put_template 9  $color09
put_template 10 $color10
put_template 11 $color11
put_template 12 $color12
put_template 13 $color13
put_template 14 $color14
put_template 15 $color15

# 256 color space
put_template 16 $color16
put_template 17 $color17
put_template 18 $color18
put_template 19 $color19
put_template 20 $color20
put_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg D0D0D0 # foreground
  put_template_custom Ph 141414 # background
  put_template_custom Pi D0D0D0 # bold color
  put_template_custom Pj 424242 # selection color
  put_template_custom Pk D0D0D0 # selected text color
  put_template_custom Pl D0D0D0 # cursor
  put_template_custom Pm 1C1919 # cursor text
else
  put_template_var 10 $color_foreground
  if [ "$BASE16_SHELL_SET_BACKGROUND" != false ]; then
    put_template_var 11 $color_background
    if [ "${TERM%%-*}" = "rxvt" ]; then
      put_template_var 708 $color_background # internal border (rxvt)
    fi
  fi
  put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset -f put_template
unset -f put_template_var
unset -f put_template_custom
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
