#!/bin/bash
script_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
for script in $script_dir/base16*.sh; do
  script_name=$(basename $script .sh)
  theme=${script_name#*-}
  variation=${theme#*.}
  theme=${theme%.*}
  cat <<FUNC
base16_${theme}_${variation}()
{
  . $script
  ln -fs $script ~/.base16_theme 
  export BASE16_THEME=base16-${theme}
  export BASE16_VARIATION=$variation
  echo $variation > ~/.base16_variation.rc
  if type tmux_${variation} >/dev/null; then
    tmux_${variation}
  fi
  [ -f ~/.vimrc_background ] && rm ~/.vimrc_background
  cat <<VIMRC_BACKGROUND > ~/.vimrc_background
set background=$variation
colorscheme base16-$theme
VIMRC_BACKGROUND
}
FUNC
done;
[ -f ~/.base16_theme ] && echo ". ~/.base16_theme"
