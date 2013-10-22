title: Sparklines
date: 2013-10-22
slug: sparklines
summary: Inspired by Tufte's
    [sparklines](http://www.edwardtufte.com/bboard/q-and-a-fetch-msg?msg_id=0001OR),
    I prototyped the following visualisation at work today.

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

_R code for this image on
[Github](https://github.com/mngu2382/mngu2382.github.io/blob/src/extra/sparklines/sparklines.R). A
[pdf](/static/images/sparklines.pdf) version of the image is also
available._

The last element that was add to the graphic was the gray background
on the  plots which made an enormous amount of difference, surprising
the crap out of me. I knew it would make a difference -- helping to
visually group elements and graph reading in general (&agrave; la
ggplot, which cites the advice of Tufte, Brewer and Carr) -- but the
improvement still surprised.

__NB__: The data from work has been replaced with publically available
series from the [RBA](http://www.rba.gov.au/statistics/by-subject.html)
and [IndexMundi](http://www.indexmundi.com/commodities/).

For the rest of this post I will walk through some of the corners of
R the I learnt while trying to figure this one out. _Complete R code
for the examples on
[Github](https://github.com/mngu2382/mngu2382.github.io/blob/src/extra/sparklines/examples.R)._

##### The layout function
The
[layout](http://stat.ethz.ch/R-manual/R-devel/library/graphics/html/layout.html)
function is a way to divide the graphics device up in a
manner similar, yet more flexibly that the `mfrow`/`mfcol` properties
in `par`. For example the following two code chunks produce equivalent
outputs:

    :::r
    # default par values
    opar <- par(no.readonly=T)
    
    # Firstly an mfrow example
    # use mfcol if you want to fill by column
    par(mfcol=c(2, 2), mar=c(1,1,1,1))
    for (i in 1:4) {
        plot(1, type="n", axes=F, xlab="", ylab="")
        text(1, 1, i)
        box()
    }
    
    # revert to original par values
    par(opar)
    
    # Equivalent layout example
    # use byrow=F if you want to fill by column
    layout(matrix(1:4, nrow=2, byrow=T))
    par(mar=c(1, 1, 1, 1))
    for (i in 1:4) {
        plot(1, type="n", axes=F, xlab="", ylab="")
        text(1, 1, i)
        box()
    }

![Layout example 1](/static/images/sparklines_example1.png "Using layout to achieve the same result as mfrow/mfcol")

With layout, figures can also be relatively sized and cells merged:

    :::r
    # Layout with varying sizes, can similarly adjust the height
    layout(matrix(1:4, nrow=2, byrow=T), width=c(2, 1))
    par(mar=c(1, 1, 1, 1))
    for (i in 1:4) {
        plot(1, type="n", axes=F, xlab="", ylab="")
        text(1, 1, i)
        box()
    }

![Layout example 2](/static/images/sparklines_example2.png "Layout with resized figures")

    :::r
    layout(matrix(c(1, 2, 2,
                    1, 3, 4), nrow=2, byrow=T), width=c(2, 1))
    for (i in 1:4) {
        plot(1, type="n", axes=F, xlab="", ylab="")
        text(1, 1, i)
        box()
    }
    
    par(opar)

![Layout example 3](/static/images/sparklines_example3.png "Layout with merged cells")

For the market report, I've simply used a 8  by 3 grid layout:
![Layout example 4](/static/images/sparklines_example4.png "Layout used in market report")

##### R graphics coordinate systems and grconvertX/grconvertY

##### Reference
- H. Wickham. _ggplot2: elegant graphics for data analysis_. Springer
  New York, 2009. 8.1.1 Built-in themes.
