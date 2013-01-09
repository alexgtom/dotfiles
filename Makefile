default: install

install: update xmledit

xmledit:
	cd bundle/xmledit/ftplugin/ ; \
	ln -s xml.vim html.vim ; \
	ln -s xml.vim xhtml.vim  ; \
	ln -s xml.vim ejs.vim  ; 

update: 
	git submodule update --init
