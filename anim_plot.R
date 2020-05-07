#set your work directory
setwd("./Desktop/b/r_scripts")

#importing the needed libraries
library(tidyverse)
library(gganimate)

#import the needed data
cov_ranked <- read_csv("clean_data/april_all.csv")

#ormat the data
cov_ranked <- cov_tidy %>%
  group_by(Day) %>%
  mutate(rank = rank(-confirmedCases),
         confirmedCases_lbl = paste0(" ",confirmedCases)) %>%
  group_by(states) %>% 
  filter(rank <=10) %>%
  ungroup()

#creating the plot and animation
anim <- ggplot(cov_ranked, aes(rank, group = states, 
                                  fill = as.factor(states), color = as.factor(states))) +
  geom_tile(aes(y = confirmedCases/2,
                height = confirmedCases,
                width = 0.9), alpha = 0.8, color = NA) +
  geom_text(aes(y = 0, label = paste(states, " ")), vjust = 0.2, hjust = 1.) +
  geom_text(aes(y=confirmedCases, label = confirmedCases_lbl, hjust=0)) +
  coord_flip(clip = "off", expand = FALSE) +
  scale_y_continuous(labels = scales::comma) +
  scale_x_reverse() +
  guides(color = FALSE, fill = FALSE) +
  theme(axis.line=element_blank(),
        axis.text.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        legend.position="none",
        panel.background=element_blank(),
        panel.border=element_blank(),
        panel.grid.major=element_blank(),
        panel.grid.minor=element_blank(),
        panel.grid.major.x = element_line( size=.1, color="grey" ),
        panel.grid.minor.x = element_line( size=.1, color="grey" ),
        plot.title=element_text(size=18, hjust=0.5, face="bold", colour="grey", vjust=1),
        plot.subtitle=element_text(size=12, hjust=1.0, vjust=-0.5, face="bold", color="black"),
        plot.caption =element_text(size=10, hjust=0.5, color="black"),
        plot.background=element_blank(),
        plot.margin = margin(2,2, 2, 4, "cm")) +
  transition_states(Day, transition_length = 7, state_length = 1) +
  view_follow(fixed_x = TRUE)  +
  labs(title = "Confirmed COVID-19 Cases as at April {closest_state} 2020",  
       subtitle  =  "Top 10 States",
       caption  = "Source : covid19.ncdc.gov.ng") 

anim

#saving the animation as a gif image
animate(anim, 200, fps = 8,  width = 600, height = 600, 
        renderer = gifski_renderer("animatedPlot.gif")) 
