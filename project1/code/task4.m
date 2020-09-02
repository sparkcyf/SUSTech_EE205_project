clear;
clc;
%read the file and constant
N=20;
f1=200;
f2=7000;
[data,fs]=audioread('C_01_01.wav');
w=linspace(-fs/2,fs/2,length(data));
lpf=[20 50 100 400];
specOfData=fftshift(fft(data))/length(data);
%generate noise
lengthOfData=length(data);
noise=1-2*rand(1,lengthOfData);
sig=repmat(data,1,10);
[pxx,w1]=pwelch(sig,[],[],512,fs);
b=fir2(3000,w1/(fs/2),sqrt(pxx/max(pxx)));
SSN=filter(b,1,noise);
SSN=SSN/norm(SSN)*norm(data)*(10^0.25);%adjust energy density
%if SNR=-5dB the energy of noise is larger than original signal
noisySignal=data+SSN';%add up the original signal and noise signal 
specOfNoise=fftshift(fft(noisySignal))/length(noisySignal);
figure0 = figure;
subplot(2,1,1),plot(w,abs(specOfData)),title('origianl signal'),xlabel('w1');
saveas(figure0,'../fig/task4/orginal.jpg');
subplot(2,1,2),plot(w,abs(specOfNoise)),title('noisy signal'),xlabel('w1');
audiowrite('../audio/task4/Task4_addingNoise_01_original.wav',data,fs);
saveas(figure0,'../fig/task4/orginal+noise.jpg');
for n = 1:4
    %implement the tone-vocoder to noisy signal
     w=linspace(-fs/2,fs/2,length(noisySignal));
    sig2=tone_vocoder(N,f1,f2,fs,lpf(n),noisySignal);
    specOfCoch=fftshift(fft(sig2))/length(noisySignal);
    %plot the fft figure
    figure1 = figure;
    plot(w,abs(specOfCoch));
    xlabel('frequency w'),ylabel('magnitude');
    grid on;
    title(sprintf('spectral of LPF=%d Hz Tone Vocoder',lpf(n)));
    %save the processed audio file
    audiowrite(sprintf('../audio/task4/Task4_coch_lpf=%d.wav',lpf(n)),sig2,fs);
    saveas(figure1,sprintf('../fig/task4/lpf%d.jpg',lpf(n)));
end

