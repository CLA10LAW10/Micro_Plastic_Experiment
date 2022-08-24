#[Workspace loaded from C:/Users/Clayton/My Drive/Haley HEART/RStudio/ContactAngle/.RData]

library(readxl)
PETA <- read_excel("ContactAngle.xlsx", sheet = "PET A", 
                   col_types = c("skip", "skip", "skip", 
                                 "text", "skip", "skip", "skip", "text", 
                                 "skip", "skip", "skip"))

PETA0 <- PETA[(1:59), c(2)]
PETA0 <- na.omit(PETA0)
PETA0<-PETA0[!(PETA0=="Mean")]
PETA0 <- as.numeric(PETA0)

PETA60 <- PETA[(202:237), c(2)]
PETA60 <- na.omit(PETA60)
PETA60<-PETA60[!(PETA60=="Mean")]
PETA60 <- as.numeric(PETA60)

library(readxl)
PETB <- read_excel("ContactAngle.xlsx", sheet = "PET B", 
                   col_types = c("skip", "skip", "skip", 
                                 "text", "skip", "skip", "skip", "text", 
                                 "skip", "skip", "skip"))

PETB0 <- PETB[(1:100), c(2)]
PETB0 <- na.omit(PETB0)
PETB0<-PETB0[!(PETB0=="Mean")]
PETB0 <- as.numeric(PETB0)

PETB60 <- PETB[(307:437), c(2)]
PETB60 <- na.omit(PETB60)
PETB60<-PETB60[!(PETB60=="Mean")]
PETB60 <- as.numeric(PETB60)

library(readxl)
PETC <- read_excel("ContactAngle.xlsx", sheet = "PET C", 
                   col_types = c("skip", "skip", "skip", 
                                 "text", "skip", "skip", "skip", "text", 
                                 "skip", "skip"))
 
PETC0 <- PETC[(1:100), c(2)]
PETC0 <- na.omit(PETC0)
PETC0<-PETC0[!(PETC0=="Mean")]
PETC0 <- as.numeric(PETC0)

PETC60 <- PETC[(308:427), c(2)]
PETC60 <- na.omit(PETC60)
PETC60<-PETC60[!(PETC60=="Mean")]
PETC60 <- as.numeric(PETC60)

ALL_PET_0 <- c(PETA0,PETB0,PETC0)
ALL_PET_60 <- c(PETA60,PETB60,PETC60)

par(mar=c(5,6,4,1)+.1)
boxplot(ALL_PET_0, ALL_PET_60,
        main = "Contact Angle",
        at = c(1,2),
        names = c("0 Minutes", "60 Minutes"),
        las = 2,
        col = c("goldenrod3","darkolivegreen2"),
        border = "black",
        horizontal = TRUE
        )
