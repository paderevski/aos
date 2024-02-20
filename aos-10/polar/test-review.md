# Precalculus Review Sheet

## Parametric Equations

1. Given the parametric equations $x(t) = 3t + 2$ and $y(t) = 2t - 5$, find $y$ as a function of $x$.
2. Sketch the curve described by $x(t) = \sin(t)$, $y(t) = \cos(t)$ for $0 \leq t \leq 2\pi$.
3. For the parametric equations $x(t) = t^2 - 4$ and $y(t) = t + 1$, eliminate the parameter to find the Cartesian equation.
4. Given $x(t) = e^t$ and $y(t) = e^{-t}$, determine the Cartesian equation and identify the type of curve.
5. Plot the trajectory of a projectile given by $x(t) = 5t$ and $y(t) = 20t - 4.9t^2$.

## Converting Between Polar and Rectangular Coordinates

1. Convert the polar coordinate $(5, \pi/3)$ to rectangular coordinates.
2. Express the rectangular coordinate $(-3, \sqrt{3})$ in polar form.
3. Given the polar equation $r = 4\cos(\theta)$, convert it to rectangular form.
4. Convert the rectangular equation $y = 2x + 3$ to polar form.
5.  Find the polar coordinates of the point $(4, -4)$ ensuring $r > 0$ and $0 \leq \theta < 2\pi$.

## Polar Graphing

You should be able to recognize basic polar graphs: roses, cardioids, circles: $r=cos(n\theta)$, $r=\sin(n\theta)$, $r=a+b\cos\theta$, $r=a+b\sin\theta$, $r=a\cos \theta$, and $r=a\sin\theta$. For the following problems, find the $x$ and $y$ intercepts by plugging in $\theta = 0,\pi/2,\pi$ and $3\pi/2$. Then describe the graph in words. Check with Desmos. You will not have to graph on the test but you should be able to match, describe, etc.

11.   $r = 2 + 2\sin(\theta)$.
2.  $r = 1 - \cos(\theta)$ .
3.   $r = 3\cos(2\theta)$ .
4.   $r = 2\sin(3\theta)$.
5.  $r = -\cos(\theta)$.

## Converting Equations Between Polar and Rectangular Forms

16. Convert the polar equation $r^2 = 4\sin(2\theta)$ to rectangular form.
17. Express the rectangular equation $x^2 + y^2 = 9$ in polar form.
18. Convert $r = \frac{2}{1 - \sin(\theta)}$ to its rectangular equivalent.
19. Given the rectangular equation $x^2 - y^2 = 4$, convert it to polar form.
20. Transform the polar equation $r\cos(\theta) = 1$ into rectangular coordinates.

## Free-Fall Word Problems (Calc)

For free fall the following equations hold, given initial height $s_0$ and velocity $v_0$ at an angle $\theta$

  * $v_x(t) = v_0 \cos(\theta)$
  * $v_y(t) = -gt + v_0 \sin(\theta)$
  * $s_x(t) = v_0\cos(\theta) \cdot t$
  * $s_y(t) = -\frac12 g t^2 + v_0\sin(\theta) \cdot t + s_0$

Maximum height occurs when $v_y(t) = 0$ and maximum range is when $s_y(t) = 0$ (assuming 0 is ground level).

Where the acceleration constant $g$ is approximately $9.8\; m/s^2$ or $32\; ft/s^2$

1.  A ball is thrown upward with an initial velocity of $20 \, \text{m/s}$. How long does it take to reach its maximum height?
2.  From a height of $45 \, \text{m}$, a stone is dropped. Calculate the time it takes for the stone to hit the ground.
3.  An object is thrown vertically upward and its height after $t$ seconds is given by $h(t) = -4.9t^2 + 30t + 2$. Find the maximum height reached by the object.
4.  A projectile is launched from the ground with an initial velocity of $50 \, \text{m/s}$ at an angle of $30^\circ$ to the horizontal. Determine its range.
5.  How long is a ball in the air if it is kicked with an initial velocity of $40 \, \text{m/s}$ at an angle of $45^\circ$ to the ground?


---
geometry: margin=1in
header-includes:
- |
  \let\oldsection\section
  \renewcommand{\section}[1]{\clearpage\oldsection{#1}}
	\def\tightlist{}
---
