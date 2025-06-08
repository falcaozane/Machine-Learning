Here is the extracted content from your uploaded file, formatted and presented in **Markdown**:

---

# Clustering Algorithms and Evaluation

This document provides a comprehensive walkthrough of applying various clustering algorithms (K-Means, DBSCAN, Hierarchical Clustering, and Gaussian Mixture Models) to income data. It also includes preprocessing steps, visualization techniques, and evaluation metrics.

---

## 📥 Loading and Visualizing Data

```python
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.preprocessing import MinMaxScaler
from sklearn.cluster import KMeans, DBSCAN
from sklearn.mixture import GaussianMixture
from sklearn.metrics import silhouette_score, calinski_harabasz_score, davies_bouldin_score

df = pd.read_csv("income.csv")
print(df.head())
```

### 🔍 Initial Scatter Plot

```python
plt.scatter(df.Age, df['Income($)'])
plt.xlabel('Age')
plt.ylabel('Income ($)')
plt.title('Raw Income vs Age')
plt.show()
```

---

## 🧹 Preprocessing with MinMaxScaler

```python
scaler = MinMaxScaler()
df['Income($)'] = scaler.fit_transform(df[['Income($)']])
df['Age'] = scaler.fit_transform(df[['Age']])
X = df[['Age', 'Income($)']]
```

---

## 🧠 Clustering Algorithms

### 1️⃣ K-Means Clustering

```python
kmeans = KMeans(n_clusters=3, random_state=42)
kmeans_labels = kmeans.fit_predict(X)
df['kmeans_cluster'] = kmeans_labels
```

### 2️⃣ DBSCAN

```python
dbscan = DBSCAN(eps=0.3, min_samples=5)
dbscan_labels = dbscan.fit_predict(X)
df['DBSCAN_cluster'] = dbscan_labels
```

### 3️⃣ Hierarchical Clustering

```python
agg = AgglomerativeClustering(n_clusters=3)
agg_labels = agg.fit_predict(X)
df['agg_cluster'] = agg_labels
```

### 4️⃣ Gaussian Mixture Model (GMM)

```python
gmm = GaussianMixture(n_components=3, random_state=42)
gmm_labels = gmm.fit_predict(X)
df['gmm_cluster'] = gmm_labels
```

---

## 📊 Evaluation Metrics

### 📏 Common Unsupervised Evaluation Metrics

| Metric | Description | Best Value |
|--------|-------------|------------|
| Silhouette Score | How similar a point is to its own cluster vs others | Closest to 1 |
| Calinski-Harabasz Index | Between-cluster dispersion vs within-cluster dispersion | Higher better |
| Davies-Bouldin Index | Average similarity between clusters | Lower better |

### 📈 Function to Evaluate Clustering

```python
def evaluate_clustering(X, labels, algorithm_name):
    silhouette = silhouette_score(X, labels)
    calinski = calinski_harabasz_score(X, labels)
    davies = davies_bouldin_score(X, labels)
    print(f"Metrics for {algorithm_name}:")
    print(f"  Silhouette Score: {silhouette:.4f}")
    print(f"  Calinski-Harabasz Index: {calinski:.4f}")
    print(f"  Davies-Bouldin Index: {davies:.4f}")
    print()
```

### 📋 Evaluate All Models

```python
evaluate_clustering(X, kmeans_labels, "K-Means")
evaluate_clustering(X, dbscan_labels, "DBSCAN")
evaluate_clustering(X, agg_labels, "Hierarchical Clustering")
evaluate_clustering(X, gmm_labels, "Gaussian Mixture Models")
```

---

## 🖼️ Visualization of Clusters

```python
def plot_clusters(X, labels, title):
    plt.scatter(X['Age'], X['Income($)'], c=labels, cmap='viridis', s=50)
    plt.title(title)
    plt.xlabel('Age')
    plt.ylabel('Income ($)')
    plt.show()

plot_clusters(X, kmeans_labels, "K-Means Clustering")
plot_clusters(X, dbscan_labels, "DBSCAN Clustering")
plot_clusters(X, agg_labels, "Hierarchical Clustering")
plot_clusters(X, gmm_labels, "Gaussian Mixture Models")
```

---

## 📊 Final Comparison Table

| Algorithm | Cluster Shape | Handles Noise | Scalability | Soft Clustering | Best For |
|----------|----------------|----------------|--------------|------------------|-----------|
| K-Means | Spherical | ❌ | ✅ High | ❌ | Spherical clusters, large datasets |
| DBSCAN | Arbitrary | ✅ | ❌ Medium | ❌ | Irregular shapes, noise handling |
| Hierarchical | Arbitrary | ❌ | ❌ Low | ❌ | Small hierarchical datasets |
| GMM | Elliptical | ❌ | ✅ Medium | ✅ | Overlapping clusters, soft assignment |

---

## 📝 Summary

- **K-Means**: Fast, simple, works well on spherical clusters.
- **DBSCAN**: Finds arbitrary shapes, handles noise, but sensitive to parameter tuning.
- **Hierarchical Clustering**: Visual dendrogram output, not scalable for large data.
- **GMM**: Probabilistic, flexible shapes, slower than K-Means.

---

## 📁 Output DataFrame

```python
df.head()
```

Output:
```
         Age  Income($)  cluster  DBSCAN_cluster  Hierarchical_cluster  GMM_cluster
0  0.375000   0.666667        0              -1                     0            0
1  0.458333   0.703704        0              -1                     0            0
2  0.375000   0.962963        0              -1                     0            0
3  0.333333   0.777778        0              -1                     0            0
4  0.250000   0.481481        0              -1                     0            0
```

---

## 📈 Elbow Method for K-Means

```python
sse = []
for k in range(1, 10):
    km = KMeans(n_clusters=k)
    km.fit(X)
    sse.append(km.inertia_)

plt.plot(range(1,10), sse)
plt.xlabel('K')
plt.ylabel('Sum of Squared Error')
plt.title('Elbow Curve')
plt.show()
```

---
