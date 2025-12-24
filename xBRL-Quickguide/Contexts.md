\newpage
# Contexts
We have seen that facts are made up of values and aspects. One of those aspects, namely the concept, is what gives the value its tag. The other aspects together form the context of the fact. 

Contexts are written at the top of a XBRL instance. If we think back of the first fact I presented in the [[Facts]] chapter
```shell
Value: 1079,5
Concept: Net revenue 
Entity: Cooljapan
Period: 2024
unit: Euro
decimals: -6
```
We will end up with a context that consists of the period and the entity. The concept will be the tag name of the value, and the unit and decimals are attributes on the value. 

When facts have more aspects than the basic mentioned so far, they will also end up in a context. These extra aspects will come from dimensions and members. In the second part we will introduce them to you. 

With the basics in place facts, concepts, and aspects we have the building blocks to write this fact in an XBRL instance. In the next chapter we have a look at our first instance document.