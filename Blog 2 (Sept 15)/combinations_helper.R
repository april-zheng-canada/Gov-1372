#' @title Pairwise Combinations Function
#'
#' @description This function enumerates all the pairwise combinations in a 
#' discrete input vector.
#'
#' @param vec A vector with the elements you'd like to combine
#' 
#' @param self_combs TRUE or FALSE, whether or not you would like to include
#' combinations of an element with itself (e.g. "a" and "a")
#'
#' @return This function returns a tibble with two columns where each row
#' corresponds to a unique pairwise combination of the input vector. 
#'
#' @author Dominic Valentino (creds to Charles Ones)
#'
#' @export
#'
pair_combs <- function(vec) {
  combinations <- t(combn(vec, 2))
  return(combinations)
}

pair_combs(c("strat1", "strat2", "strat3", "strat4", "strat5", "strat6"))








