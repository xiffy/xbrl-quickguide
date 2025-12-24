\newpage
# Calculations and formula

The last types of hierarchy we will discover are the different calculations- and formula linkbases. In XBRL it is possible to add calculations to add and distract values from one another. There are different implementations which each have their own limitations. 
## XBRL Calculations 1.0
The base xbrl 2.1 specification contains the [original calculation link](https://www.xbrl.org/Specification/XBRL-2.1/REC-2003-12-31/XBRL-2.1-REC-2003-12-31+corrected-errata-2013-02-20.html#_5.2.5), which is referred to as Calculations 1.0. The calculation link is like the others it uses `calculationArc`'s with the role `http://www.xbrl.org/2003/arcrole/summation-item`.And this time i use the whole URI because the other Calculations linkbase 1.1 also uses the arcrole `summation-item`, only  with the URI `https://xbrl.org/2023/arcrole/summation-item`. But let's focus on the Calculations 1.0 for now. 

To be part of this hierarchy a concept must be of a numeric type. Also must all members of this hierarchy be of the same `period type`. The hierarchy is build up in a way that the children add up to the value of the parent.

Calculations are defined in a taxonomy using summation-item relationships

- The concept identified as the source of the relationship is referred to as the total concept.
- The concept identified as the target of the relationship is referred to as a contributing concept.
- The value of the defining arc's weight attribute is referred to as the contribution weight.

Lets look again at a couple of line items of the hypercube we created in the hypercube chapter 

-  Assets
    -  Current assets
    -  Other current assets
    -  Non-current assets

We want the three underlying concepts to add up to the to level *Assets*. To accomplish this we create a calculation network that resembles the definition network.
```xml
<link:linkbase 
  xsi:schemaLocation="http://www.xbrl.org/2003/linkbase http://www.xbrl.org/2003/xbrl-linkbase-2003-12-31.xsd">
  <link:roleRef 
    roleURI="urn:kvk:linkrole:balance-sheet-micro-entities" 
    xlink:type="simple" 
    xlink:href="kvk-linkroles.xsd#kvk-lr_BalanceSheetMicroEntities"/>
  <link:calculationLink 
    xlink:type="extended" 
    link:role="urn:kvk:linkrole:balance-sheet-micro-entities">
    <link:loc 
      xlink:href="jenv-bw2-data.xsd#jenv-bw2-i_Assets" 
      xlink:label="jenv-bw2-i_Assets_loc" 
      xlink:type="locator"/>
    <link:loc 
      xlink:href="jenv-bw2-data.xsd#jenv-bw2-i_AssetsCurrent" 
      xlink:label="jenv-bw2-i_AssetsCurrent_loc" 
      xlink:type="locator"/>
    <link:calculationArc 
      xlink:arcrole="http://www.xbrl.org/2003/arcrole/summation-item" 
      xlink:to="jenv-bw2-i_Assets"
      xlink:from="jenv-bw2-i_AssetsCurrent" 
      xlink:type="arc"
      order="1" 
      weight="1"/>
    <link:loc 
      xlink:href="jenv-bw2-data.xsd#jenv-bw2-i_AssetsNoncurrentOther" 
      xlink:label="jenv-bw2-i_AssetsNoncurrentOther_loc" 
      xlink:type="locator"/>
    <link:calculationArc 
      xlink:arcrole="http://www.xbrl.org/2003/arcrole/summation-item" 
      xlink:to="jenv-bw2-i_Assets"
      xlink:from="jenv-bw2-i_AssetsNoncurrentOther" 
      xlink:type="arc"
      order="1" 
      weight="1"/>
    <link:loc 
      xlink:href="jenv-bw2-data.xsd#jenv-bw2-i_AssetsNoncurrent" 
      xlink:label="jenv-bw2-i_AssetsNoncurrent_loc" 
      xlink:type="locator"/>
    <link:calculationArc 
      xlink:arcrole="http://www.xbrl.org/2003/arcrole/summation-item" 
      xlink:to="jenv-bw2-i_Assets"
      xlink:from="jenv-bw2-i_AssetsNoncurrent" 
      xlink:type="arc"
      order="1" 
      weight="1"/>
  </link:calculationLink>
</link:linkbase>
```

All three `link:calculationsArc`s share the same *to* concept: *Assets*. All three *from* concepts have a `weight` of `1`. That means we have to *add* the value to the total. When a `calculationArc` has a weight of `-1` the value needs to be subtracted.

With the help of calculations we can validate values inside an instance. The above calculation tells us that Assets **must** be the total of the three concepts mentioned in to `xlink:from`. 

The biggest problem with these calculations is that it is prohibited to mix `period` and `duration` concepts in a `link:calculationLink`. So figures from a balance sheet (typically period) can not be added to figures from profit and loss (typically duration). In fact you can only use concepts which share the same context (dimensions, entity, unit, period)

## Calculations 1.1
Besides the restrictions mentioned that facts need to be of the same context to be in a calculation network. Calculations 1.0 has some unwanted behavior with edge cases like rounding errors or not noticing duplicate facts..
Some of the problems were addressed with the introduction of calculations 1.1 which is not a replacement but an addition to the tools available to taxonomy writers to check the consistency of an instance.  

The biggest feature is in my opinion the rounding feature where it's possible to define value interval for a higher level concept, that might be reported with an other precision than the underlying concepts.

All in all, calculations have important, but limited power. Their scope is limited to facts within the same context. 

The XBRL organisation is working on the next specification **Calculations 2.0**. So far only the requirements have been written down and my estimate is that it will take a couple of years before this has turned in to a specification.

## Formula 1.0
In contrast to calculations, which should only be used for validation and consistency checks, formula are also able to produce facts based on a calculation on facts that are present in the instance. They are also the Swiss army knife for instance validation and comparison. With formula you can rewrite an instance from one taxonomy to an other. They also deserve their own book. Not a brief description which will never do justice to the possibilities.

That said, they might be the silver bullet for your problem, they are also complex and slow. This is because formulae work on the whole set, meaning both the instance(s) as the used taxonomy must be in memory. Then the function, which is written in XPath 2.0, is executed and the result is given back. This result can be a True or False on a validation rule, a value for a variable that can be used elsewhere, or a complete new fact complete with context as a result of a calculation.

[The specification](https://www.xbrl.org/specification/formula/rec-2009-06-22/formula-rec-2009-06-22.html), which was published in 2009. There also exists an [Formula overview](https://www.xbrl.org/wgn/xbrl-formula-overview/pwd-2011-12-21/xbrl-formula-overview-wgn-pwd-2011-12-21.html) where the workings of formula get explained. There is [a complete list of different formulae](https://specifications.xbrl.org/work-product-index-formula-formula-1.0.html). If this is not enough, you are free to write your own implementation of any filters, assertions or calculations not covered by the existing implementations. 




