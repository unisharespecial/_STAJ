function [hl] = hrr_profile (nscat, scat_range, scat_rcs, n, deltaf, prf, v, rnote)
% Range or Time domain Profile
% Range_Profile returns the Range or Time domain plot of a simulated 
% HRR SFWF returning from a predetermined number of targets with a predetermined
% RCS for each target.
c=3.0e8;  % speed of light (m/s)
num_pulses   = n;
SNR_dB = 40;
%carrier_freq = 9.5e9; %Hz (10GHz)
freq_step    = deltaf; %Hz (10MHz)
V = v;  % radial velocity (m/s)  -- (+)=towards radar (-)=away
PRI = 1. / prf; % (s)
Inphase = zeros((2*num_pulses),1);
Quadrature = zeros((2*num_pulses),1);
Inphase_tgt    = zeros(num_pulses,1);
Quadrature_tgt = zeros(num_pulses,1);
IQ_freq_domain = zeros((2*num_pulses),1);
Weighted_I_freq_domain = zeros((num_pulses),1);
Weighted_Q_freq_domain = zeros((num_pulses),1);
Weighted_IQ_time_domain = zeros((2*num_pulses),1);
Weighted_IQ_freq_domain = zeros((2*num_pulses),1);
abs_Weighted_IQ_time_domain = zeros((2*num_pulses),1);
dB_abs_Weighted_IQ_time_domain = zeros((2*num_pulses),1);
taur = 2. * rnote / c;
for jscat = 1:nscat
   ii = 0;
   for i = 1:num_pulses
      ii = ii+1;
      rec_freq = ((i-1)*freq_step);
      Inphase_tgt(ii) = Inphase_tgt(ii) + sqrt(scat_rcs(jscat)) * cos(-2*pi*rec_freq*...
         (2.*scat_range(jscat)/c - 2*(V/c)*((i-1)*PRI + taur/2 + 2*scat_range(jscat)/c)));
      Quadrature_tgt(ii) = Quadrature_tgt(ii) + sqrt(scat_rcs(jscat))*sin(-2*pi*rec_freq*...
         (2*scat_range(jscat)/c - 2*(V/c)*((i-1)*PRI + taur/2 + 2*scat_range(jscat)/c)));
   end
end
Inphase = Inphase_tgt;
Quadrature = Quadrature_tgt;
Weighted_I_freq_domain(1:num_pulses) = Inphase(1:num_pulses)...
   .*(hamming(num_pulses));
Weighted_Q_freq_domain(1:num_pulses) = Quadrature(1:num_pulses).* ...
   (hamming(num_pulses));
Weighted_IQ_freq_domain(1:num_pulses)= Weighted_I_freq_domain + ...
   Weighted_Q_freq_domain*j;
Weighted_IQ_freq_domain(num_pulses:2*num_pulses)=0.+0.i;
Weighted_IQ_time_domain = (ifft(Weighted_IQ_freq_domain));
abs_Weighted_IQ_time_domain = (abs(Weighted_IQ_time_domain));
dB_abs_Weighted_IQ_time_domain = 20.0*log10(abs_Weighted_IQ_time_domain)+SNR_dB;

plot((0:(2*num_pulses-1)), dB_abs_Weighted_IQ_time_domain,'k')
xlabel ('FFT bin')
ylabel ('Range profile - dB')
grid
