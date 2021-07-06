
## extract data to work with -- m = moralization, e = meat emotions ##
working.data2 <- data.cv[,c(1:12)]
names(working.data2) <- c('m1', 'm2', 'm3', 'm4', 'e1', 'e2', 'e3', 'e4')

names(working.data2)


cross2.second <- '
m2 ~ m1 + b1*e1
m3 ~ m2 + b2*e2 + m1
m4 ~ m3 + b3*e3 + m2

e2 ~ e1 + b4*m1
e3 ~ e2 + b5*m2 + e1
e4 ~ e3 + b6*m3 + e2

m1 ~~ e1
m2 ~~ e2
m3 ~~ e3
m4 ~~ e4

bb14 := b1-b4
bb25 := b2-b5
bb36 := b3-b6'

cross.second.fit2 <- lavaan(cross2.second, data = working.data2, auto.var = TRUE, fixed.x=FALSE) ## run model
summary(cross.second.fit2, standardized = TRUE, fit.measures = TRUE) ## examine model

