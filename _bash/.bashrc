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
    export PS1="\033[01m[ \033[01;34m\u@\h \033[00m\033[01m] \033[01;32m\w\033[00m\n\033[01;34m\$git_branch\$git_dirty$\033[00m "
    #export PS1="[\033[01m][ [\033[01;34m]\u@\h [\033[00m][\033[01m]] [\033[01;32m]\w[\033[00m]\n[\033[01;34m]$ [\033[00m]> "
fi

# Virtual Environments --------------------------------------------------------

export WORKON_HOME="$HOME"/venv
export PROJECT_HOME="$HOME"/Desktop
source /usr/local/bin/virtualenvwrapper.sh

# Automatically activate Git projects' virtual environments based on the
# directory name of the project. Virtual environment name can be overridden
# by placing a .venv file in the project root with a virtualenv name in it
# original: http://hmarr.com/2010/jan/19/making-virtualenv-play-nice-with-git/
function workon_cwd {
    # Check that this is a Git repo
    GIT_DIR=`git rev-parse --git-dir 2> /dev/null`
    if [ $? == 0 ]; then
        # Find the repo root and check for virtualenv name override
        GIT_DIR=`\cd $GIT_DIR; pwd`
        PROJECT_ROOT=`dirname "$GIT_DIR"`
        ENV_NAME=`basename "$PROJECT_ROOT"`
        if [ -f "$PROJECT_ROOT/.venv" ]; then
            ENV_NAME=`cat "$PROJECT_ROOT/.venv"`
        fi
        # Activate the environment only if it is not already active
        if [ "$VIRTUAL_ENV" != "$WORKON_HOME/$ENV_NAME" ]; then
            if [ -e "$WORKON_HOME/$ENV_NAME/bin/activate" ]; then
                workon "$ENV_NAME" && export CD_VIRTUAL_ENV="$ENV_NAME"
            fi
        fi
    elif [ $CD_VIRTUAL_ENV ]; then
        # We've just left the repo, deactivate the environment
        # Note: this only happens if the virtualenv was activated automatically
        deactivate && unset CD_VIRTUAL_ENV
    fi
}

# New cd function that does the virtualenv magic
function venv_cd {
    cd "$@" && workon_cwd
}

alias cd="venv_cd"
