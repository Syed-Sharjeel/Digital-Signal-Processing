## 1. Z-Transform

The Z-transform is a mathematical technique used in Digital Signal Processing (DSP) to convert a discrete-time signal from the time domain into the complex frequency domain. It is used to analyze the behavior, stability, and frequency characteristics of discrete-time systems.

The Z-transform of a discrete-time signal $x[n]$ is defined as:

$$
\boxed{X(z)=\sum_{n=-\infty}^{\infty}x[n]z^{-n}}
$$

Where:

- $x[n]$ is the discrete-time signal.
- $z$ is a complex variable.
- $n$ is the discrete-time index.

The complex variable $z$ is expressed as:

$$
z=re^{j\omega}
$$

where $r$ represents the magnitude and $\omega$ represents the angle.

## 2. Z-Plane

The Z-plane is a two-dimensional complex plane used to represent the complex variable $z$. It consists of a real axis and an imaginary axis.

The Z-plane is used to visualize the locations of poles and zeros of a discrete-time system. The magnitude of $z$ determines its radial distance from the origin, while its angle determines its angular position.

The unit circle is particularly important because the frequency response of a discrete-time system is obtained by evaluating its transfer function on the unit circle.

$$
z=e^{j\omega}, \qquad |z|=1
$$

## 3. Regions of the Z-Plane

The Z-plane is divided into three important regions based on the magnitude of $z$:

- Inside the Unit Circle:

$$
|z|<1
$$

All points have a magnitude less than one.

- On the Unit Circle:

$$
|z|=1
$$

All points have a magnitude equal to one. This region represents the frequency response of a discrete-time system.

- Outside the Unit Circle:

$$
|z|>1
$$

All points have a magnitude greater than one.

## 4. Stability Based on Pole Locations

The stability of a discrete-time system depends on the locations of its poles in the Z-plane. For a causal rational system, the following conditions apply:

- Stable System: If all poles lie strictly inside the unit circle, the system is BIBO stable. Its impulse response decays with time.

- Unstable System: If at least one uncancelled pole lies outside the unit circle, the system is unstable. Its impulse response generally grows with time.

- Poles on the Unit Circle: A causal system with uncancelled poles on the unit circle is not BIBO stable. Simple poles may produce sustained oscillations, whereas repeated poles generally produce growing oscillations.

Digital Filters: FIR and IIR | Tutorials on Electronics | Next Electronics

Important: Stability is determined by pole locations, not zero locations. For a causal rational system, all poles must lie strictly inside the unit circle for BIBO stability.
