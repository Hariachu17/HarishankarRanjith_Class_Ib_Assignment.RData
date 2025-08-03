# Subdirectories

dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")
dir.create("plots")

# Import csv file

data <- read.csv(file.choose())
View(data)
str(data)

# Data types with inappropriate data type - gender, diagnosis and smoker

# Converting variables to appropriate data type

data$gender_fac <- as.factor(data$gender)
str(data)
levels(data$gender_fac)

data$diagnosis_fac <- as.factor(data$diagnosis)
str(data)

data$smoker_fac <- as.factor(data$smoker)
str(data)

# New variable for smoking status as a binary factor
# Convert factor into binary

data$smoker_binary <- ifelse(data$smoker_fac == "Yes", 1, 0)
str(data)

# To get a cleaned data file

data_cleaned <- data[ , !(names(data)%in% c("gender", "diagnosis", "smoker", "gender_log", "gender_binary"))]
write.csv(data_cleaned, file = "clean_data/patient_info_clean.csv")

# Save r script

























