\newpage
# Taxonomy

So far I've only introduced the building blocks of an instance or report. Yet the term *taxonomy* has been used a couple of times. A taxonomy is the complete definition of one or more filings. An instance is only possible if there exists a taxonomy on which the report is based. To create a report one must first *read* the taxonomy on which you want to base the report. Only then you have knowledge of which concepts can/must be reported on and how.  In the mini-instance we created in [[XBRL Instance]] we see a line: 
```xml
<link:schemaRef xlink:type="simple" xlink:href="http://www.nltaxonomie.nl/nt19/kvk/20241211/entrypoints/kvk-rpt-jaarverantwoording-2024-nlgaap-micro.xsd"/>
``` 

Here we state that we want to file a report against this entrypoint. 
An entrypoint is the first file you, or more often, your software opens when you want to discover a taxonomy. 

An xbrl taxonomy consists of at least one xml schema file , which can be the starting point of a long line of subsequent imports of other schema files or linkbase files which are referenced by means of the xbrl specifications.

One of the key aspects of xbrl is that it not only provides the syntax and the data definitions, but also adds semantic meaning to this definition. Where syntax means that the taxonomy describes how and what you should report. Semantics on the other hand adds meaning to the facts and how these are related. 

This is done by building hierarchies by combining different building blocks of the taxonomy together into meaningful groups. 

A small but important hierarchy is formed around the Concept itself. I've already mentioned that a Concept can have labels, documentation and references. These little hierarchies are a good starting point to look at a taxonomy and how things get linked. But first we look at how these little hierarchies are added to the taxonomy and how we can read a taxonomy. 

To start the discovery of a taxonomy one reads the entrypoint!
