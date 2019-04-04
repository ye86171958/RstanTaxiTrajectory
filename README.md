# RstanTaxiTrajectory
Clustering taxi trajectories in Porto by using rstan.


This is the implement of Taxi Trajectory Clustering in the paper Automatic Differentiable Variational Inference (D.Blei et al. 2017). The dataset is too big so I give the link here: https://www.kaggle.com/crailtap/taxi-trajectory.



## How to Use RStan
Stan is a probabilistic programming language for statistical inference written in C++. The Stan language is used to specify a (Bayesian) statistical model with an imperative program calculating the log probability density function. RStan https://mc-stan.org/users/interfaces/rstan is the R interface to Stan. For more information on Stan and its modeling language visit the Stan website at http://mc-stan.org/. 

We start by writing a Stan program for the model in a text file. If you are using RStudio version 1.2.x or greater, click on File -> New File -> Stan File . Otherwise, open your favorite text editor. We have writen PPCA, GMM stan file in the repository.
