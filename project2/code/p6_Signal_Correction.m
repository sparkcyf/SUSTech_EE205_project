%p6_Signal_Correction.m
%% Signal Correction
OFDM_RF_fft = OFDM_RF_fft./hn;
OFDM_RF_fft_Scale_Length = OFDM_RF_fft(1:N);

%% Plot Signal After Correction
figure1 = figure();
subplot(2,2,1);
stem(real(ss));
grid on;title('Real(Origin Signal)');xlabel('n');ylabel('Magnitude');
subplot(2,2,2);
stem(imag(ss));
grid on;title('Image(Origin Signal)');xlabel('n');ylabel('Magnitude');
subplot(2,2,3);
stem(real(OFDM_RF_fft_Scale_Length));
grid on;title('Real(RF Signal After Correction)');xlabel('n');ylabel('Magnitude');
subplot(2,2,4);
stem(imag(OFDM_RF_fft_Scale_Length));
grid on;title('Image(RF Signal After Correction)');xlabel('n');ylabel('Magnitude');
saveas(figure1,'../fig/12_RF_Signal_After_Correction.png');

%% Calculate Difference
figure1 = figure();
subplot(2,1,1);
stem(real(ss)-real(OFDM_RF_fft_Scale_Length));
grid on;title('Real(Difference)');xlabel('n');ylabel('Magnitude');
subplot(2,1,2);
stem(imag(ss)-imag(OFDM_RF_fft_Scale_Length));
grid on;title('Image(Difference)');xlabel('n');ylabel('Magnitude');
saveas(figure1,'../fig/13_Signal_Difference.png');
