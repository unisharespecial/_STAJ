function [snr_out] = lprf_req_gui(pt, freq, g, sigma, te, b, nf, loss, range,...
   prf, np, rcs_delta, pt_percent, np1, np2)
% This function implements the LOW PRF radar equation.
c = 3.0e+8;
lambda = c / freq;
p_peak = base10_to_dB(pt);
lambda_sq = lambda^2;
lambda_sqdb = base10_to_dB(lambda_sq);
sigmadb = base10_to_dB(sigma);
for_pi_cub = base10_to_dB((4.0 * pi)^3);
k_db = base10_to_dB(1.38e-23);
te_db = base10_to_dB(te)
b_db = base10_to_dB(b);
np_db = base10_to_dB(np);
range_db = base10_to_dB(range * 1000.0);
% Implement Eq. (1.65)
snr_out = p_peak + 2. * g + lambda_sqdb + sigmadb + np_db - ...
   for_pi_cub - k_db - te_db - b_db - nf - loss - 4.0 * range_db
% Generate plots in Fig. 1.19
index = 0;
n1 = np_db;
n2 = base10_to_dB(np1);
n3 = base10_to_dB(np2)
for range_var = 25:5:400
   index = index + 1;
   rangevar_db = base10_to_dB(range_var * 1000.0);
   snr1(index) = p_peak + 2. * g + lambda_sqdb + sigmadb + n1 - ...
      for_pi_cub - k_db - te_db - b_db - nf - loss - 4.0 * rangevar_db;
   snr2(index) = p_peak + 2. * g + lambda_sqdb + sigmadb + n2 - ...
      for_pi_cub - k_db - te_db - b_db - nf - loss - 4.0 * rangevar_db;
   snr3(index) = p_peak + 2. * g + lambda_sqdb + sigmadb + n3 - ...
      for_pi_cub - k_db - te_db - b_db - nf - loss - 4.0 * rangevar_db;
end
figure(1)
var = 25:5:400;
plot(var,snr1)
xlabel ('Range - Km');
ylabel ('SNR - dB');
% Generate plots in Fig. 1.20
sigma5 = sigmadb - rcs_delta;
pt05 = p_peak + base10_to_dB(pt_percent);
index = 0;
for nvar =1:10:500
   index = index + 1;
   ndb = base10_to_dB(nvar);
   snrs(index) = p_peak + 2. * g + lambda_sqdb + sigmadb + ndb - ...
       for_pi_cub - k_db - te_db - b_db - nf - loss -  4.0* range_db;
   snrs5(index) = p_peak + 2. * g + lambda_sqdb + sigma5 + ndb - ...
      for_pi_cub - k_db - te_db - b_db - nf - loss - 4.0 * range_db;
end
index = 0;
for nvar =1:10:500
   index = index + 1;
   ndb = base10_to_dB(nvar);
   snrp(index) = p_peak + 2. * g + lambda_sqdb + sigmadb + ndb - ...
       for_pi_cub - k_db - te_db - b_db - nf - loss - 4.0 * range_db;
   snrp5(index) = pt05 + 2. * g + lambda_sqdb + sigmadb + ndb - ...
      for_pi_cub - k_db - te_db - b_db - nf - loss - 4.0 * range_db;
end
nvar =1:10:500;
figure(2)
subplot(2,1,1)
plot(nvar,snrs)
xlabel ('Number of coherently inegrated pulses');
ylabel ('SNR - dB');
subplot(2,1,2)
plot(nvar,snrp)
xlabel ('Number of coherently inegrated pulses');
ylabel ('SNR - dB');
return

