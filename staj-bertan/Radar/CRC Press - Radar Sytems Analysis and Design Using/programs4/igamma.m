function [pfa, value] = igamma ( vt, np)
% This function uses Eq. (4.58) to compute the Incomplete Gamma Function
format long
eps = 1.0000000001;
sum = 1.0;
calc1 = 1.0;
calc2 = np-1;
temp1 = (vt^calc2) * exp(-vt) / factorial(calc2); 
diff = .0;
for count = 1:1:calc2
   diff = diff + 1.0;
   calc1 = calc1 * (calc2 - diff) / vt ;
   sum = sum + calc1;
end
value = 1.0 - temp1 * sum;
pfa = 1 - value;
return  
   