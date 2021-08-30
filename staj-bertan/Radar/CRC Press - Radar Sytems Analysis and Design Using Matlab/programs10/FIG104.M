var=-01.:0.001:1.;
num=sin((8*2*pi*0.5).*var);
den=sin((2*pi*0.5).*var);
pattern=num./den;
maxval=max(abs(pattern));
pattern=abs(pattern./maxval);
i=0;
for ii=-1:0.001:1
i=i+1;
if(pattern(i) < 0.001)
   pattern(i)=0.0011;
end
end
%win=hamming(i)';
%pattern=pattern.*win;
%mod=10*log10(abs(pattern));
mod=abs(pattern);
%subplot(2,1,1);
plot(var,mod,'k');
grid;
xlabel('sine angle - dimensionless')
ylabel('array pattern')
%gtext('main lobe');
%gtext('grating lobe');
%gtext('grating lobe');
%title('(a)')

%var1=1.*pi.*var;
%patternj=2.*besselj(1,var1)./var1;
%mod=abs(pattern).*abs(patternj);
%subplot(2,1,2);
%plot(var,mod,'k');
%grid;
%xlabel('sine angle - dimensionless')
%ylabel('array pattern')
%gtext('main lobe');
%gtext('grating lobe');
%gtext('grating lobe');

