clear all
factor = 4. * pi *5.;
theta = 0:.1:90;;
theta = theta .* (pi/180);
f = sqrt((1. + 1 + 2.0 .* cos(pi+factor .* sin(theta))));
polar(theta,f,'k');
xlabel ('Normalized range R/Ro')