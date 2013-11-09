# Base16 Shell
Changes your shell's first 21 colors via escape sequences. Make sure this script is run each time you open a new shell!

![Base16 Shell](https://raw.github.com/chriskempson/base16-shell/master/base16-shell.png)

## Installation

    git clone git@github.com:chriskempson/base16-shell.git ~/.config/base16-shell

## Shells

### ZSH

    # Base16 Shell
    BASE16_SCHEME="default"
    BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
    [[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

### Fish
In `config.fish` have the following line:

    # Base16 Shell
    eval sh $HOME/.base16-default.dark.sh
