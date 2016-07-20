#!/bin/bash
script_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
if [ -f ~/.base16_theme ]; then
  script_name=$(basename $(readlink -f ~/.base16_theme) .sh)
  variation=${script_name#*.}
  variation=none
  [[ $theme =~ -dark ]] && variation=dark
  [[ $theme =~ -light ]] && variation=light
  echo "export BASE16_THEME=${script_name}"
  echo "export BASE16_VARIATION=$variation"
  echo ". ~/.base16_theme"
  if [[ $variation != "none" ]]; then
    echo "tmux_${variation}"
  fi
fi
for script in $script_dir/scripts/base16*.sh; do
  script_name=$(basename $script .sh)
  theme=${script_name#*-}
  variation=none
  [[ $theme =~ -dark ]] && variation=dark
  [[ $theme =~ -light ]] && variation=light
  theme=${theme%-dark}
  theme=${theme%-light}
  if [[ $variation != "none" ]]; then
    func_name="base16_${theme}_${variation}"
  else
    func_name="base16_${theme}"
  fi
  cat <<FUNC
$func_name()
{
  [ -f $script ] && . $script
  ln -fs $script ~/.base16_theme
  export BASE16_THEME=${theme}
  export BASE16_VARIATION=$variation
  if type tmux_${variation} &>/dev/null; then
    tmux_${variation}
  fi
  [ -f ~/.vimrc_background ] && rm ~/.vimrc_background
  if [[ $variation != "none" ]]; then
    echo "background=$variation" >> ~/.vimrc_background
  fi
  echo "colorscheme base16-$theme" >> ~/.vimrc_background
}
FUNC
done;
