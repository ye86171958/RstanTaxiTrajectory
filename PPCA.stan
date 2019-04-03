data {
  int<lower = 0> N;  //number of data points in dataset
  int<lower = 0> D; // dimension
  int<lower = 0> M;  
  
  vector[D] x[N];   //data 
}


parameters {
  matrix[M, N] z;   //latent variable
  matrix[D, M] w;   //weights
  real<lower = 0> sigma;  //standard deviation parameter
  vector<lower = 0>[M] alpha;  //hyper-parameters on weights 
}

model {
  // priors
  to_vector(z) ~ normal(0, 1);
  for (d in 1:D)
    w[d] ~ normal(0, sigma*alpha);
  sigma ~ lognormal(0, 1);
  alpha ~ inv_gamma(1, 1);
  
  //likelihood 
  for (n in 1:N)
    x[n] ~ normal(w * col(z,n), sigma );
}