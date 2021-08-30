function [emod] = circ_aperture (lambda, d)
eps = 0.000001;
k = 2. * pi / lambda;
r = d /2.;
beta = -pi:pi/200.:pi;
sinbet = sin(beta);
var = k * r .* sinbet; 
pattern = (2. * r^2)  .* besselj(1,var) ./ (var);
maxval = max(abs(pattern));
pattern = pattern ./ maxval;
emod = 20. * log10(abs(pattern));
figure(1)
plot(var,emod)
grid;
xlabel('kr*sin(angle)')
ylabel('Normalized radiation pattern');
minval = fix(min(var));
maxval = fix(max(var));
var3d = minval:.5:maxval;
[X,Y] = meshgrid(var3d,var3d);
U = sqrt(X.^2 + Y.^2) + eps;
z = 2. * besselj(1,U) ./ U;
figure (2)
mesh(abs(z))
axis off
figure(3)
polar(beta,pattern)