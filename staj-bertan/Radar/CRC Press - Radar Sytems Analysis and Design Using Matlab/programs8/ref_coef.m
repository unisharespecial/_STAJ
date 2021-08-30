function [rh,rv,ph,pv] = ref_coef (epsp,epspp)
eps = epsp - i * epspp; %65.0-30.7i;
psi = 0:0.1:90;
psirad = psi.*(pi/180.);
arg1 = eps-(cos(psirad).^2);
arg2 = sqrt(arg1);
arg3 = sin(psirad);
arg4 = eps.*arg3;
rv = (arg4-arg2)./(arg4+arg2);
rh = (arg3-arg2)./(arg3+arg2);
gamamodv = abs(rv);
gamamodh = abs(rh);
figure(1)
plot(psi,gamamodv,'k',psi,gamamodh,'k -.');
axis tight
grid
xlabel('grazing angle - degrees');
ylabel('reflection coefficient - amplitude')
legend ('Vertical Polarizatio','Horizontal Polarization')
pv = -angle(rv);
ph = angle(rh);
figure(2)
plot(psi,pv,'k',psi,ph,'k -.');
grid
xlabel('grazing angle - degrees');
ylabel('reflection coefficient - pahse')
legend ('Vertical Polarizatio','Horizontal Polarization')

