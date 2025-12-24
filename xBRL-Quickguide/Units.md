\newpage
# Units
When reporting a numeric value you also need to reference a unit. All non numerical datatypes must **not** reference a unit. A unit tells us the *of what* of the aspects. A monetary item type where the value represents a number in a specific currency, one must add a `ISO-4127 Currency code` as a Unit and reference this unit from the value. We will explore how this is done in the [[XBRL Instance]].

There are many types of units possible. The list of know units is published by the xBRL organisation. [list of units](https://www.xbrl.org/utr/2017-07-12/utr.html) and holds besides currencies the likes of *meters*, *celcius*, *joule* and many, many others.

Besides these there is also a registry which holds proposed units which ultimately will end up in the unit list  [Unit registry](https://specifications.xbrl.org/work-product-index-registries-units-registry-1.0.html).

While financial data will often have currencies as their units, some need to be mentioned as well. The `pure`-unit for numbers that are just that. And the `shares`-unit as the unit of ownership in stock. 

Units in xBRL Instances are mentioned on their own, just once for each used unit. They are referenced by their *id*.

```xml
<unit id="EUR">
  <measure>iso4217:EUR</measure>
</unit>
```
_example unit definition for the currency Euro._

A value can have an optional *decimal*- and *precision*-attribute.
