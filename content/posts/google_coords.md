title: Lat-Lng, World and Pixel Coordinates in Google Maps
Date: 2013-10-11
slug: google-coords
mathjax: true
summary: A summary of the different coordinate systems that the Google
    Maps API uses as explained in the
    [documentation](https://developers.google.com/maps/documentation/javascript/maptypes#MapCoordinates)
    and demonstrated in an
    [example](https://developers.google.com/maps/documentation/javascript/examples/map-coordinates).


A summary of the different coordinate systems that the Google Maps API
uses as explained in the
[documentation](https://developers.google.com/maps/documentation/javascript/maptypes#MapCoordinates)
and demonstrated in an
[example](https://developers.google.com/maps/documentation/javascript/examples/map-coordinates).

#### The short of it
From the [WGS84](http://en.wikipedia.org/wiki/World_Geodetic_System)
lat-lng pair, the
[Mercator projection](http://en.wikipedia.org/wiki/Mercator_projection)
is used to place the point in a square with sides of 256 units. Points
in this space are called the world coordinates.

For a given zoom level (between 0 and 21, inclusive), the world
coordinates are mapped to the pixel coordinates using the following
formula

    pixelCoordinate = worldCoordinate * 2 ^ zoomLevel

That is, from a square with sides of 256 units, the map is scaled up
to a square with sides of `256 * 2 ^ zoomLevel` units. As the name
suggests, these units are pixels and the coordinates refer to the
position of the pixel on the map.

#### From lat-lng to world coordinates
To transform lat-lng to world coordinates (using the Mercator
projection) we use the following formulae:

$$
\begin{align}
x &= 128(1 + \lambda/\pi)\\\\
y &= 128\left(1 - \frac{1}{2\pi}
\log\left(\frac{1 + \sin\varphi}{1 - \sin\varphi}\right)\right)
\end{align}
$$

where $-\pi/2\le\varphi\lt\pi/2$ is the latitude in radians and
$-\pi\le\lambda\lt\pi$ is the longitude in radians.

Note that this transformation places the $(\varphi,\lambda)$ lat-lng
pair of (0, 0) at (128.0, 128.0) in the world coordinates. The map has
an equitorial circumference of 256 units and, hence, a radius of
$256/2\pi$.

![Lat-lng and Google Map's world coordinates](/static/images/world-zoom00-adj.png)

_The R code for this figure can be found on
[GitHub](https://github.com/mngu2382/mngu2382.github.io/blob/src/extra/google-coords/00-maps.R)._

#### From world to pixel coordinates
As mentioned above, pixel coorindates are the world coordinates scaled
up to fit a square map with sides of `256 * 2 ^ zoomLevel` pixels.
Pixel coordinates are rounded to the nearest integer, since they need
to refer to actual pixel positions.

#### Tiles
Google static maps are stored in 256 by 256 pixel parts called tiles.
At a zoom level of 0 the whole world is made up of a single tile; at a
zoom level of 1, the world whole is made up of 4 tiles arranged in a 2
by 2 grid; at a zoom level of 2, there are 16 grids arrange 4 by 4; and
so on.

This struture provides an alternate way of expressing pixel coordinates
for a given zoom level. Pixel coordinates can be denoted by a pair of
coordinates: the first specifing the tile we're in, and the second, the
pixel position within the tile.

![Google Map's pixel and tile coordinates](/static/images/world-zoom01-adj.png)

_The R code for this figure can be found on
[GitHub](https://github.com/mngu2382/mngu2382.github.io/blob/src/extra/google-coords/01-maps.R)._

