dat <- read.table("./data.csv", header=T ,sep=",",
                  colClasses="character")
dat$Date <- as.Date(paste(substr(dat$Date, 1, 8), "01", sep=""))
dat[,-1] <- sapply(dat[,-1], as.numeric)

pltdat <- subset(dat, Date > "2011-09-01" & Date < "2013-10-01")

sparkline <- function(date, series,
    lab, units="", dp=2,
    mincol="red", maxcol="green", curcol="blue")
{
    # date and series are the same length
    # date is date and series is numeric
    opar <- par(no.readonly=T)
    on.exit(opar)
    
    par(mar=c(0, 0, 1, 10) + 0.1, family="serif", xpd=T)

    series <- series[order(date)]
    date <- sort(date)

    maxval <- max(series, na.rm=T)
    maxdate <- max(date[!is.na(series) & series==max(series, na.rm=T)])
    minval <- min(series, na.rm=T)
    mindate <- max(date[!is.na(series) & series==min(series, na.rm=T)])
    curval <- tail(series, 1)
    curdate <- tail(date, 1)

    gridlines <- seq(as.Date(paste(substr(head(date, 1), 1, 4),
                                   "01", "01", sep="-")),
                     as.Date(paste(substr(tail(date, 1), 1, 4),
                                  "07", "01", sep="-")),
                     by="6 months")

    plot(x=date, y=series , type="n", axes=F, xlab="", ylab="")
    rect(par("usr")[1], grconvertY(0, "nfc"),
         par("usr")[2], grconvertY(1, "nfc"), col="#F0F0F0", border=F)
    abline(v=gridlines, lty="dotted", col="#999999")
    lines(x=date, y=series)
    points(x=maxdate, y=maxval, col=maxcol, pch=20)
    points(x=mindate, y=minval, col=mincol, pch=20)
    mtext(lab, 3, 0, adj=0, cex=0.5, font=2)
    mtext(units, 3, 0, adj=1, cex=0.4, col="#00000077")
    
    mtext(c(sprintf(paste("%.", dp, "f", sep=""), minval),
            strftime(mindate, "%b%y")),
          4, 1, col=mincol, at=grconvertY(c(0.7, 0.4), "nfc"),
          las=1, cex=0.5, font=c(2, 1))
    mtext(c(sprintf(paste("%.", dp, "f", sep=""), maxval),
            strftime(maxdate, "%b%y")),
          4, 4, col=maxcol, at=grconvertY(c(0.7, 0.4), "nfc"),
          las=1, cex=0.5, font=c(2, 1))
    mtext(sprintf( paste("%.", dp, "f", sep=""), curval),
          4, 7, col=curcol, at=grconvertY(0.7, "nfc"),
          las=1, cex=0.5, font=2)
}


####
## Start Plot
####
pdf("test_test.pdf", height=3.5, width=9)
layout(matrix(1:24, nrow=8, byrow=F))

# main title
par(mar=c(0, 0, 0, 0) + 0.1, family="serif")
plot(0, 0, type="n", axes=F)
mtext("Market Report", 3, -2, adj=0, cex=1.2)
mtext("November 2011 - October 2013", 3, -3, adj=0, cex=0.5)
mtext("MIN", 3, -3.7, adj=0, cex=0.5, col="#AA6611", font=2)
mtext("MAX", 3, -3.7, at=grconvertX(0.1, "nfc"),
      cex=0.5, col="#008877", font=2)
mtext("CURRENT", 3, -3.7, at=grconvertY(0.222, "nfc"),
      cex=0.5, col=1, font=2)

# Exhange rates
plot(0, 0, type="n", axes=F)
mtext("Exchange Rate", 1, -1, adj=0, cex=1)

sparkline(pltdat$Date, pltdat$TWI, "TWI",
          mincol="#AA6611", maxcol="#008877", curcol=1)
sparkline(pltdat$Date, pltdat$AUDUSD, "AUD/USD",
          mincol="#AA6611", maxcol="#008877", curcol=1)
sparkline(pltdat$Date, pltdat$AUDYEN, "AUD/YEN",
          mincol="#AA6611", maxcol="#008877", curcol=1)

# Crude
par(mar=c(0, 0, 0, 0) + 0.1)
plot(0, 0, type="n", axes=F)
mtext("Crude Oil", 1, -1, adj=0, cex=1)

sparkline(pltdat$Date, pltdat$Brent, "Brent", units="US$/bbl",
          mincol="#AA6611", maxcol="#008877", curcol=1)
sparkline(pltdat$Date, pltdat$Dubai, "Dubai", units="US$/bbl",
          mincol="#AA6611", maxcol="#008877", curcol=1)

# IR
par(mar=c(0, 0, 0, 0) + 0.1)
plot(0, 0, type="n", axes=F)
mtext("Interest Rates", 1, -1, adj=0, cex=1, family="serif")

sparkline(pltdat$Date, pltdat$BB90, "Aus. 90 day bank bill", units="%",
          mincol="#AA6611", maxcol="#008877", curcol=1)

# Coal
par(mar=c(0, 0, 0, 0) + 0.1)
plot(0, 0, type="n", axes=F)
mtext("Coal", 1, -1, adj=0, cex=1)

sparkline(pltdat$Date, pltdat$HenHub, "Thermal Coal, Newcastle", units="US$/t",
          mincol="#AA6611", maxcol="#008877", curcol=1)

# Gas
par(mar=c(0, 0, 0, 0) + 0.1)
plot(0, 0, type="n", axes=F)
mtext("Natural Gas", 1, -1, adj=0, cex=1)

sparkline(pltdat$Date, pltdat$HenHub, "Henry Hub", units="US$/mbtu",
          mincol="#AA6611", maxcol="#008877", curcol=1)

# Iron Ore
par(mar=c(0, 0, 0, 0) + 0.1)
plot(0, 0, type="n", axes=F)
mtext("Iron Ore", 1, -1, adj=0, cex=1)

sparkline(pltdat$Date, pltdat$FeOreChina, "62% Fe, cfr China", units="US$/t",
          mincol="#AA6611", maxcol="#008877", curcol=1)

# Metals
par(mar=c(0, 0, 0, 0) + 0.1)
plot(0, 0, type="n", axes=F)
mtext("Metals", 1, -1, adj=0, cex=1)

sparkline(pltdat$Date, pltdat$AuLonPM, "Gold, London Fix PM", units="US$/oz",
          mincol="#AA6611", maxcol="#008877", curcol=1)
sparkline(pltdat$Date, pltdat$AgLon, "Silver, London Fix", units="US$/oz",
          mincol="#AA6611", maxcol="#008877", curcol=1)
sparkline(pltdat$Date, pltdat$Cu, "Copper, Grade A", units="US$/t",
          mincol="#AA6611", maxcol="#008877", curcol=1)
sparkline(pltdat$Date, pltdat$Pb, "Lead, Standard", units="US$/t",
          mincol="#AA6611", maxcol="#008877", curcol=1)
sparkline(pltdat$Date, pltdat$Al, "Aluminum, PHG", units="US$/t",
          mincol="#AA6611", maxcol="#008877", curcol=1)
sparkline(pltdat$Date, pltdat$Ni, "Nickel", units="US$/t",
          mincol="#AA6611", maxcol="#008877", curcol=1)
sparkline(pltdat$Date, pltdat$Zn, "Zinc, SHG", units="US$/t",
          mincol="#AA6611", maxcol="#008877", curcol=1)
dev.off()

# test
# ate <- pltdat$Date
# eries <- pltdat$BB90
# ab <- "90d Bank Bill"
# incol="#AA6611"; maxcol="#008877"; curcol=1
# parkline(date, series, lab)
