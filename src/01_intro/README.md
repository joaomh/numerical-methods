# Roundoff and Truncation Errors

Sometimes as scientsits and engineers we have to deal with errors in ours models,
especially when we are solving problems using computational methods.

## Round-off Error
A roundoff error, also called rounding error, is the difference between the result produced by a given algorithm using exact arithmetic and the result produced by the same algorithm using finite-precision, rounded arithmetic. Rounding errors are due to inexactness in the representation of real numbers and the arithmetic operations done with them. This is a form of quantization error. When using approximation equations or algorithms, especially when using finitely many digits to represent real numbers (which in theory have infinitely many digits), one of the goals of numerical analysis is to estimate computation errors. 

## Truncation error
In numerical analysis and scientific computing, truncation error is the error made by truncating an infinite sum and approximating it by a finite sum.

For instance, if we approximate the sine function by the first two non-zero term of its Taylor series, as in 



<img src="https://latex.codecogs.com/svg.latex?\scriptsize&space;sin= x - x^3\frac{1}{6}" /> 

for small x, the resulting error is a truncation error. It is present even with infinite-precision arithmetic, because it is caused by truncation of the infinite Taylor series to form the algorithm. 