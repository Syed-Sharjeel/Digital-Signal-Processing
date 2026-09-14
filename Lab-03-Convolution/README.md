# Lab Session 03: Signal Processing & Convolution

## Objective
To study impulse response, observe convolution technique in signal processing, and verify different properties like causality, commutative, distributive, and associative properties.

---

## Key Theoretical Concepts

### 1. Convolution Formula
The discrete-time convolution of an input signal $x(n)$ with an impulse response $h(n)$ is defined as:

$$y(n) = x(n) * h(n) = \sum_{k=-\infty}^{\infty} x(k)h(n-k) = \sum_{k=-\infty}^{\infty} h(k)x(n-k)$$

* Convolution allows for computing the output response $y(n)$ to a given input $x(n)$ when the system impulse response $h(n)$ is known.
* Convolution inherently holds the **commutative property**: $x(n) * h(n) = h(n) * x(n)$.

### 2. Output Sequence Length
If the lengths of two convolved signals $x(n)$ and $h(n)$ are $N$ and $M$ respectively, the length of the resulting convolution sequence $y(n)$ is:

$$\text{Length} = N + M - 1$$

### 3. System Causality
In a causal system, the output depends only on past and/or present input values—never on future values. Consequently, the impulse response $h(n)$ for any causal system exists only for $n \ge 0$.

---

## Lab Exercises & Verification Tasks

1. **Impulse Input Observation:**
   * Evaluate system behavior when inputting $x(n) = \{0, 0, \underset{\uparrow}{1}, 0, 0\}$ (where the arrow indicates $n=0$).
2. **Commutative Property Verification:**
   * Prove experimentally or programmatically that $x(n) * h(n) = h(n) * x(n)$.
3. **Associative & Distributive Properties:**
   * Modify the simulation code to prove:
     * **Associative:** $[x(n) * h_1(n)] * h_2(n) = x(n) * [h_1(n) * h_2(n)]$
     * **Distributive:** $x(n) * [h_1(n) + h_2(n)] = [x(n) * h_1(n)] + [x(n) * h_2(n)]$
4. **Audio Signal Processing Task:**
   * Record a custom audio file and convolve it with `drumloop.wav`.
   * **Deliverables:**
     * Plot the resulting convolved audio signal.
     * Listen to the convolved output audio and document your observations.
