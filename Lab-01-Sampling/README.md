## 📖 Theory

A **continuous-time (analog) signal** exists at every instant of time, whereas a **discrete-time signal** consists of samples taken at specific time intervals. Converting an analog signal into a digital signal involves two main steps:

- **Sampling:** Recording the signal at discrete time intervals.
- **Quantization:** Converting sampled amplitudes into a finite number of digital levels.

The normalized discrete frequency is given by

$$
f_d=\frac{F}{F_s}
$$

where:

- **\(F\)** = Signal frequency (Hz)
- **\(F_s\)** = Sampling frequency (Hz)
- **\(f_d\)** = Normalized frequency (cycles/sample)

According to the **Sampling (Nyquist) Theorem**, a signal can be perfectly reconstructed if

$$
F_s \geq 2F
$$

where \(2F\) is called the **Nyquist Rate**.

If the sampling frequency is below the Nyquist rate,

$$
F_s < 2F
$$

aliasing occurs, causing different frequency components to overlap and resulting in distortion in the reconstructed signal.
