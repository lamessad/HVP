
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Overview of HVP

<!-- badges: start -->
<!-- badges: end -->

**HVP** is an R package designed to provide unbiased estimates of
heritability and genetic correlation by disentangling horizontal and
vertical pleiotropy. Unlike traditional methods such as GREML, the HVP
model adjusts for vertical pleiotropy by incorporating causal effect
estimates from Mendelian Randomization (MR). This enables a clear
distinction between:

- **Shared genetic influences** (horizontal pleiotropy), and
- **Genetic effects mediated through causal pathways** (vertical
  pleiotropy).

By addressing the limitations of conventional approaches, the HVP
package offers a robust framework for analyzing complex genetic
relationships.

## Installation

You can install the development version of HVP from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("lamessad/HVP")
```

# Steps for the Horizontal and Vertical Pleiotropy (HVP) Model

## 1. Run Conventional Bivariate GREML (e.g., in GCTA-mtG2)

- Use genome-wide SNP data to estimate genetic variances and covariance
  using the conventional bivariate GREML model.
- Extract the following parameters and their variances from the
  information matrix generated by the GREML analysis:
  - **varg**: Genetic variance of the outcome.
  - **varb**: Genetic variance of the exposure.
  - **covg_hat**: Genetic covariance between the exposure and outcome.
  - Variances and covariances of these estimates (e.g., **v_varg**,
    **v_varb**, **v_covg_hat**, **cov_varg_covg_hat**, etc.).

``` r
# Example GREML output
library(HVP)
data("example_data")
varg <- example_data$varg
varb <- example_data$varb
covg_hat <- example_data$covg_hat
#from information matrix
v_varg <- example_data$v_varg
v_varb <- example_data$v_varb
v_covg_hat <- example_data$v_covg_hat
cov_varg_covg_hat <- example_data$cov_varg_covg_hat
cov_varb_covg_hat <- example_data$cov_varb_covg_hat
```

## 2. Run MR

- Estimate the causal effect size (**tau**) of the exposure on the
  outcome using robust MR methods (e.g., MRLOVA).
- Use the **same dataset** as in the conventional GREML analysis to
  ensure consistency between the GREML and MR steps.

``` r
# Example MR outputs
tau <- example_data$tau
v_tau <- example_data$v_tau
```

## 3. Apply the HVP Model

- Input the parameters extracted from GREML and the causal effect size
  (**tau**) from MR into the HVP model.
- The HVP model will disentangle horizontal pleiotropy from vertical
  pleiotropy by correcting genetic correlations for causal effects.
- Outputs include corrected estimates for:
  - **Heritability**: Genetic variance components of exposure and
    outcome.
  - **Genetic Covariance**: Corrected covariance between exposure and
    outcome.
  - **Genetic Correlation**: Corrected genetic correlation due to
    horizontal pleiotropy.

``` r

library(HVP)
data("example_data")
varg <- example_data$varg
varb <- example_data$varb
covg_hat <- example_data$covg_hat
v_varg <- example_data$v_varg
v_varb <- example_data$v_varb
v_covg_hat <- example_data$v_covg_hat
cov_varg_covg_hat <- example_data$cov_varg_covg_hat
cov_varb_covg_hat <- example_data$cov_varb_covg_hat
tau <- example_data$tau
v_tau <- example_data$v_tau
results <- hvp(varg, varb, covg_hat, v_varg, v_varb, v_covg_hat, cov_varg_covg_hat, cov_varb_covg_hat, tau)
results
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
