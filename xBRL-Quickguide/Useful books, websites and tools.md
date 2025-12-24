\newpage
# Useful books, websites and tools
Most of this quickguide is written with **the XBRL book - the basics of XBRL** by Ghislain Fourny on my desk[^1]. Besides my work at Logius where I learned the basics of XBRL with our focus on taxonomies, this book thought me both insights in the workings of XBRL as well as the basics for the XML needed to write or being able to read or understand the raw XML.

When you need to get to the bottom of things, there is no escaping [reading the specifications](https://specifications.xbrl.org/). And read them twice, and then once more. Compare what you've read with known and validated taxonomies. 
But you seldom need to go beyond the book of Fourny, only when you need to design your own taxonomy a firm understanding of the inner workings and principles of XBRL is needed. 

Of course there is the website of https://xbrl.org and a lot of country specific websites, some like the dutch on https://nl.xbrl.org/. Special mention also for https://xbrl.us which also has a lot of information on xbrl.

To file a report against a given taxonomy, things look much brighter. Once a taxonomy has been published it can be read by different tools. These tools give you various insights in the taxonomy and thus what you can report on. 
I've mentioned [Nessie](https://kc-xbrl.cooljapan.nl/) before, which is a taxonomy viewer which holds the NT (Dutch Taxonomy) I co-authored that at Logius. The official viewer is called [Yeti](http://taxonomy-viewer.nl/yeti/resources/yeti-gwt/Yeti.jsp) which holds the same taxonomies in a slightly different view.
A lot of pre-loaded taxonomies can be found at [fractalexperience](https://www.fractalexperience.com/xbrl/web/?) in yet another type of viewer. 
For filers, the tools are different, they can display the taxonomy in a searchable manner to ease the tagging of a document with the needed information, because seldom does an (i)xbrl instance stand on it's own. It's a machine readable report of existing human readable reports and documents. So a filer wants to quickly find 'the balance sheet', 'mergers and aquisitions'. The presentation linkbase together with the labels, documentation and references offer a way to have this information at a mouse-click when 'tagging' the annual report.

When you want to look at the taxonomy you design yourself you will need local tools. Those whom design and write the taxonomy(-files) will rely on either [Interstage XWand from Fujitsu](https://www.fqs.pl/en/finance/products/interstage-xwand-toolkit) or [XMLSpy from Altova](https://www.altova.com/xmlspy-xml-editor#XBRL) or in house built solutions. Most other vendors offer cloud services where either standard taxonomies are used or the vendor writes or dictates the taxonomy you want to use. I'm not saying it's a bad thing, it's just not something that comes cheap when you want to have both full control of your taxonomy design and full operability on the vendors platform. 

When you want to write your own software to interact with a taxonomy and you don't want to spend any money on the forementioned tools, you end up with [Arelle](https://arelle.org/). And when you want a taxonomy viewer that works on your local machine with local files and is free to use, you also end up with Arelle. It's far from perfect, but it's maintained and it does the basics by the rules. The software is also certified by the xBRL organization.

>This work is licensed under the [creative commons cc by-nc](https://creativecommons.org/licenses/by-nc/4.0/) 
>
>1<sup>st</sup> edition december 2025
>
> Appie Verschoor - Cooljapan
> 

[^1]: https://www.amazon.nl/-/en/Ghislain-Fourny/dp/B0DRZL8C4D
