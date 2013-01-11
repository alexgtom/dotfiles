default: install

install: symlink update vundle xmledit

vundle: 
	 git clone https://github.com/gmarik/vundle.git bundle/vundle
	 vim +BundleInstall +qall

symlink:
	ln -s $(HOME)/.vim/vimrc $(HOME)/.vimrc

xmledit:
	cd ftplugin ; \
	ln -s ../bundle/xmledit/ftplugin/xml.vim html.vim ; \
	ln -s ../bundle/xmledit/ftplugin/xml.vim xhtml.vim  ; \
	ln -s ../bundle/xmledit/ftplugin/xml.vim ejs.vim ;

update: 
	git submodule update --init
