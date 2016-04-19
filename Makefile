# WARNING: make clean will remove your vim and bash configs and directories
#
# make clean
# make install

ALL_FILES = $(addprefix $(HOME)/, .bash .vim .gitconfig .tmux.conf)

test:
	echo $(ALL_FILES)

install: $(ALL_FILES)

clean_dep:
	rm -rf _vim/bundle/*

clean: clean_dep
	rm $(ALL_FILES)

# Bash ------------------------------------------------------------------------
$(HOME)/.bash%: $(CURDIR)/_bash/.bash%
	ln -s $^ $@

$(HOME)/.bash: $(HOME)/.bashrc $(HOME)/.bash_profile
	ln -s $(CURDIR)/_bash $@

# VIM -------------------------------------------------------------------------
$(HOME)/.vimrc: $(CURDIR)/_vim/.vimrc
	ln -s $^ $@

$(HOME)/.vim: $(CURDIR)/_vim $(HOME)/.vimrc
	ln -s $< $@
	vim -u _vim/.vimrc +PluginInstall +qall

# Tmux ------------------------------------------------------------------------
#$(HOME)/.tmux.%: $(CURDIR)/_tmux/.tmux.%
$(HOME)/.tmux.conf: $(CURDIR)/_tmux.conf
	ln -s $^ $@

# Git Config ------------------------------------------------------------------
$(HOME)/.gitconfig: $(CURDIR)/_gitconfig
	ln -s $^ $@

# Misc programming installs ---------------------------------------------------
install_misc:
	./misc/brew_installs.sh
	./misc/node_installs.sh
