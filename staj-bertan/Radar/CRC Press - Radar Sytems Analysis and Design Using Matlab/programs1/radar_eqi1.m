% Use this input file to excite option 1 for function "radar_eq"
clear all
pt = 1.5e+6; % peak power in Watts
freq = 5.6e+9; % radar operating frequency in Hz
g = 45.0; % antenna gain in dB
sigma = 0.1; % radar cross section in m sqaured
te = 290.0; % effective noise temprature in Kelvins
b = 5.0e+6; % radar operating bandwidth in Hz
nf = 3.0; %noise figure in dB
loss = 0.0; % radar losses in dB
option = 2; % 1 ===> input_par = SNR in dB
%%%%%%%%%%%   2 ===> input_par = Range in Km
input_par = 85.855922;
rcs_delta1 = 5;
rcs_delta2 = 10;
pt_percent1 = 0.5;
pt_percent2 = 2.0;
 