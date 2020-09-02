%p3_Block3and4.m
%% Construct RF
tic
%multiply sin & cos for real and image part
OFDM_Pulse_TR_TX=real(OFDM_Pulse_CT_Transmission(1:length(t))).*cos(omega_C*t)+imag(OFDM_Pulse_CT_Transmission(1:length(t))).*sin(omega_C*t);

figure1 = figure();
subplot(2,1,1);
plot(t,OFDM_Pulse_TR_TX);
grid on;title('Signal');ylabel('Magnitude');
subplot(2,1,2);
f=(-(length(OFDM_Pulse_TR_TX)-1)/2:(length(OFDM_Pulse_TR_TX)-1)/2)*(2*pi/dt/length(OFDM_Pulse_TR_TX));
stem(f,abs(fftshift(fft(OFDM_Pulse_TR_TX))/length(OFDM_Pulse_TR_TX)));
grid on;title('Signal Spectrum');xlim([0.8e8 1.2e8]);xlabel('f/Hz');ylabel('Magnitude');
saveas(figure1,'../fig/5_Signal_and_its_Spectrum.png');

%% conv h[t] (pass channel)
%generate h[t]
Ht=[0.5 zeros(1,round(T/dt)*1.5-1) 0.4 zeros(1,round(T/dt)-1) 0.35 zeros(1,round(T/dt)*0.5-1) 0.3];
OFDM_Pulse_RF=conv(Ht,OFDM_Pulse_TR_TX); %conv RF with h[t]

figure1 = figure();
subplot(2,1,1);
plot(dt*(1:length(OFDM_Pulse_RF)),OFDM_Pulse_RF);
grid on;title('Signal (Convolution h[t])');ylabel('Magnitude');
subplot(2,1,2);
f=(-(length(OFDM_Pulse_RF)-1)/2:(length(OFDM_Pulse_RF)-1)/2)*(2*pi/dt/length(OFDM_Pulse_RF));
stem(f,abs(fftshift(fft(OFDM_Pulse_RF))));
grid on;title('Signal Spectrum (Convolution h[t])');xlim([0.8e8 1.2e8]);xlabel('f/Hz');ylabel('Magnitude');
saveas(figure1,'../fig/6_Signal_and_its_Spectrum_(conv).png');
%% Pass the LPF
T_channel_LPF = dt:dt:(N+CP_N+4)*T; %construct the time axis
[b,a]=butter(4,0.02); %generate the LPF filter

%split real & image part using cos & sin function
OFDM_Pulse_RF_Real = OFDM_Pulse_RF.*cos(omega_C*T_channel_LPF);
OFDM_Pulse_RF_Image = OFDM_Pulse_RF.*sin(omega_C*T_channel_LPF);
%pass the LPF and merge
OFDM_Pulse_RF_LPF_Merge = 2*filter(b,a,OFDM_Pulse_RF_Real) + 2i*filter(b,a,OFDM_Pulse_RF_Image);


figure1 = figure();
subplot(2,1,1);
plot(dt:dt:(N+CP_N+4)*T,real(OFDM_Pulse_RF_LPF_Merge),dt:dt:(N+CP_N+2)*T,real(OFDM_Pulse_CT_Transmission)); %compare real part
grid on;title('Signal Shape Compare (Real Part)');ylabel('Magnitude');legend('OFDM Pulse RF LPF Merge','OFDM Pulse CT Transmission');
subplot(2,1,2);
plot(dt:dt:(N+CP_N+4)*T,imag(OFDM_Pulse_RF_LPF_Merge),dt:dt:(N+CP_N+2)*T,imag(OFDM_Pulse_CT_Transmission)); %compare iamge part
grid on;title('Signal Shape Compare (Image Part)');ylabel('Magnitude');legend('OFDM Pulse RF LPF Merge','OFDM Pulse CT Transmission');
saveas(figure1,'../fig/7_Signal_Shape_Compare.png');

%% sample

Sample_Length = length(ss_Add_CP)+CP_N-1;
T_sample = round(length(OFDM_Pulse_RF_LPF_Merge)/Sample_Length);
OFDM_Pulse_RF_Int_Sample_N = 1:1:Sample_Length; 
for n = 1:Sample_Length
    OFDM_Pulse_RF_Int_Sample_N(n) = OFDM_Pulse_RF_LPF_Merge(T_sample*n);
end

%OFDM_Pulse_Int_R=cumtrapz(real(OFDM_Pulse_RF_Int_Sample_N));
%OFDM_Pulse_Int_I=cumtrapz(imag(OFDM_Pulse_RF_Int_Sample_N));
%OFDM_Pulse_Int = OFDM_Pulse_Int_R + 1i*OFDM_Pulse_Int_I;

figure1 = figure();
subplot(2,2,1);
stem(real(ss_Add_CP));
grid on;title('Real(Signal add CP)');xlabel('n');ylabel('Magnitude');
subplot(2,2,2);
stem(imag(ss_Add_CP));
grid on;title('Image(Signal add CP)');xlabel('n');ylabel('Magnitude');
subplot(2,2,3);
stem(real(OFDM_Pulse_RF_Int_Sample_N));
xlabel('n');
grid on;title('Real(Signal Sampled)');xlabel('n');ylabel('Magnitude');
subplot(2,2,4);
stem(imag(OFDM_Pulse_RF_Int_Sample_N));
grid on;title('Image(Signal Sampled)');xlabel('n');ylabel('Magnitude');
saveas(figure1,'../fig/8_Signal_After_Integration_Compare.png');
toc