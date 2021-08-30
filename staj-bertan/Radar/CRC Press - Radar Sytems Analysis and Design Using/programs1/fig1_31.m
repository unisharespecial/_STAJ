a=-2*pi:0.01:2*pi;
%angle=sin(a);
y=sinc(a).^2;
ymod=10.*log10(y);
plot(a,ymod,'k');
grid
xlabel('Aangle - radians');
ylabel('Normalized antenna pattern -dB');
