\newpage
# Glossary
#### Abstract
A special kind of **concept** which are used for titles and subheadings in a report.

#### Aspect
every different axis that contributes to the value becoming a **fact**

#### Axis
In **xBRL** axis is equivalent to **dimension**. 

#### Concept 
the _what_ the value refers to. The concept is one of the **aspects** that contributes to a fact.

#### Context
A values on a **instance** always refers to the context it belongs to. The context consists of different **aspects** 

#### Dimension
When it is needed to report detailed information about a **fact** that is beyond the scope of the standard **aspects** an extra aspect can be added by a dimension. The dimension is also called **axis** and is represented by a tree hierarchy. There are two kinds of dimensions; **typed dimensions** and **explicit dimensions**

#### Domain
a domain is an optional child of a **dimension**. A domain groups **members** under the dimension 

#### DTS
Discoverable Taxonomy Set. By means of an **entrypoint** a taxonomy can be read and understood (by the right tooling)

#### Entity
When filing a report this is usually done on behave of a person, a company or some other legal form. In **xBRL** we call this the entity The entity contributes a standard **aspect** to a **fact**.

#### Entrypoint
XML Schema file that is the start of a specific filing within a DTS. The entrypoint can be a complete taxonomy but it usually loads more files from the DTS.

#### Explicit dimension
This form of dimension is called explicit because all possible **member** values are known beforehand and can be found in the **taxonomy**.

#### Fact
A fact consists of a value (ex. 23) and a **context** to which this values refers to.

#### Filing rules
Set of rules that are published by the authority. These documents describe all the conditions that must be met by the instance, which could not be expressed in the taxonomy. 

#### Generic links
Generic links are used on all the modern stuff. They have been introduced to accommodate mostly **labels** and **definitions** to structural nodes such as linkroles, but also for instance Enumeration option nodes, . 

#### Hypercube
A multi-dimensional table representation of **concepts** that share the same aspects.

#### Instance
Or report or xbrl instance. A filing done on the basis of one or more taxonomies. The instance consists of the name of the used **schema**, **contexts** and **values**.

#### Labels
Human readable label for a Concept. These can come in different **languages** and in different 'roles' like standard label, total label, period start label, ....

#### Language
Text elements can be reported in different languages, and so can labels be. When reporting in different languages, the language adds an **aspect** to the fact.

#### Linkbase
Or RoleType. Top of different hierarchies, links together on a roleURI.

#### Member
The leaf nodes in the dimensional hierarchy. These add the actual **aspect** to the **fact**

#### Namespace
Domain to which an object is confined. A namespace is defined by a URN.

#### Prefix
A shorthand to reference a **namespace**

#### QName
Qualified name of anything. This consists of a **namespace** and local name. The namespace is written by it's **prefix** followed by a colon followed by the local name. For example `xbrli:monetaryItemType`.  

#### Report
see **Instance**.

#### Schema
Name we use for an XML Schema file. The **entrypoint** is an XML Schema file and is referred to in the **instance** on the schemaRef node.

#### Taxonomy
Set of xml-schema files and linkbases, all written in xml. The taxonomy is discoverable by an **entrypoint**. A taxonomy can hold different entrypoints. A taxonomy consists of concepts and relational information of those concepts with each other. 

#### Unit
When reporting a numeric value it should refer to a certain unit. This can be a valuta like Euro or Dollar, but also a measure like kilometers, persons, or complex divisions like Euro per share.  

#### XBRL
extensible Business reporting language. 
