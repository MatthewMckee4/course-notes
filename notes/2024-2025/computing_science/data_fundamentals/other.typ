#set document(title: "Data Fundamentals Definitions")
#set page(margin: 20pt)
#set par(spacing: 0.55em)


= Probability 2 #text(size: 10pt, gray)[Week 9]

*support* the range of values that a random variable can take -- can be compact (finite) or infinite

*compact support* values within a specific, finite range

*infinite support* values that extend infinitely, without any upper or lower bounds

*semi-infinite support* values that extend infinitely in one direction, but are bounded in the other direction (e.g. 0 to infinity)

*probability density function (pdf)* a function that describes the likelihood of a continuous random variable taking a specific value -- represents densities, not probabilities

*meaning of density versus probability* pdf values indicate relative concentration of probabilities, whereas probabilities represent the integral of the pdf over a range of values

*cumulative distribution function (cdf)* a function that gives the probability that a random variable takes a value less than or equal to a given value

*continuous random variables* variables that can take any real value within a given range

*issues with continuous random variables* the inability to assign probabilities to individual outcomes due to infinite possibilities

*uniform distribution* probability distribution where every outcome is equally likely

*multivariate distributions* probability distributions over vector spaces

*univariate normal* the normal distribution for a single random variable with mean (μ) and variance (σ^2)

*properties of the normal distribution* bell-shaped, symmetric, characterized by mean and variance

*multivariate normal* probability distribution over a real vector space, represented by a mean vector and covariance matrix

*mean vector* the expected values for each variable in a multivariate normal distribution

*covariance matrix* measures the strength and direction of linear relationships between variables in a normal distribution

*central limit theorem (CLT)* a fundamental theorem in probability theory stating that the distribution of the sum (or average) of a large number of independent, identically distributed random variables approaches a normal distribution, regardless of the original distribution of the variables

*conditions for CLT* 1. The random variables must be independent. 2. The random variables must be identically distributed. 3. The sample size must be sufficiently large.

*sampling distribution* the distribution of a statistic (e.g., mean or sum) calculated from a sample as the sample size increases, following the CLT

*population distribution* the distribution of values in the entire population from which a sample is drawn

*standard error* the standard deviation of a sampling distribution, representing the variability of sample means around the population mean

*implications of CLT* 1. Allows the use of normal distribution approximations in various statistical analyses. 2. Justifies hypothesis testing and confidence interval construction for various sample statistics.

*importance in inferential statistics* enables making inferences about population parameters based on sample statistics, assuming the sample size is large enough

*limitations of CLT* may not apply if the sample size is small or the underlying population distribution has heavy tails or is not well-behaved

*population* the entire set of individuals, objects, or measurements of interest to a particular study

*sample* a subset of individuals, objects, or measurements selected from a population for the purpose of making inferences about the population

*random sampling* the process of selecting a sample from a population in such a way that every possible sample of a given size has an equal chance of being chosen

*sampling bias* occurs when the method of selecting a sample causes the sample to be unrepresentative of the population, leading to skewed or inaccurate results

*representative sample* a sample that accurately reflects the characteristics of the population from which it is drawn

*sampling error* the difference between a sample statistic and the corresponding population parameter caused by chance variation in the selection of the sample

*population parameter* a numerical measure that describes an aspect of a population, such as a mean or proportion

*sample statistic* a numerical measure that describes an aspect of a sample, such as a sample mean or sample proportion

*inference* the process of drawing conclusions or making predictions about a population based on information obtained from a sample

*generalizability* the extent to which the findings from a sample can be applied to the larger population

*varieties of inference*  direct, maximum likelihood estimation, and Bayesian

*direct inference* making conclusions about population parameters based on observed sample statistics without formal statistical methods

*maximum likelihood estimation (MLE)* a method of estimating the parameters of a statistical model by maximizing the likelihood function, representing the probability of observed data given the parameters

*likelihood function* the probability of observing the given data for different values of the parameters in a statistical model

*Bayesian inference* a method of statistical inference in which Bayes' theorem is used to update the probability for a hypothesis as more evidence or information becomes available

*prior probability* the initial probability assigned to a hypothesis before considering the observed data in Bayesian inference

*likelihood* the probability of observing the given data for a specific set of parameters in Bayesian inference

*posterior probability* the updated probability of a hypothesis after considering the observed data in Bayesian inference, obtained by combining the prior probability and the likelihood

*Bayes' theorem* a mathematical formula that describes the relationship between the prior probability, likelihood, and posterior probability in Bayesian inference

*advantages of Bayesian inference* incorporates prior knowledge, provides a coherent framework for decision-making, and handles small sample sizes well

*disadvantages of Bayesian inference* requires specifying a prior distribution, can be computationally intensive, and interpretation of subjective priors can be challenging

*probabilistic programming* a programming paradigm that allows the incorporation of probability distributions and Bayesian inference into computer programs, enabling modeling of complex, uncertain systems

*Markov Chain Monte Carlo (MCMC)* a computational method used for sampling from complex probability distributions, especially in Bayesian inference

*MCMC algorithm steps* 1. Start with an initial state. 2. Propose a new state based on a transition probability. 3. Accept or reject the new state based on acceptance probability. 4. Repeat steps 2-3 to generate a chain of states.

*Metropolis-Hastings algorithm* an MCMC algorithm that generalizes the basic MCMC approach by using a proposal distribution and an acceptance probability to generate a Markov chain

*Burn-in period* initial phase of an MCMC simulation where the chain stabilizes and reaches the target distribution, discarding the samples generated during this phase

*thinning*  the process of discarding some of the samples generated by an MCMC simulation to improve convergence

*convergence diagnostics* methods used to assess whether an MCMC chain has reached the target distribution, ensuring accurate inference

*probabilistic programming language* a programming language designed specifically for expressing probabilistic models, making it easier to define and manipulate complex probability distributions

*advantages of probabilistic programming* facilitates rapid prototyping of Bayesian models, enables easy model modification, and supports complex, hierarchical models

*limitations of MCMC* computationally intensive, sensitive to the choice of initial conditions, and might require a large number of iterations to achieve convergence

*posterior distribution*  the probability distribution of the parameters of a statistical model given observed data, obtained by applying Bayes' theorem

*posterior predictive*  the probability distribution of future observations given observed data, obtained by integrating over the posterior distribution of the parameters

*prior predictive*  the probability distribution of future observations given a prior distribution of the parameters, obtained by integrating over the prior distribution

*linear regression by direct estimation*  a method of estimating the parameters of a linear regression model by minimizing the sum of squared errors between the observed and predicted values, e.g. via pseudo-inverse

*linear regression by maximum likelihood estimation*  a method of estimating the parameters of a linear regression model by maximizing the likelihood function, representing the probability of observed data given the parameters (gradient, offset, and variance)

*linear regression by Bayesian inference*  a method of estimating the parameters of a linear regression model by using Bayes' theorem to update the prior probability of the parameters based on the observed data

#pagebreak()

= Digital Signals and Time Series #text(size: 10pt, gray)[Week 10]

*evenly spaced samples* samples taken at regular intervals from a continuous signal

*consistent quantization* uniform assignment of digital values to analog signal levels

*quantization levels* number of distinct amplitude values in a digital signal

*quantization noise* error introduced due to the finite number of quantization levels

*sampling rate* number of samples taken per unit of time from a continuous signal

*Nyquist rate* minimum sampling rate required to accurately represent a signal without aliasing

*aliasing* artifacts caused by undersampling, creating false frequencies in the reconstructed signal

*aliasing effects* misinterpretation of high-frequency signals as low-frequency signals in the sampled data

*aliasing mitigation* preventing aliasing by using a sampling rate higher than the Nyquist rate

*SNR (Signal-to-Noise Ratio) formula* $"SNR" = 20 * log(10)$ (Amplitude of Signal / RMS Noise Amplitude)

*Frequency of aliased components formula* $"Aliased Frequency" = |k * "Sampling Frequency" - "Original Frequency"|$

*Quantization SNR formula* $"Quantization SNR" = 6.02 * ("Number of Bits") + 1.76 "dB"$

*interpolation of irregular data* estimating unknown data points within a dataset with irregularly spaced points

*common interpolation methods* linear, polynomial, sinc, and nearest-neighbor interpolation

*linear interpolation* estimating unknown values by connecting adjacent known data points with straight lines

*polynomial interpolation* approximating data points using a polynomial equation fitted to neighboring points

*nearest-neighbor interpolation* estimating unknown values based on the nearest known data point

*resampling* process of changing the sampling rate of a signal, altering the number of samples per unit time

*sliding window technique* a method to analyze data within a fixed-size window that slides over the dataset

*running mean* average computed over a fixed-size window as it moves through the data

*moving average* series of averages calculated from different subsets of the dataset, useful for smoothing

*linear filtering* process of modifying an input signal using a linear operation (a weighted sum), producing an output signal

*weighted averages* calculations that assign different weights to values in a window when computing a moving average

*convolution* mathematical operation combining two functions to produce a third, by multiplying and summing

*convolution in signal processing* process of combining input signal and filter kernel to create an output signal

*linear filtering using convolution* applying a filter kernel to input signal via convolution to obtain filtered output

*convolution formula* $(f * g)(t) = integral_(-infinity)^infinity f(tau) * g(t - tau) "d"tau$, where $*$ denotes convolution

*convolution properties* commutativity, associativity, distributivity, and identity element exist in convolution

*common types of filters* low-pass, high-pass, and band-pass filters

*low-pass filter* allows low-frequency components to pass through while attenuating high-frequency components

*high-pass filter* allows high-frequency components to pass through while attenuating low-frequency components

*band-pass filter* allows a specific range of frequencies to pass through, attenuating others

*kernel*  array of coefficients used in linear filtering to modify the input signal. We convolve a signal with a kernel specifying a filter.

*filter kernel coefficients* weights assigned to each element of the kernel, affecting the filter's behavior

*filter design* process of selecting kernel size and coefficients to achieve desired filtering effect

*impulse response* the output of a system when an impulse signal (Dirac delta function) is applied as input

*impulse response function* representation of a system's output in response to an impulse signal

*impulse response recovery* process of determining a system's behavior by analyzing its impulse response

*impulse response recovery methods* deconvolution techniques, Fourier transform, and inverse filtering

*deconvolution* mathematical operation used to recover the original signal from its convolution with an impulse response

*impulse response recovery challenges* noise interference, finite duration of signals, and ill-conditioned systems

*Dirac delta function* mathematical function representing an idealized impulse at a single point in space or time ("spike" function)

*properties of Dirac delta function* integral over the entire real line is 1, and it is zero everywhere except at 0

*Dirac delta in convolution*  Dirac delta function is the identity element in convolution, i.e. $f * delta = f$

*nonlinear filtering* filtering technique where the computation is anything other than a weighted sum

*median filtering* nonlinear filtering method where the output is the median value of the neighboring elements in the window

*advantages of median filtering* eliminates spike noise, preserves edges, and is computationally efficient

*pure frequencies* signals consisting of a single frequency without any harmonics or overtones

*sinusoids* signals characterized by a sinusoidal waveform, represented as $A * sin(2pi * f * t + phi)$, where $A$ is amplitude, $f$ is frequency, $t$ is time, and $phi$ is phase angle

*amplitude of a sinusoid* maximum displacement of the waveform from its equilibrium position

*frequency of a sinusoid* number of complete cycles occurring in one unit of time, measured in Hertz (Hz)

*phase angle of a sinusoid* offset in the horizontal direction, indicating the starting point of the waveform

*Fourier Transform* mathematical technique that transforms a time-domain signal into its frequency components

*continuous Fourier Transform equation* $F(omega) = integral_(-infinity)^infinity f(t) * e^(-j * omega * t) "d"t$, where $F(omega)$ represents the frequency spectrum of $f(t)$

*Discrete Fourier Transform (DFT)* discretized version of the Fourier Transform, applied to sampled, discrete-time signals

*DFT equation* $X(k) = sum_(n=0)^(N-1) x(n) * e^(-j * (2pi/N) * k * n)$, where $X(k)$ represents the frequency component at index $k$. $X(k)$ is a complex number with magnitude and phase.

*Complex number*  a number that can be expressed in the form a + bi, where a and b are real numbers, and i is the imaginary unit, satisfying i^2 = -1

*magnitude and phase angle*  two components of a complex number, representing its amplitude and phase angle. Amplitude = sqrt(a^2 + b^2), Phase = arctan(b/a)

*Argand diagram*  a graphical representation of complex numbers as points in the complex plane, with the real part on the x-axis and the imaginary part on the y-axis

*Fast Fourier Transform (FFT)* algorithm for efficiently computing the Discrete Fourier Transform, reducing time complexity from O(N^2) to O(N log N)

*time complexity of DFT* O(N^2), where N is the number of samples in the input signal

*time complexity of FFT* O(N log N), significantly faster than the naive DFT calculation

*Inverse Discrete Fourier Transform (IDFT)* transforms frequency-domain representation back to time domain

*IDFT equation* $x(n) = (1/N) * sum_(k=0)^(N-1) X(k) * e^(j * (2pi/N) * k * n)$, where $x(n)$ is the reconstructed time-domain signal

*spatial domain* representation of a signal in terms of its amplitude at various points in space or time

*frequency domain* representation of a signal in terms of its frequency components and their amplitudes

*convolution theorem* states that convolution in the time domain is equivalent to multiplication in the frequency domain

*implications of the convolution theorem* filtering in the frequency domain is computationally efficient, and convolution in time domain can be avoided

*filter design with DFT* designing filters by manipulating their frequency response in the frequency domain

*steps for filter design using DFT* 1. Determine desired frequency response 2. Compute inverse DFT to get filter coefficients 3. Apply these coefficients for convolution

*frequency response* representation of a filter's behavior as a function of frequency, showing how it affects different frequencies

*sinc interpolation* interpolation technique that uses sinc function as the interpolation kernel

*sinc function* mathematical function defined as sinc(x) = sin(πx) / (πx), with a central peak at x = 0 and zeros at other integers

*ideal interpolation kernel* the sinc function, providing perfect reconstruction of the original signal without distortion

*sinc interpolation process* multiply input samples with sinc function, summing the results to obtain interpolated values

*limitations of sinc interpolation* computational intensity due to infinite support, requires truncation or windowing for practical implementation

*windowing functions* mathematical functions used to taper the edges of a signal before applying Fourier analysis or other algorithms

*use of windowing functions* minimizing spectral leakage, improving frequency resolution, and reducing artifacts in Fourier analysis

*application of windowing functions* applied to time-domain signals before performing Fourier Transform or other frequency analysis methods

*lobes* distinct sections in the frequency spectrum of a signal or a windowing function

*main lobe* central and largest lobe in the frequency spectrum, containing the primary frequency content of the signal

*sidelobes* smaller lobes on both sides of the main lobe in the frequency spectrum

*sidelobe level* amplitude of the sidelobes relative to the main lobe, indicating the extent of spectral leakage

*spectral leakage* phenomenon where signal energy spreads into adjacent frequency bins, causing inaccuracies in frequency analysis

*windowing to reduce sidelobes* applying window functions helps reduce sidelobe levels, minimizing spectral leakage and improving frequency analysis accuracy

*spectrum* representation of a signal's frequency content, showing the amplitudes and phases of each frequency component

*magnitude spectrum* computing the absolute values of the Fourier Transform coefficients

*phase spectrum* computing the angles (phases) of the Fourier Transform coefficients

*importance of magnitude spectrum* determines the amplitudes of frequency components, vital in applications like filtering and modulation

*importance of phase spectrum* determines the relative positions/offsets of frequency components, vital in applications like signal reconstruction