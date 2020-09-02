clc
[data,fs]=audioread('C_01_01.wav');
f1=200;
f2=7000;
N=4;
lpf = 400;
y = cochlea(N,f1,f2,fs,lpf,data);
 
%%
filename = 'wav1.wav';
audiowrite(filename,y,fs);
 
spec = fft(y)/length(y);
x = -(length(y)-1)/2:(length(y)-1)/2;
figure;
plot(x*fs/length(y),abs(fftshift(spec)));
xlabel('frequency(Hz)');
ylabel('Magnitude');
 
%%
lpf = 100;
y = cochlea(N,f1,f2,fs,lpf,data);
 
filename = 'wav2.wav';
audiowrite(filename,y,fs);
 
spec = fft(y)/length(y);
x = -(length(y)-1)/2:(length(y)-1)/2;
figure;
plot(x*fs/length(y),abs(fftshift(spec)));
xlabel('frequency(Hz)');
ylabel('Magnitude');
 
%%
lpf = 50;
y = cochlea(N,f1,f2,fs,lpf,data);
 
filename = 'wav3.wav';
audiowrite(filename,y,fs);
 
spec = fft(y)/length(y);
x = -(length(y)-1)/2:(length(y)-1)/2;
figure;
plot(x*fs/length(y),abs(fftshift(spec)));
xlabel('frequency(Hz)');
ylabel('Magnitude');
%%
lpf = 20;
y = cochlea(N,f1,f2,fs,lpf,data);
 
filename = 'wav4.wav';
audiowrite(filename,y,fs);
 
spec = fft(y)/length(y);
x = -(length(y)-1)/2:(length(y)-1)/2;
figure;
plot(x*fs/length(y),abs(fftshift(spec)));
xlabel('frequency(Hz)');
ylabel('Magnitude');
