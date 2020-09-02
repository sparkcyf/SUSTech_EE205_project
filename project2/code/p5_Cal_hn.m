%% Cal ht
% RUN THIS PROGRAM ONLY ONCE!

hn = get_hn(OFDM_RF_fft,ss,N);
figure1 = figure();
subplot(2,1,1);
stem(real(hn));
grid on;title('Real(Correction Function h[t])');xlabel('n');ylabel('Magnitude');
subplot(2,1,2);
stem(imag(OFDM_Pulse_Int_Remove_CP));
grid on;title('Image(Correction Function h[t])');xlabel('n');ylabel('Magnitude');
saveas(figure1,'../fig/11_ht.png');
