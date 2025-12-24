\newpage
# Entrypoints and Linkbases
From this point on there will be a lot more xml than in the first part. Remember xml is only the tool used to express xbrl. It's 'just' notation which can be interpreted by well programmed machines that have knowledge of the xbrl specifications. The xbrl organisation has a compliance suite to which all certified xbrl software have to adhere. 

To create a filing (an xbrl instance) one references an entrypoint or schema file by means of a `link:schemaRef`, for instance
```xml
<link:schemaRef 
    xlink:type="simple"
    xlink:href="http://www.nltaxonomie.nl/nt19/kvk/20241211/entrypoints/kvk-rpt-jaarverantwoording-2024-nlgaap-micro.xsd"/>
```
The file that is referenced via the `xlink:href` is called an entrypoint. An entrypoint is a view on a taxonomy (or Discoverable Taxonomy Set -DTS-). As we will see we can create different hierarchies that give structure and meaning to the concepts in a taxonomy. Taxonomies can consist of more than just one filing or report. By creating different files with different parts of the taxonomy definitions a taxonomy writer is able to create different reports with the ability to re-use general parts of the different filings. These files are either more xml schema files (`.xsd`) or so called `linkbase` files. 

A view or report starts with an entrypoint, which is always an xml-schema. At the top we have some namespace declarations, one xbrl specific.
`xmlns:link="http://www.xbrl.org/2003/linkbase"` which is used to include all the different parts that create the specific filing. Remember this is a namespace, there is no file hosted on the URL[^linkbasschema].

In xbrl we use the 'freeform' `xs:annotation`, `xs:appinfo`[^appinfo] to enumerate the linkbases used. Now let's write this out in xml
```xml
<xs:schema 
    xmlns:kvk-rpt-h-u="http://www.nltaxonomie.nl/nt19/kvk/20241211/entrypoints/kvk-rpt-jaarverantwoording-2024-nlgaap-micro"
    xmlns:link="http://www.xbrl.org/2003/linkbase"
    xmlns:xlink="http://www.w3.org/1999/xlink" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    attributeFormDefault="unqualified" 
    elementFormDefault="qualified" 
    id="kvk-rpt-h-u" 
        targetNamespace="http://www.nltaxonomie.nl/nt19/kvk/20241211/entrypoints/kvk-rpt-jaarverantwoording-2024-nlgaap-micro">
<xs:annotation>
  <xs:appinfo>
    <link:linkbaseRef
      xlink:arcrole="http://www.w3.org/1999/xlink/properties/linkbase"
      xlink:href="../validation/kvk-balance-sheet-lineitems_u-def.xml"
      xlink:role="http://www.xbrl.org/2003/role/definitionLinkbaseRef"
      xlink:type="simple"/>
```

Inside the `xs:appinfo` we see the link to the definition of the line-items of the balance sheet. This particular entrypoint has 137 different linkbases that need to be loaded and examined to have a complete overview of the report at hand. 

As we look closer to the actual import we see the attributes `xlink:arcrole` and `xlink:role` The arcrole points to the standard xlink properties of a linkbase. The role can have any URI as a value, but there are just a couple of standard roles defined by xbrl.org. These are:

-  **Presentation Linkbase**: Used to define the structure and order in which concepts are presented in financial statements.
-  **Calculation Linkbase**: Used to define the arithmetic relationships between concepts, such as summation.
-  **Definition Linkbase**: Used to define more complex relationships between concepts, like dimension relationships.
-  **Label Linkbase**: Used to provide human-readable labels for concepts, including different types of labels like terse, verbose, and documentation labels.

Each of these will be studied in more detail in the following chapters. For the moment it's enough to understand that the files mentioned in the `xlink:href`attributes must be loaded and parsed by the software. When all the files are loaded and the parsing is done, the software holds the definition of  a specific filing, defined by the entrypoint.

Besides loading linkbases it is also possible to import or include other schema files. This can also be external taxonomies defined by a regulatory instance. For instance a country or a currency taxonomy often get imported from an authoritative source.

We now start our discovery by looking at a label linkbase.

[^appinfo]: see https://docstore.mik.ua/orelly/xml/schema/ch14_02.htm for more examples of these elements

[^linkbasschema]: xbrl.org does host a file on that location to point at the schema file, which can be found here: ttp://www.xbrl.org/2003/xbrl-linkbase-2003-12-31.xsd
