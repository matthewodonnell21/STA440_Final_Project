library(ChineseNames)
library(tidyverse)


data(givenname)


compute_name_index(name="包寒吴霜", birth=1996)

decade_gender = rep(0, times=6)


decade_gender[1] = sum(givenname$ppm.1930_1959 * abs(givenname$name.gender)) / sum(givenname$ppm.1930_1959)

decade_gender[2] = sum(givenname$ppm.1960_1969 * abs(givenname$name.gender)) / sum(givenname$ppm.1960_1969)

decade_gender[3] = sum(givenname$ppm.1970_1979 * abs(givenname$name.gender)) / sum(givenname$ppm.1970_1979)

decade_gender[4] = sum(givenname$ppm.1980_1989 * abs(givenname$name.gender)) / sum(givenname$ppm.1980_1989)

decade_gender[5] = sum(givenname$ppm.1990_1999 * abs(givenname$name.gender)) / sum(givenname$ppm.1990_1999)

decade_gender[6] = sum(givenname$ppm.2000_2008 * abs(givenname$name.gender)) / sum(givenname$ppm.2000_2008)



chart = data.frame(period = 1:6, gender = decade_gender)


ggplot(chart, aes(x=period, y=gender)) + 
  geom_point() +
  geom_smooth(method="lm") + 
  geom_smooth(color="red")


write_csv(givenname, "data/givenname.csv")
