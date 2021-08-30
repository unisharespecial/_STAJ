i=0;
for x=0:.1:20
   i=i+1;
   y1(i)=incomplete_gamma(x,1);
   y2(i)=incomplete_gamma(x,3);
   y3(i)=incomplete_gamma(x,10);
end
xx=0:.1:20;
plot(xx,y1,xx,y2,xx,y3)