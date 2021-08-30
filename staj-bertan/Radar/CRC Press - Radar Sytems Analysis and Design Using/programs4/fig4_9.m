% This program is used to produce Fig. 4.9
clear all
nfa = 1e9;
pfa = log(2) / nfa;
b = sqrt(-2.0 * log(pfa));
index = 0;
for snr = 0:.1:20
   index = index +1;
   a = sqrt(2.0 * 10^(.1*snr));
   pro(index) = marcumsq(a,b);
   prob205(index) =  pd_swerling5 (1e9, 2, 10, snr);
end
x = 0:.1:20;
plot(x, pro,'k',x,prob205,'k:');
axis([0 20 0 1])
xlabel ('SNR - dB')
ylabel ('Probability of detection')
legend('np = 1','np = 10')
grid

