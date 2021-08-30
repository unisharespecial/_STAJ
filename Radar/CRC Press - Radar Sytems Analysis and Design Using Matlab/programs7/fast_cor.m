%function y = fast_cor[nscat, rmin, rmax, taup, f0, b, scat_range, scat_rcs, winid]
clear all
format long
nscat = 3.;
rmin = 1000.;
rmax = 1100.;
taup = 5.e-6;
f0 = 22.e6;
b = 16.e6;
scat_range = [1015 1035 1055];
scat_rcs = [ 10 10. 10. ];
winid = 0.;
eps = 1.0e-10;
c = 3.0e8;
htaup = taup / 2.;
mu = b / taup;
for j = 1:1:nscat
   t_tgt(j) = 2. * (scat_range(j)-rmin) / c;
end
rec_win_range = rmax - rmin;
t_rec = 2.* rec_win_range / c;
% assume complex samples
fs = 1.2 * b; 
delta_t = 1. / fs;
%n = fix(trec / delta_t)
trec = taup + t_rec;
n = fix((taup + trec) / delta_t);
m = power_integer_2(n);
nfft = 2.^m;
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
% compute the replica
index = 0.;
for tt = 0:delta_t:taup
   index = index + 1.;
   psi = 2. * pi * (0.5 * mu * tt^2);
   replica(index) = exp(sqrt(-1)*psi);
   %replica(index) = cos( pi * mu * tt^2);
end
% compute the overall uncompressed returns signal
for jscat = 1:1:nscat
   index = 0.;
   for time = 0:delta_t:trec
      index = index +1.;
      if (time >= (t_tgt(jscat)) & time <= (t_tgt(jscat)+taup))
      %if (time >= (t_tgt(jscat)) & time <= (t_tgt(jscat)+taup))
         psi =  2. * pi * (0.5 * mu * time^2);
         x(index) = x(index) + scat_rcs(jscat) * exp(i*psi);
      else
         x(index) = x(index);
      end
   end
end
xfft = fft(x);
figure(3)
plotyy(abs(x),'r',abs(replica),'b')
rfft = fft(replica);
yfft = (xfft) .* conj(rfft);
y = fftshift(ifft(yfft));
maxval = max(abs(y));
y = abs(y) ./ (maxval);
 figure(1)
 %plot(20 .*log10(y+eps))
 plot(y)
 grid
 figure(2)
 delf = b*1.e-6/nfft;
 d = 14:delf:30-eps;
 maxval = max(abs(rfft));
 rfft = abs(rfft) ./ maxval;
 plot(d,20. .*log10((rfft+eps))) 
 grid
 

