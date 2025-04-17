## created 2025-02-12 by eucarida
## LAST UPDATED: 2025-04-17 by eucarida
## This is project exists to merge statistics with TMNF wr in comparison with 
## tas runs and other runs

# clear memory
rm(list = ls())


#load libraries
library(performance)
library(tidyverse)

# load wr for A01 ####
## IMPORTANT: to load the data from the run/race the .gbx file needs to be
## converted into a .csv (comma delimited). To do this the the online tool
## "https://io.gbx.tools/extract-inputs-tmi" convert .gbx > .txt
## Then open the .txt in Excel using space delimited seperation
## In Excel heders are placed and the removal of start and finish data is
## done. Then the file is saved as a comma delimited .csv file
## tidy shit is to ensue

df_edd_raw <- read_csv2("A01-Race_eddieman194.csv")

# make df_edd_raw tidy ####
## TO DO ##
  # seperate value into stering value and accelerate/breake [done]
  # remove "press" and "rel"from INPUT [not done]
  # create up and down coloums with binary value
  # fill in missing information [not done]

print.data.frame(df_edd_raw)

# 
# df_edd_raw %>% 
#   mutate(GAS = VALUE) %>% 
#  #group_by(c(INPUT,TIME)) %>% 
#   filter(GAS == c("up", "down"))
# 

# pivot data to a more tidy format
df_edd_tidy <- df_edd_raw %>%
  pivot_wider(names_from = "INPUT",
              values_from = "VALUE") 

df_edd_tidy <- df_edd_tidy%>% 
  pivot_wider(names_from = "press",
              values_from = "press")

# relpace NA with values that are better sutied 

# replace NA in steer with 0 as it is a result of a non counted input
df_edd_tidy %>% 
  replace_na(list(steer = 0))


