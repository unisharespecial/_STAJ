function [pfa, value] = incomp_gamma ( vt, np)
% This function uses Eq. (4.58) to compute the Incomplete Gamma Function
format long
eps = 1.000000001;
% Test to see if np = 1
if (np == 0)
   value = 1.0 - exp(-vt);
   pfa = 1.0 - value;
   return
end
sumold = 1.0;
sumnew =1.0;
calc1 = 1.0;
calc2 = np;
xx = np * log(vt) - vt - factor(calc2)
temp1 = exp(xx)
diff = .0;
while (diff <= np)
   diff = diff + 1.0;
   calc1 = calc1 * (calc2 - diff) / vt ;
   sumnew = sumold + calc1;
   sumold = sumnew;
end
   value = 1.0 - temp1 * sumnew 
   pfa = 1 - value
   return  
