## Script to matchup fips with region
## Note: noncensus also has divisions which are 
library(noncensus)
library(plyr)
data(states)
data(counties)

state_n_fips <- counties %>% 
  tbl_df %>% 
  select(state, state_fips,county_fips)  

fips_regions <- states %>% 
  tbl_df %>% 
  join(state_n_fips, by = "state") %>% 
  mutate(fips = paste(state_fips, county_fips, sep="")) %>% 
  select(fips, state, region) %>% 
  arrange(fips)


## Be good to the Environment
rm(state_n_fips)
rm(states)
rm(counties)


