\newpage
# XBRL Instance
When writing a report we usually do so in XML. Nowadays it is also possible to write it in JSON or CSV. The notations differ, but the idea is the same, they are just representational different, the stated facts are off course the same. For brevity I'll only show the XML variant. The XML Variant consists of three parts. 

-  First we enumerate the different contexts that are used by the facts
-  The unit(s) used by the facts
-  The values

First we need to determine which report we are going to file. We will choose for our example an existing SBR taxonomy: [KVK Micro](https://www.nltaxonomie.nl/nt19/kvk/20241211/entrypoints/kvk-rpt-jaarverantwoording-2024-nlgaap-micro.xsd) [taxonomy viewer](https://kc-xbrl.cooljapan.nl/dts/nt19/kvk-rpt-jaarverantwoording-2024-nlgaap-micro.xsd)

We will report a net revenue of 1000 euro for the year 2023
```xml
<?xml version="1.0" encoding="UTF-8"?>  
<xbrli:xbrl xml:lang="nl"   
  xmlns:iso4217="http://www.xbrl.org/2003/iso4217"   
  xmlns:jenv-bw2-i="http://www.nltaxonomie.nl/nt19/jenv/20241211/dictionary/jenv-bw2-data"   
  xmlns:link="http://www.xbrl.org/2003/linkbase"   
  xmlns:xlink="http://www.w3.org/1999/xlink"   
  xmlns:xbrli="http://www.xbrl.org/2003/instance">  
  <link:schemaRef xlink:type="simple"
  xlink:href="http://www.nltaxonomie.nl/nt19/kvk/20241211/entrypoints/kvk-rpt-jaarverantwoording-2024-nlgaap-micro.xsd"/>  
  <xbrli:context id="context_1">  
    <xbrli:entity>  
      <xbrli:identifier scheme="http://www.kvk.nl/kvk-id">12345678</xbrli:identifier>  
    </xbrli:entity>  
    <xbrli:period>  
      <xbrli:startDate>2022-01-01</xbrli:startDate>  
      <xbrli:endDate>2022-12-31</xbrli:endDate>  
    </xbrli:period>  
  </xbrli:context>  
  <xbrli:unit id="EUR">  
    <xbrli:measure>iso4217:EUR</xbrli:measure>  
  </xbrli:unit>  
  <jenv-bw2-i:NetRevenue 
      decimals="INF" 
      contextRef="context_1" 
      unitRef="EUR">1000</jenv-bw2-i:NetRevenue>  
</xbrli:xbrl>
```

That might be a bit much to digest in full, let's look at this in detail. 

 -  At the top we declare the required root node `xbrl` (with the prefix `xbrli` so the QName is `xbrli:xbrl`) 
 -  on this node we define the optional `xml:lang` attribute and the namespaces with their prefixes used  in this document.
 -  Next we refer to the taxonomy entrypoint which we used to create this instance. This is done via the `link:schemaRef` tag. 
 
 With the administration done we can create the three body parts. 
 
-  There is one context, which is made up of the entity aspect and the time aspect. We give it an id of `context_1`
-  We declare that our filing is done in Euro's and give the currency the `id` of `EUR`
-  We report a value of 1000 on the concept `NetRevenu` from the prefix `jenv-bw2-i`

With these three parts done we can close the document.

This is a very simple, but valid instance, apart from some required fields missing. The instances get a bit more complicated on the context level as we add extra 'dimensions' or 'axis'. But in principle this is all you need to know about an instance. The only difference with real world examples is the amount of facts. 

The three main parts of an instance are: Contexts which have an ID attribute and an entity and period inside, unit(s), also have their ID attribute and values for concepts with reference to a context and an unit.

In brief so far:

-  Reports consist of Facts, 
-  Facts consist of aspects and values, 
-  Concepts are the main aspect of a Fact. 
-  Numerical values must reference a unit,
-  The other aspects make up a context which is reference by a fact.

Apart from the optional dimensions and members which we will cover in the next chapter, this is all there is to an XBRL instance. A complete filing will of course have a lot of contexts and way more values in there, but that's all just repetition. And again, if you are creating a complete filing there must be software available to help you create the XBRL. 