function y=my_fun2(x)
vec=[2.2,3,4.5];
vec2=[3,0,1];
temp=vec*x'+vec2*x'.^2;
y=-temp;