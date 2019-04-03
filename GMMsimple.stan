data{
  int<lower=0> N;  //number of datapoints in entire dataset
  int<lower=0> K;  // number of mixture components
  int<lower=0> D;  // dimension
  vector[D] y[N];  // observationx
  
  real<lower=0> alpha0; // dirichlet prior
}

transformed data{
  vector<lower = 0>[K] alpha0_vec;
  for (k in 1:K){
    alpha0_vec[k] = alpha0;
  }
}

parameters {
  simplex[K] theta;
  vector[D] mu[K];
  vector<lower=0>[D] sigma[K];
}

model {
  //prior
  theta ~ dirichlet(alpha0_vec);
  for (k in 1:K){
    mu[k] ~ normal(0, 1);
    sigma[k] ~ lognormal(0, 1);
  }
  
  // likelihood 
  for (n in 1:N) {
    real ps[K];
    for (k in 1:K){
      ps[k] = log(theta[k]) + normal_lpdf(y[n]| mu[k], sigma[k]); 
    }
    target += log_sum_exp(ps);
  }
}    
  