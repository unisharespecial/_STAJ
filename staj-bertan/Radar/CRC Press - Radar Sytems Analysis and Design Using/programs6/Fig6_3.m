clear all
eps = 0.000001;
taup = 2.;
taumin = -1.1 * taup;
taumax = -taumin;
x = single_pulse_ambg(taup);
taux = taumin:.05:taumax;
fdy = -5/taup:.05:5/taup;
figure(1)
mesh(taux,fdy,x);
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')
zlabel ('Ambiguity function')
figure(2)
contour(taux,fdy,x);
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')
y = x.^2;
figure(3)
mesh(taux,fdy,y);
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')
zlabel ('Ambiguity function')
figure(4)
contour(taux,fdy,y);
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')

