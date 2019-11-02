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

