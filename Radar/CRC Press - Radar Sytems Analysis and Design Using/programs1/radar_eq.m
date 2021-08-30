function [out_par] = radar_eq(pt, freq, g, sigma, te, b, nf, loss, input_par, ...
   option, rcs_delta1, rcs_delta2, pt_percent1, pt_percent2)
% This program implements Eq. (1.161). Parameters description is in Section 1.7.
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
if (option == 1)
   temp = p_peak + 2. * g + lambda_sqdb + sigmadb - ...
      for_pi_cub - k_db - te_db - b_db - nf - loss - input_par;
   out_par = dB_to_base10(temp)^(1/4)
   % calculate sigma(+-)rcs_delta1,2 dB
   sigmap = rcs_delta1 + sigmadb;
   sigmam = sigmadb - rcs_delta2;
   % calculate pt_percent1 * pt and pt_percent2 * pt
   pt05 = p_peak + base10_to_dB(pt_percent1);
   pt200 = p_peak + base10_to_dB(pt_percent2);
   index = 0;
   % vary snr from .5 to 1.5 of default value
   for snrvar = input_par*.5 : 1 : input_par*1.5
      index = index + 1;
      range1(index) = dB_to_base10(p_peak + 2. * g + lambda_sqdb + sigmam - ...
         for_pi_cub - k_db - te_db - b_db - nf - loss - snrvar)^(1/4) / 1000.0;
      range2(index) = dB_to_base10(p_peak + 2. * g + lambda_sqdb + sigmadb - ...
         for_pi_cub - k_db - te_db - b_db - nf - loss - snrvar)^(1/4) / 1000.0;
      range3(index) = dB_to_base10(p_peak + 2. * g + lambda_sqdb + sigmap - ...
         for_pi_cub - k_db - te_db - b_db - nf - loss - snrvar)^(1/4) / 1000.0;
   end
   index = 0;
   for snrvar = input_par*.5 : 1 : input_par*1.5;
      index = index + 1;
      rangp1(index) = dB_to_base10(pt05 + 2. * g + lambda_sqdb + sigmadb - ...
         for_pi_cub - k_db - te_db - b_db - nf - loss - snrvar)^(1/4) / 1000.0;
      rangp2(index) = dB_to_base10(p_peak + 2. * g + lambda_sqdb + sigmadb - ...
         for_pi_cub - k_db - te_db - b_db - nf - loss - snrvar)^(1/4) / 1000.0;
      rangp3(index) = dB_to_base10(pt200 + 2. * g + lambda_sqdb + sigmadb - ...
         for_pi_cub - k_db - te_db - b_db - nf - loss - snrvar)^(1/4) / 1000.0;
   end
   snrvar = input_par*.5 : 1 : input_par*1.5;
   figure(1)
   subplot(2,1,1)
   plot(snrvar,range2,'k',snrvar,range1,'k --',snrvar,range3,'k:')
  legend('default RCS','RCS-delta1','RCS+delta2')
   xlabel ('Minimum SNR required for detection - dB');
   ylabel ('Maximum detection range - Km');
   title('delta1=10dBsm, delta2=10dBsm, percent1=0.5, percent2=2.0')
   subplot(2,1,2)
   plot(snrvar,rangp2,'k',snrvar,rangp1,'k --',snrvar,rangp3,'k:')
   legend('default power','percent1*pt','percent2*pt')
   xlabel ('Minimum SNR required for detection - dB');
   ylabel ('Maximum detection range - Km');
   else
   range_db = base10_to_dB(input_par * 1000.0);
   out_par = p_peak + 2. * g + lambda_sqdb + sigmadb - ...
      for_pi_cub - k_db - te_db - b_db - nf - loss - 4.0 * range_db
   % calculate sigma -- rcs_delta1,2
   sigma5 = sigmadb - rcs_delta1;
   sigma10 = sigmadb - rcs_delta2;
   % calculate pt_percent1 * pt and pt_percent2 * pt
   pt05 = p_peak + base10_to_dB(pt_percent1);
   pt200 = p_peak + base10_to_dB(pt_percent2);
   index = 0;
   % vary snr from .5 to 1.5 of default value
   for rangvar = input_par*.5 : 1 : input_par*1.5
      index = index + 1;
      var = 4.0 * base10_to_dB(rangvar * 1000.0);
      snr1(index) = p_peak + 2. * g + lambda_sqdb + sigmadb - ...
         for_pi_cub - k_db - te_db - b_db - nf - loss - var;
      snr2(index) = p_peak + 2. * g + lambda_sqdb + sigma5 - ...
         for_pi_cub - k_db - te_db - b_db - nf - loss - var;
      snr3(index) = p_peak + 2. * g + lambda_sqdb + sigma10 - ...
         for_pi_cub - k_db - te_db - b_db - nf - loss - var;
   end
   index = 0;
   for rangvar = input_par*.5 : 1 : input_par*1.5;
      index = index + 1;
      var = 4.0 * base10_to_dB(rangvar * 1000.0);
      snrp1(index) = pt05 + 2. * g + lambda_sqdb + sigmadb - ...
         for_pi_cub - k_db - te_db - b_db - nf - loss - var;
      snrp2(index) = p_peak + 2. * g + lambda_sqdb + sigmadb - ...
         for_pi_cub - k_db - te_db - b_db - nf - loss - var;
      snrp3(index) = pt200 + 2. * g + lambda_sqdb + sigmadb - ...
         for_pi_cub - k_db - te_db - b_db - nf - loss - var;
   end
   rangvar = input_par*.5 : 1 : input_par*1.5;
   figure(2)
   subplot(2,1,1)
   plot(rangvar,snr1,'k',rangvar,snr2,'k --',rangvar,snr3,'k:')
   legend('default RCS','RCS-delta1','RCS-delta2')
   xlabel ('Detection range - Km');
   ylabel ('SNR - dB');
   title('delta1=5dBsm, delta2=10dBsm, percent1=0.5, percent2=2.0')
   subplot(2,1,2)
   plot(rangvar,snrp2,'k',rangvar,snrp1,'k --',rangvar,snrp3,'k:')
   legend('default power','percent1*pt','percent2*pt')
   xlabel ('Detection range - Km');
   ylabel ('SNR - dB');
   end

