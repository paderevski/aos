import graph;

void drawPolarGrid(real r) {
	real labelsize = 6;
	if (r<0) {
		r=1;
	}
	real r2 = r;

	for (real r0 = 1; r0 <= r; r0 = r0 + 1) {
		path c = circle((0,0),r0);
		draw(c, linewidth(0.5));
	}

	for (real t = 0; t < 2*pi; t += pi/12) {
		pair pt = (cos(t),sin(t));
		path l = (pt -- r*pt);
		draw(l, linewidth(0.5));
		path l = (-r*pt -- -pt);
		draw(l, linewidth(0.5));
	}

	for (real t = 0; t < 2*pi; t += pi/6) {
		pair pt = (cos(t),sin(t));
		path l = ((0,0)-- 1*pt);
		draw(l, linewidth(0.5));
		path l = (-1*pt -- (0,0));
		draw(l, linewidth(0.5));
	}
	label("$0$",r2*(cos(0*pi/12),sin(0*pi/12)), fontsize(labelsize), align=(2,0));
	label("$\pi/6$",r2*(cos(2*pi/12),sin(2*pi/12)), fontsize(labelsize), align=(cos(2*pi/12),sin(2*pi/12)));
	label("$\pi/4$",r2*(cos(3*pi/12),sin(3*pi/12)), fontsize(labelsize), align=(cos(3*pi/12),sin(3*pi/12)));
	label("$\pi/3$",r2*(cos(4*pi/12),sin(4*pi/12)), fontsize(labelsize), align=(cos(4*pi/12),sin(4*pi/12)));
	label("$\pi/2$",r2*(cos(6*pi/12),sin(6*pi/12)), fontsize(labelsize), align=(cos(6*pi/12),sin(6*pi/12)));
	label("$2\pi/3$",r2*(cos(8*pi/12),sin(8*pi/12)), fontsize(labelsize), align=(cos(8*pi/12),sin(8*pi/12)));
	label("$3\pi/4$",r2*(cos(9*pi/12),sin(9*pi/12)), fontsize(labelsize), align=(cos(9*pi/12),sin(9*pi/12)));
	label("$5\pi/6$",r2*(cos(10*pi/12),sin(10*pi/12)), fontsize(labelsize), align=(cos(10*pi/12),sin(10*pi/12)));
	label("$\pi$",r2*(cos(12*pi/12),sin(12*pi/12)), fontsize(labelsize), align=(cos(12*pi/12),sin(12*pi/12)));
	label("$7\pi/6$",r2*(cos(14*pi/12),sin(14*pi/12)), fontsize(labelsize), align=(cos(14*pi/12),sin(14*pi/12)));
	label("$5\pi/4$",r2*(cos(15*pi/12),sin(15*pi/12)), fontsize(labelsize), align=(cos(15*pi/12),sin(15*pi/12)));
	label("$4\pi/3$",r2*(cos(16*pi/12),sin(16*pi/12)), fontsize(labelsize), align=(cos(16*pi/12),sin(16*pi/12)));
	label("$3\pi/2$",r2*(cos(18*pi/12),sin(18*pi/12)), fontsize(labelsize), align=(cos(18*pi/12),sin(18*pi/12)));
	label("$5\pi/3$",r2*(cos(20*pi/12),sin(20*pi/12)), fontsize(labelsize), align=(cos(20*pi/12),sin(20*pi/12)));
	label("$7\pi/4$",r2*(cos(21*pi/12),sin(21*pi/12)), fontsize(labelsize), align=(cos(21*pi/12),sin(21*pi/12)));
	label("$11\pi/6$",r2*(cos(22*pi/12),sin(22*pi/12)), fontsize(labelsize),  align=(cos(22*pi/12),sin(22*pi/12)));
}

void drawPolarGrid() {
	drawPolarGrid(1);
}

void drawPolar(real f(real), real rMax) {
	path g=polargraph(f,0,2pi);
	draw(g, linewidth(2.0)+red+opacity(0.7));
	drawPolarGrid(rMax);
}

void drawPolar(real f(real)) {
	path g=polargraph(f,0,2pi);
	draw(g, linewidth(2.0)+red+opacity(0.7));
	drawPolarGrid(1);
}

void drawPolar(real f(real), real rMax, real t0, real t1) {
	path g=polargraph(f,t0,t1);
	draw(g, linewidth(2.0)+red+opacity(0.7));
	drawPolarGrid(rMax);
}