\newpage
# Labels, documentation and references
## Labels
Entrypoints can load a linkbase. In fact all xml schema files can load a linkbase file by the same means shown with the entrypoint; *xs:annotation* and *xs:appinfo*. In xbrl we do this by means of a `link:linkbaseRef`, which comes from the xbrl-standard. One of the standard linkbases is the label linkbase.  

We have seen that concepts are the *what* of what gets reported. Because most xbrl reports are based on regulation they thought of a way to add semantic information to a concept, such as the regulation the concept is based on, documentation and labels. All this information can be stored inside the taxonomy, in multiple languages if needed.

We start by adding labels to a concept, for example:
```xml
<xs:element 
    abstract="false" 
    id="nl-cd_POBoxNumber" 
    name="POBoxNumber" 
    nillable="false" 
    substitutionGroup="xbrli:item" 
    type="nl-types:nonNegative20ItemType"
    xbrli:periodType="duration"/>
```
And the labels themselves in both Dutch and English to this concept. 

```xml
<link:label 
    id="nl-cd_POBoxNumber_label_nl" 
    xlink:label="nl-cd_POBoxNumber_label_nl" 
    xlink:role="http://www.xbrl.org/2003/role/label" 
    xlink:type="resource" 
    xml:lang="nl">Postbusnummer</link:label>
<link:label 
    id="nl-cd_POBoxNumber_label_en" 
    xlink:label="nl-cd_POBoxNumber_label_en" 
    xlink:role="http://www.xbrl.org/2003/role/label" 
    xlink:type="resource" 
    xml:lang="en">PO box number</link:label>
```
These two labels, created in the *link* namespace carry information in their attributes. The `xml:lang` tells us which language, the `xlink:role` attribute tells us these are standard labels. The `xlink:role` attribute for labels can have different values. Some common values are `totalLabel`, `periodEndLabel`, `terseLabel`. For now we'll focus on the standard label and link them to the PO Box concept.

For this linking XBRL uses Arcs and Locators. Arcs associates objects to another, and do so with the role of the arc, which is called `arcrole`. To link concepts to labels we use the `concept-label`-arcrole. 

```xml
<link:labelArc 
    xlink:arcrole="http://www.xbrl.org/2003/arcrole/concept-label" 
    xlink:from="nl-cd_POBoxNumber_loc" 
    xlink:to="nl-cd_POBoxNumber_label_nl" 
    xlink:type="arc"/>
<link:labelArc
    xlink:arcrole="http://www.xbrl.org/2003/arcrole/concept-label" 
    xlink:from="nl-cd_POBoxNumber_loc" 
    xlink:to="nl-cd_POBoxNumber_label_en" 
    xlink:type="arc"/>
```
An arc always consists of the following attributes:

-  `xlink:arcrole` Which role does this relation have?
-  `xlink:from` The source of the relationship
-  `xlink:to` The target of the relationship
-  `xlink:type` `arc`

In this case, the `xlink:from` is for both labels the same and reads: `nl-cd_POBoxNumber_loc`. Following the specification, this `xlink:from` points to a `label` of a node of the type `locator`. Here we see the two locators that point to the concept via the `xlink:href` and are 'found' by the arc on the value of the `xlink:label`. Because we are adding both a Dutch and English label to the same concept it is understandable both locators point to the same concept in the `xlink:hraf`. 
```xml
<link:loc 
    xlink:href="nl-common-data.xsd#nl-cd_POBoxNumber" 
    xlink:label="nl-cd_POBoxNumber_loc" 
    xlink:type="locator"/>
<link:loc 
    xlink:href="nl-common-data.xsd#nl-cd_POBoxNumber" 
    xlink:label="nl-cd_POBoxNumber_loc" 
    xlink:type="locator"/>
```

A locator always must have the following attributes

-  `xlink:href` Where does the locator point to? This in itself is a URL with an ID-Anchor. in this case `nl-common-data.xsd` as the (relative) URL and `nl-cd_POBoxNumber` as the ID of the element to be located in that file. In this case the locater points to a concept, but it could also point to other resources.
-  `xlink:label` The anchor the arc attaches to. 
-  `xlink:type` `locator`

## Roles
In the above example we have discussed one Concept having two labels attached via arcs. These arcs have the tag `link:labelArc`. One of the mandatory attributes is the `xlink:arcrole` which in this case points to the URN `http://www.xbrl.org/2003/arcrole/concept-label`. As I said, this is a URN, that looks like an URL. But on that location no file is hosted. You can however see a couple of the standard roles defined by the xbrl organization at this URL: [http://www.xbrl.org/2003/xbrl-role-2003-07-31.xsd](Linkbase role type definitions) 
As well as an Arc, a label definition can have a role as well. These roles determine what label is displayed. Under certain circumstances a concept can represent a summation of underlying concepts in an hierarchy. In that case the taxonomy writer will assign a different role to the label, in that case `http://www.xbrl.org/2003/role/totalLabel`. In the document linked above you can view all the roles the xbrl standard recognizes. 

## Label linkbase file
We now have the building blocks to construct a complete linkbase holding these labels and their arcroles and locators.  To construct the complete file we need to add one more tag at the top of the document to hold all the labels, arcs and locators together. In this case the `link:labelLink`. Different types of linkbases have different tags in the `link` namespace as we shall see later on. The start of the file would look like this:
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<link:linkbase 
    xmlns:link="http://www.xbrl.org/2003/linkbase" 
    xmlns:xlink="http://www.w3.org/1999/xlink">
  <link:labelLink 
      xlink:role="http://www.xbrl.org/2003/role/link" 
      xlink:type="extended">
    <link:label 
       id="kvk-abstr_EntityAddressTitle_label_en" 
       xlink:label="kvk-abstr_EntityAddressTitle_label_en" 
       xlink:role="http://www.xbrl.org/2003/role/label" 
       xlink:type="resource" 
       xml:lang="en">Address of the legal entity
    </link:label>
    <link:labelArc 
       xlink:arcrole="http://www.xbrl.org/2003/arcrole/concept-label" 
       xlink:from="kvk-abstr_EntityAddressTitle_loc" 
       xlink:to="kvk-abstr_EntityAddressTitle_label_en"
       xlink:type="arc"/>
    <link:loc 
        xlink:href="kvk-abstracts.xsd#kvk-abstr_EntityAddressTitle"
        xlink:label="kvk-abstr_EntityAddressTitle_loc"
        xlink:type="locator"/>
```
## Documentation
A special label role is the documentation role.  `http://www.xbrl.org/2003/role/documentation`. Like any other label it can be in different languages. In these labels the taxonomy writer can add helpful information to explain what the concept represents and what is expected of the filer. Documentation labels are identical to normal labels in every aspect, It's just that most software treats these labels differently and they are mentioned in the specifications. They also get defined within the same linkbase as labels are. Apart from the role they are in no way different from normal labels. 

## References
The third (or technically second) way to add information to a concept is by means of a reference. Because most taxonomies are based on legislation, standards or some rulebooks, taxonomy writers need a way to reference a law or a bill which gives clarification from the legal side. References can include a broad range of sources. This could be books, magazines, websites, articles, etc. 

The PO Box number concept has a reference in the taxonomy. In this case it only points to the standard: `NEN5825`, without further information or a link. 
Lets see how a reference is defined in xml:

```xml
<link:reference 
    id="nl-cd_NEN5825_2002_ref" 
    xlink:label="nl-cd_NEN5825_2002_ref"
    xlink:role="http://www.xbrl.org/2003/role/reference" 
    xlink:type="resource">
  <ref:IssueDate>2002</ref:IssueDate>
  <ref:Name>NEN5825</ref:Name>
</link:reference>
```

The reference has its own tag `link:reference` 
Attributes:

 -  `xlink:role`: `http://www.xbrl.org/2003/role/reference` 
 -  `xlink:type`: `reference`
 -  `id`: optional, unique
 -  `xlink:label` unique value (like id)

There are many tags which can be used inside an `link:reference` node. In the example above you see two of them: `IssueDate` and `Name`. But there are many others that can be added like `pages`, `clause`, `paragraph`, `publisher` to name a few[^referenceparts]. 

These references get linked to a concept in the same way we add labels to concepts. By means of arcs and locators. Remember, the arc gives meaning to the relationship by means of its role. The locator points to the intended resource. 
Lets look at the specific arc for a reference:

```xml
<link:referenceArc
    xlink:arcrole="http://www.xbrl.org/2003/arcrole/concept-reference" 
    xlink:from="nl-cd_POBoxNumber_loc" 
    xlink:to="nl-cd_NEN5825_2002_ref" 
    xlink:type="arc"/>
```

This time we see that this arc has a tag `link:referenceArc` and an arcrole `http://www.xbrl.org/2003/arcrole/concept-reference` which tells us that we deal with a concept-reference relationship. The other attributes we have seen before, the `xlink:from`, `xlink:to` and `xlink:type`.
The `from` side has to be resolved via a locator. The `to` side points to the `link:reference` from the previous xml example.
The locator for completeness:

```xml
<link:loc 
    xlink:href="nl-common-data.xsd#nl-cd_POBoxNumber" 
    xlink:label="nl-cd_POBoxNumber_loc" 
    xlink:type="locator"/>
```

Again points the `xlink:href` to the POBoxNumber concept and the `xlink:label` attribute corresponds with the `xlink:from` from the referenceArc.

To create a reference linkbase holding these references and their arcs and locators together we add a top level linkbase tag and a `link:referenceLink` tag to a file.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<link:linkbase 
    xmlns:link="http://www.xbrl.org/2003/linkbase"
    xmlns:ref="http://www.xbrl.org/2006/ref" 
    xmlns:xlink="http://www.w3.org/1999/xlink" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xsi:schemaLocation="http://www.xbrl.org/2006/ref  http://www.xbrl.org/2006/ref-2006-02-27.xsd">
  <link:referenceLink 
      xlink:role="http://www.xbrl.org/2003/role/link" 
      xlink:type="extended">
  <link:reference 
      id="nl-cd_NEN5825_2002_ref" 
      xlink:label="nl-cd_NEN5825_2002_ref" 
      xlink:role="http://www.xbrl.org/2003/role/reference" 
      xlink:type="resource">
  <ref:IssueDate>2002</ref:IssueDate>
  <ref:Name>NEN5825</ref:Name>
</link:reference>
<link:referenceArc 
    xlink:arcrole="http://www.xbrl.org/2003/arcrole/concept-reference" 
    xlink:from="nl-cd_POBoxNumber_loc" xlink:to="nl-cd_NEN5825_2002_ref" 
    xlink:type="arc"/>
<link:loc 
    xlink:href="nl-common-data.xsd#nl-cd_POBoxNumber" 
    xlink:label="nl-cd_POBoxNumber_loc" 
    xlink:type="locator"/>

```
## A general Mechanism Arcs and Locators
With the mechanism of arc and locators we are able to create all kinds of hierarchies. Here shown with the introduction of labels and references bundled in linkbase files. In this part we created a hierarchy with a concept on top and different labels and references as children. The variety of labels is the multiplication of possible label roles and desired languages. So if you want to have 4 languages and use 5 different label roles, a concept can have as much as 20 labels attached. In theory the number of references can be unlimited. 
The next type of standard linkbase we will explore is the presentation network. 

[^referenceparts]: The xbrl organisation recognises these values as valid parts: *name, number, issuedate, chapter, article, note, section, subsection, publisher, paragraph, subparagraph, clause, subclause, appendix, example, page, exhibit, footnote, sentence, uri, uridate http://www.xbrl.org/2006/ref-2006-02-27.xsd
