## layout

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

