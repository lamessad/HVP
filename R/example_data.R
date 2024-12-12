#' @title Example Data for HVP Model
#' @description A dataset to demonstrate the usage of the genetic correlation estimation function in the HVP model.
#' @usage data(example_data)
#' @format A list with the following elements:
#' \describe{
#'   \item{tau}{Causal effect of the exposure on the outcome.}
#'   \item{varb}{Genetic variance of the exposure variable.}
#'   \item{covg_hat}{Genetic covariance between exposure and outcome.}
#'   \item{varg}{Genetic variance of the outcome variable.}
#'   \item{v_tau}{Variance of the causal effect (tau).}
#'   \item{v_varb}{Variance of the exposure variable.}
#'   \item{v_varg}{Variance of the outcome variable.}
#'   \item{cov_varg_varb}{Covariance of between varb and varg.}
#'   \item{v_covg_hat}{Variance of the genetic covariance (covg_hat).}
#'   \item{cov_varg_covg_hat}{Covariance between varg and covg_hat.}
#'   \item{cov_varb_covg_hat}{Covariance between varb and covg_hat.}
#' }
#' @examples
#' data(example_data)
#' print(example_data)
"example_data"
