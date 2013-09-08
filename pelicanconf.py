#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = u'm'
SITENAME = u':testSite'
SITESUBTITLE = u'a work in progress'
#SITEURL = u''

TIMEZONE = u'Australia/Sydney'

DEFAULT_LANG = u'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None

DEFAULT_PAGINATION = 10

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True

THEME = u'themes/simple'
CSS_FILE = u'themes/simple/static/css/main.css'

DIRECT_TEMPLATES = ('index',)
INDEX_SAVE_AS = u'index.html'

ARTICLE_DIR = u'posts'
ARTICLE_URL = u'posts/{slug}.html'
ARTICLE_SAVE_AS = u'posts/{slug}.html'

PAGE_DIR = u'pages'
PAGE_URL = u'pages/{slug}.html'
PAGE_SAVE_AS = u'pages/{slug}.html'

AUTHOR_SAVE_AS = False
CATEGORY_SAVE_AS = False

STATIC_PATHS = ['images']

JINJA_EXTENSIONS = ['jinja2.ext.do']

# Custom variables
MATHJAX_URL = u'http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'
