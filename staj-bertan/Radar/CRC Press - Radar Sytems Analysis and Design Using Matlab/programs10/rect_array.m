function emod = rect_array(nex,ney,dx,dy)
eps = 0.0000001;
factx = nex * 2. * pi * 0.5 * dx ;
facty = ney * 2. * pi * 0.5 * dy ;
ii = 0.;
delpi = pi / 10.;
for betax = 0.+delpi : pi/101 : 2.*pi-delpi
   ii = ii + 1.;
   numx = sin(factx * sin(betax));
      if(abs(numx) <= eps)
         numx = eps;
      end
      denx = sin(factx * sin(betax) / nex);
      if(abs(denx) <= eps)
         denx = eps;
      end
   jj = 0.;
   for betay = 0.+delpi : pi/101 : 2.*pi-delpi
      jj = jj + 1.;
      numy = sin(facty * sin(betay));
      if(abs(numy) <= eps)
         numy = eps;
      end
      deny = sin(facty * sin(betay) / ney);
      if(abs(deny) <= eps)
         deny = eps;
      end
      emod(ii,jj) = abs(numx / denx) * abs(numy / deny);
   end
end
maxval = max(max(emod));
emod = emod ./ maxval;
figure(1)
mesh(emod)
figure(2)
contour(emod)




