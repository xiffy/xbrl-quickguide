\newpage
# Namespaces
A more technical intermezzo that is needed, namely *namespaces*. Now you all heard of this term before, because it's used in software development, deployments and plenty of other places. Namespaces are used to confine the use of a name to a certain domain. This enables you to use different domains, which potentially have clashing names inside them. By confining them to a namespace it is possible to distinguish between them. While both domains (for example `cljpn` and `html`) can have an entity called `body`, the addition of a namespace keeps the two identities distinct `cljpn:body` and `html:body`.

In XML and thus XBRL, everything is bound by a namespace, even if you don't see this. In that case a *default* (empty) namespace is used. Namespaces in XML are defined by a URI (Uniform Resource Identifier) and take often the form of a URL (Uniform Resource Locator), or otherwise a URN (Uniform Resource Name). So `http://www.uri.org/schema/value` or `urn:uri:org:schema:value` are both valid namespaces. 

Because of the verbose nature of URIs they tend to be very long. To increase  readability and ease of use it is possible to refer to a namespace by a **prefix**. The prefix is defined at the top of the schema file along with the namespace.  Although the choice of the prefix is free, some prefixes are either a standard or universally accepted as the prefix for a given namespace. Some examples of these are:

| prefix | namespace                         |
| ------ | --------------------------------- |
| xs     | http://www.w3.org/2001/XMLSchema  |
| link   | http://www.xbrl.org/2003/linkbase |
| xlink  | http://www.w3.org/1999/xlink      |
| xbrli  | http://www.xbrl.org/2003/instance |
| svg    | http://www.w3.org/2000/svg        |

All elements (concepts) defined in a schema are defined within the namespace the schema dictates. This is done by the **targetNamespace** of the schema.  
When we define the following concept
```xml
<xs:element abstract="false" 
    id="cljpn_Assets" 
    name="Assets" 
    nillable="false" 
    substitutionGroup="xbrli:item" 
    type="xbrli:monetaryItemType" 
    xbrli:balance="debit" 
    xbrli:periodType="instant" />
```
In a schema file that has a targetNamespace defined like:
```xml
xmlns:cljpn="http://schemas.cooljapan.nl/taxonomy/cljpn"
```
and it has
```xml
targetNamespace="http://schemas.cooljapan.nl/taxonomy/cljpn"
```
then we must refer to this `assets` element as either (Clark notation):
```xml
{http://schemas.cooljapan.nl/taxonomy/cljpn}Assets
```
or the more common form with the prefix
```xml
cljpn:Assets
```
The latter form is also known as the QName or Qualified Name. 

Whenever you see a colon (':') inside a tag name (`xs:element`), attribute name (`xbrli:balance`), attribute value (`xbrli:monetaryItemType`) or value, you are most likely dealing with a QName which consists of the prefix (of a namespace) and the local name of the element. 

When writing a report, all prefixes and namespaces are provided by the taxonomy. There is not much to worry about for a filer, just be aware that namespaces exist and are heavily used in xbrl. 

