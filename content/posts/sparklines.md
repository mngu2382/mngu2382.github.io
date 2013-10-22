title: Sparklines
date: 2013-10-22
slug: sparklines
summary: Inspired by Tufte's
    [sparklines](http://www.edwardtufte.com/bboard/q-and-a-fetch-msg?msg_id=0001OR)
    I prototyped the following visualisation at work today.

_R code for this post on
[Github](https://github.com/mngu2382/mngu2382.github.io/blob/src/extra/sparklines/sparklines.R)._

Inspired by Tufte's
[sparklines](http://www.edwardtufte.com/bboard/q-and-a-fetch-msg?msg_id=0001OR)
I prototyped the following data visualisation at work today. A
definition of sparklines given by Tutfe:

> A sparkline is a small intense, simple, word-sized graphic with
> typographic resolution. Sparklines mean that graphics are no
> longer cartoonish special occasions with captions and boxes, but
> rather sparkline graphic can be everywhere a word or number can
> be: embedded in a sentence, table, headline, map, spreadsheet,
> graphic.

The [Yale Toolkit](http://cran.r-project.org/web/packages/YaleToolkit/)
on CRAN provides an implementaion of sparklines, but since it is not
easy for me to retrive and install packages at work, I thought I'd roll
my own. Although not quite word-size ...

![Market report sparklines](/static/images/sparklines.png "Market report sparklines")

_pdf version also on
[Github](https://github.com/mngu2382/mngu2382.github.io/blob/src/extra/sparklines/sparklines.pdf)._

The last element that was add to the graphic was the gray background
on the  plots which made an enormous amount of difference, surprising
the crap out of me. I knew it would make a difference -- helping to
visually group elements and graph reading in general (&agrave; la
ggplot, which cites the advice of Tufte, Brewer and Carr) -- but the
improvement still surprised.


__NB__: The data from work has been replaced with publically available
series from the [RBA](http://www.rba.gov.au/statistics/by-subject.html)
and [IndexMundi](http://www.indexmundi.com/commodities/).

##### Reference
- H. Wickham. _ggplot2: elegant graphics for data analysis_. Springer
  New York, 2009. 8.1.1 Built-in themes.
