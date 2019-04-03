data {
  int<lower = 0> N;  //number if data points in dataset
  int<lower = 0> D;  // dimension
  int<lower = 0> M;  // maximum dimension of latent space to consider
  
  vector[D] x[N];  //data
  vector[N]  y;    //data
}


parameters {
  matrix[M, N] z;    //latent variable
  matrix[D, M] w_x;  //weight parameter for x
  vector[M] w_y;     //weight parameter for y
  real<lower = 0> sigma;   //standard deviation parameter
  vector<lower = 0>[M] alpha;  //hyper-parameters on weights
}

model {
  // priors
  to_vector(z) ~ normal(0,1);
  for (d in 1:D)
    w_x[d] ~ normal(0, sigma * alpha);
  w_y ~ normal(0, sigma * alpha);   
  
  sigma ~ lognormal(0, 1);
  alpha ~ inv_gamma(1, 1);
  
  // likelihood 
  for (n in 1:N){
    x[n] ~ normal(w_x * col(z,n), sigma);
    y[n] ~ normal(w_y * col(z, n), sigma);
  }
}

