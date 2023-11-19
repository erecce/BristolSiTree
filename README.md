# The INMOS family tree of companies

This repository is to document the relationship between Bristol silicon associated companies, and how they relate to INMOS, in the form of a graph. The nodes are companies, and the edges are their relationship. A rank is given to show some progression of time. 

The source representation is the file `tree.m4.dot`. This is a Graphviz/dot with m4 macros. The `tree.m4.dot` file needs to be run through the M4 pre-processor to generate a dot file. The dot file is then processed by dot/Graphviz to draw the graph as an A4 pdf.

The single line Linux command to go from source to output pdf is:
```sh
m4 tree.dot.m4 | dot -Tpdf -o tree.pdf
```
Alternatively the very simple make file can be used.
```sh
make clean
make
```

The graph comes from the author's knowledge and no doubt prejudice. To add or change the graph with extra companies and extra relationships the `tree.dot.m4` should be editted.

Companies should be added as nodes for example
``` dot
"INMOS" [label="INMOS\n1978-1989", entity];
```
The last field can be entity or branch to show whether the head office is in Bristol.
The years of the company can be added in the label, as shown above, and should be added into a five year rank at the bottom of the file for example
``` dot
{ rank=same; 1980, "INMOS"}
```

Company relationships are added as edges. Three types of relationship are defined startup, acquired, people. For example
``` dot
"INMOS" -> "STMicroelectronics" [label="1992", acquired];
```