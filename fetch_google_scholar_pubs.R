
library(vitae)
library(tidyverse)
library(rio)
library(lubridate)
library(rorcid)
library(glue)
library(scholar)


# Retreiving citations from google scholar
pubs <- get_publications("lIYgwaYAAAAJ")

# Getting complete author list
pubs$author <- unlist(lapply(pubs$pubid, function(x){
  get_complete_authors("lIYgwaYAAAAJ", x)
}))

pubs <- pubs %>% 
  filter(!is.na(year))


export(pubs, file = "data/publications_google_scholar.csv")

