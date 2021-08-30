clear all
i=0;
for x=0:.1:15
   i=i+1;
   y1(i)=incomplete_gamma(x,1);
   y2(i)=incomplete_gamma(x,3);
   y4(i)=incomplete_gamma(x,6);
   y3(i)=incomplete_gamma(x,10);
end
xx=0:.1:15;
plot(xx,y1,'k',xx,y2,'k:',xx,y3,'k--',xx,y4,'k-.')
legend('N = 1','N = 3','N = 6','N = 10')
xlabel('x')
ylabel('Incomplete Gamma function (x,N)')