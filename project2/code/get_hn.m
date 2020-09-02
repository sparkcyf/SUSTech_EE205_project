%get_hn.m
function hn = get_hn(OFDM_RF_fft,Serial_Signal,N)
hn = OFDM_RF_fft(1:N)./Serial_Signal;
    hn = [hn 1];