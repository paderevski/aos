if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
defaultfilename="polar-exploration copy-4";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

import polargrid;
size(1.75inch);
drawPolar(new real(real t) {return 3;}, 3);
