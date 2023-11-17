all: tree.pdf

clean:
	rm -f tree.dot tree.pdf
	
tree.dot : tree.dot.m4
	m4 tree.dot.m4 > tree.dot

tree.pdf : tree.dot
	dot -Tpdf tree.dot -o tree.pdf
