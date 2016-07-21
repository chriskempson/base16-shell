#!/bin/bash
script_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
get_variation() {
  local theme=$1
  variation=none
  if [[ $theme =~ -dark ]] || [[ $theme =~ -night$ ]]; then
    variation=dark
  fi
  if [[ $theme =~ -light ]] || [[ $theme =~ tomorrow$ ]]; then
    variation=light
  fi
}
if [ -f ~/.base16_theme ]; then
  script_name=$(basename $(readlink -f ~/.base16_theme) .sh)
  get_variation $script_name
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
  get_variation $script_name
  func_name="base16_${theme}"
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
  echo "colorscheme base16-$theme" >> ~/.vimrc_background
}
FUNC
done;
