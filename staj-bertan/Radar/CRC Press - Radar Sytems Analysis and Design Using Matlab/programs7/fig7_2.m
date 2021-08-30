clear all
format long
taup = 100.e-5;
c = 3.e8;
b = 10.e6;
dr = c /(2.*b);
mu = b /taup;
samples = 2.* b * taup;
ts = taup / samples;
r1 = 1000.;
r2 = 2000.;
t1 = 2.*r1/c;
t2 = 2.*r2/c;
f0 = 5.6e9;
deltar = (r2 - r1); 
psi = -2.*pi*deltar/c;
t = 0:ts:taup;
replica = cos(2.*pi*mu .*t.^2);
n = 0;
for time = 0:ts:taup;
   n = n + 1.;
   x1(n) = 0.5*cos(-2.*pi*f0*t1+pi*mu*time^2+2.*pi*t1^2-2.*pi*mu*time*t1);
%...  sqrt(-1) * sin(-2.*pi*f0*t1+2.*pi*mu*time^2+2.*pi*t1^2-4.*pi*mu*time*t1);
   x2(n) = cos(-2.*pi*f0*t2+pi*mu*time^2+2.*pi*t2^2-2.*pi*mu*time*t2+psi);
%... +sqrt(-1)*sin(-2.*pi*f0*t2+2.*pi*mu*time^2+2.*pi*t2^2-4.*pi*mu*time*t2));
end
x = x1 + x2;
%figure(1)
%plot (t,abs(x))
for n=1:4096
   if(n<= 2001)
      xi(n) = x(n);
      ri(n) = replica(n);
   else
      xi(n) = 0.;
      ri(n) = 0.;
   end
end
xfft = fft(xi);
rfft = fft(ri);
yfft = conj(xfft) .* rfft;
y = fftshift(ifft(yfft));
maxval = max(abs(y));
 y = abs(y) ./ maxval + eps;
 figure(1)
 tt = 0:1e-3/4096:1e-3-.00000001;
 plot(tt,y,'k')
 grid
%figure(3)
%ydb = 10.* log10(y+.001);
%plot((ydb))
for thin = 1:4096/4
   index = (thin)*4;
   xthin(thin) = xi(index);
end
figure(2)
t = 0: 1e-3/500:1e-3;
plot(t,xthin(1:501),'k') 
grid