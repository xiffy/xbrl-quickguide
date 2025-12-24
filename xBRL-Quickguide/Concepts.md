\newpage
# Concepts
As we saw in the previous chapter a concept is an aspect of a fact and it is *the what* that is reported. *Gross Sales*, *Net Revenue*, "*Average number of employees*" are all examples of concepts. Concepts come, by the specification, in two flavors, There are Concepts and Abstract Concepts, which I will also refer to as just *Abstracts*. The difference between 'real concepts' and abstracts is that you can only report values on real concepts.

Abstracts on the other hand are only used to add structure to a report. They can be used for titles and headings in a report. We will get to know them when we properly introduce them in the second part when we add structure to the taxonomy. For now I will focus on the real concepts. Concepts represent the building blocks of a report and they are the only obligatory parts of a report. You cannot create an instance without a concept, while on the other hand in theory all other aspects can be absent from the report. 

Concepts are defined in a taxonomy which usually gets published by an authority like the federal tax agency or the house of commerce. These concepts can be found in a schema file and are defined as XML Elements. Each concept must have an attribute that tells us if the concept is an **abstract** or not. It also must have both a **name** and an **id**. There also needs to be an attribute that tells us what type of **period** needs to be reported; *period* or *duration*, what **type** of *unit* is used for the concept, which  **substitutiongroup** can be used. The **nillable** attribute tells us if it is allowed to report on the concept without providing a value. If a concept is of a Monetary type you must also provide the **balance** of the value, either debit/credit. 

```xml
<xs:element abstract="false" 
    id="jenv-bw2-i_Assets" 
    name="Assets" 
    nillable="false" 
    substitutionGroup="xbrli:item" 
    type="nl-types:monetaryNoDecimals20ItemType"
    xbrli:balance="debit" 
    xbrli:periodType="instant" />
```
_Example of a Concept definition from the Dutch taxonomy (NT)_

Let's analyse the definition of the 'Assets' concept. 

 -  We see that it's a reportable item because the *abstract* attribute is false. 
 -  By the name of the type we can deduct that it's a monetary unit which does not allow for decimals (so only integers) the definition of this *nl-types:monetaryNoDecimals20ItemType* can be found elsewhere in the taxonomy so machines also know what we've deducted from the name. 
 -  If you report on this fact, you must provide a value because **nillable** is false.
 -  The value entered is by definition *debit*. 
 -  And for the period type you must provide a single date because the definition is *instant*. 
 -  The *substitutionGroup* in this case is `xbrli:item`, you can ignore this attribute for now. Reportable items are of the substitutionGroup `xbrli:item`. Be aware that there are other substitutionGroups and they confine the subset of items one can choose to use for a value. 

Each concept that is found in the taxonomy has a definition comparable to the one shown. There are of course subtle differences which are expressed by the attributes. Now it is possible to add information to this concept. This can be done by Labels, Documentation and references. These elements are of course important, but they do not add to the report. They exist to make the taxonomy readable and meaningful. I'll skip these for the moment and come back to them when we introduce the taxonomy. 

In brief so far:

-  Reports consist of Facts, 
-  Facts consist of aspects and a value, 
-  Concepts are the main aspect of a Fact. 
-  The other aspects that are almost always present are 
    -  Entity (who)
    -  Period (when)
    -  Unit (of what)