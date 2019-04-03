functions {
    real divide_promote_real(int x, int y){
      real x_real;
      x_real = x;
      return x_real/y
    }
}

data {
  int<lower = 0> NFULL; //total number of datapoints in dataset
  int<lower=0> N; // minibatch 
  
  int<lower = 0> K; //number of mixture components 
  int<lower = 0> D; //dimension
  
  vector[D] yFULL[NFULL]; //dataset
  vector[D] y[N]; //minibatch
  
  real<lower = 0> alpha0; //dirichlet hyper-prior parameter
}

transformed data{
  real minibatchfactor;
  vector<lower = 0>[K] alpha0vec;
  for (k in 1:K)
       alpha0vec[k] = alpha0/K;
  minibatchfactor = divide_promote_real(N,NFULL);    
}

parameters {
  simplex[K] theta;
  vector[D] mu[K];
  vector<lower = 0>[D] sigma[K];
}

model{
  //prior
  theta ~ dirichlet(alpha0vec);
  for (k in 1:K){
    mu[k] ~ normal(0,1);
    sigma[k] ~lognormal(0,1);
  }
  
  //likelihood 
  for (n in 1:N){
    real ps[K];
    for (k in 1:K){
      ps[k] = log(theta[k]) + normal_lpdf(y[n] | mu[k],sigma[K]);
      }
    target += minibatchfactor*log_sum_exp(ps);
  }
  
}