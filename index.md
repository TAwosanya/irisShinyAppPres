---
title       : iris Data Set Shiny Application
subtitle    : A First Time User's Guide
author      : Babatunde Awosanya
job         : Data Products Project
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

---

## Introduction

* The iris data is one of the most popular data sets used in feature learning; it is part of the data sets in R dataset package
* The data contains measurements in centimeters of sepal length and width and petal length and width variables respectively for 50 flowers from each of 3 species of iris
* Taking a peek at the iris data summary in R

```
##   Sepal.Length   Sepal.Width    Petal.Length   Petal.Width 
##  Min.   :4.30   Min.   :2.00   Min.   :1.00   Min.   :0.1  
##  1st Qu.:5.10   1st Qu.:2.80   1st Qu.:1.60   1st Qu.:0.3  
##  Median :5.80   Median :3.00   Median :4.35   Median :1.3  
##  Mean   :5.84   Mean   :3.06   Mean   :3.76   Mean   :1.2  
##  3rd Qu.:6.40   3rd Qu.:3.30   3rd Qu.:5.10   3rd Qu.:1.8  
##  Max.   :7.90   Max.   :4.40   Max.   :6.90   Max.   :2.5  
##        Species  
##  setosa    :50  
##  versicolor:50  
##  virginica :50  
##                 
##                 
## 
```


---
 

## Introduction (contd.)

* This shiny application is intended to help learn the features that best distinguish the flower species i.e. K-Means Clustering and also to predict the class  i.e. Random Forests Technique of specie for new data 

* This shiny application also gives the summary and performance of the clustering and prediction models

---

## Application Features
* This shiny application helps the user to cluster the iris data into desireable number of clusters and to predict classes of new data based on random forests technique. 
* In the side panel, the user can choose which task he/she intends to perform i.e. clustering or prediction. 
* If clustering is selected, only the widgets that are associated with clustering are displayed i.e choose which variable to use as x and y axes, number of clusters and a checkbox to turn on and off summary of the clustering model. 
* In the same vein, if the prediction is selected only the widgets associated with the random forests prediction for the iris data are displayed which are the Sepal Lengths and Widths, Petal Lengths and Widths.
* The submit button is to pass the input data to the model for prediction. 

---

## Application Features (contd.)
* Also note that the output display in the mainpanel also follows from the option of clustering or prediction selection from the side panel. 

    - The ouput include the iris data table whose display can be controlled by the number of observation input in the side panel. 

    - Under the clustering, the outputs are a plot of the iris data set distiguished colour for different clusters and the summary of the cluster model displayed in the pane below the plot. 

    - Under the prediction, the output is a list of the model call and summary plus the outcome prediction based on input.




