#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -lah --group-directories-first --color=auto'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# sources colours we can use as variables
. ~/.cache/wal/colors.sh

# prompts
if [[ -n $no_color_prompt ]]; then
  PS1="[\$? \w]\$ "
else
  # coloured getting colours from pywal
  # can set to background,foreground or color0..15
  fromhex(){
    # converts a hex RRGGBB to a 256-color code
    hex=${1#"#"}
    r=$(printf '0x%0.2s' "$hex")
    g=$(printf '0x%0.2s' ${hex#??})
    b=$(printf '0x%0.2s' ${hex#????})
    printf '%03d' "$(( (r<75?0:(r-35)/40)*6*6 +
                       (g<75?0:(g-35)/40)*6   +
                       (b<75?0:(b-35)/40)     + 16 ))"
  }

  prompt_color=${color13:1:6}
  pct=$(fromhex $prompt_color)
  PS1="\[\$(tput setaf $pct)\][\$? \w]\[\$(tput sgr0)\]\[$(tput setaf 207)\]\$(parse_git_branch)\[\$(tput sgr0)\]\$ "
fi

# for catting images with kitty
alias icat="kitty +kitten icat"
alias kitdiff="kitty +kitten diff"
alias kitclip="kitty +kitten clipboard"

source /usr/share/doc/pkgfile/command-not-found.bash

alias open="xdg-open"

