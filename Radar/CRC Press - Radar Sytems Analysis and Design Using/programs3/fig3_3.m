z=0:0.01:15;
j0=besselj(0,z);
j1=besselj(1,z);
j2=besselj(2,z);
j3=besselj(3,z);
plot(z,j0,'k',z,j1,'k',z,j2,'k',z,j3,'k')
grid
xlabel('z');
ylabel('Jn(z)');