hw <-read.csv("hw1_data.csv",TRUE, ",")

names(hw)

head(hw,2) 
hw[c(1,2),]

nrow(hw)

tail(hw,2)

hw[c(47),]

sub = subset(hw, is.na(Ozone))
nrow(sub)

lad = subset(hw, !is.na(Ozone), select = Ozone)
apply(lad, 2, mean)

sad = subset(hw, Ozone >31 & Temp > 90, select = Solar.R )
apply(sad, 2, mean)

cat = subset(hw, Month ==6 , select = Temp )
apply(cat, 2, mean)

latte = subset(hw, Month == 5 & !is.na(Ozone), select = Ozone)
apply(latte, 2, max)
