% Use this input file to excite option 1 for function "hprf_req"
clear all
pt = 100.0e+3;   % peak power in Watts
freq = 5.6e+9;   % radar operating frequency in Hz
g = 20.0;        % antenna gain in dB
sigma = 0.01;    % radar cross section in m sqaured
ti = 2.0;        % time on target in seconds
dt = 0.3;        % radar duty cycle
%%%%%%%%%%%% enter  dt = 0 when PRF and Tau are given %%%%%
prf = 0.0;        % PRF
%%%%%%%%%%%% enter fr = 0 when duty cycle is known %%%%
tau = 0.0;       % pulse width in seconds
%%%%%%%%%%%% enter tau = 0 when duty cycle is known %%%%
te = 400.0;      % effective noise temprature in Kelvins
nf = 5.0;        % noise figure in dB
loss = 8.0;      % radar losses in dB
range =50.0;   % target range in Km 
dt1 = .05;
dt2 =.2;