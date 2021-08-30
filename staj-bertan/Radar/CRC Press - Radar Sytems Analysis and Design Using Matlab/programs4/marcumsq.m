function PD = marcumsq (a,b)
% This function uses PArl's method to compute PD
max_test_value = 1000.; % increase to more than 1000 for better results
if (a < b)
   alphan0 = 1.0;
   dn = a / b;
else
   alphan0 = 0.;
   dn = b / a;
end
alphan_1 = 0.;
betan0 = 0.5;
betan_1 = 0.;
D1 = dn;
n = 0;
ratio = 2.0 / (a * b);
r1 = 0.0;
betan = 0.0;
alphan = 0.0;
while betan < 1000.,
   n = n + 1;
   alphan = dn + ratio * n * alphan0 + alphan;
   betan = 1.0 + ratio * n * betan0 + betan;
   alphan_1 = alphan0;
   alphan0 = alphan;
   betan_1 = betan0;
   betan0 = betan;
   dn = dn * D1;
end
PD = (alphan0 / (2.0 * betan0)) * exp( -(a-b)^2 / 2.0);
if ( a >= b)
   PD = 1.0 - PD;
end
return


   