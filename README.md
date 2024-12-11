
<!-- README.md is generated from README.Rmd. Please edit that file -->

# HVP (Horizonatal Vertical Pleiotropy)

<!-- badges: start -->
<!-- badges: end -->

**`HVP`** is an R package designed to disentangle horizontal and
vertical pleiotropy leading to the correct estimation of genetic
correlation between two traits.

## Installation

You can install the development version of HVP from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("lamessad/HVP")
```

## Steps for Mendelian Randomization Analysis with MRLOVA

**1. run conventional bivariate ‘GREML’ (e,g., in mtg2) and extract
input data from the information matrix generated. **2. run Mendelian
randomization to estimate the causal effect size

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(HVP)
data(example_data)
tau = example_data$tau
varb = example_data$varb
covg_hat = example_data$covg_hat
varg = example_data$varg
v_tau = example_data$v_tau
v_varb = example_data$v_varb
v_varg = example_data$v_varg
v_covg_hat = example_data$v_covg_hat
cov_varg_covg_hat = example_data$cov_varg_covg_hat
cov_varb_covg_hat = example_data$cov_varb_covg_hat
hvp(varg, varb,covg_hat,v_varg,v_varb,v_covg_hat,cov_varg_covg_hat,cov_varb_covg_hat,tau)
#>                Corrected Heritability     Corrected Genetic Covariance    
#> Estimate       0.06696947                 0.03452509                      
#> Standard Error 0.08504413                 0.00304289                      
#> P_value        0.4310084                  7.749676e-30                    
#>                Corrected Genetic Correlation    
#> Estimate       0.5437487                        
#> Standard Error 1.924691                         
#> P_value        0.7775508
```

## Contact

Please contact Lamessa Amente (<lamessa.amente@mymail.unisa.edu.au>) or
Hong Lee (<hong.lee@unisa.edu.au>) if you have any queries.
