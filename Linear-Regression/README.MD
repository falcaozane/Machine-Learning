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

Python implementation 

---

import numpy as np

# Sample true values and predicted values
y_true = np.array([3.0, -0.5, 2.0, 7.0])
y_pred = np.array([2.5, 0.0, 2.0, 8.0])

# 1) Mean Bias Error (MBE)
def mean_bias_error(y_true, y_pred):
    return np.mean(y_true - y_pred)

# 2) Mean Absolute Error (MAE)
def mean_absolute_error(y_true, y_pred):
    return np.mean(np.abs(y_true - y_pred))

# 3) Mean Squared Error (MSE)
def mean_squared_error(y_true, y_pred):
    return np.mean((y_true - y_pred) ** 2)

# 4) Root Mean Squared Error (RMSE)
def root_mean_squared_error(y_true, y_pred):
    return np.sqrt(mean_squared_error(y_true, y_pred))

# 5) Huber Loss
def huber_loss(y_true, y_pred, delta=1.0):
    error = y_true - y_pred
    is_small_error = np.abs(error) <= delta
    squared_loss = 0.5 * error**2
    linear_loss = delta * (np.abs(error) - 0.5 * delta)
    return np.mean(np.where(is_small_error, squared_loss, linear_loss))

# 6) Log-Cosh Loss
def log_cosh_loss(y_true, y_pred):
    error = y_true - y_pred
    return np.mean(np.log(np.cosh(error)))

# Print results
print("Mean Bias Error:", mean_bias_error(y_true, y_pred))
print("Mean Absolute Error:", mean_absolute_error(y_true, y_pred))
print("Mean Squared Error:", mean_squared_error(y_true, y_pred))
print("Root Mean Squared Error:", root_mean_squared_error(y_true, y_pred))
print("Huber Loss (delta=1):", huber_loss(y_true, y_pred))
print("Log-Cosh Loss:", log_cosh_loss(y_true, y_pred))


---