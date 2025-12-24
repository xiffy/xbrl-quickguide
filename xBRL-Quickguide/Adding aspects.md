\newpage
# Adding aspects

We started our introduction to xbrl with facts. And we have learned that a fact can be presented as a value for a concept (from a taxonomy) accompanied by an entity (who) a period or duration and, when dealing with numerical facts a unit. With these aspects a lot of facts can be stated. But most of the time there need to be more aspects to a fact. 
The toy factory *Cooljapan* does its internal reporting with xbrl. And they want to report on the colours of the toys produced.
A simple fact table for such a report could then look like this

| concept | entity    | unit | period | colour | value |
| ------- | --------- | ---- | -----: | ------ | ----: |
| yoyo    | Cooljapan | pure |   2024 | red    |  1000 |
| yoyo    | Cooljapan | pure |   2024 | yellow |  2000 |
| yoyo    | Cooljapan | pure |   2024 | blue   |   750 |
| yoyo    | Cooljapan | pure |   2024 | total  |  3750 |
| toll    | Cooljapan | pure |   2024 | red    |   500 |
| toll    | Cooljapan | pure |   2024 | yellow |   500 |
| toll    | Cooljapan | pure |   2024 | blue   |   500 |
| toll    | Cooljapan | pure |   2024 | total  |  1500 |
*a fact table with two different concepts and a colour aspect with 4 options*

The technical term for what we have added here is a **dimension** with 4 **members**. Each aspect that is not one of the default aspects (concept, entity, period, unit) is added as a member of a dimension. In the second part we'll learn how a dimension is created and how the taxonomy tells you when and where to add extra aspects. All that matters now is that we see that it is possible to create more detailed insights by adding aspects.

Now the fact table is only one way of presenting the facts in an instance. The table above could just as well be drawn with two rows and a heading stating the repetitious aspects of entity, period and unit.

| company   | period | unit |
| --------- | ------ | ---- |
| Cooljapan | 2024   | pure |

|      |  red | yellow | blue | total |
| ---- | ---: | -----: | ---: | ----: |
| yoyo | 1000 |   2000 |  750 |  3750 |
| toll |  500 |    500 |  500 |  1500 |
*table stating the same facts on two rows with 3 basic aspects mentioned in the heading*

If these facts were to be reported in an instance, it could look like this:
```xml
<xbrli:context id="context_1">
	<xbrli:entity>
		<xbrli:identifier scheme="urn:cljpn:schema:entyti:id">
		cooljapan</xbrli:identifier>
	</xbrli:entity>
	<xbrli:period>
		<xbrli:startDate>2024-01-01</xbrli:startDate>
		<xbrli:endDate>2024-12-31</xbrli:endDate>
	</xbrli:period>
	<xbrli:scenario>
		<xbrldi:explicitMember dimension="cljpndim:colours">
			cljpnmem:red
		</xbrldi:explicitMember>
	</xbrli:scenario>
</xbrli:context>
<xbrli:context id="context_2">
	<xbrli:entity>
		<xbrli:identifier scheme="urn:cljpn:schema:entyti:id">
		cooljapan</xbrli:identifier>
	</xbrli:entity>
	<xbrli:period>
		<xbrli:startDate>2024-01-01</xbrli:startDate>
		<xbrli:endDate>2024-12-31</xbrli:endDate>
	</xbrli:period>
	<xbrli:scenario>
		<xbrldi:explicitMember dimension="cljpndim:colours">
			cljpnmem:yellow
		</xbrldi:explicitMember>
	</xbrli:scenario>
</xbrli:context>
<xbrli:context id="context_3">
	<xbrli:entity>
		<xbrli:identifier scheme="urn:cljpn:schema:entyti:id">
		cooljapan</xbrli:identifier>
	</xbrli:entity>
	<xbrli:period>
		<xbrli:startDate>2024-01-01</xbrli:startDate>
		<xbrli:endDate>2024-12-31</xbrli:endDate>
	</xbrli:period>
	<xbrli:scenario>
		<xbrldi:explicitMember dimension="cljpndim:colours">
			cljpnmem:blue
		</xbrldi:explicitMember>
	</xbrli:scenario>
</xbrli:context>
<xbrli:context id="context_4">
	<xbrli:entity>
		<xbrli:identifier scheme="urn:cljpn:schema:entyti:id">
		cooljapan</xbrli:identifier>
	</xbrli:entity>
	<xbrli:period>
		<xbrli:startDate>2024-01-01</xbrli:startDate>
		<xbrli:endDate>2024-12-31</xbrli:endDate>
	</xbrli:period>
	<xbrli:scenario>
		<xbrldi:explicitMember dimension="cljpndim:colours">
			cljpnmem:allcolours
		</xbrldi:explicitMember>
	</xbrli:scenario>
</xbrli:context>

<xbrli:unit id="PURE">
	<xbrli:measure>xbrli:pure</xbrli:measure>
</xbrli:unit>

<cljpn:yoyoAmount
	decimals="INF"
	contextRef="context_1"
	unitRef="PURE">1000</cljpn:yoyoAmount>
<cljpn:yoyoAmount
	decimals="INF"
	contextRef="context_2"
	unitRef="PURE">2000</cljpn:yoyoAmount>
<cljpn:yoyoAmount
	decimals="INF"
	contextRef="context_3"
	unitRef="PURE">750</cljpn:yoyoAmount>
<cljpn:yoyoAmount
	decimals="INF"
	contextRef="context_4"
	unitRef="PURE">3750</cljpn:yoyoAmount>
<cljpn:tollAmount
	decimals="INF"
	contextRef="context_1"
	unitRef="PURE">500</cljpn:tollAmount>
<cljpn:tollAmount
	decimals="INF"
	contextRef="context_2"
	unitRef="PURE">500</cljpn:tollAmount>
<cljpn:tollAmount
	decimals="INF"
	contextRef="context_3"
	unitRef="PURE">500</cljpn:tollAmount>
<cljpn:tollAmount
	decimals="INF"
	contextRef="context_4"
    unitRef="PURE">1500</cljpn:tollAmount>
```
*part of an xbrl instance stating the facts from the previous tables*

The three parts are hopefully recognisable; the contexts (4 this time, and slightly more complex), the unit, this time not a currency, but the `xbrli:pure` unit which should be used for plain numbers. And 8 values make up the third part.
Starting with the last ones, we saw in both tables that we have two types of toys and from the in published taxonomy we find two concepts `yoyoAmount` and `tollAmount` both in the namespace with the prefix `cljpn`.
Both concepts occur four times in the instance, each time referencing a different context.

Now let us examine the contexts for example `context_2` here repeated for clarity.
```xml
<xbrli:context 
	id="context_2">
  <xbrli:entity>
	<xbrli:identifier 
		scheme="urn:cljpn:schema:entity:id">cooljapan
	</xbrli:identifier>
  </xbrli:entity>
  <xbrli:period>
	<xbrli:startDate>2024-01-01</xbrli:startDate>
	<xbrli:endDate>2024-12-31</xbrli:endDate>
  </xbrli:period>
  <xbrli:scenario>
	<xbrldi:explicitMember 
		dimension="cljpndim:colours">cljpnmem:yellow
	</xbrldi:explicitMember>
  </xbrli:scenario>
</xbrli:context>

```

We start just like the previous example, with an entity, followed by a period. Then there is this new tag `xbrli:scenario`. This section holds the dimensions (or axis). 
The tag could also be `xbrli:segment`, which functions exactly the same. The choice wether to use *segment* or *scenario* is dictated by the taxonomy. How is explained in the second part where we dive into the taxonomy. They both exist for historical reasons but their functionality has been superseded by dimensions. 

The tag is followed by yet another new tag `xbrldt:explicitMember`. This tag has one required tag `dimension`. The value of that attribute is a QName that points to a concept in the taxonomy. This concept is also the top of our colours dimension.
We've seen that we report on three real colours and a total. So this dimension has four members that can also be found in the taxonomy. These members are also concepts. We see that the value is `cljpnmem:yellow`, and we saw that in the table the heading was just 'yellow'. That value comes from a label tied to the concept. In the report we must point to the concept by it's QName.

Besides an *explicitMember* there is also `xbrldt:typedMember`, and in contrast to *scenario* and *segment* which have no different meaning, a *typedMember* has.
In our colours example we've unknowingly created an *explicit dimension*. It means that we've created a dimension whose members can be stated before hand. Colours, types of drinks, types of material, classes of equity, countries, etc. are examples of dimensions that could be created as explicit dimensions. It's possible to state all possibilities in the taxonomy so the filer can choose which ones can reported on.

A typed dimension holds members that can not be known beforehand when writing the taxonomy, or it would be a too great effort and meaningless to add all the possibilities as a member. Suppose we want to report per telephone number. In theory it could be possible to add all possible phone numbers to the taxonomy. But it would be madness. It is also quite common to report on individuals tied to a company. To identify this person one usually works with a name. Now to state all possible names inside a taxonomy is impossible. For these cases one uses a typed dimension. The member can be 'any value that fits within the type definition'.  And a type definition could be `string(254)`. 

For the colours we have created a dimension 'Colours' with four members. But Cooljapan has invested on new machinery that can handle an unlimited variety of colours. So we change our original explicit dimension into a typed dimension. The type is a `string(254)`. So when we want to report the same values on the same colours, the contexts will look slightly different. 

```xml
<xbrli:context 
	id="context_2">
  <xbrli:entity>
	<xbrli:identifier 
		scheme="urn:cljpn:schema:entity:id">cooljapan
	</xbrli:identifier>
  </xbrli:entity>
  <xbrli:period>
	<xbrli:startDate>2024-01-01</xbrli:startDate>
	<xbrli:endDate>2024-12-31</xbrli:endDate>
  </xbrli:period>
  <xbrli:scenario>
	<xbrldi:typedMember 
		dimension="cljpndim:colours">
		<cljpnmem:colour>Crimson red</cljpnmem:colour>
	</xbrldi:typedMember>
  </xbrli:scenario>
</xbrli:context>

```
Inside the `xbrli:scenario` we see that we add a `typeMember` from the colours-dimension. The taxonomy will have one member defined in this dimension. The name of that member is used as the tag. The actual colour is the value for this member. 

At this point we have seen all the parts that make an XBRL instance. All that remains to cover is called taxonomy. It is the datamodel and explanation of the instance that can be created with it. The concepts, the dimensions and the units you can use to report are all defined in the taxonomy. 
