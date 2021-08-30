function [p_a_p, aperture, pt, pav ] = power_aperture_req (snr, freq, tsc, ...
   sigma, dt, range, te, nf, loss, az_angle, el_angle, g, rcs_delta1, rcs_delta2)
% This function implements the search radar equation. 
c = 3.0e+8;
% Compute Omega in steraradians
omega = (az_angle / 57.23) * (el_angle /57.23);
omega_db = base10_to_dB(omega);
lambda = c / freq;
lambda_sqdb = base10_to_dB(lambda^2);
sigmadb = base10_to_dB(sigma);
k_db = base10_to_dB(1.38e-23);
te_db = base10_to_dB(te);
tsc_db = base10_to_dB(tsc);
factor = base10_to_dB(16.0);
range_db = base10_to_dB(range * 1000.);
p_a_p = snr - sigmadb - tsc_db + factor + 4.0 * range_db + ...
   k_db + te_db + nf + loss +omega_db
aperture = g + lambda_sqdb - base10_to_dB(4.0 * pi)
pav = p_a_p  - a;
pav = dB_to_base10(pav) / 1000.0
pt = pav / dt
% Calculate sigma(+-)10dB
sigmap = rcs_delta1 + sigmadb;
sigmam = sigmadb - rcs_delta2;
index = 0;
% vary rnage from 10% to 200% of input range 
for rangevar = range*.1 : 1 : range*2.0
   index = index + 1;
   rangedb = base10_to_dB(rangevar);
   snr1(index) = snr - sigmadb - tsc_db + factor + 4.0 * rangedb + ...
      k_db + te_db + nf + loss +omega_db;
   snrm(index) = snr - sigmam - tsc_db + factor + 4.0 * rangedb + ...
      k_db + te_db + nf + loss +omega_db;
  snrp(index) = snr - sigmap - tsc_db + factor + 4.0 * rangedb + ...
      k_db + te_db + nf + loss +omega_db;
end
var = range*.1 : 1 : range*2.0;
figure (1)
plot (var,snr1,'k',var,snrm,'k --',var,snrp,'k:')
legend ('default RCS','RCS-delta1','RCS+delta2')
xlabel ('Range - Km');
ylabel ('SNR - dB');
title ('RCS = -10dBsm, delta1 = 10dBsm, delta2 = 10dBsm');
index = 0;
% Vary aperture from 10 msq to 100 msq
for apervar = 10:1:100
   aperdb = base10_to_dB(apervar);
   index = index +1;
   pav = p_a_p  - aperdb;
   pav = dB_to_base10(pav) / 1000.0;
   pt(index) = pav / dt;
end
figure (2)
apervar = 10:1:100;
plot (apervar, pt,'k')
xlabel ('Aperture in squared meters')
ylabel ('Peak power - Kw')  
   
