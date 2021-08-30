clear all
eps = 0.0000001;
beta = -pi : pi / 10791 : pi;
var = sin(beta);
%var = -1.:0.00101:1.;
num = sin((8. * 2. * pi * 0.5) .* var);
if(abs(num) <= eps)
   num = eps;
end
den = sin((2. * pi * 0.5) .* var);
if(abs(den) <= eps)
   den = eps;
end
pattern = num ./ den;
maxval = max(abs(pattern));
pattern = abs(pattern ./ maxval);
i=0;
mod=abs(pattern);
figure(1)
plot(var,mod);
grid;
xlabel('sine angle - dimensionless')
ylabel('array pattern')
figure(2)
polar(beta,abs(pattern))

