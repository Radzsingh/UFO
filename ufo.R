# Class Test 1

# Question 1
# Read csv data by removing empty spaces
ufo_data = read.csv("ufo.csv", na= "")

# Ques 2
#strcutre of ufo_data
str(ufo_data)

# displaying first 15 rows of ufo_data
head(ufo_data, 15)

#count number of rows in ufo_data
nrow(ufo_data)

# Ques 3
# Convert date to a date variable
# It is currently in mm/dd/yyyy
converted_datetime <- as.Date(ufo_data$datetime, "%m/%d/%Y")

# Ques 4
# update dataframe with converted date 
ufo_data$datetime <- converted_datetime
ufo_data$date.posted <- as.Date(ufo_data$date.posted, "%m/%d/%Y")
# print schema of the dataframe with datetime as date type
str(ufo_data)

# Ques 5
# changing the names of the column with index 6,7 and 9
names(ufo_data)
names(ufo_data)[6:9] <- c('DurationSeconds', 'DurationHrsMins', 'comments', 'DatePosted')
names(ufo_data)

# Ques 6
#convert the latitude datatype into numeric
ufo_data$latitude <- as.numeric(ufo_data$latitude) 
str(ufo_data)

# Ques 7 
# display all the missing variables
library(mice)
# saving plot as png file
png('missingvars.png')
md.pattern(ufo_data)
dev.off()

# number of rows with complete data content
sum(complete.cases(ufo_data))

# number of rows with missing values
colSums(is.na(ufo_data))

# Ques 8
# sort and subset the dataframe without logic
attach(ufo_data)
sorted_ufo_data <- ufo_data[order(shape, city),]
sorted_ufo_data  <- sorted_ufo_data[,c('datetime', 'city', "country", "shape")]
detach(ufo_data)

# Ques 9
# subset records of great britain with disk shaped spotting of ufo
attach(sorted_ufo_data)
ufo_gb_disk <- subset(sorted_ufo_data, country == "gb" & shape == "disk" )

# Ques 10
# write dataframes in csv files
write.csv(ufo_data, file = "modified_ufo.csv")
write.csv(ufo_gb_disk, file = "ufo_gb.csv")
write.csv(sorted_ufo_data, file = "sorted_ufo.csv")


