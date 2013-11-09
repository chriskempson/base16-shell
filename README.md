# Base16 Shell
A shell script to change your terminal's default ANSI colors and colors 17 to 21 of your shell's 256 colorspace (if supported).

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
