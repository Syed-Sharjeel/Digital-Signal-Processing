# Implementation of Discrete Fourier Transform (DFT) and Inverse Fourier Transform (IDFT) Using Twiddle Factors

This document outlines the theoretical concepts, mathematical definitions, matrix formulations.

---

## 1. Core Concepts & Definitions

### Discrete Fourier Transform (DFT)
The **Discrete Fourier Transform** converts a finite sequence of equally spaced time-domain samples into a discrete frequency-domain representation. It reveals the underlying frequency components of a discrete signal, allowing us to analyze signals in the frequency domain.

* **Definition:** A mathematical transformation that maps time-domain data into its corresponding frequency spectrum components.
* **Formula:**
  $$X(K) = \sum_{n=0}^{N-1} x(n) W_N^{kn} \quad ; \quad k=0,1,\dots,N-1$$

### Inverse Discrete Fourier Transform (IDFT)
The **Inverse Discrete Fourier Transform** performs the reverse operation of the DFT. It takes the frequency-domain representation and reconstructs the original time-domain signal.

* **Definition:** A transformation that reconstructs a time-domain signal back from its frequency-domain components.
* **Formula:**
  $$x(n) = \frac{1}{N} \sum_{k=0}^{N-1} X(k) W_N^{-kn} \quad ; \quad n=0,1,\dots,N-1$$

### Twiddle Factor ($W_N$)
The **Twiddle Factor** is the complex exponential coefficient used in DFT and Fast Fourier Transform (FFT) algorithms. It represents the $N$-th roots of unity, enabling computational efficiency through its symmetry and periodicity properties.

* **Definition:** A complex multiplier used in transform algorithms to rotate vectors in the complex plane.
* **Formulas:**
  $$W_N = e^{\frac{-j2\pi}{N}}$$
  $$W_N^{kn} = e^{\frac{-j2\pi kn}{N}}$$

### Matrix Representation
Both DFT and IDFT can be expressed compactly using linear algebra via matrix-vector multiplication. The transform matrix is populated by powers of the twiddle factor.

* **DFT Matrix Equation:** 
  $$X_N = [W_N^{kn}] x_N$$
* **IDFT Matrix Equation:** 
  $$x_N = [W_N^{kn}]^{-1} X_N$$

---
