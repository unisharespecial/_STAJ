clear all
n = 0;
 for x = 0:.05:4
n = n+1;
sx(n) = quad8('fresnels',.0,x);
cx(n) = quad8('fresnelc',.0,x);
end
 plot(cx)
 x=0:.05:4; 
 plot(x,cx,'k',x,sx,'k--')
 grid
 xlabel ('x')
 ylabel ('Fresnel integrals: C(x); S(x)')
 legend('C(x)','S(x)')
 