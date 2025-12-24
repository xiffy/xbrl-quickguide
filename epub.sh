#!/bin/bash
pandoc -s metadata.yaml -V classoption=oneside --top-level-division=chapter --number-sections --toc-depth=1 --to=epub \
	  xBRL-Quickguide/Introduction.md \
	  xBRL-Quickguide/Facts.md \
	  xBRL-Quickguide/Concepts.md \
	  xBRL-Quickguide/Namespaces.md \
	  xBRL-Quickguide/Units.md xBRL-Quickguide/Contexts.md \
	  xBRL-Quickguide/XBRL\ Instance.md \
	  xBRL-Quickguide/Adding\ aspects.md \
	  xBRL-Quickguide/Taxonomy.md \
	  xBRL-Quickguide/Entrypoints\ and\ Linkbases.md \
	  xBRL-Quickguide/Labels\,\ documentation\ and\ references.md \
	  xBRL-Quickguide/Presentation\,\ abstract\ Concepts\ and\ Linkroles.md \
	  xBRL-Quickguide/Dimensions\,\ domains\ and\ members.md \
	  xBRL-Quickguide/Hypercubes.md \
	  xBRL-Quickguide/Table\ linkbase.md \
	  xBRL-Quickguide/Calculations\ and\ formula.md \
	  xBRL-Quickguide/Glossary.md \
	  xBRL-Quickguide/Useful\ books\,\ websites\ and\ tools.md \
	  -o xbrl-quickguide.epub \
	  --epub-cover-image="cover.png" \
	  --css="epub.css" \
	  --toc \
          --variable colorlinks="true" \
          --variable code-block-font-size="\\footnotesize" \
          --variable monobackgroundcolor="cccccc" \
	  --highlight-style=tango 
