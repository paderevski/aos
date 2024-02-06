if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="polar-exploration copy-9";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import polargrid;
size(1.75inch);
drawPolar(new real(real t) {return 2/(0.01+cos(t));}, 3,-0.8,0.8);
