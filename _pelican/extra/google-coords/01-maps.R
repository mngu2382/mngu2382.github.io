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
                    "?center=0,0&zoom=1&size=512x512&scale=2",
                    "&maptype=satellite&sensor=false", sep=""),
              "./world-zoom01.png", mode="wb")

map01 <- readPNG("./world-zoom01.png")

# Adding transparency
map01_t <- array(0, c(1024, 1024, 4))
map01_t[,, 1:3] <- map01
map01_t[,, 4] <- 0.6

png("./world-zoom01-adj.png", width=630, height=630, res=96)
par(mar=c(3, 3, 3, 3), mgp=c(1.6, 0.5, 0), cex.axis=0.7)
plot(-4:515, -4:515, type="n",xaxs="i", yaxs="i",
     xlab="Tile and Pixel Coordinates, x", ylab="Pixel Coordinates, y",
     col.lab="#dd3322", axes=F)
rasterImage(map01_t, 0, 0, 511, 511, interpolate=F)
axis(2, seq(511, -1, by=-128), seq(0, 512, by=128))
axis(3, seq(0, 512, by=128), seq(0, 512, by=128))
mtext("Pixel Coordinates, x", 3, line=1.8, col="#dd3322")
axis(1, c(128, 384), c(0, 1), tick=F, cex.axis=0.9)
axis(4, c(384, 128), c(0, 1), tick=F, cex.axis=0.9)
mtext("Tile and Pixel Coordinates, y", 4, line=1.8, col="#dd3322")
rect(0, 0, 511, 511, lwd=2, border="#bb7766")
rect(0, 0, 255, 255, lwd=2, border="#bb7766")
rect(255, 255, 511, 511, lwd=2, border="#bb7766")
axis(1, seq(256, 512, by=32), seq(0, 256, by=32),
     cex.axis=0.6, mgp=c(0, -0.3, 0), tcl=0.3)
axis(4, seq(-1, 255, by=32), seq(256, 0, by=-32),
     cex.axis=0.6, mgp=c(0, -0.3, 0), tcl=0.3)
box()
dev.off()

