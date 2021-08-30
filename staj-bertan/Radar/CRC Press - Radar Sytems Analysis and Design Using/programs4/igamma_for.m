function value = incomplete_gamma (x,n)
if( x == 0)
   value = 0;
   return
end
if(x > 1e100)
   value = 1.;
   return
end
eps = 3.0e-7;
if( x < 0. | n < 0.)
   'error'
   return
end
if (x <= n)
   ap = n;
   sum = 1. / n;
   del = sum;
   for i = 1:1:150
      ap = ap + 1.;
      del = del * x / ap;
      sum = sum + del;
   end
   gln = factor(n);
   value = sum * exp(-x + n * log(x) - gln);
else
   fmin = 1.0e-30;
    gln = factor(n);
    b = x + 1. - n;
    c = 1. / fmin;
    d = 1. / b;
    h = d;
    del = 1000.;
    for ni=1:1:150
      an = -ni * (ni -n);
       b = b + 2.0;
       d = an * d + b;
       if (abs(d) < fmin)
          d = fmin;
       end
       c = b + an / c;
       if (abs(c) < fmin)
          c = fmin;
       end
       d = 1. / d;
       del = d* c;
       h = h * del;
    end
    val = exp(-x + n * log(x) - gln) * h;
    value = 1.0 - val;   
  end
    
      
      
      