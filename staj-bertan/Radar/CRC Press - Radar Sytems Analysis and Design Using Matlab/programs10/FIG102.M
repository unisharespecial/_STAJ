function [emod] = circ_aperture (lambda, d)
eps = 0.000001;
var = 2.0 * pi * (-2:0.001:2);
pattern = 2. * besselj(1,var) ./ var;
maxval = max(abs(pattern));
pattern = pattern ./ maxval;
mod = 20. * log10(abs(pattern));
plot(var,mod,'k')
grid;
xlabel('kr*sin(angle)')
ylabel('normalized pattern');