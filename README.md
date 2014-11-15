# Base16 Shell
A shell script to change your shell's default ANSI colors but most importantly, colors 17 to 21 of your shell's 256 colorspace (if supported by your terminal). This script makes it possible honor the original bright colors of your shell (e.g. bright green is still green and so on) whilst providing the additional base16 colors to applications such as Vim.

![Base16 Shell](https://raw.github.com/chriskempson/base16-shell/master/base16-shell.png)

## Use Cases
* You want to use a `*.256.*` varient of a Termainal theme designed to honor the original bright colors.
* You prefer to use a script instead of a terminal emulator theme to color your shell.
* You use this script to have different colorschemes appear on different SSH sessions.

## Installation

    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

## Shells

### Bash/ZSH
In `~/.bashrc` or `~/.zshrc` place the following lines:

    # Base16 Shell
    BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
    [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

### Fish
In `config.fish` place the following lines:

    # Base16 Shell
    eval sh $HOME/.config/base16-shell/base16-default.dark.sh

## Troubleshooting
Run the included **colortest** script and check that your colour assignments appear correct. If your teminal does not support the setting of colours in within the 256 colorspace (e.g. Apple Terminal), colours 17 to 21 will appear blue.

![setting 256 colourspace not supported](https://raw.github.com/chriskempson/base16-shell/master/setting-256-colourspace-not-supported.png)

If **colortest** is run without any arguments e.g. `./colortest` the hex values shown will correspond to the default scheme. If you'd like to see the hex values for a particular scheme pass the file name of the theme as the arguement e.g. `./colortest base16-ocean.dark.sh`.
