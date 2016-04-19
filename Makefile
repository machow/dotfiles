# WARNING: make clean will remove your vim and bash configs and directories
#
# make clean
# make install
install: $(HOME)/.bash $(HOME)/.vim $(HOME)/.vimrc $(HOME)/.gitconfig

clean_dep:
	rm -rf _vim/bundle/*

clean: clean_dep
	rm $(HOME)/{.bash,.vim,.bashrc,.vimrc,.gitconfig}

# Bash ------------------------------------------------------------------------
$(HOME)/.bashrc: $(CURDIR)/_bash/.bashrc
	ln -s $^ $@

$(HOME)/.bash: $(HOME)/.bashrc
	ln -s $(CURDIR)/_bash $@

# VIM -------------------------------------------------------------------------
$(HOME)/.vimrc: $(CURDIR)/_vim/.vimrc
	ln -s $^ $@

$(HOME)/.vim: $(CURDIR)/_vim
	ln -s $^ $@
	vim +PluginInstall +qall

# Git Config ------------------------------------------------------------------
$(HOME)/.gitconfig: _gitconfig
	ln -s $^ $@

# Misc programming installs ---------------------------------------------------
install_misc:
	./misc/brew_installs.sh
	./misc/node_installs.sh
