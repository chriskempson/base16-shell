#!/usr/bin/env bash
if [ -s "$BASH" ]; then
    file_name=${BASH_SOURCE[0]}
elif [ -s "$ZSH_NAME" ]; then
    file_name=${(%):-%x}
fi
script_dir=$(cd "$(dirname "$file_name")" && pwd)

. "$script_dir/realpath/realpath.sh"

if [ -f ~/.base16_theme ]; then
  script_name=$(basename "$(realpath ~/.base16_theme)" .sh)
  echo "export BASE16_THEME=${script_name#*-}"
  echo ". ~/.base16_theme"
fi
cat <<'FUNC'
_base16()
{
  local script=$1
  local theme=$2
  [ -f $script ] && . $script
  ln -fs $script ~/.base16_theme
  export BASE16_THEME=${theme}
  echo -e "if \0041exists('g:colors_name') || g:colors_name != 'base16-$theme'\n  colorscheme base16-$theme\nendif" >| ~/.vimrc_background
  if [ -n ${BASE16_SHELL_HOOKS:+s} ] && [ -d "${BASE16_SHELL_HOOKS}" ]; then
    for hook in $BASE16_SHELL_HOOKS/*; do
      [ -f "$hook" ] && [ -x "$hook" ] && "$hook"
    done
  fi
}
FUNC
for script in "$script_dir"/scripts/base16*.sh; do
  script_name=${script##*/}
  script_name=${script_name%.sh}
  theme=${script_name#*-}
  func_name="base16_${theme}"
  echo "alias $func_name=\"_base16 \\\"$script\\\" $theme\""
done;
