%p4_Block2.m
%% remove CP
OFDM_Pulse_Int_Remove_CP=OFDM_Pulse_RF_Int_Sample_N((CP_N+1):(N+1+CP_N));

figure1 = figure();
subplot(2,2,1);
stem(real(IFFT_ss));
grid on;title('Real(IFFT of Origin Signal)');xlabel('n');ylabel('Magnitude');
subplot(2,2,2);
stem(imag(IFFT_ss));
grid on;title('Real(IFFT of Origin Signal)');xlabel('n');ylabel('Magnitude');
subplot(2,2,3);
stem(real(OFDM_Pulse_Int_Remove_CP));
grid on;title('Real(RF removed CP)');xlabel('n');ylabel('Magnitude');
subplot(2,2,4);
stem(imag(OFDM_Pulse_Int_Remove_CP));
grid on;title('Real(RF removed CP)');xlabel('n');ylabel('Magnitude');
saveas(figure1,'../fig/9_RF_Signal_Removed_CP.png');


%% FFT
OFDM_RF_fft = fft(OFDM_Pulse_Int_Remove_CP);


figure1 = figure();
subplot(2,2,1);
stem(real(ss));
grid on;title('Real(Origin Signal)');xlabel('n');ylabel('Magnitude');
subplot(2,2,2);
stem(imag(ss));
grid on;title('Image(Origin Signal)');xlabel('n');ylabel('Magnitude');
subplot(2,2,3);
stem(real(OFDM_RF_fft));
grid on;title('Real(RF After FFT)');xlabel('n');ylabel('Magnitude');
subplot(2,2,4);
stem(imag(OFDM_RF_fft));
grid on;title('Image(RF After FFT)');xlabel('n');ylabel('Magnitude');
saveas(figure1,'../fig/10_RF_Signal_FFT.png');

