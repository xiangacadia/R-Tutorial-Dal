# 1. Read file with read.fwf
#
#    File can be found here: http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for
#
#    read.fwf() reads a table of fixed width formatted data into data.frame
#
#    [paremeters]
#
#    width:
#    - integer vector, giving the widths of the fixed-width fields (of one line), 
#      or list of integer vectors giving widths for multiline records.
#    - negative length means to ignore these characters
#
#    skip:
#    - number of initial lines to skip
data = read.fwf("./getdata-wksst8110.for", widths=c(10,-5,4,4,-5,4,4,-5,4,4,-5,4,4),skip=4)

# 2. Invoke a spreedsheet-style data viewer 
View(data)

