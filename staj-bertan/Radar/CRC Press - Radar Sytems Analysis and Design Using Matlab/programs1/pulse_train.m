function [dt, prf, pav, ep, ru] = pulse_train(tau,pri,p_peak)
% This function is described in Section 1.2
c = 3.0e+8;
dt = tau / pri;
prf = 1. / pri;
pav = p_peak * dt;
ep = p_peak * tau;
ru = 1.0e-3 * c * pri / 2.0;
return