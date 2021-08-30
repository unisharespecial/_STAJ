function [emod] = linear_array (ne, d, beta0)
eps = 0.0000001;
beta = 0 : pi / 10791 : 2.*pi;
beta0 = beta0 * pi /180.;
var = sin(beta) - sin(beta0);
num = sin((0.5 * ne * 2. * pi * d) .* var);
if(abs(num) <= eps)
   num = eps;
end
den = sin((0.5 * 2. * pi * d) .* var);
if(abs(den) <= eps)
   den = eps;
end
pattern = num ./ den;
maxval = max(abs(pattern));
pattern = abs(pattern ./ maxval);
emod=abs(pattern);
figure(1)
plot(sin(beta),emod,'k');
grid;
xlabel('sine angle - dimensionless')
ylabel('array pattern')
figure(2)
polar(beta,abs(pattern),'k')
