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

commandt:
	cd bundle/Command-T/ruby/command-t ; \
	ruby extconf.rb ; \
	make ; 

update: 
	git submodule update --init
