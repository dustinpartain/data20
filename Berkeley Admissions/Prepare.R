#
# Prepare Berkeley admissions dataset
# 
# Data source: Included with R
# Data: Admissions data for UC Berkeley's six largest departments in 1973
#

# Use the vcdExtra and openxlsx packages
# To install: install.packages(c('vcdExtra', 'openxlsx'))
library(dplyr)
library(magrittr)
library(vcdExtra)
library(openxlsx)

rm(list = ls(all = TRUE))

# Change to the appropriate directory
setwd('~/Documents/Courses/MBA 6273 Data Analysis Design/Datasets/Berkeley Admissions')

# The dataset UCBAdmissions comes with R
# Convert it from a frequency table to individual observations
data(UCBAdmissions)
dat <- expand.table(UCBAdmissions, freq = 'Freq')

# Rename variables
names(dat) <- c('Admitted', 'Gender', 'Department')

# Convert 'Admitted' and 'Rejected' to 'Yes' and 'No'
recode(dat$Admitted, Admitted = 'Yes', Rejected = 'No')

# Shuffle the rows to reflect real-world data
dat <- dat[sample(nrow(dat)),]

# Write to csv
write_csv(dat, 'Berkeley Admissions.csv')

# Build an Excel workbook for output
wb <- createWorkbook()
addWorksheet(wb, 'Output')
writeData(wb, sheet = 1, dat, rowNames = FALSE)

# The openxlsx package does not apply styles to arbitrary ranges, so we use a
# for loop to center the columns individually
for(i in 1:ncol(dat)) {
  addStyle(wb, sheet = 1, createStyle(halign = 'center'),
           rows = 1:(nrow(dat) + 1), cols = i)
}

# Use bold text for the header row
addStyle(wb, sheet = 1, createStyle(halign = 'center', textDecoration = 'bold'),
         rows = 1, cols = 1:ncol(dat))
  
# Make the columns slightly wider than default
setColWidths(wb, sheet = 1, widths = 14, cols = 1:ncol(dat))

saveWorkbook(wb, 'Berkeley Admissions.xlsx', overwrite = TRUE)
