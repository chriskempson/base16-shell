# Base16 Shell
A shell script to change your shell's default ANSI colors but most importantly, colors 17 to 21 of your shell's 256 colorspace (if supported by your terminal). This script makes it possible honor the original bright colors of your shell (e.g. bright green is still green and so on) whilst providing the additional base16 colors to applications such as Vim.

![Base16 Shell](https://raw.github.com/chriskempson/base16-shell/master/base16-shell.png)

## Use Cases
* You want to use a `*.256.*` variant of a Terminal theme designed to honor the original bright colors.
* You prefer to use a script instead of a terminal emulator theme to color your shell.
* You use this script to have different colorschemes appear on different SSH sessions.

## Installation

    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

## Shells

### Bash/ZSH
In `~/.bashrc` or `~/.zshrc` place the following lines:

    BASE16_SHELL=$HOME/.config/base16-shell/
    [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

start a new shell and then type base16 (tab completion)

### Base16-Vim Users

the profile_helper will update a ~/.vimrc_background file that will have your current the colorscheme, you just need to source this file in your vimrc: i.e. (remove the base16colorspace line if not needed)

    if filereadable(expand("~/.vimrc_background"))
      let base16colorspace=256
      source ~/.vimrc_background
    endif


### Fish
In `config.fish` place the following lines:

    # Base16 Shell
    if status --is-interactive
        eval sh $HOME/.config/base16-shell/scripts/base16-default-dark.sh
    end

## Troubleshooting
Run the included **colortest** script and check that your colour assignments appear correct. If your teminal does not support the setting of colours in within the 256 colorspace (e.g. Apple Terminal), colours 17 to 21 will appear blue.

![setting 256 colourspace not supported](https://raw.github.com/chriskempson/base16-shell/master/setting-256-colourspace-not-supported.png)

If **colortest** is run without any arguments e.g. `./colortest` the hex values shown will correspond to the default scheme. If you'd like to see the hex values for a particular scheme pass the file name of the theme as the arguement e.g. `./colortest base16-ocean.sh`.
