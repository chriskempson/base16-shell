#!/bin/bash
script_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

. $script_dir/realpath/realpath.sh

if [ -f ~/.base16_theme ]; then
  script_name=$(basename $(realpath ~/.base16_theme) .sh)
  echo "export BASE16_THEME=${script_name}"
  echo ". ~/.base16_theme"
fi
for script in $script_dir/scripts/base16*.sh; do
  script_name=$(basename $script .sh)
  theme=${script_name#*-}
  func_name="base16_${theme}"
  cat <<FUNC
$func_name()
{
  [ -f $script ] && . $script
  ln -fs $script ~/.base16_theme
  export BASE16_THEME=${theme}
  echo "colorscheme base16-$theme" > ~/.vimrc_background
}
FUNC
done;
