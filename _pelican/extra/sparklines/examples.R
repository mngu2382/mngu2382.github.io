## layout examples

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

# Layout with varying sizes, can similarly adjust the height
layout(matrix(1:4, nrow=2, byrow=T), width=c(2, 1))
for (i in 1:4) {
    plot(1, type="n", axes=F, xlab="", ylab="")
    text(1, 1, i)
    box()
}

# layout with merged cells
layout(matrix(c(1, 2, 2,
                1, 3, 4), nrow=2, byrow=T), width=c(2, 1))
for (i in 1:4) {
    plot(1, type="n", axes=F, xlab="", ylab="")
    text(1, 1, i)
    box()
}

# Market report layout
layout(matrix(1:24, nrow=8, byrow=F))
par(mar=c(0.1, 0.1, 0.1, 0.1))
for (i in 1:24) {
    plot(1, type="n", axes=F, xlab="", ylab="")
    text(1, 1, i)
    box()
}

par(opar)


## Graphics Coordinate Systems
par(oma=c(3, 0, 0, 0), mar=c(4, 3, 3, 1) + 0.1, cex=0.8)
plot(1:10, type="n", xlab="", ylab="")
box("plot", lty=1)
box("figure", lty=2)
box("outer", lty=3)
mtext(c("Device/Outer", "Figure/Inner", "Plot"),
      1, line=c(6.1, 3.1, -1), cex=0.8)

# centre of data
points(5, 5, pch=19)
text(5, 5, "user: (5, 5)", pos=4)

# centre of plot area
points(grconvertX(0.5, "npc"), grconvertY(0.5, "npc"), col=2, pch=19)
text(grconvertX(0.5, "npc"), grconvertY(0.5, "npc"),
     "npc: (0.5, 0.5)", pos=4, col=2)

# centre of figure area
points(grconvertX(0.5, "nfc"), grconvertY(0.5, "nfc"), col=3, pch=19)
text(grconvertX(0.5, "nfc"), grconvertY(0.5, "nfc"),
     "nfc: (0.5, 0.5)", pos=2, col=3)

# centre of outer/device area
points(grconvertX(0.5, "ndc"), grconvertY(0.5, "ndc"), col=4, pch=19)
text(grconvertX(0.5, "ndc"), grconvertY(0.5, "ndc"),
     "ndc: (0.5, 0.5)", pos=2, col=4)
