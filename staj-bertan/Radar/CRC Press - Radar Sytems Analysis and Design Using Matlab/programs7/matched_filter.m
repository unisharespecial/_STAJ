function [y] = matched_filter(nscat,taup,f0,b,rmin,rrec,scat_range,scat_rcs,winid)
eps = 1.0e-16;
htau = taup / 2.;
c = 3.e8;
n = fix(2. * taup * b);
m = power_integer_2(n);
nfft = 2.^m;
x(nscat,1:nfft) = 0.;
y(1:nfft) = 0.;
replica(1:nfft) = 0.;
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
trec = 2. * rrec / c;
deltat = taup / nfft;
t = 0: deltat:taup-eps;
uplimit = max(size(t));
replica(1:uplimit) = exp(i * 2.* pi * (.5 * (b/taup) .* t.^2));
figure(3)
subplot(2,1,1)
plot(real(replica))
title('Matched filter time domain response')
subplot(2,1,2)
plot(fftshift(abs(fft(replica))));
title('Matched filter frequency domain response')
for j = 1:1:nscat
   t_tgt = 2. * (scat_range(j) - rmin ) / c +htau;
   x(j,1:uplimit) = scat_rcs(j) .* exp(i *  2.* pi * ...
      (.5 * (b/taup) .* (t+t_tgt).^2));
   y = y + x(j,:);
end
figure(1)
plot(t,real(y),'k')
xlabel ('Relative delay - seconds')
ylabel ('Uncompressed echo')
title ('Zero delay coincide with minimum range')
rfft = fft(replica,nfft);
yfft = fft(y,nfft);
out= abs(ifft((rfft .* conj(yfft)) .* win' )) ./ (nfft);
figure(2)
time = -htau:deltat:htau-eps;
plot(time,out,'k')
xlabel ('Relative delay - seconds')
ylabel ('Compressed echo')
title ('Zero delay coincide with minimum range')
grid

