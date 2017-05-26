#ENS 495 Lab 1: Intro to R
#Thu Sep 01 

### Part I: What is R?

## What does it do?
# It does math
# It does stats
# It makes figures
# You can write computer programs to automate these things

## Why use R
# Its free - for students, government, business, anyone
# Its free
# Its used by statisticians to develop new statistical techniques
# Its used by all ecological statisticians to develop new techniques (mark recapture, distance sampling)
# It allows stats, graphics, and modeling, all for free


## Who uses it?
#Ford
#Monsanto
#Facebook
#Newspapers (eg New York Times)
#see http://blog.revolutionanalytics.com/2014/05/companies-using-r-in-2014.html

### Part II: Getting started with R
##What we'll do
# Get some data ready in Excel
# Set up RStudio
# Load data into Rstudio
# Examine it
# Plot It
# Add more data to Excel
# Examine it, plot it etc.


## IIa. Open data in Excel

## Save to working directory (WD)

## Save excel file as "csv"
# 1)"File"
# 2)"Save As"
# 3)"Browse"
# 4)Select WD
# 5)"Save as type"
# 6)Select 
# "CSV (Comma delimited)"
# 7)Change name of file
# To have "_CSV" in it
# 8)Click "Save"

## IIb. Getting to know RStudio

#Consol
#Source Viewer/Script editor
#Set up location of windows

## IIc.  Loading Data into RStudio

##Set the "working directory"
#("WD")

#"Session"
#"Set working directory"
# "Choose Directory"
# Select directory & click  "Select folder"
# The command "setwd" shows up followed by the location of the directory you selected


##IId) Interacting with R (slide 30ish)
#Executing commands in the CONSOL
# Type "getwd()"
# 
# Must have both ( and )
# Press enter
#Prints out your working directory

#IIe) Interacting with R
#Executing commands from the SOURCE VIEWER part 1 
#Click on the source viewer
# Type
# "getwd()" in the source viewer
#Click on "Run"
#The getwd() command is  sent over to the consol and excucted


#Try these commands in the source view
date()
ls()   #"l" = lower case "L"

#"ls" means "list".  
#More on this later

# Now try just "date" without the parentheses.
# What happens?

date

# NB: parentheses are key to the execution of commands in R!
#   
#When things don't, one of the 
#1st things to check for are 
#parentheses

## IIf) Interacting with R:
#Executing commands from the 
#SOURCE VIEWER part 2

# Type date & instead of clicking
#"Run" 
# put the curser right after the 
#last parenthesis and press 
#"Crlt+Enter"
# 

#Execute the command "list.files()"
list.files()
# This tells you what files are saved in your working directory (wd).  
# There should be the original xlsx & 
#   the csv file you made.
# We will load the .csv file into R


### Loading data into R
# Copy and paste the CSV file name from the consol in the source view
# Execute the command 
# read.csv(file = "Lab1_data_PA_eagles_CSV.csv")

#You must have the file name in 
#quotation marks and include 
#".csv"

#Correct
read.csv(file = "Lab1_data_PA_eagles_CSV.csv")


#Incorrect- none of these will work!
read.csv(file = Lab1_data_PA_eagles_CSV.csv) #missing quotes " "
read.csv(file = "Lab1_data_PA_eagles_CSV")   #missing .csv
read.csv(file "Lab1_data_PA_eagles_CSV")     #missing =

## Load eagles data into an "object"
# Now type this:
#   eagles <- read.csv(file = "Lab1_data_PA_eagles_CSV.csv")
# What happens when you execute this command?

eagles <- read.csv(file = "2_Lab1_data_PA_eagles_CSV.csv")

# "<-" is called the "assignment operator".  
# It is a special type of R command

# "<" is usually 
# Shares The 
# comma ( , ) Key
# Type "shift + , " 
# To get it

#You have "assigned" the data from your file to the "object" named "eagles"


#If you type just "eagles" and 
# execute it as a command what 
# Happens?


# Execute the list command 
# ls() again In the console 
# you see
# "eagles".  
# 
# This means that the
# Object you assigned your data 
# is now in your "workspace."


### Interacting with data "objects" in R (slide 51ish)
## Getting to know an R data object


#Look at the "eagles" object using the summary() 
#command
#DO NOT put the ">" in front of it

summary(eagles)

#Check how big the eagles object is using dim() [dimension]
dim(eagles)

#Look at the top of the eagles object
head(eagles)


#Look at the the bottom of the eagles object
tail(eagles)

#Call up the help information for these commands
?dim


#Try executing them directly from the console & 
#also from the source viewer using "Cntl+Enter"


# Call up help for dim() by typing 
# "?dim"

?dim

# Unfortunately, the help files for R
# Are designed w/programmers in
# Mind and are typically very 
# Encyclopedic.  You can usually get
# Some useful information from 
# Them but often it can be hard
# When you are a beginner to find
# What you need

# You can often find information 
# Online, eg, by googling 
# "R dim command"
# 
# Usually the R help file will come up
# 
# Other information will also show up





### Interacting w/ data in R: plotting the number 
#   of eagles in PA
## Making a basic plot (slide 56 ish)
# 
# If you want to make a plot of the number of eagles over time in PA, what command do you think will do it?
# 
# Many R commands use fairly
# Simple language.

plot(eagles ~ year, data = eagles)



# One thing that makes R tricky is that there are
#multiple ways to accomplish the exact same thing.  
# Try typing in these different commands.
# 
# The following commands all produce the exact same
#figure, just with different colors (via "col = .").
# One consequence of this fact is that different 
#books/instructors/etc. will use slightly different 
#approaches, making it sometimes tricky to compare 
#code written by different people.
# 
# 




### Other ways of doing the exact same thing
plot(eagles$eagles ~ eagles$year,col = 2)
plot(eagles[,"eagles"] ~ eagles[,"year"], col = 3)
plot(eagles[,2] ~ eagles[,1], col = 4)
plot(eagles$year,eagles$eagles, col = 5)





### Customizing a plot in R

#R plots can be customized almost infinitely.
#Type these different commands into the source 
#viewer & execute them


#### Change the color with "col = "
plot(eagles ~ year, data = eagles, col = 2)

#### Change the style of point with "pch = "
plot(eagles ~ year, data = eagles, col = 2, pch = 2)

### Change the x axis label
plot(eagles ~ year, data = eagles, col = 2, pch = 2, xlab = "Year of census")


### Change the y axis label
plot(eagles ~ year, data = eagles, col = 2, pch = 2, xlab = "Year of census",
     ylab = "Number of eagles")



### Note that in the source viewer commands 
#can be on separate lines.  
#Be mindful of the commas though!

#Here, each command is on a separate line
plot(eagles ~ year, 
     data = eagles, 
     col = 2, 
     pch = 2, 
     xlab = "Year of census",
     ylab = "Number of eagles")


#You can even include blank lines
plot(eagles ~ year, 
     
     data = eagles, 
     col = 2, 
     
     pch = 2, 
     
     xlab = "Year of census",
     
     ylab = "Number of eagles")








### Summary stats for main PA eagle dataframe
#There are many commands for summary data in R, such as mean, median
#However, you ahe to be careful about NAs!
mean(eagles$eagles)

# "NA" is a big deal in R
mean(eagles$eagles, na.rm = T)

# R is VERY picky about uppper vs. lower case
Mean(eagles$eagles, na.rm = T)


#most commands are lower case

mean(eagles$eagles, na.rm = T)
median(eagles$eagles, na.rm = T)
min(eagles$eagles, na.rm = T)
max(eagles$eagles, na.rm = T)
summary(eagles$eagles)
sd(eagles$eagles, na.rm = T)

#The standard error is a very common summary statistics but for some reason 
#there is not a function in R

#Calcualte the standard error
sd(eagles$eagles, na.rm = T)/sqrt(15)



      ## Skip during 1st lab
      ### Making plots using a single column of data
      #This is meaningless
      plot(eagles$eagles)
      
      
      ### Make a boxplot
      #What is the thick black line?
      boxplot(eagles$eagles)
      
      
      #Make a histogram
      hist(eagles$eagles)












### Reload data with another state added
# Open up Excel file
# Type in new data from your assigned state in a new
# Column
# Name the column "eagles.XX" where "xx" is the 
# Postal code for that state.
# Be sure to separate the words with a period
# R is unfortunately picky about what characters show
# Up in its columns
      
#Type in new eagle data
#"Save as" data with new file name, eg Lab1_data_PA_eagles_CSV2
#reload to new object names "eagles2"

      
# Preparing a file for loading into R
      # 
      # Things work best when you Excel file is "clean" & only has exactly what you want in it.  
      # Any extra, accidental typing can cause problems or make things confusing.  
      # A good practice is to always highlight cells to the right of and below your data, right click & select "Delete".  T
      # his will remove any accidental typing that occurred. 
      # Do this below your data also.
      # 
      # 
      
      
# reLoad data; be sure to include the "csv" at the end
eagles2 <- read.csv(file = "Lab1_data_PA_eagles_CSV2.csv")

#type ls() to see what is now in your workspace
ls()

#look at the new eagles2 data object
summary(eagles2)
dim(eagles2)
head(eagles2)
tail(eagles2)




### Plot the data from both states

#Plot the PA data
#use "col = 1" to set PA to black
plot(eagles ~ year, data = eagles2, col = 1)

#Plot the other state's data
#be sure to change the name of the 
#use "col = 2" to set the other state to red to red
points(eagles.WV ~ year , data = eagles2, col = 2) #WV data



### Exporting R Figures
# Click on "EXPORT" in RStudio above the graph
# Select "Copy to clipboard"
#A window will pop up

# Adjust the size and dimensions
# By clicking and dragging the bottom Right corner


# Click on "copy plot"
# 
# The window will disappear
# 
# The Plot is now stored in memory 
#and can be pasted into PowerPoint or a Word docutment

# In Word, it works well to right click in a document and click on the clipboard icon
# 
# The short cut "Crtl+V" should work in Word and PowerPoint





#This plot can be modified using different commands
#change the type of point used for each state via pch = 
plot(eagles ~ year, data = eagles2, col = 1, pch = 2)
points(eagles.WV ~ year , data = eagles2, col = 2, pch = 4) #WV data


### Adding a legend
#Plots should always have legends.  Legends are highly customizable in R but
#can require a bit of coding.  Here is how you could do it.  This
#will be covered again in later labs in more detail.  One thing to note that 
#will be discussed later is the use of the "c(...)" in the code
plot(eagles ~ year, data = eagles2, col = 1, pch = 2)
points(eagles.WV ~ year , data = eagles2, col = 2, pch = 4) #WV data
legend("topleft",             #where the legend coges
       legend = c("PA","WV"), #the text the legend contains
       col = c(1,2),          #colors of the points in the legend
       pch = c(2,4) )         #symbols of the points












### Add data "by hand"

#Most work in R takes data from a spreadsheet and loads it using read.csv().
#It is possible to also enter data manually.  This is often useful for class
#exercises where small "toy" datasets are used that are easy to manage.
#We'll enter data "by hand" to add a third state of data to our figure.
eagles.OH <- c(NA,NA,NA,16,19,20,24,26,30,33,38,47,57,63,73,79,88,NA,125,NA,NA,NA,NA,
        NA,NA,NA,NA,NA,NA)

length(eagles.OH)
dim(eagles.OH)     #this will not produce output for a very R-ish reason
length(eagles.OH)




### Summary stats for Ohio

mean(eagles.OH)
mean(eagles.OH, na.rm = T)
median(eagles.OH, na.rm = T)
min(eagles.OH, na.rm = T)
max(eagles.OH, na.rm = T)
summary(eagles.OH)
sd(eagles.OH, na.rm = T)

#Calcualte the standard error
sd(eagles.OH, na.rm = T)/sqrt(15)



#This is meaningless
plot(eagles.OH)


### Make a boxplot
#What is the thick black line?
boxplot(eagles.OH)


#Make a histogram
hist(eagles.OH)




### Combine OH data with main dataframe

eagles3 <- cbind(eagles2, eagles.OH)

#Look at the "workspace"
ls()

#look at the new "eagles3" object
summary(eagles3)
dim()

plot(eagles ~ year, data = eagles2, col = 1, pch = 2)
points(eagles.WV ~ year , data = eagles2, col = 2, pch = 4) #WV data
points(eagles.OH ~ year , data = eagles3, col = 3, pch = 5) #OH data



#Plot 
plot(eagles ~ year, data = eagles2, col = 1, pch = 2)
points(eagles.WV ~ year , data = eagles2, col = 2, pch = 4) #WV data
points(eagles.OH ~ year , data = eagles3, col = 3, pch = 5) #OH data
legend("topleft",             #where the legend coges
       legend = c("PA","WV","OH"), #the text the legend contains
       col = c(1,2,3),          #colors of the points in the legend
       pch = c(2,4,5) )         #symbols of the points













### In-class assignment

#Enter your own state
#What is min, max, mean, median
#sd
#make a boxplot - what does it representatio
#what is bigger, sd or se?


### Lab Write-up 1:

# 1)Find recent (2014,2015 or 2016) data on the
# number of eagles nesting in your state
# 2)Add the data to the excel file
# 3)Make a plot that includes PA, OH, and your state
# 4)Include a legend using the legend() command
# 5)Export the graph
# 6)Write a short legend (aka caption) beneath the graph that
# explains what it is like it woudl show 
# up in a published paper
# An example will be provided in class
