function yn = tone_vocoder(N,Flow,Fhigh,Fsample,fl,s)
%s: Input sound.
%N: Number of bands.
%Fsample: Sampling frequency.
%Flow: Start frequency.
%Fhigh:end frequency.
for g = 1:length(N)
    d2 = log10(Fhigh/165.4+1)/0.06;
    d1 = log10(Flow/165.4+1)/0.06;
    d = linspace(d1,d2,N(g)+1);
    y0 = zeros(length(s),N(g));
    yn = zeros(length(s),1);
    for n = 1:N(g)
        f00 = getf(d(n));
        f01 = getf(d(n+1));
        [b1,a1] = butter(2,[f00 f01]/(Fsample/2));
        yt = filter(b1,a1,s);
        fm = (f00 + f01)/2;
        sinw = sin(2*pi*fm*(0:length(s)-1)/Fsample);
        y02 = abs(yt);
        [b2,a2] = butter(4,fl/(Fsample/2),'low');
        ey0 = filter(b2,a2,y02);
        y0(:,n) = ey0.*sinw.';
    end
    for n = 1:N(g)
        yn = yn + y0(:,n);
    end
end
yn = yn/norm(yn)*norm(s);
yn = yn.';
end

function f = getf(d)
f = 165.4*(10^(0.06*d)-1);
end