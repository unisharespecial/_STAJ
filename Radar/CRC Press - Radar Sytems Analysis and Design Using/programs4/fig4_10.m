% This program is used to produce Fig. 4.10
clear all
nfa = 1e9;
pfa = log(2) / nfa;
b = sqrt(-2.0 * log(pfa));
index = 0;
for snr = 0:.1:22
   index = index +1;
   a = sqrt(2.0 * 10^(.1*snr));
   pro(index) = marcumsq(a,b);
   prob(index) =  pd_swerling1 (1e9, 1, snr);
end
x = 0:.1:22;
plot(x, pro,'k',x,prob,'k:');
axis([2 22 0 1])
xlabel ('SNR - dB')
ylabel ('Probability of detection')
legend('Swerling V','Swerling I')






