# Lab Session 07: Analysis of $s$-Plane, Frequency Response, and System Stability

## 🎯 Objective
- To study the **$s$-plane** representation of continuous-time signals and systems.
- To plot the **impulse response** and **frequency response** for different pole-zero locations in the $s$-plane.
- To determine whether a continuous-time system is **Finite Impulse Response (FIR)** or **Infinite Impulse Response (IIR)**.

---

## 📖 Theoretical Background

### 1. The Laplace Transform
The Laplace Transform of a continuous-time signal $x(t)$ is defined as:

$$
X(s) = \int_{-\infty}^{\infty} x(t) e^{-st} \, dt
$$

where $s$ is a complex frequency variable defined in rectangular form as:

$$s = \sigma + j\omega$$

- **$\sigma$**: Real part (attenuation/damping factor)
- **$\omega$**: Imaginary part (angular frequency)

---

### 2. Relationship between Laplace Transform and CTFT
The Continuous-Time Fourier Transform (CTFT) is a special case (subset) of the Laplace transform evaluated along the imaginary axis where the real part is zero ($\sigma = 0$):

$$X(j\omega) = \left. X(s) \right|_{s = j\omega}$$

Because the attenuation parameter $\sigma$ is absent in CTFT ($\sigma = 0$), stability information for continuous-time systems cannot be fully inferred from CTFT alone; it requires the full $s$-domain (Laplace transform) representation.

---

### 3. Pole Location & System Stability

System stability in continuous-time systems depends on the location of the poles relative to the imaginary axis ($j\omega$-axis) in the $s$-plane:

| Pole Location | System Stability | Behavior |
| :--- | :--- | :--- |
| **Left-Half Side (L.H.S)** ($\sigma < 0$) | **Stable** | Impulse response decays exponentially to zero as $t \to \infty$. |
| **Right-Half Side (R.H.S)** ($\sigma > 0$) | **Unstable** | Impulse response grows exponentially as $t \to \infty$. |
| **On the $j\omega$-axis** ($\sigma = 0$) | **Marginally Stable / Oscillatory** | Impulse response maintains continuous sustained oscillations or stays constant. |

---

### 4. Classification: FIR vs. IIR Continuous Systems

- **Finite Impulse Response (FIR) Systems**:
  - The impulse response $h(t)$ is strictly bounded to a finite duration.
  - **Always stable** as all poles lie in the left-half of the $s$-plane.

- **Infinite Impulse Response (IIR) Systems**:
  - The impulse response $h(t)$ extends indefinitely in time.
  - **Can be stable or unstable**, depending on whether all poles lie strictly in the L.H.S of the $s$-plane.

---

## 🔬 Experimental Procedure

1. **Pole-Zero Mapping**: Generate the pole-zero constellation in the $s$-plane.
2. **Frequency Response Plotting**: Plot the corresponding frequency (Bode magnitude) response.
3. **Impulse Response & Classification**: Plot the impulse response $h(t)$ and determine whether the system is FIR or IIR.
4. **Parameter Manipulation**: Modify pole locations in the $s$-plane to observe corresponding shifts in frequency and impulse responses.
