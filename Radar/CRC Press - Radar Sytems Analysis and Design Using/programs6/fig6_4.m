clear all
eps = 0.0001;
taup = 2.;
fd = -10./taup:.05:10./taup;
uncer = abs( sinc(taup .* fd));
ambg = uncer.^2;
plot(fd, ambg)
xlabel ('Frequency - Hz')
ylabel ('Ambiguity - Volts')
grid
figure(2)
plot (fd, uncer);
xlabel ('Frequency - Hz')
ylabel ('Uncertainty - Volts')
grid



      