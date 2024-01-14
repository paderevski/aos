if(!settings.multipleView) settings.batchView=false;
settings.tex="pdflatex";
settings.inlinetex=true;
deletepreamble();
defaultfilename="ellipse-1";
if(settings.render < 0) settings.render=4;
settings.outformat="";
settings.inlineimage=true;
settings.embed=true;
settings.toolbar=false;
viewportmargin=(2,2);

// Global Asymptote definitions can be put here.
settings.prc=true;
import three;
usepackage("bm");
texpreamble("\def\V#1{\bm{#1}}");
// One can globally override the default toolbar settings here:
// settings.toolbar=true;

import graph;
import geometry;

size(10cm);

// Define the ellipse E
ellipse ell = shift((0,0))*xscale(6)*yscale(4)*unitcircle;

// Define foci F1 and F2
pair F1 = (-sqrt(20),0);
pair F2 = (sqrt(20),0);

// Define point P on the ellipse
pair P = intersectionpoint(E, Line((2,-10),(2,10)));

// Draw the ellipse
draw(E, blue + 1bp);

// Draw foci
dot(F1, red);
label("$F_1$", F1, SW);
dot(F2, red);
label("$F_2$", F2, SE);

// Draw point P
dot(P, red);
label("$P$", P, NE);

// Draw tangent line at P
draw(tangent(P, E, 1), green);

// Draw line parallel to x-axis through P
draw(P--(P.x,0), magenta + dashed);
pair S = (P.x, 0);
dot(S);
label("$S$", S, S);

// Draw perpendicular from P to x-axis
draw(P--(0,P.y), magenta + dashed);

// Label angles
label("$\alpha$", P, 1.5*dir(75));
label("$\beta$", P, 1.5*dir(25));
label("$\gamma$", P, 1.5*dir(-45));

// Add labels to vertices
pair V1 = (6,0);
pair V2 = (0,4);
pair V3 = (-6,0);
pair V4 = (0,-4);
dot(V1); dot(V2); dot(V3); dot(V4);
label("$(6,0)$", V1, E);
label("$(0,4)$", V2, N);
label("$(-6,0)$", V3, W);
label("$(0,-4)$", V4, S);

// Add label for ellipse E
label("$E$", (6,4), NE);

shipout(bbox(6cm));
