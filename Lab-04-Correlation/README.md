## OBJECTIVE

To study discrete-time correlation and apply it to real data to observe the correlation between two signals.

---

## THEORY

The cross-correlation of two discrete-time signals is defined as:

$$
r_{xy}(l)=\sum_{n=-\infty}^{\infty}x(n)y(n-l)
$$

Equivalently,

$$
r_{xy}(l)=\sum_{n=-\infty}^{\infty}x(n+l)y(n)
$$

### 1. Cross-Correlation

The correlation function measures the similarity between two signals as a function of lag $l$. The correlation between $y(n)$ and $x(n)$ is given by:

$$
r_{yx}(l)=\sum_{n=-\infty}^{\infty}y(n)x(n-l)
$$

Equivalently,

$$
r_{yx}(l)=\sum_{n=-\infty}^{\infty}y(n+l)x(n)
$$

### 2. Symmetry Property

In general,

$$
r_{xy}(l)\neq r_{yx}(l)
$$

For real-valued signals,

$$
r_{xy}(l)=r_{yx}(-l)
$$

If $x(n)=y(n)$, the cross-correlation becomes the autocorrelation function, which is even symmetric:

$$
r_{xx}(l)=r_{xx}(-l)
$$

### 3. Length of the Correlation Sequence

If two finite-length signals have lengths $N$ and $M$, then the resulting correlation sequence has length

$$
L=N+M-1
$$

### 4. Correlation Using Convolution

Cross-correlation can be computed using convolution by reversing one of the signals before applying convolution:

$$
r_{xy}(l)=x(l)*y(-l)
$$

where $*$ denotes convolution.

---

## KEY OBSERVATIONS

- Cross-correlation measures the degree of similarity between two signals.
- The correlation value depends on the relative shift (lag) between the signals.
- For real-valued signals,

  $$
  r_{xy}(l)=r_{yx}(-l)
  $$

- Autocorrelation is a special case of cross-correlation where the two signals are identical.
- The autocorrelation function is always symmetric about the origin.

---

## CONCLUSION

Correlation is an important tool in Digital Signal Processing for measuring similarity between signals, identifying delays, detecting patterns, and analyzing signal behavior. The experiment demonstrates both the mathematical properties and practical implementation of correlation for discrete-time signals.
