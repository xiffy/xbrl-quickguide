\newpage
# Contexts the complete version
By adding dimensions and hypercubes to the taxonomy, the contexts as described earlier are not enough to give room to all the extra information that comes with facts that have additional dimensions. 
We have to add some information to a context if the fact we are reporting requires a `member` as an aspect value for a fact.
As we have seen, hypercubes are responsible for adding dimensions other than the implicit dimensions of entity, period and unit. On the hypercube definition we saw the attribute `xbrldt:contextElement`. The value of this attribute, which could be *segment* or *scenario* determines the tag- or element name the dimensions member information should be used in the context.

Let's look at our fact from the previous Context chapter and let's add an extra aspect. Suppose the taxonomy adds the dimension basis of preparation to the hypercube of the income statement. This dimension `pwcdim:basis-of-preperation` has two members `pwcmem:fiscal` and `pwcmem:commercial`. We have chosen to file our *commercial* Net revenue.

```text
Value: 1079,5
Concept: Net revenue Lines of Service
Entity: PwC
Period: 2023/2024
unit: Euro
decimals: -6
basis of preparation: Commercial
```

When we create a context for this fact without the dimensions it could look like this
```xml
<xbrli:context id="context_1">  
  <xbrli:entity>  
    <xbrli:identifier scheme="http://schemas.pwc.nl/identifier">
    pwc
    </xbrli:identifier>  
  </xbrli:entity>  
  <xbrli:period>  
    <xbrli:startDate>2023-07-01</xbrli:startDate>  
    <xbrli:endDate>2024-06-30</xbrli:endDate>  
  </xbrli:period>  
</xbrli:context>
```

The hypercube that binds the `pwc:netrevenu` to the dimension has a `xbrldt:contextElement` of `scenario`. That should be interpreted that we are supposed to add a `xbrli:scenario` element to the context and reference the member `pwcmem:commercial` from there.
The xml will then look like this

```xml
<xbrli:context id="context_1">  
  <xbrli:entity>  
    <xbrli:identifier scheme="http://schemas.pwc.nl/identifier">
    pwc
    </xbrli:identifier>  
  </xbrli:entity>  
  <xbrli:period>  
    <xbrli:startDate>2023-07-01</xbrli:startDate>  
    <xbrli:endDate>2024-06-30</xbrli:endDate>  
  </xbrli:period>  
  <xbrli:scenario>
     <xbrldi:explicitMember dimension="pwcdim:basis-of-preparation">
     pwcmem:commercial
     </xbrldi:explicitMember>
  </xbrli:scenario>
</xbrli:context>
```

We see that we added an `xbrli:scenario` element to the `xbrli:context` as dictated by the hypercube. Then we have to address the member we choose for our fact. We do that by adding a `xbrldi:explicitMember` to the *scenario* and add the QName of the chosen dimension to the `dimension` attribute of the tag. Lastly we add the QName of the member as a value.

If a fact has more than one dimension added, the context will need to have that dimension added to the `xbrli:scenario` tag as well. 

