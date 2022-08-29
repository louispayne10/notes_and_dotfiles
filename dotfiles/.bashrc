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
  prompt_col=142
  PS1="\[\$(tput setaf $prompt_col)\][\$? \w]\[\$(tput sgr0)\]\[$(tput setaf 132)\]\$(parse_git_branch)\[\$(tput sgr0)\]\$ "
fi

# for catting images with kitty
alias icat="kitty +kitten icat"
alias kitdiff="kitty +kitten diff"
alias kitclip="kitty +kitten clipboard"

source /usr/share/doc/pkgfile/command-not-found.bash

alias open="xdg-open"

# wait 300ms before repeating key press and then send that 35 times a second
set r rate 300 35
