# Lab Session 06

**Objective**

To identify the different frequency components present in an audio signal and plot its frequency spectrum using the Discrete Fourier Transform (DFT).

**Theory**

- **Discrete Fourier Transform (DFT):** The DFT converts a discrete-time signal from the time domain into the frequency domain, allowing its frequency components to be analyzed.
  
  $$
  X(k)=\sum_{n=0}^{N-1}x(n)e^{-j2\pi kn/N}
  $$
  
- **Inverse Discrete Fourier Transform (IDFT):** The IDFT reconstructs the original time-domain signal from its frequency-domain representation.
  
  $$
  x(n)=\frac{1}{N}\sum_{k=0}^{N-1}X(k)e^{j2\pi kn/N}
  $$

- **Frequency Resolution:** The frequency resolution represents the spacing between consecutive frequency bins and is given by:
  
  $$
  \Delta F=\frac{F_s}{N}
  $$

- **Frequency Vector:** The frequency corresponding to each DFT bin is calculated as:
 
  $$
  F_k=k\Delta F,\quad k=0,1,\ldots,N-1
  $$

- **Fast Fourier Transform (FFT):** FFT is an efficient algorithm used to compute the DFT of a signal.
- **Magnitude Spectrum:** The magnitude spectrum, $|X(k)|$, represents the strength of the frequency components present in the signal.
- **Nyquist Frequency:** The maximum frequency displayed for the positive-frequency spectrum of a real-valued sampled signal is generally half the sampling frequency.

  $$
  F_{\text{Nyquist}}=\frac{F_s}{2}
  $$

**Result**

The frequency components of the audio signal are analyzed using the DFT, and its magnitude spectrum is plotted against frequency.
