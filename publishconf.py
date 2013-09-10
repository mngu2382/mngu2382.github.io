#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

# This file is only used if you use `make publish` or
# explicitly specify it as your config file.

import os
import sys
sys.path.append(os.curdir)
from pelicanconf import *

SITEURL = 'http://mngu2382.github.io'
RELATIVE_URLS = False

FEED_ALL_ATOM = None #'feeds/all.atom.xml'
CATEGORY_FEED_ATOM = None #'feeds/%s.atom.xml'

DELETE_OUTPUT_DIRECTORY = False

DEFAULT_PAGINATION = 10

THEME = u'themes/simple'
CSS_FILE = u'themes/simple/static/css/main.css'

DIRECT_TEMPLATES = ('index',)
INDEX_SAVE_AS = u'index.html'

STATIC_PATHS = ['images']

ARTICLE_DIR = u'posts'
ARTICLE_URL = u'posts/{slug}.html'
ARTICLE_SAVE_AS = u'posts/{slug}.html'

PAGE_DIR = u'pages'
PAGE_URL = u'pages/{slug}.html'
PAGE_SAVE_AS = u'pages/{slug}.html'

FILES_TO_COPY = (('tmp.ico', 'tmp.ico'), )

JINJA_EXTENSIONS = ['jinja2.ext.do']

# Custom variables
MATHJAX_URL = u'http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'
# Following items are often useful when publishing

#DISQUS_SITENAME = ""
#GOOGLE_ANALYTICS = ""
