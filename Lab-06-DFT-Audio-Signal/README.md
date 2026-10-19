# Lab Session 06

## Objective

To identify the different frequency components present in an audio signal and plot its frequency spectrum using the Discrete Fourier Transform (DFT).

## Theory

- **Discrete Fourier Transform (DFT):** The DFT converts a discrete-time signal from the time domain into the frequency domain.

  $$
  X(k) = \sum_{n=0}^{N-1} x(n)e^{-j2\pi kn/N}
  $$

- **Inverse Discrete Fourier Transform (IDFT):** The IDFT reconstructs the original time-domain signal from its frequency-domain representation.

  $$
  x(n) = \frac{1}{N}\sum_{k=0}^{N-1} X(k)e^{j2\pi kn/N}
  $$

- **Frequency Resolution:** The frequency resolution is the spacing between consecutive frequency bins.

  $$
  \Delta F = \frac{F_s}{N}
  $$

- **Frequency Vector:** The frequency corresponding to each DFT bin is given by:

  $$
  F_k = k\Delta F, \quad k = 0,1,\ldots,N-1
  $$

- **Fast Fourier Transform (FFT):** FFT is an efficient algorithm used to calculate the DFT of a signal.

- **Magnitude Spectrum:** The magnitude spectrum, represented by \( |X(k)| \), indicates the magnitude of each frequency component.

- **Nyquist Frequency:** For a real-valued sampled signal, the Nyquist frequency is half the sampling frequency.

  $$
  F_{\text{Nyquist}} = \frac{F_s}{2}
  $$

## Result

The frequency components of the audio signal are analyzed using the DFT, and the magnitude spectrum is plotted against frequency.
