\newpage
# Dimensions, domains and members
When the default aspects aren't enough fine-grained to report a fact, we can add one or more dimensions to the fact to give more context. When we were [[Adding aspects]] we came to know the toy factory that produces coloured toys. We can report on the amount of *yoyo*'s we produce with the default aspects. We have a concept `toys` which is of type `integer` and has a unitref of `pure`. 

```text
Concept: yoyoAmount
Entity: Cooljapan
Period: 2025-10-10
Value: 10
```

Management has decided that we have to report on each colour of these yoyo's. To be able to do this, we add some elements to our taxonomy. At the top we place something we refer to as dimension, but you can also think of it as an axis of a table. 
For this example we create a concept called `cljpndim:colours` with a label `Colours`. We will add this as an Abstract to our taxonomy. A dimensional concept accepts no values. 

The dimension can have one or more children, which are called *members*. It is possible for members to have children as well. If that is the case, the topmost member (the one directly linked to the dimension) is called a *domain*. To get back to our example, we would like to report on the colours, *yellow*, *blue* and *red*. This means we have to add three members to the *colours* dimension. We start by defining these individual colours as a concept `cljpnmem:red` `cljpnmem:yellow` and `cljpn:blue` with the labels `red`, `yellow` and `blue` respectively. 

We now have the tools to report on these colours

|      | Red | Yellow | Blue |
| ---- | --- | ------ | ---- |
| yoyo | 3   | 2      | 5    |
How this table gets defined and build in taxonomy terms will be discussed later. For the moment we focus on the dimensions and their ancestors. As you can see we report on all the members of the colour dimension. What we also see is that we do not have a grand total of toys produced. That is because we did not leave space in the dimension to hold the grand total. We can accommodate for this by adding an extra member, called `cljpn:allcolours` with label `total`.  We add this member as a domain and dimension-default to the dimension. And we will have the colours dimension look like this

```text
-  Colors [dimension]
    -  All colors [domain]
        -  Red [member]
        -  Yellow [member]
        -  Blue [member]
```
If we now look at the table we see that there is an extra layer of header labels, and an extra column to hold the grand total. 

|      |     |        |      | All colors |
| ---- | --: | -----: | ---: | ---------: |
|      | Red | Yellow | Blue |            |
| yoyo |   3 |      2 |    5 |         10 |

We could go further, we could add a `primary color` member, which would act as a domain for red, yellow and blue, and `other color` to count the newly started silver and gold line.

|      |     |        |               |        |             | All colors<br> |
| ---- | --: | -----: | ------------: | -----: | ----------: | -------------: |
|      |     |        | Primary color |        | Other color |                |
|      | Red | Yellow |          Blue | Silver |        Gold |                |
| Yoyo |   3 |      2 |             5 |      2 |           2 |             14 |

So dimensions add an axis to the data, the members of the dimension is where we report on. In this case, we knew before hand which colors we produce, so the amount of possible members is finite. We can declare every color we produce in our taxonomy and we can report on each one of them. When all members of a dimension are known and defined in the taxonomy we speak of an *explicit dimension*.

But it also happens that the number of possibilities can not be known beforehand. Think of a report where we have to specify the income of each board member. We would report this for instance on a concept `income`. And we would create a `boardMemberDimension` dimension. So far this is identical to the colors dimension. But it is impossible for the taxonomy writer to know all the names of all the board members within all reporting companies. So the members for this dimension are absent in the taxonomy. 

These kind of dimensions are called *typed dimensions*. They do not dictate a finite list of options but instead offer a `type`. For example `string255`. Which means, in this case, that the name of the director must filled in, and must be a string of maximum 255 characters. Typed dimensions are in most cases of a text item type of some sort.  

## Dimensions the xml part
Now that we have seen that dimensions can add detail to a report beyond the basic aspects it's time to see how these hierarchies are defined within a taxonomy. 

Like the presentation linkbase, dimensions have their own linkbase files. Let's look at the xml definition of the following dimension

```text
 -  Classes of intangible assets
    -  Total of intangible assets [domain] (totalLabel)
    -  Costs relating to the incorporation and issuance of shares [member]
    -  Other intangible assets [member]
```

Let's start with the beginning of the xml needed to create this dimension.

```xml
<link:linkbase 
    xmlns:gpl="http://xbrl.org/2013/preferred-label" 
    xmlns:link="http://www.xbrl.org/2003/linkbase" 
    xmlns:xbrldt="http://xbrl.org/2005/xbrldt" 
    xmlns:xlink="http://www.w3.org/1999/xlink" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    xsi:schemaLocation="http://xbrl.org/2013/preferred-label http://www.xbrl.org/2013/preferred-label.xsd">
  <link:roleRef roleURI="urn:kvk:linkrole:classes-of-intangible-assets" xlink:href="kvk-linkroles.xsd#kvk-lr_ClassesOfIntangibleAssets" xlink:type="simple"/>
  <link:arcroleRef
    arcroleURI="http://xbrl.org/int/dim/arcrole/dimension-domain" 
    xlink:href="http://www.xbrl.org/2005/xbrldt-2005.xsd#dimension-domain" 
    xlink:type="simple"/>
  <link:arcroleRef 
    arcroleURI="http://xbrl.org/int/dim/arcrole/domain-member" 
    xlink:href="http://www.xbrl.org/2005/xbrldt-2005.xsd#domain-member" 
    xlink:type="simple"/>
```

Compared to the presentation linkbase this one needs a lot more namespaces defined. Partly because the `preferred label` role is used. We see a link to a roleRef, just as with the presentation linkbase. This roleRef also must have a `<link:usedOn>link:definitionLink</link:usedOn>` to have a definition linkbase attached.
Then we load the definition of the arcroles we are going to use via the `link:arcroleRef`. In this case:

-  dimension-domain
-  domain-member

Further on we will see that there are even more arcroles for the definition available, but for dimensions, these two suffice. 

Now we can start to define our dimension. In this type of linkbase we use the `link:definitionLink`.

```xml
[continued]
  <link:definitionLink 
    xlink:role="urn:kvk:linkrole:classes-of-intangible-assets-small-medium" 
    xlink:type="extended">
```

Followed by Arcs and Locators. In this case we use `link:definitionArc`.
```xml
[continued]
    <link:definitionArc 
      gpl:preferredLabel="http://www.xbrl.org/2003/role/totalLabel" 
      xbrldt:usable="true" 
      xlink:arcrole="http://xbrl.org/int/dim/arcrole/dimension-domain" 
      xlink:from="jenv-bw2-dim_ClassesOfIntangibleAssetsAxis_loc" 
      xlink:to="jenv-bw2-dm_IntangibleAssetsMember_loc" 
      xlink:type="arc"/>
```
First we see that the taxonomy designer wants a total label displayed along with the concept instead of the standard label. This is done by defining a preferred label on the arc, just as in the presentation linkbase.

Next we see a `xbrldt:usable`, I'll leave the explanation for after we covered the whole file.

The arcrole has a value of `dimension-domain` and this is thus the top of this hierarchy, where the `xlink:from` represents the dimension and the `xlink:to` the domain. Exactly like the presentation linkbase where the from-to-relationship represented parent-child arcrole with parents on the left (from) and children on the right (to). In contrast to the presentation network where each relationship is represented by the same arcrole, each subsequent arcrole in the dimension network **must** be `domain-member`. That means that each member in theory can act as the domain of it's children.

The rest of the file consists of two more definition-arcs and 4 locators to link to the concepts that represent the members and give them their labels.

```xml
[continued]
    <link:definitionArc 
	  order="1" 
	  xbrldt:usable="true" 
	  xlink:arcrole="http://xbrl.org/int/dim/arcrole/domain-member" 
	  xlink:from="jenv-bw2-dm_IntangibleAssetsMember_loc" 
	  xlink:to="jenv-bw2-dm_CostsIncorporationShareIssueMember_loc" 
	  xlink:type="arc"/>
    <link:definitionArc 
      order="3" 
      xbrldt:usable="true" 
      xlink:arcrole="http://xbrl.org/int/dim/arcrole/domain-member" 
      xlink:from="jenv-bw2-dm_IntangibleAssetsMember_loc" 
      xlink:to="rj-dm_IntangibleAssetsOtherMember_loc" 
      xlink:type="arc"/>
    <link:loc 
      xlink:href="jenv-bw2-axes.xsd#jenv-bw2-dim_ClassesOfIntangibleAssetsAxis" 
      xlink:label="jenv-bw2-dim_ClassesOfIntangibleAssetsAxis_loc" 
      xlink:type="locator"/>
    <link:loc 
      xlink:href="jenv-bw2-domains.xsd#jenv-bw2-dm_CostsIncorporationShareIssueMember" 
      xlink:label="jenv-bw2-dm_CostsIncorporationShareIssueMember_loc" 
      xlink:type="locator"/>
    <link:loc 
      xlink:href="jenv-bw2-domains.xsd#jenv-bw2-dm_IntangibleAssetsMember" 
      xlink:label="jenv-bw2-dm_IntangibleAssetsMember_loc" 
      xlink:type="locator"/>
    <link:loc 
      xlink:href="rj-domains.xsd#rj-dm_IntangibleAssetsOtherMember" 
      xlink:label="rj-dm_IntangibleAssetsOtherMember_loc" 
      xlink:type="locator"/>
  </link:definitionLink>
</link:linkbase>

```

We've now covered the basics of creating dimensions to add detail to our reports. 
With this principle we can create as much axis as we want. And with the help of the hypercube we can define which axis/dimensions one must use to create a fact that is valid against the taxonomy.

I owe you however an explanation of `xbrldt:usable` When this has the value of *true*, this means that this member or domain can be used as a value in a context. When `xbrldt:usable` is *false*, the member (or domain) is only used to group the ancestors but can not be used as a context value. Or to put it in other words, if the `to` relationship has `usable="true"` then the member is a cell heading in a table. On the other hand if `usable="false"` then the member is only  there to group the children. 

In the second colours example we introduced the domains `primary color` and `other color` and drew a table. When we write out the `color` dimension as a tree and add the usable attribute we see the following

```text
-  Colors [dimension]
    -  All colors [domain] usable = true
        -  Primary colors [domain] usable = false
            -  Red [member] usable = true
            -  Yellow [member] usable = true
            -  Blue [member] usable = true
		-  Other colors [domain] usable = false
		    -  Gold [member] usable = true
		    -  Silver [member] usable = true
```

So in this case neither Primary colors nor Other colors add a column to the table, but only group their children. The all colors domain is usable, so the total has its own column in the table.

I have mentioned that there is also another type of dimension, those whose members can't be known while writing the taxonomy, the so called `typed dimensions`. A typed dimension is constructed by defining the name of the dimension and the type the user provided member must adhere to. So instead of linking domains and members, this dimension type has only one child. This child is always a type definition.

The dimensional abstract in xml
```xml
<xs:element 
    abstract="true" 
    id="bzk-wnt-dim_NameOfSeniorOfficialAxis" 
    name="NameOfSeniorOfficialAxis" 
    nillable="false" 
    substitutionGroup="xbrldt:dimensionItem" 
    type="xbrli:stringItemType" 
    xbrldt:typedDomainRef="bzk-wnt-domains.xsd#bzk-wnt-dm_NameOfSeniorOfficialTypedMember" 
    xbrli:periodType="duration"/>
```

the new attribute `xbrldt:typeDomainRef` points to a concept which holds the type definition. Looking at this element we see:

```xml
<xs:element 
    abstract="false" 
    id="bzk-wnt-dm_NameOfSeniorOfficialTypedMember" 
    name="NameOfSeniorOfficialTypedMember" 
    nillable="false" 
    type="nl-types:string255"/>
```
Which means we can fill out anything we want as long as it's a string of 255 characters or less. Typed dimensions can hold lots of different things, like buildings, pieces of land, names of board members, ships, etc. 

As we saw earlier, dimensions add aspects to facts, so we can report facts on different detail levels. Dimensions also play a big role in the next resource we will examine; the hypercube.