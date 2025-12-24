#!/bin/bash
pandoc -s -V classoption=oneside --top-level-division=section \
	  xBRL-Quickguide/Introduction.md \
	  xBRL-Quickguide/Facts.md \
	  xBRL-Quickguide/Concepts.md \
	  xBRL-Quickguide/Namespaces.md \
	  xBRL-Quickguide/Units.md \
	  xBRL-Quickguide/Contexts.md \
	  xBRL-Quickguide/XBRL\ Instance.md \
	  xBRL-Quickguide/Adding\ aspects.md \
	  xBRL-Quickguide/Taxonomy.md \
	  xBRL-Quickguide/Entrypoints\ and\ Linkbases.md xBRL-Quickguide/Labels\,\ documentation\ and\ references.md \
	  xBRL-Quickguide/Presentation\,\ abstract\ Concepts\ and\ Linkroles.md \
	  xBRL-Quickguide/Dimensions\,\ domains\ and\ members.md \
	  xBRL-Quickguide/Hypercubes.md \
	  xBRL-Quickguide/Dimensional\ validity.md \
	  xBRL-Quickguide/Contexts\ the\ complete\ version.md \
	  xBRL-Quickguide/Table\ linkbase.md \
	  xBRL-Quickguide/Calculations\ and\ formula.md \
	  xBRL-Quickguide/Glossary.md \
	  xBRL-Quickguide/Useful\ books\,\ websites\ and\ tools.md \
	  -o quickguide.tex \
	  --variable title="xBRL Quickguide" \
	  --variable subtitle="understanding the xml behind it." \
	  --variable author="Appie Verschoor" \
	  --variable titlepage-logo="cooljapan.png" \
	  --variable logo-width="100mm" \
	  --variable titlepage="true" \
	  --variable titlepage-text-color="FFFFFF" \
	  --variable titlepage-color="34348a" \
	  --variable titlepage-rule-color="FFFFFF" \
	  --variable titlepage-rule-height="1" \
	  --variable colorlinks="true" \
	  --variable code-block-font-size="\\footnotesize" \
	  --variable monobackgroundcolor="cccccc" \
	  --variable book="true" \
	  -V 'monofontoptions:Scale=0.8' \
	  -H packages.sty \
	  --highlight-style=tango \
	  --template eisvogel \
	  --toc \
	  --pdf-engine=xelatex
