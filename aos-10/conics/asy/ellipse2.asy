size(0,200);
import geometry;

real A=130;
real B=3.1415/1.1;

pair O=(0,0);
pair R=(1,0);

real a = 1.3;
real b = 0.7;
real c = sqrt(a*a-b*b);
pair F1 = (c,0);
pair F2 = (-c,0);
pair V1 = (-a,0);
pair V2 = (a,0);
pair P=(a*cos(B),b*sin(B));

path ellipse(pair c, real a, real b)
{
  return shift(c)*scale(a,b)*unitcircle;
}

path EE = ellipse(0,a,b);

draw(EE);
draw(V1--V2);
draw(F1--P--F2, red);
dot("$F_1$", F1, S);
dot("$F_2$", F2, S);


dot(O);
dot("$P$",P ,dir(O--P));
label("$d_1$", (F2+P)/2, 2*E);
label("$d_2$", (F1+P)/2, W);

real t = B*2/3.1415;
pair tangent = dir(EE, t);
draw(shift(point(EE,t)) * scale(1/2) * (-tangent -- tangent));