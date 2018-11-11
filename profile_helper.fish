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
  set LIGHT_THEMES  "base16-cupcake" "base16-brushtrees" "base16-cupertino" "base16-github" "base16-shapeshifter" "base16-tomorrow"
  function $THEME -V SCRIPT -V THEME
    eval sh '"'$SCRIPT'"'
    ln -sf $SCRIPT ~/.base16_theme
    set -x BASE16_THEME (string split -m 1 '-' $THEME)[2]
    if string match -q -- '*light*' $THEME; or contains $THEME $LIGHT_THEMES
      set BACKGROUND 'light'
    else
      set BACKGROUND 'dark'
    end
    echo -e "if !exists('g:colors_name') || g:colors_name != '$THEME'\n  colorscheme $THEME\n  set background=$BACKGROUND\nendif" >  ~/.vimrc_background
  end
end for
