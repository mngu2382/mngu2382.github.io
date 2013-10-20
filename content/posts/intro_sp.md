title: Spatial data classes for R and the `sp` package
date: 2013-09-10
slug: sp_package
status: draft
summary: Notes I made when I wanted to plot a shapefile to make a map
    of the northern suburbs of Canberra ([here](/TODO)).

Notes I made when I wanted to plot a shapefile to make a map of the
northern suburbs of Canberra ([here](/TODO)).

## 1 Introduction
Spatial data structures implemented include points, lines, polygons
and grids; each with and without attribute data. S4 classes and
methods style.

## 2 Spatial data classes
The `sp` package provides classes for spatial-only information (e.g.
`SpatialPoints`) and extensions which include the data attributes for
the spatial entities (e.g. `SpatialPointsDataFrame`). Available
classes:

<table>
<thead>
  <tr>
    <th>Data Type</th>
    <th>Class</th>
    <th>Contains</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>points</td>
    <td><code>SpatialPoints</code></td>
    <td><code>Spatial</code></td>
  </tr>
  <tr>
    <td>points</td>
    <td><code>SpatialPointsDataFrame</code></td>
    <td></td>
  </tr>
  <tr>
    <td>pixels</td>
    <td><code>SpatialPixels</code></td>
    <td><code>SpatialPoints</code></td>
  </tr>
  <tr>
    <td>pixels</td>
    <td><code>SpatialPixelsDataFrame</code></td>
    <td><code>SpatialPointsDataFrame</code></td>
  </tr>
  <tr>
    <td>full grid</td>
    <td><code>SpatialGrid</code></td>
    <td><code>SpatialPixels</code></td>
  </tr>
  <tr>
    <td>full grid</td>
    <td><code>SpatialGridDataFrame</code></td>
    <td></td>
  </tr>
  <tr>
    <td>line</td>
    <td><code>Line</code></td>
    <td></td>
  </tr>
  <tr>
    <td>lines</td>
    <td><code>Lines</code></td>
    <td><code>Line</code> list</td>
  </tr>
  <tr>
    <td>lines</td>
    <td><code>SpatialLines</code></td>
    <td><code>Spatial</code>, <code>Lines</code> list</td>
  </tr>
  <tr>
    <td>lines</td>
    <td><code>SpatialLinesDataFrame</code></td>
    <td></td>
  </tr>
  <tr>
    <td>ring</td>
    <td><code>Polygon</code></td>
    <td><code>Line</code></td>
  </tr>
  <tr>
    <td>rings</td>
    <td><code>Polygons</code></td>
    <td><code>Polygon</code> list</td>
  </tr>
  <tr>
    <td>rings</td>
    <td><code>SpatialPolygons</code></td>
    <td><code>Spatial</code>, <code>Polygons</code> list</td>
  </tr>
  <tr>
    <td>rings</td>
    <td><code>SpatialPolygonsDataFrame</code></td>
    <td></td>
  </tr>
</tbody>
</table>
Note that `Spatial*DataFrame` always contains `Spatial*`.

### 2.1 Spatial
The foundational class `Spatial` has two slots. The first `bbox`, is
the bounding box, a matrix of numerical coordinates with column names
`c(min, max)` and at least two rows (easting and northing). Often the
bounding box in generated automatically from data in subclasses of
`Spatial`.

The second, `proj4string`, is a `CRS` class object defining the
coordinate reference system. The `CRS` class in turn, has a single
character string slot, `projargs`,  which is the projection in
PROJ.4-format. The default value is `as.character(NA)`.

The slots can be access using the `bbox` and `proj4string` methods.

Operations on `Spatial*` objects update or copy these values to the
new `Spatial*` object being created.

    :::R
    getClass("Spatial")
    # Slots:
    #                               
    # Name:         bbox proj4string
    # Class:      matrix         CRS

### 2.2 Spatial points
The `SpatialPoints` class extends the `Spatial` class by adding a
`coords` slot, into which a matrix of point coordinates can be inserted.
This can be accessed by the `cooordinates` method.

`SpatialPoints` objects may have more than two dimensions, but plot
methods for the class use only the first two.

The class `SpatialPointsDataFrame` extends `SpatialPoints` to include
attribute data, where each spatial entity (in this case, a point), is
linked to a row in a data frame. The data frame is stored in the slot
`data`.

The `Spatial*DataFrame` classes have been designed to behave like
data frames and work with standard methods like `[`, `names` and
`model.frame` which act on the `data` slot.

    :::R
    getClass("SpatialPoints")
    # Slots:
    #                                           
    # Name:       coords        bbox proj4string
    # Class:      matrix      matrix         CRS

    getClass("SpatialPointsDataFrame")
    # Slots:
    #                                                                   
    # Name:         data  coords.nrs      coords        bbox proj4string
    # Class:  data.frame     numeric      matrix      matrix         CRS

### 2.3 Spatial lines
Lines in R are represented as a sequence of points, based on
lowering the graphic "pen" at the first point and drawing to the
successive points until an `NA` is met. Then the pen is raise and
moved to the next non-`NA` value, where it is lowered, and so on until
the end of the sequence.

`Lines` in `sp` are different: starting with a `Line` object which is
represented as a matrix of 2D coordinates, without `NA` values. A list
of `Line` objects fills the `Lines` slot in a `Lines` object. The only
other slot in `Lines` is `ID`, a single identifying character string,
that will be used in the construction of `SpatialLines`.

`Line` and `Lines` do not inherit from the `Spatial` class, rather it
is `SpatialLines` which inherits from both `Lines` and `Spatial`.



## Reference
Pebesma, E.J. and Bivand, R.S., 2005,
[S Classes and Methods for Spatial Data: the `sp` Package](http://cran.r-project.org/web/packages/sp/index.html)

Bivand, R.S, Pebesma, E.J. and Gomez-Rubio, V., 2008,
[Applied Spatial Data Analysis with R](http://www.asdar-book.org)
