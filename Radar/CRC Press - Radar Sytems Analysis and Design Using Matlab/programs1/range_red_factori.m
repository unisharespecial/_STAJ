% Use this input file to reproduce Fig.s 1.27 through 1.29
clear all
te = 500.0;    % radar effective tem in Kelvin
pj	= 500; % jammer peak power in W
gj = 3.0;      % jammer antenna gain in dB
g = 45.0;      % radar antenna gain
freq = 10.0e+9;% radar operating frequency in Hz
bj	= 10.0e+6;   % radar operating bandwidth in Hz
rangej = 750.0;% radar to jammer range in Km
lossj = 1.0;   % jammer losses in dB
