clear all
index = 0;
for x = -5:.01:5;
   index = index +1;
   if (x >= 0) 
   denom = 0.661 * x + 0.339 * sqrt(x^2 + 5.51);
   expo = exp(-x^2 /2.0);
   que(index) = 1.0 - (1.0 / sqrt(2.0 * pi)) * (1.0 / denom) * expo;
else
   denom = 0.661 * x + 0.339 * sqrt(x^2 + 5.51);
   expo = exp(-x^2 /2.0);
   value = 1.0 - (1.0 / sqrt(2.0 * pi)) * (1.0 / denom) * expo;
   que(index) = 1.0 - value;
end
end
xx = -5:.01:5;
plot(xx,que,'k');
grid



   