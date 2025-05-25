# Classification: 
<br />
---
<br />
1) BCE: Used for binary classification tasks. Measures the dissimilarity between predicted probabilities and true binary labels, through the logarithmic loss.

2) Hinge loss: Penalizes both wrong and right (but less confident) predictions). It is based on the concept of margin, which represents the distance between a data point and the decision boundary. Particularly used to train support vector machines (SVMs).

3) Cross-entropy loss: An extension of BCE loss to multi-class classification tasks.

4) KL Divergence: Measure information lost when one distribution is approximated using another distribution. For classification, however, using KL divergence is the same as minimizing cross entropy. Thus, it is recommended to use cross-entropy loss directly. It is used in t-SNE and knowledge distillation for model compression.

---

Here are the **formulas** and **Python implementations** for each classification loss function you listed:

---

## 📘 1) **Binary Cross-Entropy (BCE) Loss**

### 🔸 Formula:

$$
\text{BCE} = -\frac{1}{n} \sum_{i=1}^{n} \left[ y_i \log(\hat{y}_i) + (1 - y_i) \log(1 - \hat{y}_i) \right]
$$

Where:

* $y_i \in \{0, 1\}$
* $\hat{y}_i \in (0, 1)$

### 🐍 Python:

```python
def binary_cross_entropy(y_true, y_pred, epsilon=1e-15):
    y_pred = np.clip(y_pred, epsilon, 1 - epsilon)  # avoid log(0)
    return -np.mean(y_true * np.log(y_pred) + (1 - y_true) * np.log(1 - y_pred))
```

---

## 📘 2) **Hinge Loss** (for SVM)

### 🔸 Formula (for binary classification with labels $y_i \in \{-1, 1\}$):

$$
\text{Hinge} = \frac{1}{n} \sum_{i=1}^{n} \max(0, 1 - y_i \cdot \hat{y}_i)
$$

Where:

* $\hat{y}_i$ is the raw output score (not probability)

### 🐍 Python:

```python
def hinge_loss(y_true, y_pred):
    # y_true should be -1 or 1
    return np.mean(np.maximum(0, 1 - y_true * y_pred))
```

---

## 📘 3) **Cross-Entropy Loss (Multiclass)**

### 🔸 Formula:

$$
\text{CrossEntropy} = -\sum_{i=1}^{n} \sum_{j=1}^{C} y_{ij} \log(\hat{y}_{ij})
$$

Where:

* $y_{ij}$ is 1 for the correct class, 0 otherwise (one-hot)
* $\hat{y}_{ij}$ is the predicted probability for class $j$

### 🐍 Python:

```python
def cross_entropy_loss(y_true, y_pred, epsilon=1e-15):
    y_pred = np.clip(y_pred, epsilon, 1 - epsilon)
    return -np.sum(y_true * np.log(y_pred)) / y_true.shape[0]
```

---

## 📘 4) **KL Divergence**

### 🔸 Formula:

$$
D_{\text{KL}}(P \parallel Q) = \sum_{i=1}^{n} P(i) \log\left( \frac{P(i)}{Q(i)} \right)
$$

Where:

* $P$ is the true distribution (e.g., one-hot or soft targets)
* $Q$ is the predicted distribution

### 🐍 Python:

```python
def kl_divergence(p_true, q_pred, epsilon=1e-15):
    p_true = np.clip(p_true, epsilon, 1)
    q_pred = np.clip(q_pred, epsilon, 1)
    return np.sum(p_true * np.log(p_true / q_pred)) / p_true.shape[0]
```

---

### ✅ Example Usage:

```python
import numpy as np

# For BCE
y_true_b = np.array([1, 0, 1, 1])
y_pred_b = np.array([0.9, 0.2, 0.8, 0.7])

# For hinge
y_true_h = np.array([1, -1, 1])
y_pred_h = np.array([0.8, -0.5, 0.3])  # raw scores

# For Cross-Entropy & KL
y_true_c = np.array([[1, 0, 0], [0, 1, 0]])  # one-hot
y_pred_c = np.array([[0.7, 0.2, 0.1], [0.1, 0.85, 0.05]])  # probabilities

# Results
print("Binary Cross Entropy:", binary_cross_entropy(y_true_b, y_pred_b))
print("Hinge Loss:", hinge_loss(y_true_h, y_pred_h))
print("Cross-Entropy Loss:", cross_entropy_loss(y_true_c, y_pred_c))
print("KL Divergence:", kl_divergence(y_true_c, y_pred_c))
```

---

