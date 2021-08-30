eps = 0.000001;
taumin = -1.1 * taup;
taumax = -taumin;
x = single_pulse_ambg(taup);
taux = taumin:.05:taumax;
fdy = -5/taup:.05:5/taup;
figure(2)
mesh(taux,fdy,x);
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')
zlabel ('Ambiguity function')
figure(3)
contour(taux,fdy,x);
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')
y = x.^2;
figure(4)
mesh(taux,fdy,y);
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')
zlabel ('Ambiguity function')
figure(5)
contour(taux,fdy,y);
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')

