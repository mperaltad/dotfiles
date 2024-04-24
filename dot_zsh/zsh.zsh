export COMPLETION_WAITING_DOTS="true"

# export HISTSIZE=32768;
# export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups:erasedups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
