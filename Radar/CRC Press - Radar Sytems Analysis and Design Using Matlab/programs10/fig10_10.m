clear all
eps =0.000001;
var = -01.:0.001:1.;
num = sin((8. * 2. * pi * 1.) .* var);
den = sin((2. * pi * 1.) .* var);
pattern = num ./ den;
maxval = max(abs(pattern));
pattern = abs(pattern ./ maxval);
i = 0.;
for ii=-1:0.001:1
i = i + 1.;
if(pattern(i) < 0.001)
   pattern(i) = 0.0011;
end
end
mod = abs(pattern);
subplot(2,1,1);
plot(var,20.0 .* log10(mod));
grid;
xlabel('sine angle - dimensionless')
ylabel('array pattern')
gtext('main lobe');
gtext('grating lobe');
gtext('grating lobe');
var1 = 1. * pi .* var;
patternj = 2. .* besselj(1,var1) ./ var1;
mod = abs(pattern) .* abs(patternj);
subplot(2,1,2);
plot(var,20.0 .* log10(mod));
grid;
xlabel('sine angle - dimensionless')
ylabel('array pattern')
gtext('main lobe');
gtext('grating lobe');
gtext('grating lobe');

