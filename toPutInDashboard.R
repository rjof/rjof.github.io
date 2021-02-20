library(tidyverse)
library(tidycovid19)
library(zoo)
theCountry='Mexico'
# Compare Mexico against the world
merged <- download_merged_data(cached = TRUE, silent = TRUE)

## New cases
### The world
w1 = merged %>%
  select(date,confirmed) %>%
  group_by(date) %>%
  summarise(confirmed=sum(confirmed, na.rm = TRUE)) %>%
  mutate(
    new_cases = confirmed - lag(confirmed),
    ave_new_cases = rollmean(new_cases, 7, na.pad=TRUE, align="right"),
    region="World"
  ) %>%
  filter(!is.na(new_cases), !is.na(ave_new_cases))

### Mexico
m1 = merged %>%
  filter(iso3c == "MEX") %>%
  select(date,confirmed) %>%
  mutate(
    new_cases = confirmed - lag(confirmed),
    ave_new_cases = rollmean(new_cases, 7, na.pad=TRUE, align="right"),
    region="Mexico"
  ) %>%
  filter(!is.na(new_cases), !is.na(ave_new_cases))

a1 = merge(x = w1, y = m1, by = 'date', all.x = TRUE)
a1 = a1 %>% select(date, new_cases.x,new_cases.y,ave_new_cases.x,ave_new_cases.y)
#a1 = mutate_all(a1, ~if_else(is.na(.), 0, .))
a1$new_cases.x = a1$new_cases.x/(max(a1$new_cases.x, na.rm = T) - min(a1$new_cases.x, na.rm = T))
a1$new_cases.y = a1$new_cases.y/(max(a1$new_cases.y, na.rm = T) - min(a1$new_cases.y, na.rm = T))
a1$ave_new_cases.x = a1$ave_new_cases.x/(max(a1$ave_new_cases.x, na.rm = T) - min(a1$ave_new_cases.x, na.rm = T))
a1$ave_new_cases.y = a1$ave_new_cases.y/(max(a1$ave_new_cases.y, na.rm = T) - min(a1$ave_new_cases.y, na.rm = T))
thisColours = c("Mundo"="#f04546","Mexico"="blue")
ggplot(data = a1, aes(x = date)) +
  #geom_bar(aes(y = new_cases.x, fill = "Mundo"), stat = "identity") +
  geom_line(aes(y = ave_new_cases.x, colour="Mundo")) +
  #geom_bar(aes(y = new_cases.y, fill="Mexico"), stat = "identity") +
  geom_line(aes(y = ave_new_cases.y,colour ="Mexico")) +
  ggtitle("New cases") +
  scale_colour_manual(name="Region", values = thisColours) +
  #scale_fill_manual(name="Region",  values=alpha(thisColours,0.5)) + 
  theme_minimal() +
  theme(
    plot.caption = element_text(hjust = 0.5)
  ) +
  labs(caption = "En esta sobre nuevos casos solo importa la forma,
       \nestá normalizada.
       \nSon los nuevos casos del mundo contra los de México para ver
       \nqué tan en sincronía estamos con el mundo.")

## Daily deaths
### The world
w1 = merged %>%
  select(date,deaths) %>%
  group_by(date) %>%
  summarise(confirmed=sum(deaths, na.rm = TRUE)) %>%
  mutate(
    new_cases = confirmed - lag(confirmed),
    ave_new_cases = rollmean(new_cases, 7, na.pad=TRUE, align="right"),
    region="World"
  ) %>%
  filter(!is.na(new_cases), !is.na(ave_new_cases))

### Mexico
m1 = merged %>%
  filter(iso3c == "MEX") %>%
  select(date,deaths) %>%
  mutate(
    new_cases = deaths - lag(deaths),
    ave_new_cases = rollmean(new_cases, 7, na.pad=TRUE, align="right"),
    region="Mexico"
  ) %>%
  filter(!is.na(new_cases), !is.na(ave_new_cases))

a1 = merge(x = w1, y = m1, by = 'date', all.x = TRUE)
a1 = a1 %>% select(date, new_cases.x,new_cases.y,ave_new_cases.x,ave_new_cases.y)
#a1 = mutate_all(a1, ~if_else(is.na(.), 0, .))
a1$new_cases.x = a1$new_cases.x/(max(a1$new_cases.x, na.rm = T) - min(a1$new_cases.x, na.rm = T))
a1$new_cases.y = a1$new_cases.y/(max(a1$new_cases.y, na.rm = T) - min(a1$new_cases.y, na.rm = T))
a1$ave_new_cases.x = a1$ave_new_cases.x/(max(a1$ave_new_cases.x, na.rm = T) - min(a1$ave_new_cases.x, na.rm = T))
a1$ave_new_cases.y = a1$ave_new_cases.y/(max(a1$ave_new_cases.y, na.rm = T) - min(a1$ave_new_cases.y, na.rm = T))
thisColours = c("Mundo"="#f04546","Mexico"="blue")
ggplot(data = a1, aes(x = date)) +
  #geom_bar(aes(y = new_cases.x, fill = "Mundo"), stat = "identity") +
  geom_line(aes(y = ave_new_cases.x, colour="Mundo")) +
  #geom_bar(aes(y = new_cases.y, fill="Mexico"), stat = "identity") +
  geom_line(aes(y = ave_new_cases.y,colour ="Mexico")) +
  ggtitle(paste("Muertes en el mundo y en", theCountry)) +
  scale_colour_manual(name="Region", values = thisColours) +
  #scale_fill_manual(name="Region",  values=alpha(thisColours,0.5)) + 
  theme_minimal() +
  theme(
    plot.caption = element_text(hjust = 0.5)
  ) +
  labs(caption = "Son números normalizados para ver el parecido (o no)\n
       de las gráficas.")

## Daily recovers
### The world
w1 = merged %>%
  select(date,recovered) %>%
  group_by(date) %>%
  summarise(confirmed=sum(recovered, na.rm = TRUE)) %>%
  mutate(
    new_cases = confirmed - lag(confirmed),
    ave_new_cases = rollmean(new_cases, 7, na.pad=TRUE, align="right"),
    region="World"
  ) %>%
  filter(!is.na(new_cases), !is.na(ave_new_cases))

### Mexico
m1 = merged %>%
  filter(iso3c == "MEX") %>%
  select(date,recovered) %>%
  mutate(
    new_cases = recovered - lag(recovered),
    ave_new_cases = rollmean(new_cases, 7, na.pad=TRUE, align="right"),
    region="Mexico"
  ) %>%
  filter(!is.na(new_cases), !is.na(ave_new_cases))

a1 = merge(x = w1, y = m1, by = 'date', all.x = TRUE)
a1 = a1 %>% select(date, new_cases.x,new_cases.y,ave_new_cases.x,ave_new_cases.y)
#a1 = mutate_all(a1, ~if_else(is.na(.), 0, .))
a1$new_cases.x = a1$new_cases.x/(max(a1$new_cases.x, na.rm = T) - min(a1$new_cases.x, na.rm = T))
a1$new_cases.y = a1$new_cases.y/(max(a1$new_cases.y, na.rm = T) - min(a1$new_cases.y, na.rm = T))
a1$ave_new_cases.x = a1$ave_new_cases.x/(max(a1$ave_new_cases.x, na.rm = T) - min(a1$ave_new_cases.x, na.rm = T))
a1$ave_new_cases.y = a1$ave_new_cases.y/(max(a1$ave_new_cases.y, na.rm = T) - min(a1$ave_new_cases.y, na.rm = T))
thisColours = c("Mundo"="#f04546","Mexico"="blue")
ggplot(data = a1, aes(x = date)) +
  #geom_bar(aes(y = new_cases.x, fill = "Mundo"), stat = "identity") +
  geom_line(aes(y = ave_new_cases.x, colour="Mundo")) +
  #geom_bar(aes(y = new_cases.y, fill="Mexico"), stat = "identity") +
  geom_line(aes(y = ave_new_cases.y,colour ="Mexico")) +
  ggtitle(paste("Muertes en el mundo y en", theCountry)) +
  scale_colour_manual(name="Region", values = thisColours) +
  #scale_fill_manual(name="Region",  values=alpha(thisColours,0.5)) + 
  theme_minimal() +
  theme(
    plot.caption = element_text(hjust = 0.5)
  ) +
  labs(caption = "Son números normalizados para ver el parecido (o no)\n
       de las gráficas.")

#' Place of Mexico by population or pop_density by
#' confirmed, ecdc_cases
#' deaths, ecdc_deaths
#' recovered
#' total_tests
#' positive_rate
#' hosp_patients
#' icu_patients
#' total_vaccinations
#' soc_dist
#' mov_rest
#' pub_health
#' gov_soc_econ
#' lockdown
#' 
#' How to use this:
#' "apple_mtr_driving"      "apple_mtr_walking"     
#' [22] "apple_mtr_transit"      "gcmr_retail_recreation" "gcmr_grocery_pharmacy" 
#' [25] "gcmr_parks"             "gcmr_transit_stations"  "gcmr_workplaces"       
#' [28] "gcmr_residential"       "gtrends_score"          "gtrends_country_score" 
#' 
#' For each variable v1 get
#' i1 = v1 by date by country * 100000 / population
#' Show top 3, bottom 3, Mexico, 3 above Mexico, 3 below Mexico
#' and some distance indicator
