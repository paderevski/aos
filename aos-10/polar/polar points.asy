import graph;
import polargrid;

settings.outformat = "pdf";
size(0,300);

real f(real t) {return 1+4*cos(t);}

path g=polargraph(new real(real t) {return 1+4*sin(t);},0,2pi)--cycle;
filldraw(g,pink);
drawPolarGrid(5);
