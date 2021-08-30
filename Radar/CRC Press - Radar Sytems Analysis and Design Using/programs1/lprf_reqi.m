% Use this input file to excite option 1 for function "lprf_req"
clear all
pt = 1e+6;   % peak power in Watts
freq = 5.6e+9; % radar operating frequency in Hz
g = 40.0;      % antenna gain in dB
sigma = 0.1;   % radar cross section in m sqaured
te = 400.0;    % effective noise temprature in Kelvins
b = 5.0e+6;    % radar operating bandwidth in Hz
nf = 3.0;      % noise figure in dB
loss = 1.0;    % radar losses in dB
np = 1;        % 1 number of coherently integrated pulses
prf = 100 ;    % PRF in Hz
range = 250.0; % target range in Km 
np1 = 10;
np2 = 100;
rcs_delta = 10;
pt_percent = 2.;