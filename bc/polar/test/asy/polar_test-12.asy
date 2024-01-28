if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="polar_test-12";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import polargrid;
size(2inch);
drawPolar(new real(real t) {return 3/sin(t+0.01);}, 5);
clip((5,5)--(-5,5)--(-5,-5)--(5,-5)--cycle);
