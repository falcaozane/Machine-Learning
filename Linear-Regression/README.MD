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


Here are the **formulas** for each of the regression loss/error metrics you listed:

---

### 1) **Mean Bias Error (MBE)**

Captures average bias in predictions (can be positive or negative):

$$
\text{MBE} = \frac{1}{n} \sum_{i=1}^{n} (y_i - \hat{y}_i)
$$

---

### 2) **Mean Absolute Error (MAE)**

Measures the average magnitude of absolute errors:

$$
\text{MAE} = \frac{1}{n} \sum_{i=1}^{n} |y_i - \hat{y}_i|
$$

---

### 3) **Mean Squared Error (MSE)**

Penalizes larger errors more heavily:

$$
\text{MSE} = \frac{1}{n} \sum_{i=1}^{n} (y_i - \hat{y}_i)^2
$$

---

### 4) **Root Mean Squared Error (RMSE)**

Takes the square root of MSE to match units with target variable:

$$
\text{RMSE} = \sqrt{\frac{1}{n} \sum_{i=1}^{n} (y_i - \hat{y}_i)^2}
$$

---

### 5) **Huber Loss**

Combines MAE and MSE based on a threshold $\delta$:

$$
L_\delta(a) =
\begin{cases}
\frac{1}{2} a^2 & \text{for } |a| \leq \delta \\
\delta (|a| - \frac{1}{2} \delta) & \text{for } |a| > \delta
\end{cases}
$$

Where $a = y_i - \hat{y}_i$

---

### 6) **Log-Cosh Loss**

Smooth approximation of MAE (less sensitive to outliers):

$$
\text{LogCosh} = \sum_{i=1}^{n} \log\left(\cosh(y_i - \hat{y}_i)\right)
$$

Where:

$$
\cosh(x) = \frac{e^x + e^{-x}}{2}
$$

---

Let me know if you'd like a Python implementation of these as well.
