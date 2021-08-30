%This program generates Figure 4.3.
logpfa = .1:.05:25;
var = 10.^(logpfa ./ 10.0);
vtnorm =  sqrt( log (var));
plot(logpfa, vtnorm,'k')
grid
