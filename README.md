# Base16 Shell
See the [Base16 repository](https://github.com/chriskempson/base16) for more information.
These scripts were built with [Base16 Builder PHP](https://github.com/chriskempson/base16-builder-php).

A shell script to change your shell's default ANSI colors but most importantly, colors 17 to 21 of your shell's 256 colorspace (if supported by your terminal). This script makes it possible to honor the original bright colors of your shell (e.g. bright green is still green and so on) while providing additional base16 colors to applications such as Vim.

![Base16 Shell](base16-shell.png)

## Use Cases

* You want to use a `*.256.*` variant of a Terminal theme designed to honor the original bright colors (default 16 colors also implemented).
* You prefer to use a script instead of a terminal emulator theme to color your shell.
* You use this script to have different colorschemes appear on different SSH sessions.

## Installation

```shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
```

## Configuration

### Bash/ZSH

Add following lines to `~/.bashrc` or `~/.zshrc`:

```bash
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
# Uncomment the following line if you want the default 16 colors template
#export BASE16_SHELL_DEFAULT_VARIANT="1"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
```

Open a new shell and type `base16` followed by a tab to perform tab completion.

### Fish

Add following lines to `~/.config/fish/config.fish`:

```fish
# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    # Uncomment the following line if you want the default 16 colors template
    #set -x BASE16_SHELL_DEFAULT_VARIANT "1"
    source "$BASE16_SHELL/profile_helper.fish"
end
```

Open a new shell and type `base16` followed by a tab to perform tab completion.

### Base16-Vim Users

the profile_helper will update a ~/.vimrc_background file that will have your current the colorscheme, you just need to source this file in your vimrc: i.e. (remove the base16colorspace line if not needed)

    if filereadable(expand("~/.vimrc_background"))
      " Comment the following line if you are using the default 16 colors template
      let base16colorspace=256
      source ~/.vimrc_background
    endif

## Troubleshooting

Run the included **colortest** script and check that your colour assignments appear correct. If your teminal does not support the setting of colours in within the 256 colorspace (e.g. Apple Terminal), colours 17 to 21 will appear blue. In this situation, you can use the default 16 colors variant (see the [Configuration](#Configuration) section above).

![setting 256 colourspace not supported](setting-256-colourspace-not-supported.png)

If **colortest** is run without any arguments e.g. `./colortest` the hex values shown will correspond to the default scheme. If you'd like to see the hex values for a particular scheme pass the file name of the theme as the arguement e.g. `./colortest base16-ocean.sh`.

### Inverted blacks and whites

This is the expected behaviour when using a light theme:
https://github.com/chriskempson/base16-shell/issues/150
