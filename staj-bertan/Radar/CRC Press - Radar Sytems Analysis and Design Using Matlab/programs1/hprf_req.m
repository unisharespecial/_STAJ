function [snr_out] = hprf_req (pt, freq, g, sigma, dt, ti, range, te, nf, ...
   loss, prf, tau, dt1, dt2)
% This program implements the High PRF radar equation.
c = 3.0e+8;
lambda = c / freq;
% Compute the duty cycle
if (dt == 0)
   dt = tau * prf;
end
pav_db = base10_to_dB(pt * dt);
lambda_sqdb = base10_to_dB(lambda^2);
sigmadb = base10_to_dB(sigma);
for_pi_cub = base10_to_dB((4.0 * pi)^3);
k_db = base10_to_dB(1.38e-23);
te_db = base10_to_dB(te);
ti_db = base10_to_dB(ti);
range_db = base10_to_dB(range * 1000.0);
% Implement Eq. (1.69)
snr_out = pav_db + 2. * g + lambda_sqdb + sigmadb + ti_db - ...
   for_pi_cub - k_db - te_db - nf - loss - 4.0 * range_db
%%%%%%%%%% Generate Plots in Figure 1.21 %%%%%%%%%%%%
index = 0;
pav10 = base10_to_dB(pt * dt1);
pav20 = base10_to_dB(pt * dt2);
for range_var = 10:1:100
   index = index + 1;
   rangevar_db = base10_to_dB(range_var * 1000.0);
   snr1(index) = pav_db + 2. * g + lambda_sqdb + sigmadb + ti_db - ...
      for_pi_cub - k_db - te_db - nf - loss - 4.0 * rangevar_db;
   snr2(index) = pav10 + 2. * g + lambda_sqdb + sigmadb + ti_db - ...
      for_pi_cub - k_db - te_db - nf - loss - 4.0 * rangevar_db;
   snr3(index) = pav20 + 2. * g + lambda_sqdb + sigmadb + ti_db - ...
      for_pi_cub - k_db - te_db - nf - loss - 4.0 * rangevar_db;
end
figure(1)
var = 10:1:100;
plot(var,snr1,var,snr2,var,snr3)
%legend('dt','dt1','dt2')
xlabel ('Range - Km');
ylabel ('SNR - dB');
%title ('dt = 1, dt1 = 10, dt2 = 100');
grid



