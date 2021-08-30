function q = que (x)
format long
eps = 7.5e-9;
p = 0.2316419;
b1 = 0.319381530;
b2 = -0.356563782;
b3 = 1.781477937;
b4 = -1.821255978;
b5 = 1.330274429;
zofx = 1.0 / sqrt(2.0*pi*exp(x^2));
t = 1.0 / ( 1.0 + p * abs(x));
q = zofx*(b1*t+b2*t^2+b3*t^3+b4*t^4+b5*t^5)+eps;
