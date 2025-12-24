\newpage
# Facts
>*In the end, we are only interested in the facts.*

XBRL serves a special purpose: it automated the process and made filed reports machine-readable and -interpretable. A couple of decades ago most filings were on paper—non-indexable and non-searchable—so only a handful of people ever read them. The next step was the same report  as PDF or HTML, searchable, but the information inside was still not indexable. XBRL standardized the final step and made filings and reports searchable, indexable and comparable. Nowadays it is easy to compare the net revenue of different companies, the amount of shares held by companies, or any other fact that can be stated on a report. All data structured to the same model, available in machine readable format. 

Many organisations are required to publish one or more reports each year, quarter, half-year, by different authorities, like the government, federal tax, oversight committees, continental entities and so on. All the reports or filings have the same thing in common, they state facts. Facts based on the prescribed taxonomy or "data model". What makes, in XBRL terms, a fact? 

Let us look at a possible fact from *Cooljapan* a small toy company.

`Net revenue (€ millions), 2024, 1079.5`

The *value* is `1079.5`, we see that's reported in `millions of euro`, we call that a _unit_ in XBRL, the value was valid for the *period* `2024` and the *entity* reporting this fact is `Cooljapan`.

To put it differently, a common fact consists of 
```text
Value: 1079.5
What: Net revenue
Who: Cooljapan
When: 2024
of what: Millions of euro.
```

And to put it in xBRL terms:
```text
Value: 1079.5
Concept: Net revenue
Entity: Cooljapan
Period: 2024
unit: Euro
decimals: -6
```

We see that the *what* is called *[[Concepts]]*, the _who_ is referred to as _entity_, the when as _period_ and the _of what_ has a formal name *unit* and the *decimals=-6* tells that we report in millions of the *unit*. In XBRL we call these different properties of a fact *aspects*. 

The combination of the value and the different aspects is what makes a fact. And in xBRL all that we report are facts. Which values can and must be reported is defined by the [[taxonomy]]. We will look at this in great detail in part II the technical nitty gritty.

A report, or instance, will contain more than just one fact, there will be many. One way to present the facts is in a two-dimensional table called the *fact table*.  In a fact table each fact is represented by a row. Each aspect is a column. A very simple filing with only three facts stated could have a fact table like the example below.

| concept     | value | entity    | unit | period |
| ----------- | ----: | --------- | ---- | -----: |
| net revenue |   200 | Cooljapan | euro |   2024 |
| gross sales |   300 | Cooljapan | euro |   2024 |
| investments |   150 | Cooljapan | euro |   2024 |
*a fact table with three different concepts*

The fact table is just one way to look at a report. Later we will see that there are different types of tables that can help us to make an XBRL instance human readable and group related facts together. These aides however are not needed to create a report.

We saw an example of what is called a monetary fact, but we can report on much more than only monetary facts. We can report text, areas of land, number of units in an appartement block, etc. All what matters is that the facts we report on are found in the taxonomy that is used to create the report and that all the required aspects are provided.

In the next parts we'll dive deeper into the different aspects that make a fact, starting with the Concept.
