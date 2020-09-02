lpf = [20 50 100 400 800 1600 3200 7000]; %Define the Low-pass Frequency.
[sound, samples] = audioread('C_01_01.wav');
N = 4;%Define the bands.
Flow = 200;%Start Frequency
Fhigh = 7000;%End Frequecy
for n=1:length(lpf)
    PassBPF = tone_vocoder(N,Flow,Fhigh,samples,lpf(n),sound);
    FPassBPF = fftshift(fft(PassBPF));
    FPassBPF_Abs = abs(FPassBPF);
    f=linspace(-samples/2,samples/2,length(sound));
    figure1 = figure;
    plot(f,FPassBPF_Abs);
    grid on;title(sprintf('N=4 f_{lpf}=%d Hz Tone Vocoder',lpf(n)));
    xlabel('Frequency/Hz');ylabel('Magnitude');
    audiowrite(sprintf('../audio/task2/Task2_N=4-Cut-Frequency=%d Hz-tone-vocoder.wav',lpf(n)),PassBPF,samples);
    saveas(figure1,sprintf('../fig/task2/lpf%d.jpg',lpf(n)));
end

