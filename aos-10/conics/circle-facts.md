# The Circle

The circle is one of the most basic shapes, known to humans for tens of thousands of years according to the archaeological record. It defines
everybody's favorite constant, $\pi$, and is the basis of analytic trigonometry.

**Geometric Definition**: The circle is the locus of points all equidistant
from a given *center*. The distance from any such point to the center is called the *radius*.  As a conic section, the circle is produced
from the intersection of a cone with any plane perpendicular to the central axis of
the cone.


![](fig-circle.pdf){height=1.5in}

![](fcc.pdf){height=1.5in}


**Parent Equation**: The parent equation $x^2+y^2=1$ is the equation for the unit circle, a circle centered at the origin with radius 1.

**Standard Form Equation**: $(x-h)^2 + (y-k)^2 = r^2$ is a circle with radius $r$ centered at $(h,k)$


**General Form Equation**: $Ax^2+Cy^2+Dx+Ey+F=0$. This is the general form for any (non-rotated) conic.

**Geometry Review**: Given a line segment joining $(x_1,y_1)$ and $(x_2,y_2)$

* the length of the segment is $\sqrt{(x_2-x_1)^2 + (y_2-y_1)^2}$
* The midpoint of the segment is $\left(\dfrac{x_1+x_2}{2}, \dfrac{y_1+y_2}{2}\right).$

**Completing the Square**: You can always rewrite $x^2 + bx +c$ as

  * $x^2 + bx +\left(\frac{b}{2}\right)^2 - \left(\frac{b}{2}\right)^2 +c$
  * which is $(x+\frac{b}{2})^2 + (c - \left(\frac{b}{2}\right)^2)$

<!---
**Parametric Equations**. A circle can be defined parametrically as the set of points $x = r \cos \theta, y = r \sin \theta$ for $\theta \in [0,2\pi)$. These equations trace the circle counterclockwise starting at the point $(r,0).$ Transforming these equations to a center of $(h,k)$ results in $x = h + r \cos \theta, y = k + r \sin \theta$.

**Polar Equation:** The polar equation for a circle centered at the origin is $r = R$, where $R$ is the radius. Translating  this to a different center is extremely difficult in polar coordinates.
-->

## Problems

Unless otherwise specified, any circle equations should be given in standard form

#### Fundamental Concepts
1. Find the radius of the circle $x^2 + y^2 = 100$.
2. Find the radius of the circle $x^2 + y^2 = 72$.
3. Find the radius and center of the circle $(x-8)^2 + (y+4)^2 = 20$.
4. Translate the circle given here by 5 units up and 3 units to the left: $(x+8)^2 + (y+2)^2 = 20$
5. Translate the circle given here so that its center is half as close to the origin: $(x+\sqrt{7})^2 + (y + \frac{\sqrt{5}}{2})^2 = \pi$
6. Write the equation of a circle with the same center but half the area of the circle $(x-1)^2+(y-5)^2=84$
7. Find the radius and center of the circle $(3x-4)^2 = 100 - (3y + 1)^2$
8. Write the equation of a circle with radius 5 and center $(3,-4)$. Write both standard and general form.
9.  Write the equation of a circle with radius $\frac{\sqrt{17}}{3}$ and center $(\frac13,\frac{-2}{3})$. Eliminate all denominators. Write both standard and general form.
10. A diameter of a certain circle joins the points $(-12,7)$ and $(12,14)$. Find the equation of the circle.
11. Write the circle $(x+8)^2 + (y - \sqrt2)^2 = 15\sqrt 2$ in general form.
12. Complete the square to write the following in standard form: $x^2 + 10x + y^2 - 20y - 50 = 0$
13. Complete the square to write the following in standard form: $4x^2 + 8x + 4y^2 - 20y  = 100$
14. Write a "completing the square" circle problem and trade with a friend.

#### Deeper Understanding
15. An equilateral triangle has its base as the line segment joining the points $(-4,-2)$ and $(4,-2)$. Find the third point of the triangle. Circumscribe a circle around this triangle and find the equation of the circle. (Hint: the center of the circle is the average of the three triangle vertices).
16.  Given the circle $x^2 + y^2 = 72$, find four points on the circle that form the vertices of a square.
17.  In the general form equation of a circle $Ax^2+Cy^2+Dx+Ey+F=0$, can $A$ be greater than $C$? Can it be less than $C$? Why or why not?
18.  Write an inequality which constrains $F$ in terms of the other coefficients in the general form equation of a circle. (Hint: find the
center and radius of the general equation first by completing the square.)
19. Find the intersection points of the circle $x^2 + y^2 = 80$ with the line $y=2x+1$. Round your answer to 3 places.
20. A regular hexagon is inscribed in a unit circle. What is its perimeter?
21. The circle $x^2 + y^2 = 25$ contains the points $(3,4)$ and $(3,-4)$. The tangent line to the circle at the point $(3,4)$ is perpendicular to the line segment from the origin to $(3,4)$. Write the equation of this tangent line. Also write the equation of the tangent line through $(3,-4)$.
22. Circle $C_1$ has radius 1 and is centered at the origin. Circle $C_2$ is tangent to circle $C_1$ at the point $(-\frac{\sqrt2}{2},-\frac{\sqrt2}{2})$, entirely contains circle $C_1$ and has twice the area of $C_1$. Write the equation of $C_2$ in standard form.

<!---
5.  Write the parametric equations of a circle centered at $(5,-6)$ with radius $\sqrt{17}$.
6.  What is the qualitative difference, if any, between the parametric equations $x = 3 + \cos(t), y = 3 + \sin(t)$ and the equations $x = 3-\cos(t), y=3-\sin(t)$?
-->

---
geometry: margin=1in
header-includes:
- |
  \let\oldsection\section
  \renewcommand{\section}[1]{\clearpage\oldsection{#1}}
	\def\tightlist{}
---
