BASE16_SHELL=${(%):-%x}
BASE16_SHELL=${BASE16_SHELL%/*}
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && source "$BASE16_SHELL/profile_helper.sh"
