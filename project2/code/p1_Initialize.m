%p1_Initialize.m
%% Import audio
%[sound1, samples1] = audioread('C_01_01.wav');
%% initialize variable
N = 31; %length of signal
%N = length(sound1);
CP_N = 4; %length of CP
dt=1e-9; 
T=1e-6;
omega_C=1e8; %Wc

%% generate signal serial (pilot signal)
ss = zeros(1,N);
for n=1:N
rndr = sign(randn(1));
rndi = sign(randn(1));
%rndr = randi([-20000,20000],1,1);
%rndi = randi([-20000,20000],1,1);
%rndr = sin(n/0.25);
%rndi = cos(n/0.25);
ss(n) = rndr + 1i*rndi;
end
figure1 = figure();
%% Set Audio File as ss
%ss=sound1';

%% Plot
subplot(2,1,1);
stem(real(ss));
grid on;title('Real(x_{pilot})');xlabel('n');ylabel('Magnitude');
subplot(2,1,2);
stem(imag(ss));
grid on;title('Image(x_{pilot})');xlabel('n');ylabel('Magnitude');
saveas(figure1,'../fig/1_pilot_signal.png');