default: install

install: update xmledit

xmledit:
	cd ftplugin ; \
	ln -s ../bundle/xmledit/ftplugin/xml.vim html.vim ; \
	ln -s ../bundle/xmledit/ftplugin/xml.vim xhtml.vim  ; \
	ln -s ../bundle/xmledit/ftplugin/xml.vim ejs.vim ;

update: 
	git submodule update --init
