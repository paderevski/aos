# The Circle

The circle is one of the most basic shapes, known to humans for tens of thousands of years according to the archaeological record. It defines
everybody's favorite constant, $\pi$, and is the basis of analytic trigonometry.

**Geometric Definition**: The circle is the locus of points all equidistant
from a given *center*. The distance from any such point to the center is called the *radius*.

![Schematic of a Circle](figcircle.pdf){width=2in}

**Parent Equation**: $x^2+y^2=1$ is the equation for the unit circle, a circle centered at the origin with radius 1.

**General Equation**: $(x-h)^2 + (y-k)^2 = r^2$ is a circle with radius $r$ centered at $(h,k)$


**Parametric Equations**. A circle can be defined parametrically as the set of points $x = r \cos \theta, y = r \sin \theta$ for $\theta \in [0,2\pi)$. These equations trace the circle counterclockwise starting at the point $(r,0).$ Transforming these equations to a center of $(h,k)$ results in $x = h + r \cos \theta, y = k + r \sin \theta$.

**Polar Equation:** The polar equation for a circle centered at the origin is $r = R$, where $R$ is the radius. Translating  this to a different center is extremely difficult in polar coordinates.

## Problems

1. Find the radius of the circle $x^2 + y^2 = 100$
2. Find the radius of the circle $x^2 + y^2 = 72$
3. Find the radius and center of the circle $(x-8)^2 + (y+4)^2 = 20$
4. Find the radius and center of the circle $(3x-4)^2 = 100 - (3x + 1)^2$
5. Write the equation of a circle with radius 5 and center $(3,-4)$
6. Write the equation of a circle with radius $\frac{\sqrt{17}}{3}$ and center $(\frac13,\frac{-2}{3})$. Eliminate all denominators.
7. A diameter of a certain circle joins the points $(-12,7)$ and $(12,14)$. Find the equation of the circle.
8. An equilateral triangle has its base as the line segment joining the points $(-4,-2)$ and $(4,-2)$. Find the third point of the triangle. Circumscribe a circle around this triangle and find the equation of the circle. (Hint: the center of the circle is the average of the three triangle vertices).
9. Given the circle $x^2 + y^2 = 72$, find four points on the circle that form the vertices of a square.
10. Write the circle $(x+8)^2 + (y - \sqrt2)^2 = 15\sqrt 2$ in general form.
11. Complete the square to write the following in standard form: $x^2 + 10x + y^2 - 20y - 50 = 0$
12.  Complete the square to write the following in standard form: $4x^2 + 8x + 4y^2 - 20y  = 100$
13.  In the general form equation of a circle $Ax^2+Cy^2+Dx+Ey+F=0$, can $A$ be greater than $D$? Can it be less than $D$? Why or why not?
14.  Write an inequality which constrains $F$ in terms of the other coefficients in the general form equation of a circle. (Hint: find the
center and radius of the general equation first by completing the square.)
15. Find the intersection points of the circle $x^2 + y^2 = 80$ with the line $y=2x+1$. Round your answer to 3 places. (Hint: substitute the second equation into the first equation).
16. A regular hexagon is inscribed in a unit circle. What is its perimeter?
17. The circle $x^2 + y^2 = 25$ contains the points $(3,4)$ and $(3,-4)$. The tangent line to the circle at the point $(3,4)$ is perpendicular to the line segment from the origin to $(3,4)$. Write the equation of this tangent line. Also write the equation of the tangent line through $(3,-4)$.
18. Circle $C_1$ has radius 1 and is centered at the origin. Circle $C_2$ is tangent to circle $C_1$ at the point $(-\frac{\sqrt2}{2},-\frac{\sqrt2}{2})$, entirely contains circle $C_1$ and has twice the area of $C_1$. Write the equation of $C_2$ in standard form.
19. Write the parametric equations of a circle centered at $(5,-6)$ with radius $\sqrt{17}$.
20. What is the qualitative difference, if any, between the parametric equations $x = 3 + \cos(t), y = 3 + \sin(t)$ and the equations $x = 3-\cos(t), y=3-\sin(t)$?


---
geometry: margin=1in
header-includes:
- |
  \let\oldsection\section
  \renewcommand{\section}[1]{\clearpage\oldsection{#1}}
	\def\tightlist{}
---
