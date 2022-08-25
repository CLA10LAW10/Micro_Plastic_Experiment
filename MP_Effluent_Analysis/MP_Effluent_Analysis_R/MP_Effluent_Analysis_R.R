#Microplastic Effluent Analysis in R Studio
#Clayton Lawton

#Import Data from Excel File
library(readxl)
MP_Effluent_Analysis_R <- read_excel("MP_Effluent_Analysis_R.xlsx", 
                                     sheet = "Calculated Data", col_types = c("skip", 
                                                                              "skip", "skip", "skip", "skip", "skip", 
                                                                              "skip", "numeric", "numeric", "skip"))
#Divide into Zero value and Sixty value
ZERO <- MP_Effluent_Analysis_R[(1:23), c(1)]
SIXTY <- MP_Effluent_Analysis_R[(1:24), c(2)]

#Resize the plot to allow for the full name
par(mar=c(5,6,4,1)+.1)

#Making the Boxplot
boxplot(c(ZERO, SIXTY),
        main = "Microplastic Effluent Analysis",
        at = c(1,2),
        names = c("0 Minutes", "60 Minutes"),
        las = 2,
        col = c("goldenrod3","darkolivegreen2"),
        border = "black",
        horizontal = TRUE
)