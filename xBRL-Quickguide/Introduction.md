\newpage
# Introduction
eXtensible Business Reporting Language or XBRL for short. I do not pretend to give you a complete write-up on XBRL and Discoverable Taxonomy Sets (DTS). The details are hairy, the implementations are pluriform, and the perception is that it is difficult—and from an implementer’s point of view this view is to a great extent correct. To know exactly what you can and cannot do when modelling your taxonomy you must rely on the technical specifications. These are as the name implies technical and broad: the core XBRL 2.1 specification, plus separate modules for calculations, dimensions, tables, formulas, and more. To read them you got to have a clear understanding of XML.

That does **not** mean you cannot acquire any knowledge of XBRL. The basis is pretty simple, but it comes with its own terminology, so do not be put off by terms such as _taxonomy_, _dimension_, or _linkrole_. They are technical names for concepts you already understand—_data model_ or the _axis_ of a two- or three-dimensional diagram. Along the way I will use the XBRL terminology and explain what it means.

I am a software developer by profession and in the past years I had to deal with a lot of xbrl, xml and taxonomies. The first thing I noticed, besides it involves a lot of accounting,  how little was written about XBRL from a technical point of view. You have the specifications and almost no literature on how to create a taxonomy by hand. With this guide I hope to make the creation of an instance, and how an instance relates to a taxonomy, especially the technical part, more understandable. 

In the first part of this quick guide I will give you the _need-to-knows_ when dealing with XBRL reports, or _instances_, as we also call them. That part will contain as little XML as possible, for many reasons, but most because XML is only the tool, and other formats like JSON are on their way. What matters is how a report or filing is built and how the taxonomy holds (almost) all the information needed to fill and file the report.

In the second part, starting with [[Taxonomy]] I will dive deeper. I will explain the XML and show how to construct different parts of a taxonomy—again with the minimum amount of XML, because software tooling can do the hard work for you.

At the end you will find a [[Glossary]] and some [[Useful books, websites and tools]].



