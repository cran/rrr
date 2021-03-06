% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rrr.R
\name{threewise_plot}
\alias{threewise_plot}
\title{3-D Reduced Rank Regression Plots}
\usage{
threewise_plot(x, y, type = "pca", pair_x = 1, pair_y = 2, pair_z = 3,
  rank = "full", k = 0, point_size = 2.5)
}
\arguments{
\item{x}{data frame or matrix of predictor variables}

\item{y}{data frame or matrix of response variables}

\item{type}{type of reduced-rank regression model to fit. \code{type = "identity"}, the default, uses \eqn{\mathbf{\Gamma} = \mathbf{I}} to fit a reduced-rank regression. \code{type = "pca"} fits a principal component analysis model as a special case of reduced-rank regression. \code{type = "cva"} fits a canonical variate analysis model as a special case of reduced-rank regression. \code{type = "lda"} fits a linear discriminant analysis model as a special case of reduced-rank regression.}

\item{pair_x}{variable to be plotted on the \eqn{X}-axis}

\item{pair_y}{variable to be plotted on the \eqn{Y}-axis}

\item{pair_z}{variable to be plotted on the \eqn{Z}-axis}

\item{rank}{rank of coefficient matrix.}

\item{k}{small constant added to diagonal of covariance matrices to make inversion easier.}

\item{point_size}{size of points in scatter plot.}
}
\value{
three-dimensional plot. If \code{type = "pca"} returns three principal components scores - defaulted to the first three - against each other.
If \code{type = "cva"} returns three-dimensional plot of residuals. If \code{type = "lda"} returns three-dimensional plot of three linear discriminant scores plotted against each other.
}
\description{
Create three-dimensional, interactive plotly graphics for exploration and diagnostics.
}
\examples{
\dontrun{
data(pendigits)
digits_features <- pendigits[, -35:-36]
threewise_plot(digits_features, digits_class, type = "pca", k = 0.0001)

library(dplyr)
data(COMBO17)
galaxy <- as_data_frame(COMBO17)
galaxy <- select(galaxy, -starts_with("e."), -Nr, -UFS:-IFD)
galaxy <- na.omit(galaxy)
galaxy_x <- select(galaxy, -Rmag:-chi2red)
galaxy_y <- select(galaxy, Rmag:chi2red)
threewise_plot(galaxy_x, galaxy_y, type = "cva")

data(iris)
iris_x <- iris[,1:4]
iris_y <- iris[5]
threewise_plot(iris_x, iris_y, type = "lda")
}

}

