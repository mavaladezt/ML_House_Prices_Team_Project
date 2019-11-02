library(readr)
library(dplyr)
library(ggplot2)

train <- read.csv("train.csv", 
                  colClasses = c('numeric','numeric','factor','character','numeric','factor','factor','factor',
                                 'factor','factor','factor','factor','factor','factor','factor','factor','factor',
                                 'numeric','numeric','numeric','numeric','factor','factor','factor','factor',
                                 'factor','numeric','factor','factor','factor','factor','factor','factor',
                                 'factor','numeric','factor','numeric','numeric','numeric','factor','factor',
                                 'factor','factor','numeric','numeric','numeric','numeric','numeric','numeric',
                                 'numeric','numeric','numeric','numeric','factor','numeric','factor','numeric',
                                 'factor','factor','numeric','factor','numeric','numeric','factor','factor',
                                 'factor','numeric','numeric','numeric','numeric','numeric','numeric','factor',
                                 'factor','factor','numeric','numeric','numeric','factor','factor','numeric')
                    )

sapply(train,class)
colnames(train)

#MSSubClass ####===============================================================================
#Building Class
boxplot(SalePrice~MSSubClass,data=train,
        main="MSSubClass vs Sale Price",xlab="MSSubClass",ylab="Sale Price",col="orange",border="brown")
#It looks like only class 60 might be relevant for determining price
#maybe group some categories together that have low variability such as 45/85/160/190
#maybe make 2-3 different groups out of this column

#MSSubClass ####===============================================================================
g <- ggplot(data = train, aes(x = reorder(MSZoning, SalePrice), y = SalePrice))
g + geom_boxplot()
#It looks like sales price can be affected by this variable but still there are 2 categories (C and RL) with a lot
# of variability

#LotFrontage ####===============================================================================
#Linear feet of street connected to property
plot(train$LotFrontage,train$SalePrice)
#maybe create ranges of lots such as from 0-25, 25-50, 50-75, etc?

#LotArea ####===============================================================================
#LotArea: Lot size in square feet
plot(train$LotArea,train$SalePrice)
#removing a lot of outlier it looks that it has a big strong linear relationship with sales price

#Street ####===============================================================================
#Street: Type of road access
boxplot(SalePrice~Street,data=train,
        main="Street vs Sale Price",xlab="Street",ylab="Sale Price",col="orange",border="brown")
#it looks like pavement has a better price but certainly has way more variation and outliers

#Alley ####===============================================================================
#Alley: Type of alley access
boxplot(SalePrice~Alley,data=train,
        main="Alley vs Sale Price",xlab="Alley",ylab="Sale Price",col="orange",border="brown")
#it this variable can help a little bit determine the value of the house


#LotShape ####===============================================================================
#LotShape: General shape of property
g <- ggplot(data = train, aes(x = reorder(LotShape, SalePrice), y = SalePrice))
g + geom_boxplot()
#Have different values but doesn't looks like it moves the needle a lot because of the outliers in the data

#LandCountour ####===============================================================================
#LandContour: Flatness of the property
g <- ggplot(data = train, aes(x = reorder(LandContour, SalePrice), y = SalePrice))
g + geom_boxplot()
#Can help. only one has too much variability, the rest seem under control

#Utilities ####===============================================================================
#Utilities: Type of utilities available
g <- ggplot(data = train, aes(x = reorder(Utilities, SalePrice), y = SalePrice))
g + geom_boxplot()
#It might help predict only a few cases

#LotConfig ####===============================================================================
#LotConfig: Lot configuration
g <- ggplot(data = train, aes(x = reorder(LotConfig, SalePrice), y = SalePrice))
g + geom_boxplot()
#Most of their averages seem like the same

#LandSlope ####===============================================================================
#LandSlope: Slope of property
g <- ggplot(data = train, aes(x = reorder(LandSlope, SalePrice), y = SalePrice))
g + geom_boxplot()
#Doesn't look like it provides a lot of information


