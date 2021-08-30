function [BR_range] = ssj_req (pt, g, freq, sigma, b, loss, ...
   pj, bj, gj, lossj)
% This function implements Eq.s (1.76) through (1.80)
c = 3.0e+8;
lambda = c / freq;
lambda_db = base10_to_dB(lambda^2);
if (loss == 0.0)
   loss = 0.000001;
end
if (lossj == 0.0)
   lossj =0.000001;
end
% Compute Omega in steraradians
sigmadb = base10_to_dB(sigma);
pt_db = base10_to_dB(pt);
b_db = base10_to_dB(b);
bj_db = base10_to_dB(bj);
pj_db = base10_to_dB(pj);
factor = base10_to_dB(4.0 *pi);
BR_range = sqrt((pt * (dB_to_base10(g)) * sigma * bj * (dB_to_base10(lossj))) / ...
   (4.0 * pi * pj * (dB_to_base10(gj)) * b * ...
   (dB_to_base10(loss)))) / 1000.0  
s_at_br = pt_db + 2.0 * g + lambda_db + sigmadb - ...
      3.0 * factor - 4.* base10_to_dB(BR_range) - loss 
% prepare to plot Figure 1.25
index =0;
for ran_var = .1:10:10000
   index = index + 1;
   ran_db = base10_to_dB(ran_var * 1000.0);
   ssj(index) = pj_db + gj + lambda_db + g + b_db - 2.0 * factor - ...
      2.0 * ran_db - bj_db - lossj + s_at_br ;
   s(index) = pt_db + 2.0 * g + lambda_db + sigmadb - ...
      3.0 * factor - 4.* ran_db - loss + s_at_br ;
end
ranvar = .1:10:10000;
ranvar = ranvar ./ BR_range;
figure(2)
semilogx (ranvar,s,ranvar,ssj);
axis([.1 1000 -90 40])
xlabel ('Range normalized to crossover range');
legend('Target echo','SSJ')
ylabel ('Relative signal or jamming amplitude - dB');
grid
pj_var = 1:1:1000;
BR_pj = sqrt((pt * (dB_to_base10(g)) * sigma * bj * (dB_to_base10(lossj))) ...
   ./ (4.0 * pi .* pj_var * (dB_to_base10(gj)) * b * (dB_to_base10(loss)))) ./ 1000;
pt_var = 1000:100:10e6;
BR_pt = sqrt((pt_var * (dB_to_base10(g)) * sigma * bj * (dB_to_base10(lossj))) ...
   ./ (4.0 * pi .* pj * (dB_to_base10(gj)) * b * (dB_to_base10(loss)))) ./ 1000;
figure (3)
subplot (2,1,1)
semilogx (BR_pj)
xlabel ('Jammer peak power - Watts');
ylabel ('Burn-through range - Km')
grid
subplot (2,1,2)
semilogx (BR_pt)
xlabel ('Radar peak power - KW')
ylabel ('Burn-through range - Km')
grid



      
