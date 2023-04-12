#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))

titanic_data <- as.data.frame(Titanic)

#See the top rows of the data
#TASK: Write the function to see the top rows of the data

head(titanic_data)

#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr

install.packages("dplyr") #installing dplyr package
library(dplyr) #calling dplyr package

#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)

titanic_data_select <- select(titanic_data, Survived, Sex)

#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name

titanic_data_newname <- titanic_data_select

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)

titanic_data_nosex <- select(titanic_data_newname, -Sex)

#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'

titanic_data_rename <- rename(titanic_data_nosex, Gender = Sex)

#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column

titanic_data_gender <- titanic_data_rename

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'

male_data <- filter(titanic_data_gender, Gender == "male")




#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())

arranged_data <- arrange(titanic_data_gender, Gender)

#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
#TASK: After you run it, write the total here:____

sum(titanic_data$Freq) #the sum of the Freq column is 2201

#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'

female_data <- filter(titanic_data_gender, Gender == "female")

#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')

all_data <- bind_rows(male_data, female_data)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package

data_summary <- titanic_data %>% group_by(Sex) %>% summarize(mean_age = mean(Age))


