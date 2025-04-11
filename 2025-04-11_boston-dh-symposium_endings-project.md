
# Endings Project

75 min. panel: 15 minutes each, starting with me. 30 min. discussion

Goal: Provide overview of Endings Project and principles

> The session will begin with a presentation by Ash Clark focusing on the technical rationale for the Endings Principles and what they are designed to achieve. This presentation will outline the resource consumption and maintenance load of specific components, such as databases, search systems, and code libraries. It will describe the Endings Project’s recommended technical infrastructure (static websites built on HTML, CSS, and simple Javascript), laying a conceptual groundwork for the other two presentations.

## Resources

- [Endings Project Principles](https://endings.uvic.ca/principles.html)
- [From Tamagotchis to Pet Rocks: On Learning to Love Simplicity through the Endings Principles](https://digitalhumanities.org/dhq/vol/17/1/000668/000668.html), by Martin Holmes and Joey Takeda
- [WWP Endings Project Recommendations](https://docs.google.com/document/d/1rmzMUu0X-OPFEZECXtOq038cGvzfLa0QlW6kmFcTagg/edit?tab=t.0), by me and Julia
- [Slides: Endings Project Analysis](https://docs.google.com/presentation/d/1uJSpXiZQaqsYL7FEAv1VRT-fYx2PFEt2gLAvWig8bkE/edit?slide=id.p#slide=id.p) , by me and Julia

## Basics

- University of Victoria team
    - 5-year endeavor funded by Social Sciences and Humanities Research Council (SSHRC) of Canada
    - Team
        - Researchers: Claire Carlin, Ewa Czaykowska-Higgins, Elizabeth Grove-White, Janelle Jenstad
        - Developers: Stewart Arneil, Martin Holmes, Greg Newton
        - Librarians: Corey Davis, John Durno, Lisa Goddard, J. Matthew Huculak
        - Research assistants and collaborators including: Emily Comeau, Tye Landels, Daniel Martin, and Joey Takeda
    - "The impetus for The Endings Project was the substantial maintenance burden accrued by UVic’s Humanities Computing and Media Centre (HCMC), which has been involved in over 200 digital humanities projects since the 1990s. Its history, as described in Holmes & Takeda, clearly shows the problems inherent in current approaches to digital edition projects, particularly projects with short-term or sporadic grant funding. The growing maintenance burden facing the HCMC was ultimately unsustainable. Project Endings was conceived and convened to address this problem." (https://digitalhumanities.org/dhq/vol/17/1/000671/000671.html)
    - day seminar with UVic researchers, developers, librarians
        - then a survey of DH practitioners, transcribed and analyzed
        - concluded with The Endings 2021 Symposium
- 5 primary components of a digital project:
    - Data
    - Documentation
    - Processing
    - Products
    - Release management
- Endings Principles for Digital Longevity
    - Data: should be open, legible, self-documenting
    - Documentation: should be ubiquitous and detailed
    - Processing: should be anchored in "relentless validation" and continuous integration
    - Products: should be static, self-sufficient, blue-collar, accessible
    - Release management: should be regular, planned, transparent, coherent, citable

## Script

Welcome, everyone, to "Considering the Endings Principles." My name is Ash Clark. My pronouns are e, em, eir, and I'm the XML Applications Developer for the Women Writers Project and the Northeastern Digital Scholarship Group. I'll start us off with an overview of Project Endings and the Endings Principles. Then, Sarah Connell will discuss the Women Writers Project's analysis of the Endings Principles for its own needs. Finally, Julia Flanders will examine the Endings Principles through the broader lens of the Digital Scholarship Group. We've set ourselves 15 minutes each, and there should be plenty time afterwards for questions and discussion!

Okay, let's dive in by talking a bit about the roots of the Endings Project. (In a bit of lovely wordplay, the project is also known as "Project Endings".) Project Endings came out of University of Victoria's Humanities Computing and Media Centre (HCMC), with its burgeoning portfolio of digital projects. These projects represented years of creativity, experimentation, and growth at UVic and in the digital humanities more broadly. They also represented a significant maintenance burden. The infrastructure to serve out these digital materials had to be kept running, migrated to newer platforms or upgraded to newer software. The projects might be short-lived — brief periods of frenetic activity, lapsing as funding ran out — but the HCMC was on the hook for ensuring that their digital presence continued indefinitely.

As the team described in their special issue of Digital Humanities Quarterly: "The growing maintenance burden facing the HCMC was ultimately unsustainable. Project Endings was conceived and convened to address this problem." The Endings Project was funded by Canada's Social Sciences and Humanities Research Council to bring together developers, archivists, and humanities researchers in order to explore and to *solve* this problem.

One of the major outcomes of the Endings Project was its "Principles for Digital Longevity". This document is the UVic team's blueprint for designing, creating, publishing, and maintaining digital materials. Let's focus for a moment on what these Principles are trying to achieve: "digital longevity."

What does it mean for digital materials to be long-lived? The most obvious criteria is that they are available on the web, and they remain available for a long time. They can't just be available, however, they must also remain consistently and reliably **usable** over time. The Endings Project goes further: digital materials should be released in such a way that researchers can cite them, make copies of them, and reuse them. And, archives (such as the Internet Archive's Wayback Machine) should be able to ingest site materials without losing any important functionality or context.

In other words, digital materials survive in part because someone cares enough to maintain and host them for long periods of time. They might also survive because someone else cared enough to reuse and repurpose them for a different project. And they might also survive because an organization or repository was able to make a functional copy of them to archive and retain. This is the goal. All of the Endings Principles are geared toward making materials that are easy to care for.

The Principles themselves are organized according to five components which make up digital projects: data, documentation, processing, products, and release management. The components are ordered roughly by when they should appear in the project lifecycle — for instance, a project will probably start by accumulating data, not by setting up its release management system.

For the sake of my narrative, I'm going to deviate from this order a bit, and start with the "Products" section. This is by far the section with the most principles, which makes sense, because it is a project's *products* which will have the most longevity. In general, the Principles recommend that a digital product be formed from stable, well-adopted and open technologies. They recommend static sites — just HTML5, Javascript, and CSS — with no reliance on externally-produced libraries. The site should include both a copy of the dataset, *and* its accompanying documentation. The webpages should be legible even in the absence of Javascript or CSS. If one page is saved without any of the surrounding site, that solitary page should *still* be usable and legible.

I've done my best to structure this talk so that all (hopefully) sounds reasonable. My hackles went up reading this section, however, because the Principles in this section are as much about what *not* to do as they are about what *to* do. Let's cover some of the things we lose by adhering to these Principles: "no databases, no PHP, no Python". "No dependence on external libraries or services: no JQuery, no AngularJS, no Bootstrap, no Google Search." And "No query strings" — functionally, that means no filtering, no querying, no taking user inputs and creating a page from the request. As someone who designs interfaces intended to foster exploration and user choice, these Principles are a particularly tough pill to swallow.

For me, it is worth remembering that these Principles are UVic's answer to years of technical debt and costly maintenance. This is what the UVic team have decided for themselves is the most sustainable way forward. They don't want black boxes; they want products where every piece can be tested and vouched for. Everything must work towards that goal of longevity. They cannot guarantee that the server-side processing will survive, they cannot guarantee that some version of jQuery won't have a serious security flaw. But they *can* guarantee that HTML5 will continue to work in browsers, because they've seen it. Webpages built on the earliest versions of HTML *still work* in modern browsers.

Still, the UVic team understands how difficult the principles in this section can be, because they offer these concessions: ***After*** you've got your static site, you can add tech to index your site for search, or to support something like GIS, where the complexity of the feature outweighs your ability to code for it in-house. These technologies must be chosen carefully, with the goal of reducing dependencies on the archivable product.

<!-- started again here -->

Now we've got a handle on Products — almost. This is a good time to look at the first two components of a digital project: the source data and the documentation. They are the first components to come into being, but they also serve as part of the Products, made available to people for research and archival purposes.

Like the website itself, Endings-compliant data will not be in a black box. Proprietary formats are often locked to products which may not be maintainable. Instead, data should be in an open format that can be read by humans and processed by machines.

Data should also be under version control. A version control system provides minute accounting of every change to the files, including information about the person who made the change, their description of the change, and when they made it. Repositories are shareable between colleagues, and this too keeps data safe by ensuring that copies exist on each contributor's computer.

Finally, data is "continually subject to validation and diagnostic analysis." If you're working with XML, for instance, you're validating against a schema to make sure your work still fits within the data model. By requiring validation and diagnostic analysis, the Endings Project team is advocating for a dataset that conforms to its defined model — and to the dataset's documentation. In other words, a thoroughly-vetted dataset is consistent with the rest of the products. A consistent, well-defined, and easy to use dataset is more likely to *be* used. And so it is more likely to be downloaded and repurposed. It is more likely to survive.

The Endings Project only has two principles for documentation, which might seem surprising to anyone who's ever shamefully added yet another To Do item to create some crucial documentation that doesn't yet exist. However, the Endings Project team limited themselves to documentation which will serve the publication, use, and reuse of the data and all products. Thus our two principles: the data model must be fully described and published along with the other products. And: all rights and intellectual property issues must be clearly documented.

At this point we've talked through the components which form part of the public-facing products. Processing and Release Management are the two remaining sections, and these handle how the products are published.

"Processing" is comprised of the code which will produce the products, and the execution of that code. There are only three principles here, but they are big ones. The first principle calls for "relentless validation," and they do mean relentless. Your data must be valid according to its model. The output HTML must be valid according to the W3C validators. And if it's possible to validate your code in any way, you must do that too. If any validation fails, the act of processing must stop. All of this is super stringent, but ensures that the products are only published when they have been rigorously tested and approved. This will aid the maintainability of the project, because the data will be consistent, the HTML will be guaranteed to work in browsers, and the code will be clean and bug-free.

The next principle is that of "continuous integration." It says that if there is *any* change to the data, a full "build" of the Products should automatically kick off. By making this process automatic, the Endings Project team reduces the maintenance overhead that occurs when developers have to shepherd the process through. And by requiring that all Products get re-built, the Endings Project team doesn't have to maintain a system of checks to determine which webpages are affected by the change to the source data.

The last processing principle states that "code is contingent." Processing is necessary to the creation of Products, and thus to the survival of the project materials. Code *should* be subject to version control and clear rights statements, just as Data is. However, the code itself is not essential to be archived — the Products alone will suffice.

How do we know that the Products alone will suffice? That's because of the Release Management principles, which lay out more specifically how the act of publication should work. As the Processing section implies, a publication (or "release") is a full and complete packaging of *all* the Products, including the Data and the Documentation. As we've seen, the products should only be published after thorough testing.

Also, publication should be a planned event which occurs on a regular schedule. Notably, in the Processing section, the Project Endings team relies on continuous integration to recreate a website for any small change. This section makes it easier to see continuous integration as a mechanism for validating, proofing, and testing for *the project team*. The bleeding-edge website produced automatically is not necessarily suitable as a public release.

The Endings Principles also include best practices for the condition of the publication. Because any page might be copied or cited, every page must include citation information, including the date and version of the digital edition. Each edition should remain consistent with its past versions — URLs should stay the same as much as possible. If a page must be moved, the old URL should be redirected to the new one, and if a page is deleted, it should be tombstoned — marked as gone for anyone coming back to that URL.

That's all of the Principles! Here's a summary of the sections: 

- Data should be legible, amenable to processing, versioned, and consistent.
- Documentation should reflect the data model, and should clarify rights, intellectual property, and usage criteria.
- Processing should produce consistent and reliable outputs.
- Products should be static, self-sufficient, blue-collar, and accessible.
- And release management should be regular, planned, transparent, coherent, and citable.

Here at the end of my talk, I can say that I initially struggled through the Endings Principles. The principles are terse, strict guidelines that rarely discuss *why* they are constructed that way, or what problems they are constructed to solve. In fact, I found that I understood the Endings Principles best when I read them alongside a DHQ article by Endings leads Martin Holmes and Joey Takeda, "From Tamagotchis to Pet Rocks: On Learning to Love Simplicity through the Endings Principles." In this article, Holmes and Takeda go through each principle, point by point, talking about the mistakes UVic's HCMC shouldered through to land at the principles. At its core, the Endings Principles are the UVic team's manifesto, as well as a commitment to themselves written in their own blood, sweat, and tears.

Even though I've thrown a lot of information at you in the last fifteen minutes, I do hope that you can see how the individual Principles fit together into a cohesive whole. For anyone who can *kind of* see it but would benefit from another perspective, I've got you. See, I had no idea how to organize this talk, so I did the only thing that made sense to me — I encoded all of the Endings Principles in TEI and set about tagging each principle with the common themes I was seeing. (You know, like you do.) Since the Endings Principles are themselves Endings-compliant and available through a Creative Commons license, I've put the results up in a GitHub repository, at amclark42/endings-principles.

Once I had all the principles categorized, I ran some XQueries to determine how often the categories occurred. This list is my distillation of the results, what I see as the three-legged stool on which the Principles sit. First, archivability: Assume that project materials will be preserved indefinitely, and make it easy for archivists to accomplish that. Second, maintainability: Make it as easy as possible for humans to keep up with project components and keep them in sync. And third, usability: Make the product as reliable and easy to use as possible, which will invite regular users to become stewards and archivists of your project materials.

Survival is a community project, after all.

Thank you!

