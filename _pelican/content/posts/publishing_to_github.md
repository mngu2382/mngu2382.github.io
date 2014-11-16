title: Publishing my Pelican site to GitHub
date: 2013-09-19
slug: publishing-to-github
summary: The suggested method in the
    [documentation](http://docs.getpelican.com/en/latest/tips.html#publishing-to-github)
    for publishing Pelican sites to GitHub is through the
    [ghp-import](https://github.com/davisp/ghp-import) package. But since
    I'm ever stingy with the number of packages that I install, I use a
    simple work-around.

The suggested method in the
[documentation](http://docs.getpelican.com/en/latest/tips.html#publishing-to-github)
for publishing Pelican sites to GitHub is through the
[ghp-import](https://github.com/davisp/ghp-import) package. But since
I'm ever stingy with the number of packages that I install, I use a
simple work-around.

We can push the Pelican output directory to the master branch for
our user or organisation page, or the gh-pages branch for our
projects. We just need to make sure that every time we clean out the
output directory (i.e. every time we run `make clean`, `make html` or
`make regenerate`) the git directory is not removed as well.

We achieve this by modifying the `clean` target in the Makefile. The
`diff`:

    :::bash
    50c50
    <       [ ! -d $(OUTPUTDIR) ] || find $(OUTPUTDIR) -mindepth 1 -maxdepth 1 -wholename $(OUTPUTDIR)/.git -o -exec rm -r '{}' \;
    ---
    >       [ ! -d $(OUTPUTDIR) ] || find $(OUTPUTDIR) -mindepth 1 -delete

##### Footnote
If you're like me and seldom use `find`, the syntax and
switches are a pain to get your head around each time. So while it's
fresh:

    :::bash
    find $(OUTPUTDIR) -mindepth 1 -maxdepth 1

Descend only one level into output directory, do not include the
output directory itself. Now with these files...
    
    :::bash
    -wholename $(OUTPUTDIR)/.git

Match file whose whole name matches expression and print (printing is
implicit)

    :::bash
    -o -exec rm -r '{}' \;

Or/Otherwise remove file/directory.
