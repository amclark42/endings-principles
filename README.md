# Endings Principles for Digital Longevity

This repository contains resources for [my talk](2025-04-11_boston-dh-symposium_endings-project.md) explaining the [Endings Principles for Digital Longevity](https://endings.uvic.ca/principles.html).

I did not create the Endings Principles. In preparation for my talk, however, I encoded [the Principles in TEI](endings-principles-for-digital-longevity.xml) in order to think through the patterns in the individual principles, and to categorize them. These are the categories I ended up with:

- **Archiving**: This principle anticipates long-term preservation of the projects’ components.
  - **Lots of Copies Keep Stuff Safe (LOCKSS)**: This principle encourages copying resources such that some version of them might survive.
  - **Provenance**: This principle supports record-keeping of the history of the project.
- **Maintainability**: This principle encourages the upkeep of a project’s components, keeping them in sync during the project’s lifecycle.
  - **Open Source**: This principle participates in open source ecosystems, built on well-documented, thoroughly-tested, and widely-adopted technologies.
- **Usability**: This principle ensures consistent, reliable, legible use of the project’s end-products.
  - **Reuse**: This principle supports reuse of materials outside of the project’s original context.
  - **Transparency**: This principle encourages discovery of and engagement with materials.

## Analysis

I ran two [counting robot](https://github.com/NEU-DSG/wwp-public-code-share/tree/main/counting_robot#readme) reports on the marked-up Endings Principles.

To see the total number of principles in each section at a glance, I ran this XQuery:

```Xquery
for $section in $endings-principles//body//div
let $label := $section/head
for $principle in $section//item
return $label
```

Which gave me these results:

```tsv
9	Products
5	Release management
3	Data
3	Processing
2	Documentation
```

This report encouraged me to use the "Products" section as the starting point for my talk.

To identify the relative popularity of each category across all principles, I used the query `$endings-principles//@ana/tokenize(., '\s+')`. The results:

```tsv
13	#cat.archiving
11	#cat.maintainability
8	#cat.usability
7	#cat.transparency
4	#cat.provenance
4	#cat.reuse
3	#cat.lockss
2	#cat.open-source
```

Before running this report, I had listed all categories as equals of each other. This report allowed me to surface the "Archiving", "Maintainability", and "Usability" categories as the main ones, under which the rest fell.


## Transformation

I wrote an [XSL transformation](endings-principles-to-html.xsl) to render the [marked-up, categorized Principles as HTML](principles.html) so I could easily reference them as I was writing my talk. Since then, I have streamlined the page to be more informative to people who aren't me.

In conformance with the Endings Principles, this HTML page is able to stand on its own without dependencies. To view it in your browser, visit the link to the ["raw" HTML file](https://raw.githubusercontent.com/amclark42/endings-principles/refs/heads/main/principles.html), save a copy to your computer, then open it.

I would also like to create transformation(s) to group up the principles by category, rather than by project component, but I'm not sure if I will ever get to it.
