function [BR_range] = soj_req (pt, g, sigma, b, freq, loss, range, ...
   pj, bj,gj, lossj, gprime, rangej)
% This function implements equations for SOJs
c = 3.0e+8;
lambda = c / freq;
lambda_db = base10_to_dB(lambda^2)
if (loss == 0.0)
   loss = 0.000001;
end
if (lossj == 0.0)
   lossj =0.000001;
end
% Compute Omega in steraradians
sigmadb = base10_to_dB(sigma);
range_db = base10_to_dB(range * 1000.);
rangej_db = base10_to_dB(rangej * 1000.)
pt_db = base10_to_dB(pt);
b_db = base10_to_dB(b);
bj_db = base10_to_dB(bj);
pj_db = base10_to_dB(pj);
factor = base10_to_dB(4.0 *pi);
BR_range = ((pt * dB_to_base10(2.0*g) * sigma * bj * dB_to_base10(lossj) * ...
   (rangej)^2) / (4.0 * pi * pj * dB_to_base10(gj) * dB_to_base10(gprime) * ...
   b * dB_to_base10(loss)))^.25 / 1000. 
%* (dB_to_base10(16)^.25)
s_at_br = pt_db + 2.0 * g + lambda_db + sigmadb - ...
   3.0 * factor - 4.0 * base10_to_dB(BR_range) - loss  
 % prepare to plot Figure 1.27
index =0;
for ran_var = .1:1:1000;
   index = index + 1;
   ran_db = base10_to_dB(ran_var * 1000.0);
   s(index) = pt_db + 2.0 * g + lambda_db + sigmadb - ...
      3.0 * factor - 4.0 * ran_db - loss + s_at_br;
   soj(index) = s_at_br - s_at_br;
end
ranvar = .1:1:1000;
%ranvar = ranvar ./BR_range;
figure(2)
semilogx (ranvar,s,'r',ranvar,soj,'g');
xlabel ('Range normalized to crossover range');
legend('Target echo','SOJ')
ylabel ('Relative signal or jamming amplitude - dB');
%grid


      
