# Classification: 
<br />
1) BCE: Used for binary classification tasks. Measures the dissimilarity between predicted probabilities and true binary labels, through the logarithmic loss.

2) Hinge loss: Penalizes both wrong and right (but less confident) predictions). It is based on the concept of margin, which represents the distance between a data point and the decision boundary. Particularly used to train support vector machines (SVMs).

3) Cross-entropy loss: An extension of BCE loss to multi-class classification tasks.

4) KL Divergence: Measure information lost when one distribution is approximated using another distribution. For classification, however, using KL divergence is the same as minimizing cross entropy. Thus, it is recommended to use cross-entropy loss directly. It is used in t-SNE and knowledge distillation for model compression.