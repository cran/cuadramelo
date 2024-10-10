## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(cuadramelo)
set.seed(2)
example_matrix <- rnorm(3*5) |> matrix(3,5) |> round(3)
col_totals <- c( 0.870, -1.070, 3.450, 0.260, 1.350)
row_totals <- c(-1.851, 0.243, 6.468)

## -----------------------------------------------------------------------------
example_matrix

## -----------------------------------------------------------------------------
row_totals

## -----------------------------------------------------------------------------
col_totals

## -----------------------------------------------------------------------------
colSums(example_matrix) - col_totals
rowSums(example_matrix) - row_totals

## ----message=FALSE, warning=FALSE---------------------------------------------
tallied_matrix <- balance_matrix(example_matrix, col_totals, row_totals)
tallied_matrix - example_matrix
(rowSums(tallied_matrix) - row_totals) |> round(7)
(colSums(tallied_matrix) - col_totals) |> round(7)

## -----------------------------------------------------------------------------
tallied_matrix <- balance_matrix(example_matrix, col_totals)
tallied_matrix - example_matrix
(rowSums(tallied_matrix) - row_totals) |> round(7)
(colSums(tallied_matrix) - col_totals) |> round(7)

## ----include = FALSE----------------------------------------------------------
set.seed(10)
block_matrix <- (rnorm(32)*10) |> matrix(ncol = 2) |> round(3)
block_col_totals <- aggregate(block_matrix, by = list(rep(1:4, times = rep(4,4))), FUN = sum)[, -1] |>
  round() |> unname() |> as.matrix()

## -----------------------------------------------------------------------------
block_matrix

## -----------------------------------------------------------------------------
block_col_totals

## -----------------------------------------------------------------------------
X <- balance_by_blocks(block_matrix, col_totals = block_col_totals, 
                       layout = 2, L = 4)
X[9:12,] - balance_matrix(block_matrix[9:12,], block_col_totals[3,])

