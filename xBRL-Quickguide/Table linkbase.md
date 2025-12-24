\newpage
# Table linkbase
One does not escape the table linkbase. It's designed to be a presentation aide where normal hypercubes are too simple, but also a calculation aid via parameters and formulas, as well as a way to get repeating values easily added to the table (think period, entity, unit) by ways of parameters. Lastly you are able to define the width of for example the period. In a taxonomy there is no way to proscribe for which period(s) one is supposed to fill out the report. This is normally dictated by the accompanying filing rules. By using table definitions one is able to proscribe this requirement with the taxonomy.

Because the options to have the outcome of a formula as a value for either a member or a line item and the flexibility of building the visual outcome they are the perfect tool to present complex data in a 2-dimensional space. But the flexibility comes at the cost of complexity. Because so much is possible, on so many layers of the construction, the definition is both hard to write and to read.

Maybe because of this, their usage is restricted to a couple of taxonomies that I know of. But don't let it scare you, a table is also just an hierarchy with a table definition on top.  But before we can look at the table definition in a taxonomy we first need to introduce a new term *generic links*. 

## Generic links
Instead of adding another link type with predefined semantics and syntax, like the presentation-, definition- or label linkbase, the xbrl organisation added the generic link. With the help of these generic links we can extend our taxonomy with labels for other elements than concepts. And with generic links we can start the definition of an xbrl table. A table is just like all the other parts that provide structure defined in a linkbase file, so it is just another hierarchy. And it starts just like any other linkbase file with a `link:linkbase` tag with the used namespaces as attributes. Then we link to the used roleRef that functions as the top of the table (and possibly also a presentation or definition link as well.) 

What then follows is a generic link. A generic link `gen:link`, in combination with a generic arc `gen:arc`, can establish relationships between arbitrary elements. Here the generic link will be used to "bind" the table hierarchy to the roleRef. 

I will not give an XML example for the table. Mainly because it would be just 'a' table and it is a lot of XML to digest. A table linkbase requires more namespaces than the ones we introduced before. That is partly because of the generic link itself, and partly because of the possibilities tables offer. If for instance you use formula and filters to select parts of an hierarchy you need to include the formula namespace as well.

Then we link to a roleRef, just like the other linkbase types. 

Then we will use a `<gen:link>` generic link which links to the roleRef. 

The next part consists of the table definition itself. What you can and can not do within a table is specified in the [table specification](https://www.xbrl.org/Specification/table-linkbase-1.1/PWD-2017-07-12/table-linkbase-1.1-PWD-2017-07-12.html). The ultra short version leaving tons of details and edge cases out:

-  you start with a `<table:table>`, whose children are
-  two or more `<table:breakdown>` nodes (x, y and optional z axis)
-  whose children are either 
	-   a `<table:conceptRelationshipNode>`,
	-   a `<table:dimesnionRelationshipNode>`,
	-   a `<table:aspectNode>`,
	-   or a `<table:ruleNode>`

There is a lot more XML-glue involved to get these structured in a hierarchy, but these are to main parts of a table definition. 

The table is always a single node. The breakdowns, which define the axis of the table can have breakdowns on the same axis as siblings. So it is possible to have two, three or even more breakdowns which all define a part of the same axis. Under the breakdowns, which by themselves have no relationship with any concept, we could have four different types of children. The *conceptRelationshipNode* and the *dimensionRelationshipNode* are both 'leaves', they point to a hierarchy in the taxonomy and they add their hierarchy to the table as either rows (y-axis) or columns (x-axis). When there is a z-axis defined in the breakdowns, which is usually a dimension, the table should be repeated for each member in that dimension.

The *aspectNode* adds a certain aspect to the table. This can be any of the known aspects like *entity*, *period*, *unit* or a dimension. There can be only one child to an aspectnode, which makes it also a leave of the table definition.

The *ruleNode* on the other hand is more versatile. It can have different types of children. All four types of breakdown children can also be child of a rulenode. So the *conceptRelationshipNode*, the *aspectNode* and the *dimensionRelationshipNode* can be children of a *ruleNode*. A rulenode can also be the child of a rulenode, which can recurse when there is yet another rulenode as child.

The rulenode can also have a `<table:ruleSet>` as a child. This tag can define *formulas* that can add values to context of the facts displayed, found elsewhere in an instance.  This way you can help filers so they don't have to repeat some values over and over again.

The use of tables in official taxonomies is not widespread. Because of the complexity to create them in the taxonomy combined with the added value to a average user the benefits are debatable. Tables sure make nice output when you display or print a report. And they do give some help to the filers, but the move to inline xbrl makes, in my opinion, the table as a method of view obsolete.

With that in mind, and knowing this is just a quick guide I recommend you to examine the specifications if you want to dive any deeper into tables. 
A couple of (online) viewers and tooling are capable to preview tables. Tooling can also help you create a table with the help of a GUI. Understanding the specification is only needed when you want to write your own taxonomy or even more ambitious write your own xbrl parser.

