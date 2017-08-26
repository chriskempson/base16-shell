#!/usr/bin/env fish

# [what] provides aliases for base16 themes and sets ~/.base16_theme
#
# [usage] can be added to ~/.config/fish/config.fish like so:
#
# if status --is-interactive
#    source $HOME/.config/base16-shell/profile_helper.fish
# end
#
# TODO: maybe port to $HOME/.config/fish/functions ?


set SCRIPT_DIR (realpath (dirname (status -f)))

# load currently active theme...
if test -e ~/.base16_theme
  eval sh '"'(realpath ~/.base16_theme)'"'
end


# set aliases, like base16_*...
for SCRIPT in $SCRIPT_DIR/scripts/*.sh
  set THEME (basename $SCRIPT .sh)
  function $THEME -V SCRIPT -V THEME
    eval sh '"'$SCRIPT'"'
    ln -sf $SCRIPT ~/.base16_theme
    set -x BASE16_THEME (string split -m 1 '-' $THEME)[2]
    echo -e "if !exists('g:colors_name') || g:colors_name != '$THEME'\n  colorscheme $THEME\nendif" >  ~/.vimrc_background
  end
end for
