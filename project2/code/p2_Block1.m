%p2_Block1.m
%% IFFT
tic
IFFT_ss = ifft(ss,N+1);
figure1 = figure();
subplot(2,1,1);
stem(real(IFFT_ss));
grid on;title('Real(Signal After IFFT)');xlabel('n');ylabel('Magnitude');
subplot(2,1,2);
stem(imag(IFFT_ss));
grid on;title('Real(Signal After IFFT)');xlabel('n');ylabel('Magnitude');
saveas(figure1,'../fig/2_Signal_After_IFFT.png');

%% add CP

ss_Add_CP = [IFFT_ss(N+2-CP_N:N+1) IFFT_ss];
figure1 = figure();
subplot(2,1,1);
stem(real(ss_Add_CP));
grid on;title('Real(Signal Add CP)');xlabel('n');ylabel('Magnitude');
subplot(2,1,2);
stem(imag(ss_Add_CP));
grid on;title('Real(Signal Add CP)');xlabel('n');ylabel('Magnitude');
saveas(figure1,'../fig/3_Signal_Add_CP.png');

%% create CT pulse

OFDM_Pulse_CT1=[];
t=0:dt:(T*(N+1+CP_N)-dt);

for n=1:N+1+CP_N
    OFDM_Pulse_CT1 = [OFDM_Pulse_CT1 ss_Add_CP(n) zeros(1,round(T/dt)-1)];
end

% Plot shape
LTIC = [0 ones(1,round(T/dt))]; 
OFDM_Pulse_CT_Transmission = conv(OFDM_Pulse_CT1,LTIC);
figure1 = figure();
subplot(2,2,1);
plot(t,real(OFDM_Pulse_CT1));
grid on;title('Real(Signal Add CP Pulse)');ylabel('Magnitude');
subplot(2,2,2);
plot(t,imag(OFDM_Pulse_CT1));
grid on;title('Image(Signal Add CP Pulse)');ylabel('Magnitude');
subplot(2,2,3);
plot(t,real(OFDM_Pulse_CT_Transmission(1:length(t))));
grid on;title('Real(Signal Add CP Pulse Convolution)');ylabel('Magnitude');
subplot(2,2,4);
plot(t,imag(OFDM_Pulse_CT_Transmission(1:length(t))));
grid on;title('Image(Signal Add CP Pulse Convolution)');ylabel('Magnitude');
saveas(figure1,'../fig/4_Signal_Add_CP_Pulse.png');
toc