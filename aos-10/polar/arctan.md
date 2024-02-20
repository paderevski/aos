# Guide to arctan

To find $\text{arctan}(y/x)$ and ensure it corresponds to the correct quadrant for points on the unit circle, it's essential to understand the properties of the tangent function and the unit circle itself. The unit circle is a circle with a radius of 1, centered at the origin (0,0) in the Cartesian coordinate system.

### Understanding $\text{arctan}(y/x)$

The function $\text{arctan}(y/x)$ gives the angle whose tangent is $y/x$. Since tangent is $y/x$ on the unit circle, $\text{arctan}(y/x)$ directly gives the angle from the positive x-axis to the point $(x,y)$ on the unit circle. However, $\text{arctan}$ by itself only gives values from $-\frac{\pi}{2}$ to $\frac{\pi}{2}$ (or -90° to 90°), which corresponds to angles located in the first and fourth quadrants.

### Getting the Right Quadrant

To ensure that $\text{arctan}(y/x)$ gives the angle in the correct quadrant for points on the unit circle:

1. **First Quadrant (Q1)**: If $x > 0$ and $y > 0$, $\text{arctan}(y/x)$ already gives the correct angle since both $x$ and $y$ are positive.

2. **Second Quadrant (Q2)**: If $x < 0$ and $y > 0$, the point is in the second quadrant. $\text{arctan}(y/x)$ will give a negative angle because $y/x$ is negative (due to $x$ being negative). To adjust, add $\pi$ (or 180°) to $\text{arctan}(y/x)$ to get the correct angle.

3. **Third Quadrant (Q3)**: If $x < 0$ and $y < 0$, $\text{arctan}(y/x)$ gives a positive angle, but it's actually pointing to the first quadrant's equivalent angle. Add $\pi$ (or 180°) to get the angle in the third quadrant.

4. **Fourth Quadrant (Q4)**: If $x > 0$ and $y < 0$, $\text{arctan}(y/x)$ gives the correct angle since the tangent of angles in the fourth quadrant is negative. However, if you need the angle in terms of 0 to $2\pi$ (or 0° to 360°) instead of $-\pi/2$ to $\pi/2$, you can add $2\pi$ (or 360°) to the angle if it's negative.

### Special Cases

- **On the Y-Axis ($x = 0$)**: $\text{arctan}(y/x)$ is undefined because division by zero is not possible. For points $(0, 1)$ and $(0, -1)$ on the unit circle, the angles are directly $\pi/2$ (or 90°) and $3\pi/2$ (or 270°), respectively.
- **At the Origin**: The origin (0,0) is not on the unit circle and does not have a defined angle in this context.

### Summary

To correctly identify the angle $\theta = \text{arctan}(y/x)$ for a point on the unit circle and ensure it's in the right quadrant, consider the signs of $x$ and $y$ and adjust the angle accordingly. This method ensures that the angle reflects the point's actual position on the unit circle.


### Unit circle first quadrant
For points on the unit circle, especially in the first quadrant, reference values of $t$ (where $t$ is the tangent of the angle $\theta$) correspond to common angles. The unit circle in the first quadrant involves angles between 0 and $\frac{\pi}{2}$ radians (0° to 90°). Here's a list of $\text{arctan}(t)$ values for key reference angles in the first quadrant:

1. **$t = 0$ (Angle $0$)**:
   - $\text{arctan}(0) = 0$ radians or 0°.
   - This corresponds to the point (1,0) on the unit circle.

2. **$t = 1$ (Angle $\frac{\pi}{4}$)**:
   - $\text{arctan}(1) = \frac{\pi}{4}$ radians or 45°.
   - This is for the point $\left(\frac{\sqrt{2}}{2}, \frac{\sqrt{2}}{2}\right)$.

3. **$t = \sqrt{3}$ (Angle $\frac{\pi}{3}$)**:
   - $\text{arctan}(\sqrt{3}) = \frac{\pi}{3}$ radians or 60°.
   - This corresponds to the point $\left(\frac{1}{2}, \frac{\sqrt{3}}{2}\right)$.

4. **$t = \frac{1}{\sqrt{3}}$ (Angle $\frac{\pi}{6}$)**:
   - $\text{arctan}\left(\frac{1}{\sqrt{3}}\right) = \frac{\pi}{6}$ radians or 30°.
   - This is for the point $\left(\frac{\sqrt{3}}{2}, \frac{1}{2}\right)$.


### Unit circle fourth quadrant

Since $\arctan(-x) = -\arctan(x)$, the fourth quadrant just negates all the above. For example $\arctan(-\sqrt3) = -\arctan(\sqrt3) = -\pi/3$

### Summary
These values are fundamental in trigonometry and are especially useful for understanding the relationship between the angle $\theta$, its tangent $t$, and how $\text{arctan}(t)$ maps $t$ back to $\theta$. In the first quadrant, where both $x$ and $y$ coordinates (and consequently the tangent $t$) are positive, $\text{arctan}(t)$ directly gives the angle $\theta$ that $t$ corresponds to.


---
geometry: margin=1in
header-includes:
- |
  \let\oldsection\section
  \renewcommand{\section}[1]{\clearpage\oldsection{#1}}
	\def\tightlist{}
---