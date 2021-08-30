function [y] = fast_conv(nscat,taup,f0,b,rmin,rmax,scat_range,scat_rcs,winid)
eps = 1.0e-6;
htau = taup / 2.;
c = 3.e8;
rec_win_range = (rmax - rmin) * 1.e3
t_rec = 2.* rec_win_range / c;
delta_t = 1. / 2. / b;
trec = taup + t_rec;
n = fix((taup + trec) / delta_t);
m = power_integer_2(n);
nfft = 2.^m
x(1:nfft) = 0.;
replica(1:nfft) = 0.;
% compute the window
if( winid == 0.)
   win(1:nfft) = 1.;
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
%compute replica
t = 0: delta_t:taup;
size_indicator = size(t);
uplimit = size_indicator(2);
replica(1:uplimit) = chirp(t,f0,htau,b/2);
%compute returns of all targtes
for j = 1:1:nscat
   t_tgt(j) = 2. * scat_range(j) / c;
   time = htau + t_tgt(j);
   x(1:nfft) = x(1:nfft) + scat_rcs(j) .* chirp(t,f0,time,b/2);
end
figure(1)
plot(replica);
%figure(2)
%plotyy(10. .*log10((abs(fft(y1)))),'r',10. .*log10(fftshift(abs(fft(y2)))),'b')