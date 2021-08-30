t=0:0.001:6;
psisq=1;
a=3;
ray=t.*exp(-(t.^2)./2.);
arg1=1./sqrt(2*pi);
arg2=-0.5.*((t-a).^2);
gau=arg1.*exp(arg2);
plot(t,ray,'k',t,gau,'k');
grid
gtext('Gaussian');
gtext('Rayleigh')
xlabel('x')
ylabel('Probability density')