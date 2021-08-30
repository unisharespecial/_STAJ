% Use this input file to excite function "ssj_req"
clear all
pt = 50.0e+3;    % peak power in Watts
g = 35.0;       % antenna gain in dB
freq = 3.2e+9;  % radar operating frequency in Hz
sigma = 10.0 ;    % radar cross section in m sqaured
b = 667.0e+3;    % radar operating bandwidth in Hz
loss = 0.000;     % radar losses in dB
pj = 200.0;    % jammer peak power in Watts
bj = 50.0e+6;  % jammer operating bandnwidth in Hz
gj = 10.0; 		 % jammer antenna gain in dB
lossj = 0.0;    % jammer losses in dB
