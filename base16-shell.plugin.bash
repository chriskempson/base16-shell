BASE16_SHELL=$(dirname ${BASH_SOURCE[0]})
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
