\newpage
# Dimensional validity

With the introduction of dimensions and hypercubes there is by definition something that we call dimensional validity. We saw that there two types of hypercubes `all` and `notall`. The first one, the most common denotes a hypercube with *n*-dimensions and *i* concepts as line-items. For a fact to be valid in this hypercube it must pick a *member* from each dimension from that hypercube.

If we look again at this tabular representation of a hypercube from the previous chapter:

|                                                       | Fiscal       | Commercial   |
| ----------------------------------------------------- | ------------ | ------------ |
|                                                       | **separate** | **separate** |
| Assets                                                |              |              |
| Current assets                                        |              |              |
| Other current assets                                  |              |              |
| Non-current assets                                    |              |              |
| Balance sheet before of after appropriation of result |              |              |
| [continued]                                           |              |              |

We see 5 line-items, and 2 *explicit dimensions*. When we want to denote *Assets* in an instance we **must** add one of the two members of the *basis of preparation* dimension as an aspect as well as the one member of the *financial statement separate* dimension. 

This is true for each line-item we state in the instance. They all must refer to both dimensions. 

An instance that would refer a third dimension with the fact *Assets* would trigger an error from an xbrl processor, because of a dimensional mismatch.

If a dimension has a **dimension default** member, which is a *catch-all* member, then it is possible to omit the dimension from the fact. It is also prohibited to explicitly add the *default member* to the fact.  Suppose you have a *Geography* dimension, with *Europe*, and the other continents as domains. And Europe has *France*, *Spain*, *Germany* and *Other countries* as its members. Then it could be possible and logical to make *Other countries* the dimension default.  But dimension defaults are tricky in the sense that they also attract other facts, that do omit the dimension, so a parser might try to add the default member to the fact even though it should not be report on that dimension. They can work for small taxonomies with few dimensions, but when taxonomies grow this false reporting on a default member  may start to occur. 

So far only the `all` hypercube with `closed` is *true* has been covered. It's also possible to have an `all` hypercube which has `closed` set to *false*, this is also referred to as an *open hypercube*. 
If that was the case with the example balance sheet, we could add a member from any dimension that is known in the taxonomy. And because it is possible to extend a taxonomy with your own dimensions and members one could add granularity not provided and still have a valid instance. But this would only be possible on a *open* hypercube (`closed`=*false*).

The second type of hypercube is the opposite in terms of validation of the `all` hypercube. The `notall` hypercube defines all dimensional combinations that are not allowed in an instance. These hypercubes seldom exist on their own. If you find them in a taxonomy they are usually used to exclude some combinations of dimensions in a *all* hypercube. 

