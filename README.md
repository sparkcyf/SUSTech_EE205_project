# EE205 Signals and Systems

This repository contains the final project of the **Signal and System** course opened by Southern University of Science and Technology in 2019Fall.

本Repository包含了南方科技大学于2019年秋季开设的**信号与系统**课程的期末Project。

You can check the **report.pdf** in the project folder for more information.

## Project 1: Speech Synthesis And Perception With Envelope Cue

The first project provide a multi-band envelope cues that could synthesize a speech signal, which can split the audio samples into various part using the band pass ﬁlter, with rectiﬁcation Low Pass Filter followed, ﬁnally with frequency shift to rebuild the signal.

## Project 2: OFDM Technology

The second project contains three blocks: OFDM transmitter, OFDM receiver and the corresponding DAC and transmitter radio frequency front end.

### Block 1 & 2

 In block 1 OFDM transmitter, we use IFFT to substitute the way of assigning sub-signals to carriers with diﬀerent frequencies. In block 2 OFDM receiver, we use FFT to substitute the way of integrating the received signal for the preparation of demodulation. In other words, block 1 converts the input signal from frequency domain to time domain, then after transmitting, block 2 converts the receiving signal from time domain to frequency domain. Then, we add CP to convert convolution to periodic convolution and avoid inter-symbol interference.

### Block 3

 It includes DAC and transmitter radio frequency front end. DAC transform every impulse in the sample signal into rectangular waves with T extension (T is the sampling period). Next in order to separate the real part and the imaginary part of signal, we multiply the real part by cos(ct) and multiply the imaginary part by sin(ct), and then sum them up for the preparation of transmitting.