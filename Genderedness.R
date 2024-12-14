library(tidyverse)

names = read_csv("data/givenname.csv")

names_pivoted = pivot_longer(data=names, cols = starts_with("ppm"), 
                             names_to = "time_period", 
                             values_to = "period_weights")
  
names_pivoted = names_pivoted %>% mutate(abs_gender = abs(name.gender))

genderedness = lm(abs_gender ~ time_period, weights = names_pivoted$period_weights, data = names_pivoted)

summary(genderedness)

anova(genderedness)


decade_gender = rep(0, times=6)

decade_gender[1] = sum(names$ppm.1930_1959 * abs(names$name.gender)) / sum(names$ppm.1930_1959)

decade_gender[2] = sum(names$ppm.1960_1969 * abs(names$name.gender)) / sum(names$ppm.1960_1969)

decade_gender[3] = sum(names$ppm.1970_1979 * abs(names$name.gender)) / sum(names$ppm.1970_1979)

decade_gender[4] = sum(names$ppm.1980_1989 * abs(names$name.gender)) / sum(names$ppm.1980_1989)

decade_gender[5] = sum(names$ppm.1990_1999 * abs(names$name.gender)) / sum(names$ppm.1990_1999)

decade_gender[6] = sum(names$ppm.2000_2008 * abs(names$name.gender)) / sum(names$ppm.2000_2008)



plot_data = data.frame(period = 1:6, gender = decade_gender)


plot = ggplot(plot_data, aes(x = period, y = gender)) + 
  geom_point() +
  geom_smooth(method = "lm", aes(color = "Linear Model")) +  
  geom_smooth(aes(color = "Smoothed Trend")) +              
  ggtitle("Changes in Gender-Specific Name Usage Over Time", 
          subtitle = "Weighted Average by Parts-per-Million") + 
  xlab("Birthing Cohort") +                               
  ylab("Avg. Gender Specificity") +                       
  scale_color_manual(name = "Trend Lines",        
                     values = c("Linear Model" = "blue", 
                                "Smoothed Trend" = "red"))


plot

