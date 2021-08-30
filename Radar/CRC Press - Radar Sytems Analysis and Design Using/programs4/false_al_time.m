function vt = false_al_time 
% This function computes and plots the false alarm time versus
% the fixed threshold Vt to the noise power 
%b_var = 0.1 * bandwidth_rnage:0.1 * bandwidth_range: 10.0 *bandwidth_range;
hold on
vtoverpsi = 8: .1:15;
vt_par = 10.^(vtoverpsi ./ 10.);
tfa = (1.0 / 1.0) .* exp(vt_par);
tfa = tfa ./ 360.0 ;
semilogy (tfa);
axis ([8 15 .1 10000]);
tfa = (1.0 / 1e6) .* exp(vt_par) ;
tfa = tfa ./ 360.;
%semilogy (vtoverpsi,tfa,'r');
axis ([8 15 .1 10000]);
hold off
grid