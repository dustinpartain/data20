#
# Box plots of football stadium seating capacities.
#
# Nate Craig
#

library(tidyverse)
library(scales)


# Load data --------------------------------------------------------------------

dat <- read.csv('Stadium Seats.csv') %>%
  filter(Classification != 'Other')

# Plot -------------------------------------------------------------------------

gg <- ggplot(dat, aes(x = Conference, y = Capacity,
                      color = Classification, fill = Classification))

gg <- gg + geom_boxplot(width = 0.6, outlier.size = 1,
                        outlier.colour = '#000000', outlier.shape = 0)

gg <- gg + stat_summary(geom = 'crossbar', color = 'white',
                        fun.data = function(x) {return(c(y = median(x), 
                                                         ymin = median(x), 
                                                         ymax = median(x)))})

gg <- gg + scale_y_continuous(limits = c(0, 125000),
                              breaks = seq(0, 125000, 25000), labels = comma)  

gg <- gg + scale_colour_manual(values = colorPalette)
gg <- gg + scale_fill_manual(values = colorPalette)

gg <- gg + facet_grid(. ~ Classification, scale = 'free_x',
                      space = 'free_x', drop = TRUE)

gg <- gg + ylab('Stadium Seating Capacity') + xlab('League')

m <- margin(t = 1, r = 1, b = .15, l = .15, unit = 'lines')  # Axis title margin

gg <- gg + theme_minimal(base_size = 24)
gg <- gg + theme(axis.text.x = element_text(angle = 45),
                 axis.title.x = element_text(margin = m),
                 axis.title.y = element_text(margin = m),
                 axis.ticks.x = element_blank(),
                 panel.spacing = unit(2, 'lines'),               
                 panel.grid.major.x = element_blank(),
                 panel.grid.minor = element_blank(),
                 legend.position = 'none')                      

ggsave(gg, file = 'Stadium Seating Capacity.pdf', width = 12, height = 8)
