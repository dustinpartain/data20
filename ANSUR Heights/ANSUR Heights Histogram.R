#
# Create a histogram of height data from the 1988 Army Anthropometric Survey.
#
# Data: http://mreed.umtri.umich.edu/mreed/downloads.html
#
# Nate Craig
#

data_dir <- '~/Documents/Courses/MBA 6273 Design/Datasets/ANSUR Heights'

library(tidyverse)
library(RColorBrewer)


# Load data --------------------------------------------------------------------

setwd(data_dir)

female <- read.delim('ansur_women.txt', check.names = FALSE)
male <- read.delim('ansur_men.txt', check.names = FALSE)

# There are more females than males (2,208 vs 1,774), in the original data. 
# Sample the females to avoid a potentially confusing visualization.
female <- sample_n(female, nrow(male))

# Combine the female and male data.
dat <- rbind(female, male) %>%
  mutate(height = STATURE * 0.0393701,  # Convert millimeters to inches.
         sex = ifelse(GENDER == 1, 'Male', 'Female')) %>%
  select(height, sex)

# Output data  
write.csv(dat, file = 'ANSUR Heights.csv')

# Plot genders combined --------------------------------------------------------

m <- margin(t = 1, r = 1, b = .15, l = .15, unit = 'lines')  # Axis title margin

gg <- ggplot(dat, aes(x = height))

# Setting fill and border color improves appearance in some PDF viewers.
gg <- gg + geom_histogram(fill = 'grey50', color = 'grey50')

gg <- gg + xlab('Height (Inches)') + ylab('Count')

gg <- gg + theme_bw(base_size = 18)
gg <- gg + theme(axis.title.x = element_text(margin = m),
                 axis.title.y = element_text(margin = m),
                 axis.ticks = element_blank(),
                 panel.border = element_blank(),
                 panel.grid.minor = element_blank())

ggsave('ANSUR Heights.pdf', gg, width = 8, height = 5)


# Plot genders separately ------------------------------------------------------

# Add spaces for padding in legend.
padvals <- head(sort(unique(dat$sex)), -1)
dat <- dat %>%
  mutate(sex = ifelse(sex %in% padvals,
                      paste0('  ', sex, strrep(' ', 12)),
                      paste0('  ', sex)))

gg <- ggplot(dat, aes(x = height, fill = sex))
gg <- gg + geom_histogram(position = 'identity', alpha = 0.7)

gg <- gg + scale_fill_brewer(palette = 'Set1')

gg <- gg + xlab('Height (Inches)') + ylab('Count')

gg <- gg + theme_bw(base_size = 18)
gg <- gg + theme(axis.title.x = element_text(margin = m),
                 axis.title.y = element_text(margin = m),
                 axis.ticks = element_blank(),
                 panel.border = element_blank(),
                 panel.grid.minor = element_blank(),
                 legend.position = 'bottom')

gg <- gg + guides(fill = guide_legend(title = NULL, direction = 'horizontal',
                                      keywidth = unit(2.5, 'lines'),
                                      keyheight = unit(1, 'lines')))

ggsave('ANSUR Heights by Gender.pdf', gg, width = 8, height = 5)
