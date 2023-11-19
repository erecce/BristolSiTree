all: tree.pdf

clean:
	rm -f tree.dot tree.pdf
	
tree.dot : tree.m4.dot
	m4 tree.m4.dot > tree.dot

tree.pdf : tree.dot
	dot -Tpdf tree.dot -o tree.pdf
