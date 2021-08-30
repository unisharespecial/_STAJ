function [y] = stretch(nscat,taup,f0,b,rmin,rrec,scat_range,scat_rcs,winid)
eps = 1.0e-16;
htau = taup / 2.;
c = 3.e8;
trec = 2. * rrec / c;
n = fix(2. * trec * b);
m = power_integer_2(n);
nfft = 2.^m;
x(nscat,1:nfft) = 0.;
y(1:nfft) = 0.;
if( winid == 0.)
   win(1:nfft) = 1.;
   win =win';
else
   if(winid == 1.)
      win = hamming(nfft);
   else
      if( winid == 2.)
         win = kaiser(nfft,pi);
      else
         if(winid == 3.)
            win = chebwin(nfft,60);
         end
      end
   end
end
deltar = c / 2. / b;
max_rrec = deltar * nfft / 2.;
maxr = max(scat_range) - rmin;
if(rrec > max_rrec | maxr >= rrec )
   'Error. Receive window is too large; or scatterers fall outside window'
   break
end
deltat = taup / nfft;
t = 0: deltat:taup-eps;
uplimit = max(size(t));
for j = 1:1:nscat
   psi1 = 4. * pi * scat_range(j) * f0 / c - ...
      4. * pi * b * scat_range(j) * scat_range(j) / c / c/ taup;
   psi2 = (4. * pi * b * scat_range(j) / c / taup) .* t;
   x(j,1:uplimit) = scat_rcs(j) .* exp(i * psi1 + i .* psi2);
   y = y + x(j,:);
end
figure(1)
plot(t,real(y),'k')
xlabel ('Relative delay - seconds')
ylabel ('Uncompressed echo')
title ('Zero delay coincide with minimum range')
ywin = y .* win';
yfft = fft(y,nfft) ./ nfft;
out= fftshift(abs(yfft));
figure(2)
time = -htau:deltat:htau-eps;
plot(time,out,'k')
xlabel ('Relative delay - seconds')
ylabel ('Compressed echo')
title ('Zero delay coincide with minimum range')
grid

