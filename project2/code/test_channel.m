OFDM_Pulse_TR_TX = [1 zeros(1,36000-1)];
Ht=[0.5 zeros(1,round(T/dt)*1.5-1) 0.4 zeros(1,round(T/dt)-1) 0.35 zeros(1,round(T/dt)*0.5-1) 0.3];
OFDM_Pulse_RF=conv(Ht,OFDM_Pulse_TR_TX); %conv RF with h[t]
stem(OFDM_Pulse_RF)