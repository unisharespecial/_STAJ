% Use this input file with the program "power_aperture_eq.m"
clear all
snr = 15.0;      % sensitivity SNR in dB
freq = 10.0e+9;  % radar operating frequency in Hz
tsc = 2.5;       % antenna scan time in seconds
sigma = 0.1;     % radar cross section in m sqaured
dt = 0.3;        % radar duty cycle
range = 250.0;   % sensitivity range in Km
te = 900.0;      % effective noise temprature in Kelvins
nf = 5.0;        % noise figure in dB
loss = 8.0;      % radar losses in dB
az_angle = 2.0;  % search volume azimuth extent in degrees
el_angle = 2.0;  % search volume elevation extent in degrees
g = 45.0;        % antenna gain in dB
rcs_delta1 = 10.;
rcs_delta2 = 10;