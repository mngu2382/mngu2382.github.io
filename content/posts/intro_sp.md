title: Notes: the `sp` package
date: 2013-09-10
slug: sp_package
front: True
status: draft

Original article [here](TODO).
## 1 Introduction
Spatial data structures implemented include points, lines, polygons
and grids; each with and without attribute data. S4 classes and
methods style.

## 2 Spatial data classes
The `sp` package provides class for spatial-only information (e.g.
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
the bounding box, a matrix of numerical cordinates with column names
`c(min, max)` and at least two rows (easting and northings). Often the
bounding box in generated automatically from data in subclasses of
`Spatial`.

The second, `proj4string`, is a `CRS` class object defining the
corodinate reference system. The `CRS` class in turn, has a single
character string slot, `projargs`,  which is the projection in
PROJ.4-format. The default value is `as.character(NA)`.

The slots can be access using the `bbox` and `proj4string` methods.

Operations on `Spatial*` objects update or copy these values to the
new `Spatial* object being created.

### 2.2 Spatial points
The `SpatialPoints` class extends the `Spatial` class by adding a
`coords` slot, into which a matrix of point coorinates can be inserted.


`SpatialPoints` objects may have more than two dimensions, but plot
methods for the class use only the first two.

#### 2.2.1 Methods
The following methods access the two slots that in `Spatial` objects:
`bbox` returns the bounding box; and `proj4string` returns the
projection string contained as a `CRS` object .


