if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="temp-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import polargrid;
size(2inch);
drawPolar(new real(real t) {return 1+2*sin(t-1);}, 3);