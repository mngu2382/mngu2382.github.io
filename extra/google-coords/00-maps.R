library(png)

deg2rad <- function(degrees)
    degrees * pi / 180
lng2x <- function(lng)
    128 * (1 + deg2rad(lng) / pi)
lat2y <- function(lat) {
    sinphi <- sin(deg2rad(lat))
    128 * ( 1 - log((1 + sinphi) / (1 - sinphi)) / (2 * pi)) 
}

download.file(paste("http://maps.googleapis.com/maps/api/staticmap",
                    "?center=0,0&zoom=0&size=256x256&scale=2",
                    "&maptype=satellite&sensor=false", sep=""),
              "./world-zoom00.png", mode="wb")

map00 <- readPNG("./world-zoom00.png")

# Adding transparency
map00_t <- array(0, c(512, 512, 4))
map00_t[,, 1:3] <- map00
map00_t[,, 4] <- 0.6

png("./world-zoom00-adj.png", width=630, height=630, res=96)
par(mar=c(3, 3, 3, 3), mgp=c(1.6, 0.5, 0), cex.axis=0.7)
plot(-2:257,-2:257, type="n", xaxs="i", yaxs="i",
     xlab="Longitude (degrees)", ylab="World Coordinates, y (units)",
     col.lab="#dd3322", axes=F)
rasterImage(map00_t, 0, 0, 255, 255, interpolate=F)
axis(1, lng2x(seq(-180, 180, by=60)), seq(180, -180, by=-60))
axis(2, seq(255, -1, by=-64), seq(0, 256, by=64))
axis(3, seq(0, 256, by=64), seq(0, 256, by=64))
axis(4, lat2y(seq(-80, 80, by=20)), seq(80, -80, by=-20))
mtext("World Coordinates, x (units)", 3, line=1.8, col="#dd3322")
mtext("Latitude (degrees)", 4, line=1.8, col="#dd3322")
box()
dev.off()
