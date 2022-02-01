## Practice R script
## Introduction to R - February 2, 2022
## by Grace E. Seo 

##==================================================================

## GitHub page: https://github.com/MMID-coding-workshop/2022-02-02-Introduction-to-R
## Raw Pokemon class metadata: https://github.com/MMID-coding-workshop/2022-02-02-Introduction-to-R/blob/main/class_metadata.csv

##==================================================================

## Anything after # become comments and is not part of the code.

## Scenario 1.
## You are a teaching assistant for Pokemon bioinformatics course.
## Your supervisor provided you with a class metadata and would like you to perform 
## simple analysis as listed below.


##==================================================================
## 1. Load Pokemon class metadata
##==================================================================

## Raw csv file: https://github.com/MMID-coding-workshop/2022-02-02-Introduction-to-R/blob/main/class_metadata.csv
## Two methods to load dataset: using a URL or directly from your folder.

# CODE: OBJECTNAME <- read.csv("FOLDERPATH/FILE.csv", header = TRUE)
# CODE: OBJECTNAME <- read.csv("URL/FILE.csv", header = TRUE)


#metadata <- read.csv("C:/Users/USERNAME/Desktop/intro_to_r/class_metadata.csv", header = TRUE)

metadata <- read.csv("https://raw.githubusercontent.com/MMID-coding-workshop/2022-02-02-Introduction-to-R/main/class_metadata.csv", header = TRUE)

## NOTE: now you should see that "metadata" object is available in your "Environment" pane



##==================================================================
##==================================================================


## View loaded object as a table
# CODE: View("OBJECTNAME") 

View(metadata)

## NOTE: new window will pop-up beside this script. You can scroll through the content.

metadata # this will just print data into console.


##==================================================================
## Your supervisor want you to perform simple calculation and
## plot your results into a simple graph.
##
## 2. Install and load necessary package for your analysis if not already installed
##==================================================================


## For simple analyses, we will install tidyverse package available in CRAN
## NOTE: tidyverse package includes tidyr, dplyr, ggplot2 and many more!
# CODE: install.packages("PACKAGENAME")

install.packages("tidyverse") 

## NOTE: if you already have tidyverse installed, comment out the above code so you don't repeat installation.



## Load installed package == library
# CODE: library(PACKAGENAME)

library(tidyverse)



##==================================================================
## 3. Determine how many students are in your class
##
## HINT: Row number matches student number
##==================================================================

#CODE: nrow(OBJECTNAME) # counts how many rows are present in a dataframe

nrow(metadata)



## ANSWER: 20




##==================================================================
## 4. Determine how many columns are present in your metadata
##==================================================================

# CODE: ncol(OBJECTNAME) # counts how many columns are present in a dataframe
ncol(metadata)


## ANSWER: 9



##==================================================================
## 5. Show the list of column headers in the metadata
##==================================================================

# CODE: colnames(OBJECTNAME) # prints out list of column headers

colnames(metadata)

## ANSWER:
## [1] "Number"         "Student_name"   "Student_number" "Age"            "Year_of_study"  "Phone"         
## [7] "Address"        "Address_city"   "Major"   



##==================================================================
## 6. Print out row contents of only column "Student_name"
##==================================================================

# CODE: OBJECTNAME$COLNAME

metadata$Student_name


## ANSWER:
## [1] "Mew"            "Garchomp"       "Kanto Starters" "Metagross"      "Zoroark"        "Tyranitar"     
## [7] "Eevee"          "Snorlax"        "Volcarona"      "Mewtwo"         "Charizard"      "Milotic"       
## [13] "Kyurem"         "Haxorus"        "Arceus"         "Ninetales"      "Espeon"         "Golurk"        
## [19] "Lapras"         "Pikachu" 


##==================================================================
## 7. Determine average age of all students in this class
##==================================================================

# CODE: mean(OBJECTNAME$COLNAME)

mean(metadata$Age)


## ANSWER: 24




##==================================================================
## 8. Determine the Pikachu's student number
##==================================================================

# CODE: OBJECTNAME$COLNAME_CONTAIN_VALUE_YOU_WANT[OBJECTNAME$COLNAME_YOUR_SEARCH == "NAME"]

metadata$Student_number[metadata$Student_name=="Pikachu"]


## ANSWER: 7094583



##==================================================================
## 9. Scatter plot by student's Year_of_study vs. Age and 
## create a figure legend by student's study Major
##==================================================================

# CODE: NEWOBJECT <- ggplot(data = OBJECTNAME, aes(x = X_VALUE, y = Y_VALUE, colour = GROUP)) +
#                    geom_point()

# CODE: NEWOBJECT # to view the content


plot <- ggplot(data = metadata, aes(x = Year_of_study, y = Age, colour = Major)) +
        geom_point()

plot # view the plot




##==================================================================
## 10. Scatter plot is too small to see. 
## Increase the size of each scatter point, remove grey background
## and rename the x-axis to "Year of Study". 
##==================================================================


plot_2 <- ggplot(data = metadata, aes(x = Year_of_study, y = Age, colour = Major)) +
    geom_point(size = 5) +
    xlab("Year of Study") +
    theme_bw()

plot_2 # view the plot



##==================================================================
## The end of scenario 1
##==================================================================


