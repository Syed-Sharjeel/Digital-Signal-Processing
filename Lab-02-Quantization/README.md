# Lab Session 02

## Objective:

To observe the quantization effects on sampled signals and to understand how quantization leads to quantization error. In this lab, we will investigate the influence of the number of quantization levels on the quality of digitized signal. Method of selection of ADC is also a part of this lab session.

## Theory:

Everything stored on a computer is discrete time discrete valued signal. Because computer has finite number of registers andThis lab document explores digital signal processing concepts, specifically **quantization effects**, **bit depth**, **quantization error**, and **Signal-to-Quantization-Noise Ratio (SQNR)**.

Below is a detailed summary of the concepts, formulas, and tasks outlined.

---

## Overview of Core Concepts

1. **Sampling vs. Quantization:** Digitizing an analog signal involves two primary steps:
  - *Sampling:* Measuring signal amplitudes at discrete time intervals.
  -  *Quantization:* Mapping continuous amplitude values to a discrete set of numerical values so they can be stored in digital memory.

2. **Bit Depth ($b$):** Refers to the number of bits allocated per sample.
  - The total number of unique discrete quantization levels achievable with $b$ bits is given by:
    $$L = 2^b$$
  For example:
    * An 8-bit depth yields $2^8 = 256$ discrete levels.
    * A 16-bit depth yields $2^{16} = 65,536$ discrete levels.

3. **Quantization Error ($X_e[n]$):** The numerical difference between the quantized sample value ($X_q[n]$) and the original sample value ($x[n]$):
$$X_e[n] = X_q[n] - x[n]$$

---

## Mathematical Formulas

 1. **Signal Power ($P_x$):**
 
  $$
   P_x = \frac{1}{N} \sum_{n=0}^{N-1} |x[n]|^2
  $$
  
2. **Quantization Noise Power ($P_e$):**

  $$
   P_e = \frac{1}{N} \sum_{n=0}^{N-1} |x_e[n]|^2
      = \frac{1}{N} \sum_{n=0}^{N-1} |x_q[n] - x[n]|^2
  $$
   
3. **Signal-to-Quantization-Noise Ratio ($\text{SQNR}_{\text{A/D}}$):**
    
  $$
   \text{SQNR}_{\text{A/D}}
      = 10 \log_{10}\left(\frac{P_x}{P_e}\right)
   $$

---

**Summary of Lab Tasks**

* **Task 1: Effects of Quantization with Variable Precision Levels**
  * Generate a composite discrete-time continuous-value (DTCV) signal formed by frequencies $f_{d1} = 125\text{ samples/sec}$ and $f_{d2} = 150\text{ samples/sec}$ with a total duration of 250 samples.
  * Accept precision depth and quantization method (`round`, `floor`, or `ceil`) as user inputs.
  * Compute and output the quantization error signal and resulting SQNR.

* **Task 2: Quantization of a Simple Sinusoid Across Multiple Bit Depths**
  * Generate a $100\text{ Hz}$ sine wave sampled at $10,000\text{ samples/sec}$.
  * Quantize the signal using varying bit depths from 1 bit/sample up to 8 bits/sample.
  * Plot and display the resulting quantized signals in a multi-column format.

* **Task 3: Audio Signal Quantization and Quality Assessment**
  * Load a recorded voice audio signal.
  * Quantize the audio at bit depths from 1 bit up to 4 bits per sample.
  * Listen to the resulting audio outputs to observe perceptual quality degradation and determine the minimum bit depth required for acceptable audio clarity.
