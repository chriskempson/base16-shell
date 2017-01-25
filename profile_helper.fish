#!/usr/bin/fish

# [what] provides aliases for base16 themes and sets ~/.base16_theme
#
# [usage] can be added to ~/.config/fish/config.fish like so:
#
# if status --is-interactive
#    source $HOME/.config/base16-shell/profile_helper.fish
# end
#
# TODO: maybe port to $HOME/.config/fish/functions ?

# load currently active theme...
if test -e ~/.base16_theme
  eval sh (realpath ~/.base16_theme)
end

# set aliases, like base16_*...
for script in .config/base16-shell/scripts/*.sh
  alias ( basename $script .sh ) "eval sh $script ; ln -sf $script  ~/.base16_theme "
end for
