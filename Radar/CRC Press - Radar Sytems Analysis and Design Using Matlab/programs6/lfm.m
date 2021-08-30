eps = 0.0001;
x = lfm_ambg(taup, b, up_down);
taux = -1.1*taup:.05:1.1*taup;
fdy = -b:.05:b;
figure(2)
mesh(taux,fdy,x)
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')
zlabel ('Ambiguity function')
figure(3)
contour(taux,fdy,x)
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')
y = sqrt(x);
figure(4)
mesh(taux,fdy,y)
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')
zlabel ('Uncertainty function')
figure(5)
contour(taux,fdy,y)
xlabel ('Delay - seconds')
ylabel ('Doppler - Hz')

