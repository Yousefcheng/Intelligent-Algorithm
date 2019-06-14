[x,y]=meshgrid([0:0.1:10]);
z=20+x.*x+y.*y-10*(cos(2*pi*x)+cos(2*pi*y)); 
surfc(x,y,z);
% shading interp