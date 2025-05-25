https://medium.com/analytics-vidhya/machine-learning-univariate-linear-regression-1acddb85aa0b
<br />
https://medium.com/analytics-vidhya/machine-learning-multivariate-linear-regression-8f9878c0f56f


<br/>.

[text](https://medium.com/analytics-vidhya/machine-learning-linear-regression-project-from-scratch-without-library-87294048020)


# Regression: 
1) Mean bias error: captures the average bias in the prediction but is rarely used in training as negative and positive errors can cancel each other.

2) Mean absolute error: Measures the average absolute difference between predicted and actual value. One caveat is that small errors are as important as big ones. Thus, the magnitude of the gradient is independent of error size.

3) Mean squared error: Larger errors contribute more significantly than smaller errors. But this may also be a caveat as it is sensitive to outliers.

4) Root mean squared error: Used to ensure that loss and the dependent variable (y) have the same units.

5) Huber loss: A combination of MAE and MSE. For smaller errors, mean squared error is used. For large errors, mean absolute error is used. One caveat is that it is parameterized — adding another hyperparameter to the list.

6) Log cosh loss: A non-parametric alternative to Huber loss which is a bit computationally expensive.