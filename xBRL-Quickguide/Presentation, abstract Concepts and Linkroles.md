\newpage
# Presentation, abstract Concepts and Linkroles
In the previous chapter we've seen how we can add labels and references to a concept to provide extra information to the filers. Taxonomy writers have more tools to add structure to the taxonomy and to create logical connected parts. One of those ways to add structure is by means of a *presentation linkbase*. Linking of this information is done in the same way as labels and references, by means of arcs and locators. 

The presentation linkbase is mainly a readability help for humans. The presentation linkbase gives taxonomy writers the ability to add hierarchy to the concepts. For machines it does not really matter that the PO Box number and Total assets are on the same level in an instance, for humans it's important to have structure. 

Here we add presentational structure, we do this by layering the concepts into logical connected parts. For instance the PO Box number is most likely part of an address. To create a hierarchy with all address concepts we need to introduce the 'abstract concept' or plain abstract as I prefer to call them in contrast to concepts that can hold values.
An abstract concept differs from a concept:

-  has `abstract=true`
-  brings structure to a taxonomy but can hold no values (so they won't ever appear in an instance)
-  must not have a datatype nor balance.

With these rules we can introduce a concept to our taxonomy which will be the top of an address. 
```xml
<xs:element 
    abstract="true" 
    id="kvk-abstr_EntityAddressTitle" 
    name="EntityAddressTitle" 
    nillable="false" 
    substitutionGroup="sbr:presentationItem"
    type="xbrli:stringItemType" 
    xbrli:periodType="duration"/>
```
This concept can of course, by nature, have labels attached. 
```xml
<link:label 
    id="kvk-abstr_EntityAddressTitle_label_en" 
    xlink:label="kvk-abstr_EntityAddressTitle_label_en" 
    xlink:role="http://www.xbrl.org/2003/role/label" 
    xlink:type="resource" 
    xml:lang="en">Address of the legal entity [abstract]
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
*xml for the English label of this abstract*

This concept is going to be the top of the hierarchy which has the title `Address of the legal entity [abstract]`. It is custom to add the `[abstact]` to the label to give the reader an extra clue that this is a grouping element which does not represent any data-point in an instance. This is however not an obligation. For instance in the Dutch taxonomy (NT) from which I plucked this example this extra tag is absent. 

To create a presentation hierarchy we need to write another linkbase file, just as for the labels. For this linkbase we will introduce the `link:presentationLink` and the `link:roleRef` the latter references the definition of this particular presentation hierarchy.  We are describing a part of a hierarchy, which can be looked at [in full online](https://kc-xbrl.cooljapan.nl/dts/nt19/kvk-rpt-jaarverantwoording-2024-nlgaap-micro.xsd/presentations/82585?lang=en). 

+  Address of the legal entity [abstract]
	+  ...
	+  PO Box number
	+  Postal Code NL
	+  Place of residence NL
	+  ...

By adding an abstract on top of these concepts we are able to visually group the concepts that make up the legal entity address. 
At the top of this linkbase we see the following
```xml
<link:linkbase 
    xmlns:link="http://www.xbrl.org/2003/linkbase" 
    xmlns:xlink="http://www.w3.org/1999/xlink">
  <link:roleRef 
      roleURI="urn:kvk:linkrole:entity-address" 
      xlink:href="../dictionary/kvk-linkroles.xsd#kvk-lr_EntityAddress" 
      xlink:type="simple"/>
  <link:presentationLink 
      xlink:role="urn:kvk:linkrole:entity-address" 
      xlink:type="extended">
```
The first unknown tag is the `link:roleRef`, which defines a `roleURI` and links to a definition in a schema file. The definition inside this `kvk-linkroles.xsd` file is as follows:
```xml
<link:roleType 
    id="kvk-lr_EntityAddress" 
    roleURI="urn:kvk:linkrole:entity-address">
  <link:definition>Adres van de rechtspersoon</link:definition>
  <link:usedOn>gen:link</link:usedOn>
  <link:usedOn>link:definitionLink</link:usedOn>
  <link:usedOn>link:presentationLink</link:usedOn>
</link:roleType>
```

The best way to look at a linkrole is that it's the top of a hierarchy, it binds different hierarchies with aspects in common. The definition shown here shows us that the linkrole (`link:roleType`) has an `id`, which is used to locate the linkrole and a `roleURI`. This URI is what binds all hierarchies together. Furthermore we see that we can add a definition to the linkrole by means of `link:definition` and we see three instances of `link:usedOn`. These values represent the different types of hierarchies this linkrole can participate in. And as we can see, this specific linkrole can be used on a `link:presentationLink`, as well as on generic links (for example tables) and definition links. We will talk about these later.

After the `link:roleRef` we see another new tag; `link:presentationLink`. We see two attributes

-  `xlink:role`: which should be a roleURI of a linkrole
-  `xlink:type`: `extended` for presentationLink

What follows is similar to what we've seen with the labels. An arc and a locator to link Concepts to this presentation. I'll repeat the top of the xml for completeness. 
```xml
<?xml version="1.0" encoding="UTF-8"?>
<link:linkbase 
    xmlns:link="http://www.xbrl.org/2003/linkbase" 
    xmlns:xlink="http://www.w3.org/1999/xlink">
  <link:roleRef 
      roleURI="urn:kvk:linkrole:entity-address" 
      xlink:href="../dictionary/kvk-linkroles.xsd#kvk-lr_EntityAddress" 
      xlink:type="simple"/>
  <link:presentationLink 
      xlink:role="urn:kvk:linkrole:entity-address" 
      xlink:type="extended">
    <link:loc 
        xlink:href="kvk-abstracts.xsd#kvk-abstr_EntityAddressTitle" 
        xlink:label="kvk-abstr_EntityAddressTitle_loc" 
        xlink:type="locator"/>
	<link:loc 
	    xlink:href="nl-common-data.xsd#nl-cd_POBoxNumber" 
	    xlink:label="nl-cd_POBoxNumber_loc" 
	    xlink:type="locator"/>
	<link:loc 
	    xlink:href="nl-common-data.xsd#nl-cd_PostalCodeNL"
	    xlink:label="nl-cd_PostalCodeNL_loc" 
	    xlink:type="locator"/>
	<link:loc 
	    xlink:href="nl-common-data.xsd#nl-cd_PlaceOfResidenceNL" 
	    xlink:label="nl-cd_PlaceOfResidenceNL_loc" 
	    xlink:type="locator"/>

	<link:presentationArc 
	    order="5" 
	    xlink:arcrole="http://www.xbrl.org/2003/arcrole/parent-child"
	    xlink:from="kvk-abstr_EntityAddressTitle_loc" 
	    xlink:to="nl-cd_POBoxNumber_loc" 
	    xlink:type="arc"/>
	<link:presentationArc 
	    order="6" 
	    xlink:arcrole="http://www.xbrl.org/2003/arcrole/parent-child" 
	    xlink:from="kvk-abstr_EntityAddressTitle_loc" 
	    xlink:to="nl-cd_PostalCodeNL_loc" 
	    xlink:type="arc"/>
	<link:presentationArc 
	    order="7" 
	    xlink:arcrole="http://www.xbrl.org/2003/arcrole/parent-child" 
	    xlink:from="kvk-abstr_EntityAddressTitle_loc" 
	    xlink:to="nl-cd_PlaceOfResidenceNL_loc" 
	    xlink:type="arc"/>
  </link:presentationLink>
</link:linkbase>
```

The first concept we encounter is the abstract title we've added to the taxonomy at the start of this chapter. Then the other three concepts we wanted in this hierarchy are found by their locators. 
Next we start to interpret the `link:presentationArc`. We see again like the arcs with the labels, we have a `from` and `to` attribute and an arcrole. The value for a presentationArc is always `http://www.xbrl.org/2003/arcrole/parent-child`. That's why some call this hierarchy also the 'parent-child network'.
When we look at the `xlink:from` on these arcs, we see that they all have the same value, namely the locator for the abstract Concept that is the title of this address hierarchy.  And when we use the standard labels instead of the concept name we get the hierarchy from earlier

```text
+  Address of the legal entity [abstract]
	+  PO Box number
	+  Postal Code NL
	+  Place of residence NL
```

There is also an optional `order` on each presentationArc. With this you can tell the rendering which concept should follow which. If you omit this attribute, the order is not guarantied. 

It is possible for children to be a parent as well. So you can nest hierarchies as deep as you want.  A presentation hierarchy of a small income statement could look as follows

```text
+  Income statement
    +  Total of income (totalLabel)
        +  Net revenue
        +  Other operating income
        +  Other income
    +  Total of expenses (negatedTotalLabel)
        +  Costs of raw materials and consumables (negatedLabel)
        +  Wages (negatedLabel)
        +  Depreciation, amortisation and decrease in value of assets (negatedLabel)
        +  Other operating expenses (negatedLabel)
        +  Other expenses (negatedLabel)
    +  Total of result before tax (totalLabel)
    +  Income tax expense (negatedLabel)
    +  Total of result after tax (totalLabel)
```

In this example we see between brackets sometimes label names. It is possible to add a `preferredLabel` attribute to the presentationArc. The value of this attribute should then be used to select the appropriate label for the concept which is the child of the presentationArc. The value must be a valid URI for the labelRole. For instance

```xml
preferredLabel="http://www.xbrl.org/2003/role/totalLabel"
```

Where we tell that we want the label associated to the concept that has that particular label-role when displaying the concept in this presentation. As we've seen in the previous chapter the amount of labels can grow quite quickly when you have more languages you need to cover and have concepts that need different labels in different presentations. 
You see in this particular case that the taxonomy designer choose for a negated label for every concept that denotes a credit concept. That is a choice a designer can make. If we look at the definition of that concept, we will see that the standard label of *wages* is exactly the same *wages*. In this case the designer decided that the negated label roles add meaning to the concept, you can also deduct by the label role that the concept is *credit*.