function [fd , tdr] = doppler_freq(freq, ang, tv, indicator)
% This program conputes Doppler frequency and time dilation factor ratio
% tau_prime / tau
format long
c = 3.0e+8;
ang_rad = ang * pi /180.;
lambda = c / freq;
if (indicator == 1)
   fd = 2.0 * tv / lambda;
   tdr = (c - tv) / (c + tv);
else
   fd = -2.0 * c * tv / lambda;
   tdr = (c + tv) / (c -tv);
end
return
