# RstanTaxiTrajectory
Clustering taxi trajectories in Porto by using rstan.


This is the implement of Taxi Trajectory Clustering in the paper Automatic Differentiable Variational Inference (D.Blei et al. 2017). The dataset is too big so I give the link here: https://www.kaggle.com/crailtap/taxi-trajectory.



## How to Use RStan
Stan is a probabilistic programming language for statistical inference written in C++. The Stan language is used to specify a (Bayesian) statistical model with an imperative program calculating the log probability density function. RStan https://mc-stan.org/users/interfaces/rstan is the R interface to Stan. For more information on Stan and its modeling language visit the Stan website at http://mc-stan.org/. 

We start by writing a Stan program for the model in a text file. If you are using RStudio version 1.2.x or greater, click on File -> New File -> Stan File . Otherwise, open your favorite text editor. We have writen PPCA, GMM stan file in the repository.

## Parallel in R 

The '''foreach''' package provides a new looping construct for executing R code repeatedly. he  main  reason  for  using  the foreach package  is  that  it supports parallel execution, that is, it can execute those repeated operations on multiple processors/cores on your computer, or on multiple nodes of a cluster. The output is in list form.

## Make plot 

Leaflet is a very popular open-source JavaScript libraries for interactive maps. It is used by websites ranging from The New York Times and The Washington Post, which is a very good replacement of ggmap. From year 2018, ggmap require API to download maps but leaflet does not require that. The R package make it easy to integrate and control leaflet maps in R.

To save Leaflet in R map as png or jpg file, you can install PhantomJS and install webshot from github. For more details, see my code in file TaxiTrajectory.Rmd.
