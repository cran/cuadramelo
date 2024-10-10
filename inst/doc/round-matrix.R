## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(cuadramelo)
set.seed(6)
example_matrix <- rnorm(3*5)*10 |> matrix(3,5) |> round(3)

## -----------------------------------------------------------------------------
example_matrix

## -----------------------------------------------------------------------------
rounded_matrix <- round_matrix(example_matrix)
rounded_matrix

## -----------------------------------------------------------------------------
colSums(rounded_matrix) - round(colSums(example_matrix))
rowSums(rounded_matrix) - round(rowSums(example_matrix))

## -----------------------------------------------------------------------------
rounded_matrix <- round_matrix(example_matrix, MARGIN = 2)
rounded_matrix
colSums(rounded_matrix) - round(colSums(example_matrix))
rowSums(rounded_matrix) - round(rowSums(example_matrix))

## ----include = FALSE----------------------------------------------------------
set.seed(10)
example_block_matrix <- (rnorm(32)*10) |> matrix(ncol = 2) |> round(3)

## -----------------------------------------------------------------------------
example_block_matrix
X <- round_by_blocks(example_block_matrix, 2, 4)
U <- example_block_matrix[5:8,] |> round_matrix()
X[5:8,] - U

