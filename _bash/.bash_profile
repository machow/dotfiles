# Source .bashrc if it exists.
# Mac OSX uses login (e.g. .bash_profile) by default.
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html
# Second checks we're in interactive mode (http://serverfault.com/a/146747)
if [ -f ~/.bashrc ] && [[ $- == *i* ]]; then
   source ~/.bashrc
fi
