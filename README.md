# The INMOS family tree of companies
Documenting the Bristol silicon companies family tree and as they relate to INMOS
* Author: Will Robbins
* Date: 12th December 2018

## Usage
```sh
m4 tree.dot.m4 | dot -Tpdf -o tree.pdf
```

## Description: 
A dot/graphviz representation of the relationship of the Bristol Silicon Cluster.
It has m4 macros so should be run through the M4 pre-processor prior to dot

[nodes] Companies are classed as a full 'entity' or a 'branch' of a larger company

[edges] Links between companies are classed as 'startup' formed, 'acquired' or people transferred

To add more information add in the NODES and EDGES sections

To give a timeline some companies are placed in RANKs in the timeline section.
