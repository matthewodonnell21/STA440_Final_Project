library(tidyverse)

names = read_csv("data/givenname.csv")

# valence models
summary(lm(name.valence ~ name.gender, weights = names$ppm.1930_1959, data = names))
summary(lm(name.valence ~ name.gender, weights = names$ppm.1960_1969, data = names))
summary(lm(name.valence ~ name.gender, weights = names$ppm.1970_1979, data = names))
summary(lm(name.valence ~ name.gender, weights = names$ppm.1980_1989, data = names))
summary(lm(name.valence ~ name.gender, weights = names$ppm.1990_1999, data = names))
summary(lm(name.valence ~ name.gender, weights = names$ppm.2000_2008, data = names))

# warmth models
summary(lm(name.warmth ~ name.gender, weights = names$ppm.1930_1959, data = names))
summary(lm(name.warmth ~ name.gender, weights = names$ppm.1960_1969, data = names))
summary(lm(name.warmth ~ name.gender, weights = names$ppm.1970_1979, data = names))
summary(lm(name.warmth ~ name.gender, weights = names$ppm.1980_1989, data = names))
summary(lm(name.warmth ~ name.gender, weights = names$ppm.1990_1999, data = names))
summary(lm(name.warmth ~ name.gender, weights = names$ppm.2000_2008, data = names))

# competence models
summary(lm(name.competence ~ name.gender, weights = names$ppm.1930_1959, data = names))
summary(lm(name.competence ~ name.gender, weights = names$ppm.1960_1969, data = names))
summary(lm(name.competence ~ name.gender, weights = names$ppm.1970_1979, data = names))
summary(lm(name.competence ~ name.gender, weights = names$ppm.1980_1989, data = names))
summary(lm(name.competence ~ name.gender, weights = names$ppm.1990_1999, data = names))
summary(lm(name.competence ~ name.gender, weights = names$ppm.2000_2008, data = names))