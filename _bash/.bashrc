# Set vim as default editor
export EDITOR=vim

# Git Aware Prompt. Track git branch in shell prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

# Prompt Display --------------------------------------------------------------
# OS detection: http://stackoverflow.com/a/17072017
# multiline
if [ "$(uname)" == "Darwin" ]; then
    export PS1="\033[01m[ \033[01;34m\u@\h \033[00m\033[01m] \033[01;32m\w\033[00m\n\033[01;34m\$git_branch\$git_dirty$\033[00m "
else
    export PS1="[\033[01m][ [\033[01;34m]\u@\h [\033[00m][\033[01m]] [\033[01;32m]\w[\033[00m]\n[\033[01;34m]\$[\033[00m]> "
fi
#export PS1="[\033[01m][ [\033[01;34m]\u@\h [\033[00m][\033[01m]] [\033[01;32m]\w[\033[00m]\n[\033[01;34m]$[\033[00m]>"
# single line

