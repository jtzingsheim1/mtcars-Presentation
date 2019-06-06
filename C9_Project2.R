# Coursera Data Science Specialization Course 9 Project 2 Script----------------
# Plot of mtcars Data


# The purpose of this script is to complete the basic requirements behind the
# project 2 peer-graded assignment which is part of the Developing Data Products
# course from Johns Hopkins University within the Data Science Specialization on
# Coursera.
#
# The instructions say:
# "Create a web page presentation using R Markdown that features a plot created
# with Plotly. Host your webpage on either GitHub Pages, RPubs, or NeoCities.
# Your webpage must contain the date that you created the document, and it must
# contain a plot created with Plotly. We would love to see you show off your
# creativity!"
#
# This project will meet the objective by creating a plot of the mtcars data
# which is the only input for the script.


library(datasets)  # For the mtcars data
library(tidyverse)
library(plotly)


# Part 1) Load and process the data---------------------------------------------

# Load data
data("mtcars")
mtcars <- as_tibble(mtcars, rownames = "vehicle")  # Put row names in a column

# Convert data types
mtcars <- mtcars %>%
  mutate(vs = as.factor(vs)) %>%
  mutate(am = as.factor(am)) %>%
  mutate(gear = as.factor(gear))

# The vs and am variables are coded with zeros and ones, but it will be easier
# to work with them by the names those values represent:
levels(mtcars$vs) <- c("V-shaped", "Straight")
levels(mtcars$am) <- c("Automatic", "Manual")

# Preview the data
mtcars


# Part 2) Make the plot---------------------------------------------------------

# Make the plot
plot_ly(x = mtcars$wt, y = mtcars$hp, z = mtcars$mpg, type = "scatter3d",
        mode = "markers", color = mtcars$am) %>%
  layout(scene = list(xaxis = list(title = "Vehicle Weight [klbs]"),
                      yaxis = list(title = "Horsepower [hp]"),
                      zaxis = list(title = "Fuel Economy [mpg]"))) %>%
  print()

