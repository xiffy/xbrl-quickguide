\newpage
# Hypercubes
A well structured hypercube can be seen as a validation table. It binds the reportable items, or line-items as they are sometimes called, to the dimensions that need to accompany the value to be valid. Hypercubes are multi-dimensional tables. On paper we can draw 2 dimensional tables, a cube is of course a 3-dimensional table. Within XBRL tables can have more axis than 3. Although it is possible, with repetition to draw 4 or more axis on paper, it gets complex and unreadable rather soon. 

The hypercube is like dimensions part of the `link:definitionLink` and can be defined in it's own linkbase file. 
Let's first take  a look at how we can define a hypercube and link dimensions to it. 

```xml
<link:linkbase 
    xmlns:link="http://www.xbrl.org/2003/linkbase" 
    xmlns:xbrldt="http://xbrl.org/2005/xbrldt" 
    xmlns:xlink="http://www.w3.org/1999/xlink">
  <link:roleRef 
      roleURI="urn:kvk:linkrole:balance-sheet-micro-entities" 
      xlink:href="kvk-linkroles.xsd#kvk-lr_BalanceSheetMicroEntities" 
      xlink:type="simple"/>
  <link:roleRef 
      roleURI="urn:kvk:linkrole:basis-of-preparation" 
      xlink:href="kvk-linkroles.xsd#kvk-lr_BasisOfPreparation" 
      xlink:type="simple"/>
  <link:roleRef 
      roleURI="urn:kvk:linkrole:financial-statement-separate" 
      xlink:href="kvk-linkroles.xsd#kvk-lr_SeparateFinancialStatement" 
      xlink:type="simple"/>
```
We start with defining the used namespaces, and the roleRefs we want to use. This should slowly seem familiar, it is how we build all our linkbase files.

```xml
[continued]
  <link:arcroleRef 
      arcroleURI="http://xbrl.org/int/dim/arcrole/all" 
      xlink:href="http://www.xbrl.org/2005/xbrldt-2005.xsd#all" 
      xlink:type="simple"/>
  <link:arcroleRef 
      arcroleURI="http://xbrl.org/int/dim/arcrole/hypercube-dimension" 
      xlink:href="http://www.xbrl.org/2005/xbrldt-2005.xsd#hypercube-dimension" 
      xlink:type="simple"/>
```
Two new arcroles. The first `all` is used to define the hypercube itself. There also exists a `notall` arcrole, also used to define a hypercube, but in a negative sense. It defines not valid concept dimensional combinations. The `notall` hypercubes are not frequently used, and when they are, they are mostly used in combination with an `all` hypercube to exclude some unwanted combinations.

The second arcrole; `hypercube-dimension` has a descriptive name from itself. It binds dimensions to the hypercube. The hypercube will be the `xlink:from` in the arc and the dimension the `xlink:to`

```xml
[continued]
  <link:definitionLink 
      xlink:role="urn:kvk:linkrole:balance-sheet-micro-entities" 
      xlink:type="extended">
    <link:definitionArc 
        order="3" 
        xbrldt:closed="true" 
        xbrldt:contextElement="scenario" 
        xlink:arcrole="http://xbrl.org/int/dim/arcrole/all" 
        xlink:from="sbr-dim_ValidationLineItems_loc" 
        xlink:to="sbr-dim_ValidationTable_loc" 
        xlink:type="arc"/>
```

We then start again with a `link:definitionLink` like with the dimension, followed by a `link:definitonArc`. Here the attributes of the hypercube are assigned. The first new one is `xbrldt:closed` with here a value of `true`. 
The value of this attribute alters how the hypercube validates the facts. A `closed` hypercube means that all facts must offer a valid member for each dimension linked to the hypercube, unless there is a dimension-default for a dimension, in which case that dimension can be omitted. When a hypercube on the other hand is `open` it is possible to add members from dimensions not linked to the hypercube, provided that the hypercubes dimensional needs are fulfilled. 

Then we see `xbrldt:contextElement`. This is more or less a legacy attribute. It can have two values, either `scenario` or `segment`. Advice is to choose one and stick to that, and if you have no legacy to maintain, `scenario` would be the preferred choice. 

The `xlink:arcrole` tells us that this is a `all` hypercube. Followed by the `from` and `to`. Later we will follow the locators to see what this top node of the hypercube really is.

```xml
[continued]
    <link:definitionArc 
        order="1" 
        xbrldt:targetRole="urn:kvk:linkrole:basis-of-preparation" 
        xlink:arcrole="http://xbrl.org/int/dim/arcrole/hypercube-dimension" 
        xlink:from="sbr-dim_ValidationTable_loc" 
        xlink:to="jenv-bw2-dim_BasisOfPreparationAxis_loc" 
        xlink:type="arc"/>
```
Then we see the next `link:definitonArc`, this time it's a `hypercube-dimension` arc, which tells us that the `from` is a `hypercube` and the `to` must me a dimension.  

New is `xbrldt:targetRole` on this arc. It tells us to ignore the roleUri of the `link:definitionLink` but instead look at this role. With this mechanism it is possible to define a dimension once and reuse it on many hypercubes. 

With this Arc we've bound the *basis of preparation* axis to the *balance sheet* In the last part, that I will present as a whole, we will attach another axis; *financial statement separate*, which is a dimension with one member; *separate*. After that follow the locators that point to their elements and bind to the *definitionArc*.

```xml
[continued]
    <link:definitionArc order="2" 
        xbrldt:targetRole="urn:kvk:linkrole:financial-statement-separate" 
        xlink:arcrole="http://xbrl.org/int/dim/arcrole/hypercube-dimension" 
        xlink:from="sbr-dim_ValidationTable_loc" 
        xlink:to="jenv-bw2-dim_FinancialStatementsTypeAxis_loc" 
        xlink:type="arc"/>
    <link:loc 
        xlink:href="jenv-bw2-axes.xsd#jenv-bw2-dim_BasisOfPreparationAxis" 
        xlink:label="jenv-bw2-dim_BasisOfPreparationAxis_loc" 
        xlink:type="locator"/>
    <link:loc 
        xlink:href="jenv-bw2-axes.xsd#jenv-bw2-dim_FinancialStatementsTypeAxis" 
        xlink:label="jenv-bw2-dim_FinancialStatementsTypeAxis_loc" 
        xlink:type="locator"/>
    <link:loc 
        xlink:href="sbr-dimensional-concepts.xsd#sbr-dim_ValidationLineItems" 
        xlink:label="sbr-dim_ValidationLineItems_loc" 
        xlink:type="locator"/>
    <link:loc 
        xlink:href="sbr-dimensional-concepts.xsd#sbr-dim_ValidationTable" 
        xlink:label="sbr-dim_ValidationTable_loc" 
        xlink:type="locator"/>
  </link:definitionLink>
</link:linkbase>

```

So this definition Linkbase defined a hypercube and bound that to two extra dimensions. What I left out is the hypercube itself. Let's go back to the top of the file and look at the first definitionArc with some attributes stripped, and their locators.

```xml
    <link:definitionArc 
        xlink:arcrole="http://xbrl.org/int/dim/arcrole/all" 
        xlink:from="sbr-dim_ValidationLineItems_loc" 
        xlink:to="sbr-dim_ValidationTable_loc" />
    <link:loc 
        xlink:href="sbr-dimensional-concepts.xsd#sbr-dim_ValidationLineItems" 
        xlink:label="sbr-dim_ValidationLineItems_loc" 
        xlink:type="locator"/>
    <link:loc 
        xlink:href="sbr-dimensional-concepts.xsd#sbr-dim_ValidationTable" 
        xlink:label="sbr-dim_ValidationTable_loc" 
        xlink:type="locator"/>
```

There are two locators pointing to concepts. The `to`, which is the hypercube in this case, look like this:
```xml
<xs:element 
  id="sbr-dim_ValidationTable"
  name="ValidationTable"
  abstract="true"
  nillable="true"
  substitutionGroup="xbrldt:hypercubeItem"
  type="xbrli:stringItemType"
  xbrli:periodType="duration"/>
```

The first things we notice is that this is an abstract and that the `substitutionGroup` is not `xbrli:item`, but `xbrldt:hypercubeitem`. We'll get to that. First we take a look at the `from`, which is also an abstract.

```xml
<xs:element
   id="sbr-dim_ValidationLineItems"
   name="ValidationLineItems"
   abstract="true"
   nillable="true"
   substitutionGroup="sbr:primaryDomainItem"
   type="xbrli:stringItemType"
   xbrli:periodType="duration"/>
```

As we've seen, abstracts are incapable of holding values, they are just structural nodes and they should have children which are real concepts to hold any value. 
At the start I explained that hypercubes bind concepts and dimensions together. So far we've seen the dimensions. To find the concepts we must follow the network which is provided by the Abstract `ValidationLineItems`.

Remember that we referenced a linkrole by it's URI `roleURI="urn:kvk:linkrole:balance-sheet-micro-entities"`at the top of this definition linkbase? And that the linkrole itself acts as a binder for connected hierarchies. When we've read all the linkbases and have all the hierarchies linked to this linkbase we see that we've discovered another definition linkbase, this time the so called **line items** or the concepts we report on. 

Let's have a look at this definition as well

```xml
  <link:roleRef 
      roleURI="urn:kvk:linkrole:balance-sheet-micro-entities" 
      xlink:href="kvk-lr_BalanceSheetMicroEntities" 
      xlink:type="simple"/>
  <link:arcroleRef 
      arcroleURI="http://xbrl.org/int/dim/arcrole/domain-member" 
      xlink:href="http://www.xbrl.org/2005/xbrldt-2005.xsd#domain-member" 
      xlink:type="simple"/>
  <link:definitionLink 
      xlink:role="urn:kvk:linkrole:balance-sheet-micro-entities" 
      xlink:type="extended">
    <link:definitionArc 
        order="1" 
        xlink:arcrole="http://xbrl.org/int/dim/arcrole/domain-member" 
        xlink:from="sbr-dim_ValidationLineItems_loc" 
        xlink:to="jenv-bw2-i_Assets_loc" 
        xlink:type="arc"/>
    <link:definitionArc 
        order="2" 
        xlink:arcrole="http://xbrl.org/int/dim/arcrole/domain-member" 
        xlink:from="sbr-dim_ValidationLineItems_loc" 
        xlink:to="jenv-bw2-i_AssetsCurrent_loc" 
        xlink:type="arc"/>
```
I'll omit the rest of this file, there are more line-items in this balance sheet, what's important is that the roleURI of the roleRef is the same as the definition of the hypercube. What we also can see is that the line-items hierarchy is nothing less than a dimension network, all the `link:definitonArcs` are of the `domain-member` role.  

All this together gives us a hypercube with line-items and two additional dimensions on top of the implicit dimensions of entity, period and sometimes unit.
When we draw this hypercube as a table we can represent it like so:

|                                                       | Fiscal       | Commercial   |
| ----------------------------------------------------- | ------------ | ------------ |
|                                                       | **separate** | **separate** |
| Assets                                                |              |              |
| Current assets                                        |              |              |
| Other current assets                                  |              |              |
| Non-current assets                                    |              |              |
| Balance sheet before of after appropriation of result |              |              |
| [continued]                                           |              |              |
The labels in the left column are from the Concepts. The *what* we want to report. 
At the top we see two heading rows, each the result of the dimensions attached to this hypercube. The top row comes from the `basis of preparation` dimension. It has two usable members in it's hierarchy; `Fiscal` and `Commercial`. So both members add a column to the table.

Next we have the second dimension `Financial statements type`. This dimension has (for this report) just one member; `separate`. This member is also usable and repeated for each member of the previous header row. 
It is possible that that the `Financial statements type` has two members. `Separate` and `Consolidated`. If that is the case, the hypercube heading could look like this:

| Fiscal   |              | Commercial |              |
| -------- | ------------ | ---------- | ------------ |
| separate | consolidated | separate   | consolidated |

With all this extra tools (hypercubes, dimensions, domains and members) provided by the taxonomy we also introduced a way to validate reports against the taxonomy.  Dimensions add the possibility to report on an, in theory, unlimited amount of aspects. Hypercubes offer a way to define which of these dimension members can be used to report a value as a fact. Together they offer what we call dimensional validity. 