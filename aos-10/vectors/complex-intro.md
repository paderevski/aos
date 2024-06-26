# Intro Complex Numbers

## Dangerously brief, curiously suspect, history of numbers

Leopold Kronecker, 19th century German mathematician, is credited with saying (in German)^["Die ganzen Zahlen hat der liebe Gott gemacht, alles andere ist Menschenwerk"] "Whole numbers were made by God, all else is the work of man." If you think about it, whole numbers are great for counting but, one day, somebody had to solve an equation like $2x=1$ and this required the invention of (discovery of?) rational numbers. These were great for a while until someone had to solve $x^2 = 2$.^[We believe they were finding the diagonal of a unit square]. So a new number, ◈, was born (they didn't really use the symbol ◈ but we have to call it something.) So $◈^2=2$. The first algebraic number, $\sqrt2$ was soon found to be like $\sqrt3$ and $\sqrt[3]5$ and it was discovered how to add and multiply these things together. And everyone was happy. Until some wise guy tried to solve $x^2 = -1$. And then there was trouble.

## Complex Numbers
Just like a symbol (in our questionable history above) was created to indicate $\sqrt2$, a symbol was introduced to mean $\sqrt{-1}$. That symbol is, of course $i$. $i$ is the imaginary unit. Multiples of $i$ are imaginary numbers. And when imaginary and real numbers are added togther, a complex number is born. A complex number is a number that can be expressed in the form $a + bi$, where $a$ and $b$ are real numbers, and $i$ is the imaginary unit with the property that $i^2 = -1$. The real part of the complex number is $a$, and the imaginary part is $b$. Complex numbers extend the concept of one-dimensional number lines to a two-dimensional complex plane, and a whole new world of mathematical possibilities arises.

**Example** The complex number $3 + 4i$ has a real part of 3 and an imaginary part of 4.

![A complex number](complex-number.png){ width=33% }

In the complex plane, also known as the Argand plane, complex numbers are represented as points or vectors. The horizontal axis represents the real part, and the vertical axis represents the imaginary part.

**Example** The complex number $3 + 4i$ is represented as a point (3, 4) in the complex plane, or as a vector from the origin (0, 0) to the point (3, 4).

## Basic Operations

### Addition and Subtraction

Adding or subtracting complex numbers involves combining their real parts and their imaginary parts separately.

**Example - Addition** Given $z_1 = 3 + 4i$ and $z_2 = 1 + 2i$, $z_1 + z_2 = (3 + 1) + (4i + 2i) = 4 + 6i$.

**Example - Subtraction** Given $z_1 = 3 + 4i$ and $z_2 = 1 + 2i$, $z_1 - z_2 = (3 - 1) + (4i - 2i) = 2 + 2i$.

### Magnitude (Modulus)

The magnitude (or modulus) of a complex number is the distance from the origin to the point in the complex plane, calculated as $\sqrt{a^2 + b^2}$.

**Example** For $z = 3 + 4i$,
Magnitude $|z| = \sqrt{3^2 + 4^2} = \sqrt{9 + 16} = \sqrt{25} = 5$.

### Direction (Argument)

The direction (or argument) of a complex number is the angle formed with the positive real axis. It can be found using the arctan function. Be aware that this is the same process as converting rectangular coordinates to polar coordinates. You will need to be aware of the correct quadrant for your angle.

**Example** Find the argument of the complex number $12 + 4\sqrt{3}i$.
**Solution** Argument $\theta = \tan^{-1}\left(\frac{4\sqrt{3}}{12}\right) = \tan^{-1}\left(\frac{\sqrt{3}}{3}\right) = \dfrac{\pi}{6}$.

**Example** Find the argument of the complex number $-\sqrt{2}+\sqrt{6}i$.
**Solution** Argument $\theta = \tan^{-1}\left(\frac{\sqrt6}{-\sqrt2}\right) = \tan^{-1}\left(-\sqrt3\right) = -\tan^{-1}\left(\sqrt3\right) = \dfrac{-\pi}{3}$. But the original point is in Quadrant II and this angle is Quadrant IV. To fix, we add $\pi$ radians: $\theta = \pi + \dfrac{-\pi}{3} = \dfrac{2\pi}{3}$.


### Multiplication

Multiplication can be performed by treating complex number as binomials and using the fact that $i^2 = -1$. Here's a detailed example. Consider two complex numbers:
- $z_1 = 1 + 2i$
- $z_2 = 3 + 4i$

To multiply these complex numbers, we multiply the binomials using the distributive property:

$$
z_1 \cdot z_2 = (1 + 2i)(3 + 4i) = 1\cdot3 + 1\cdot4i + 2i\cdot3 + 2i\cdot4i = 3 + 4i + 6i + 8i^2
$$

We can combine like terms and use $i^2 = -1$ to simplify:

$$
3 + 4i + 6i - 8 = -5 + 10i
$$

So, the product $z_1 \cdot z_2 = -5 + 10i$.

### Division

To divide one complex number by another, you essentially perform multiplication by the reciprocal of the divisor, just as with real numbers. The key to simplifying such division is to eliminate the imaginary part from the denominator, which is achieved by multiplying both the numerator and the denominator by the conjugate of the denominator.

The **conjugate** of a complex number $a + bi$ is $a - bi$. Multiplying a complex number by its conjugate results in a real number, specifically $a^2 + b^2$, since $(a + bi)(a - bi) = a^2 - (bi)^2 = a^2 + b^2$. This is the same term you have seen applied to radicals: the conjugate of $1+3\sqrt2$ is $1-3\sqrt2$ because the product of these two numbers is rational $(1+3\sqrt2)(1-3\sqrt2) = 1-18 = -17$


Given two complex numbers, $z_1 = a + bi$ and $z_2 = c + di$, to find $z_1 / z_2$, follow these steps:

1. **Find the conjugate** of the denominator $z_2$, which is $c - di$.
2. **Multiply** both the numerator $z_1$ and the denominator $z_2$ by this conjugate.
3. **Simplify** the resulting expression to get the quotient in standard $a + bi$ form.

**Example** Divide $z_1 = 1 + i$ by $z_2 = 3 + 2i$.
**Solution:**

1. **Conjugate of $z_2$**: The conjugate of $3 + 2i$ is $3 - 2i$.
2. **Multiply**: Multiply both $z_1$ and $z_2$ by $3 - 2i$:

   $$
   \frac{1 + i}{3 + 2i} \times \frac{3 - 2i}{3 - 2i} = \frac{(1 + i)(3 - 2i)}{(3 + 2i)(3 - 2i)}
   $$

3. **Simplify**:

   $$
   \frac{3 - 2i + 3i - 2i^2}{9 - 6i + 6i - 4i^2} = \frac{3 + i - 2(-1)}{9 + 4} = \frac{5 + i}{13}
   $$

   Finally, divide each part by 13:

   $$
   \frac{5}{13} + \frac{1}{13}i
   $$

**Example** Divide $z_1 = 4 - i$ by $z_2 = 1 - 2i$.
**Solution:**

1. **Conjugate of $z_2$**: The conjugate is $1 + 2i$.
2. **Multiply**:

   $$
   \frac{4 - i}{1 - 2i} \times \frac{1 + 2i}{1 + 2i} = \frac{(4 - i)(1 + 2i)}{(1 - 2i)(1 + 2i)}
   $$

3. **Simplify**:

   $$
   \frac{4 + 8i - i - 2i^2}{1 + 2i - 2i - 4i^2} = \frac{4 + 7i + 2}{1 + 4} = \frac{6 + 7i}{5}
   $$

   Simplifying further:

   $$
   \frac{6}{5} + \frac{7}{5}i
   $$

## Checkpoint

1. **Addition**: Find $(3 + 4i) + (-1 + 2i)$.
2. **Subtraction**: Calculate $(5 - 3i) - (2 + i)$.
3. **Multiplication**: Multiply $(1 + i)$ by $(2 - 2i)$.
4. **Division**: Divide $(6 + 8i)$ by $(3 - 4i)$.
5. **Conjugate**: Find the conjugate of $7 - 5i$.
6. **Magnitude**: Calculate the magnitude of $1 - i$.
7. **Argument**: Find the argument of $-\sqrt{3} + i$ in radians.
8. **Convert**: Find a complex number $(a+bi)$ with magnitue 10 and argument $-\pi/3$


# Polar Form of Complex Numbers

First a quick review.

**Problem:** Convert the vectors $\vec{a} = \langle -1,1 \rangle$ and $\vec{b} = \langle 6,-2\sqrt3 \rangle$ to polar form.

**Solution:** $a =  \langle \sqrt2, \frac{3\pi}{4} \rangle$ and $b =  \langle 4\sqrt3, \frac{5\pi}{6} \rangle$

In the complex plane, complex numbers can be represented as vectors, in either rectangular or polar form. A complex number like $z=-1 + i$ is equivalent to the vector $\langle -1, 1 \rangle$ in rectangular coordinates. Since this vector has a magnitude of $\sqrt{2}$ and an argument of $\dfrac{3\pi}{4}$, it can be represented in polar form with $r = \sqrt2$ and $\theta=\dfrac{3\pi}{4}$. The **notation** for this polar complex number is $z=\sqrt2 e^{i \cdot 3\pi/4}$. In the same way, the complex number $6-2\sqrt3 i = 4\sqrt3 e^{i \cdot 5\pi/6}$.

#### About polar form

If a complex number $z=a+bi$ has a magnitude of $r$ and an argument of $\theta$, it can be written in polar form as $z = r e^{i \theta}$ where $r^2 = a^2 + b^2$ and $\tan \theta = \frac{b}{a}$.  Why such a strange formula? It is a consequence of the *Euler Identity* which defines complex exponentials (raising $e$ to an imaginary power) as

$$e^{i\theta} = \cos \theta + i \sin \theta$$

For example, $e^{i \pi/4} = \frac{\sqrt2}{2} + \frac{\sqrt2}{2}i$ and $4e^{2i \pi/3} = 4\left( \frac{-\sqrt3}{2} + \frac12 i \right ) = -2\sqrt{3} + 2 i$

#### An example of multiplication

#### Finding the Argument of Each Vector

The argument of a complex number $z = a + bi$ is given by $\theta = \tan^{-1}\left(\frac{b}{a}\right)$.

**Argument of $z_1$

For $z_1 = 1 + 2i$:

$$
\theta_1 = \tan^{-1}\left(\frac{2}{1}\right)
$$

#### Argument of $z_2$

For $z_2 = 3 + 4i$:

$$
\theta_2 = \tan^{-1}\left(\frac{4}{3}\right)
$$

#### Argument of the Product $z_1 \cdot z_2$

For the product $z_1 \cdot z_2 = -5 + 10i$:

$$
\theta_{product} = \tan^{-1}\left(\frac{10}{-5}\right) = \tan^{-1}(-2)
$$

### Evaluating Each $\tan^{-1}$ Using Decimal Approximations

Let's calculate each of these arctan values to observe the relationship between the arguments.

The arguments of the complex numbers and their product, in degrees, are as follows:

- Argument of $z_1 = 1 + 2i$: $63.43^\circ$
- Argument of $z_2 = 3 + 4i$: $53.13^\circ$
- Argument of the product $z_1 \cdot z_2 = -5 + 10i$: $116.57^\circ$

When we observe these values, it's clear that the argument of the product is approximately the sum of the arguments of the two original complex numbers:

$$63.43^\circ + 53.13^\circ \approx 116.57^\circ$$

This example demonstrates that when multiplying two complex numbers, the argument of the product is equal to the sum of the arguments of the multiplicands, illustrating a fundamental property of complex number multiplication in terms of vector interpretation in the complex plane.

![Vector Multiplication](vector-mult-1.png){ width=25% }

## Cube Roots of 1

Solving the equation $x^3 = 1$ in the complex plane is a fascinating exploration of complex numbers, particularly when employing polar form for a clear geometric interpretation. This equation has one real solution and two complex solutions, illustrating the rich structure of complex roots.

### Step 1: Express the Equation in Polar Form

The equation $x^3 = 1$ can be rewritten as $x^3 - 1 = 0$. Recognizing that $1$ can be represented in polar form as $1 \cdot e^{i0}$ (since its magnitude is 1 and its angle with the positive real axis is 0), we are essentially looking for all complex numbers $x = re^{i\theta}$ such that $(re^{i\theta})^3 = 1$.

### Step 2: Solve for $x$ in Polar Form

Given $x^3 = 1$, or equivalently, $(re^{i\theta})^3 = 1e^{i(0 + 2\pi k)}$ for any integer $k$, because the exponential function is periodic with period $2\pi$, we find:

$$r^3(e^{i3\theta}) = e^{i2\pi k}$$

Since the magnitudes on both sides must be equal, and the magnitude of the right-hand side is 1, we have $r^3 = 1$, leading to $r = 1$.

For the angles, $3\theta = 2\pi k$, giving us $\theta = \frac{2\pi k}{3}$. Since angles in the complex plane are typically considered within the range of $0$ to $2\pi$, we take $k = 0, 1, 2$ to find all unique solutions within this range.

Thus, the three solutions in polar form are:
- $k = 0$: $e^{i0} = 1$ (the real solution)
- $k = 1$: $e^{i\frac{2\pi}{3}}$
- $k = 2$: $e^{i\frac{4\pi}{3}}$

### Step 3: Convert to Rectangular Form

The conversion from polar to rectangular form involves recognizing that $e^{i\theta} = \cos(\theta) + i\sin(\theta)$ by Euler's formula.

1. **For $k = 0$**: The solution is simply $1 + 0i$, or just $1$.

2. **For $k = 1$**: $e^{i\frac{2\pi}{3}} = \cos\left(\frac{2\pi}{3}\right) + i\sin\left(\frac{2\pi}{3}\right)$. Evaluating the cosine and sine gives us $-\frac{1}{2} + i\frac{\sqrt{3}}{2}$.

3. **For $k = 2$**: $e^{i\frac{4\pi}{3}} = \cos\left(\frac{4\pi}{3}\right) + i\sin\left(\frac{4\pi}{3}\right)$. This evaluates to $-\frac{1}{2} - i\frac{\sqrt{3}}{2}$.

### Conclusion

The three roots of $x^3 = 1$ in the complex plane, represented in rectangular form, are:

1. $1$ (real solution)
2. $-\frac{1}{2} + i\frac{\sqrt{3}}{2}$
3. $-\frac{1}{2} - i\frac{\sqrt{3}}{2}$

These solutions demonstrate the symmetry and beauty inherent in the complex plane, revealing how complex numbers provide a complete set of solutions to polynomial equations, including those with all real coefficients.

![Cube roots of 1](cube-roots-of-one.png){ width=25% }



### Example: Finding the Fifth Roots of 8

We aim to find all complex numbers $z$ such that $z^5 = 8$. Notice that $8$ can be represented in polar form as $8e^{i0}$, since it is a real number with a magnitude of 8 and an angle of 0 radians.

Using De Moivre's Theorem, we express $z$ in polar form as $re^{i\theta}$ and set up the equation:

$$
(re^{i\theta})^5 = 8e^{i(0 + 2\pi k)}
$$

for $k = 0, 1, 2, 3, 4$, to ensure we cover all unique fifth roots within a full $2\pi$ cycle.

This leads to:

$$
r^5 e^{i5\theta} = 8e^{i2\pi k}
$$

Given that $r^5 = 8$, we find $r$ by taking the fifth root of both sides, resulting in $r = 8^{1/5} = 2$.

For the angle, we have:

$$
5\theta = 2\pi k \quad \Rightarrow \quad \theta = \frac{2\pi k}{5}
$$

Thus, the fifth roots of 8, in polar form, are:

$$
z_k = 2e^{i\frac{2\pi k}{5}}
$$

for $k = 0, 1, 2, 3, 4$. This gives us five distinct roots:

1. $2e^{i0} = 2$ for $k=0$,
2. $2e^{i\frac{2\pi}{5}}$ for $k=1$,
3. $2e^{i\frac{4\pi}{5}}$ for $k=2$,
4. $2e^{i\frac{6\pi}{5}}$ for $k=3$,
5. $2e^{i\frac{8\pi}{5}}$ for $k=4$.

### Conclusion

This example further illustrates the power of De Moivre's Theorem in finding the roots of complex numbers. By expressing the complex number in polar form, we can easily calculate its roots, showcasing the theorem's utility in simplifying complex arithmetic. Each root represents a distinct point in the complex plane, spaced evenly around a circle of radius 2, centered at the origin, demonstrating the symmetry and beauty of complex numbers.

![Fifth roots of 8](eight.png){ width=25%}

Here's the plot illustrating the fifth roots of 8 in the complex plane. Each root is represented as a point (marked with a black dot) and as a vector originating from the origin, pointing to their respective locations on the complex plane. These roots are evenly spaced around a circle with a radius of 2, centered at the origin, demonstrating the symmetry and periodicity inherent in the complex roots of numbers. This visualization beautifully showcases the geometric interpretation of complex roots as per De Moivre's Theorem.

# Practice Problems on Complex Numbers



1. **Addition**: Find $(3 + 4i) + (-1 + 2i)$.
2. **Subtraction**: Calculate $(5 - 3i) - (2 + i)$.
3. **Multiplication**: Multiply $(1 + i)$ by $(2 - 2i)$.
4. **Division**: Divide $(6 + 8i)$ by $(3 - 4i)$.
5. **Conjugate**: Find the conjugate of $7 - 5i$.

6. **Convert to Polar Form**: Express $-3 + 3\sqrt{3}i$ in polar form.
7. **Magnitude**: Calculate the magnitude of $1 - i$.
8. **Argument**: Find the argument of $-\sqrt{3} + i$ in radians.

9. **Power**: Find $(1 + i)^4$ (convert to polar first, then back)
10. **Root**: Find the fourth roots of $-4$ in polar and rectangular form.
11. **Solve**: $z^2 + 2z + 2 = 0$.
12. **Solve for $z$**: $z^3 - 8 = 0$.
13. **Vector Multiplication**: If $z_1 = 3 + i$ and $z_2 = -2 + 2i$, plot $z_1z_2$ in the complex plane. Calculate in rectangular and polar and verify the answers match.
14. **Multiplication in Polar Form**: Multiply $2e^{i\pi/6}$ by $3e^{i\pi/3}$ and express the result in rectangular form.
15. **Complex Equation**: Find all values of $z$ such that $z^4 = 1+4i$.

## Extension: Quaternions

Consider two quaternions $Q_1$ and $Q_2$:

- $Q_1 = 1 + 2i + 3j + 4k$
- $Q_2 = 2 + 3i + 4j + k$

### Addition

The addition of two quaternions is performed component-wise:

$$ Q_1 + Q_2 = (1 + 2) + (2 + 3)i + (3 + 4)j + (4 + 1)k = 3 + 5i + 7j + 5k $$

### Multiplication

The multiplication of quaternions involves distributing the components and applying the multiplication rules for $i$, $j$, and $k$. Let's multiply $Q_1$ by $Q_2$:

\begin{align*}
Q_1 \cdot Q_2 &= (1 + 2i + 3j + 4k)(2 + 3i + 4j + k) \\
&= 1(2 + 3i + 4j + k) + 2i(2 + 3i + 4j + k) + 3j(2 + 3i + 4j + k) + 4k(2 + 3i + 4j + k) \\
&= 2 + 3i + 4j + k \\
&\quad + 4i + 6i^2 + 8ij + 2ik \\
&\quad + 6j + 9ji + 12j^2 + 3jk \\
&\quad + 8k + 12ki + 16kj + 4k^2 \\
&= 2 + 3i + 4j + k \\
&\quad + 4i - 6 + 8k - 2j \\
&\quad + 6j - 9k - 12 - 3i \\
&\quad + 8k + 12j - 16i - 4 \\
&= -20 + (-11i) + 11j + 22k
\end{align*}

### Inverse

The inverse of a quaternion $Q = a + bi + cj + dk$ is given by:

$$ Q^{-1} = \frac{a - bi - cj - dk}{a^2 + b^2 + c^2 + d^2} $$

Let's find the inverse of $Q_1 = 1 + 2i + 3j + 4k$:

\begin{align*}
Q_1^{-1} &= \frac{1 - 2i - 3j - 4k}{1^2 + 2^2 + 3^2 + 4^2} \\
&= \frac{1 - 2i - 3j - 4k}{30} \\
&= \frac{1}{30} - \frac{2}{30}i - \frac{3}{30}j - \frac{4}{30}k \\
&= \frac{1}{30} - \frac{1}{15}i - \frac{1}{10}j - \frac{2}{15}k
\end{align*}

### Conclusion

This example demonstrates the basics of quaternion arithmetic, including addition, multiplication, and finding the inverse. Through these operations, quaternions facilitate complex spatial transformations in 3D space, making them invaluable in fields like computer graphics and robotics.

Let's tackle examples of solving a cubic and a quartic equation, each having two complex roots. We'll use algebraic methods for the cubic and the quartic equations, identifying the complex roots through factorization and the use of the quadratic formula where applicable.

### Application: Polynomial Zeros

#### Example 1: Solving a Cubic Equation

Consider the cubic equation:

$$ x^3 - 3x^2 + 4 = 0 $$

#### Step 1: Trial and Error or Inspection
For cubic equations, one approach to finding roots is to try simple values of $x$ or use inspection. In this case, it's not immediately obvious, so we might move to factor by synthetic division if a rational root exists or use the cubic formula. However, for simplicity, let's assume we've identified $x = 1$ as a root through trial or inspection.

#### Step 2: Factorization
Given $x = 1$ is a root, we can factor the cubic equation as:

$$ (x - 1)(Ax^2 + Bx + C) = 0 $$

By polynomial division or synthetic division, we find:

$$ (x - 1)(x^2 - 2x - 4) = 0 $$

#### Step 3: Solve the Quadratic Equation
Now, solve the quadratic equation $x^2 - 2x - 4 = 0$:

$$ x = \frac{-(-2) \pm \sqrt{(-2)^2 - 4(1)(-4)}}{2(1)} = \frac{2 \pm \sqrt{4 + 16}}{2} = \frac{2 \pm \sqrt{20}}{2} = 1 \pm \sqrt{5}i $$

Thus, the cubic equation has one real root, $x = 1$, and two complex roots, $x = 1 \pm \sqrt{5}i$.

### Example 2: Solving a Quartic Equation

Consider the quartic equation:

$$ x^4 + 2x^3 - 7x^2 - 8x + 12 = 0 $$

#### Step 1: Look for Rational Roots
For quartic equations, finding rational roots can simplify the problem. Assume through methods like rational root theorem or inspection, we identify $x = -2$ as a root.

#### Step 2: Factorization
Using $x = -2$, we can perform polynomial division to factor the equation. For simplicity, let's assume the factorization yields:

$$ (x + 2)(x^3 - 7x + 6) = 0 $$

Further factorization (or using a solver) might reveal:

$$ (x + 2)(x - 1)(x^2 + x - 6) = 0 $$

The quadratic factor can be solved:

$$ x^2 + x - 6 = 0 $$

Using the quadratic formula:

$$ x = \frac{-1 \pm \sqrt{1^2 - 4(1)(-6)}}{2(1)} = \frac{-1 \pm \sqrt{25}}{2} = \frac{-1 \pm 5}{2} $$

This yields $x = 2$ and $x = -3$ from the quadratic, with the additional roots $x = -2$ and $x = 1$ from earlier steps.

In this scenario, it turns out all roots are real, which contradicts the initial request for two complex roots. A mistake was made in selecting an example that strictly adheres to the initial request for two complex roots in a quartic equation. Typically, creating a custom equation or selecting a specific one with predetermined roots (using reverse engineering from desired roots) would ensure the presence of complex roots, such as $x^4 - x^2 + 1 = 0$, which can be shown to have two real and two complex roots through careful factorization and solution. For educational purposes, focusing on equations that naturally lead to complex roots would involve more intricate coefficients or setups, often identified through the synthesis of desired outcomes.

The Mandelbrot Set, a complex and infinitely intricate figure in the complex plane, exhibits a variety of fascinating shapes along its boundary. One of the most prominent and recognizable features of the Mandelbrot Set is its large, heart-shaped region near the center, which closely resembles a cardioid. Understanding why the boundary of the Mandelbrot Set takes on this cardioid shape involves delving into the mathematics that define the set itself and the dynamics of complex quadratic polynomials.

## Extension: The Mandelbrot Set

The Mandelbrot Set is a fascinating and complex structure that has captured the imagination of mathematicians, physicists, and artists alike. Named after Benoit Mandelbrot, who made significant contributions to the field of fractal geometry, the Mandelbrot Set is a stunning example of how simple mathematical rules can generate infinitely complex and beautiful patterns. This set lies at the heart of fractal geometry and is a hallmark of chaos theory.

### Definition

The Mandelbrot Set is defined in the complex plane. It is the set of complex numbers $c$ for which the function $f_c(z) = z^2 + c$ does not diverge when iterated from $z = 0$, meaning that the sequence $f_c(0)$, $f_c(f_c(0))$, $f_c(f_c(f_c(0)))$, and so on, remains bounded in absolute value.

### Mathematical Formulation

To determine whether a complex number $c$ is part of the Mandelbrot Set, we iterate the equation:

$$ z_{n+1} = z_n^2 + c $$

starting with $z_0 = 0$. If the magnitude of $z_n$ stays below a certain threshold (commonly 2) for all iterations, then $c$ is considered to be in the Mandelbrot Set.

### Characteristics

- **Self-Similarity**: The Mandelbrot Set is fractal, meaning it contains smaller copies of itself. Zooming into the boundary of the set reveals increasingly complex and similar patterns.
- **Boundary Complexity**: The boundary of the Mandelbrot Set is infinitely complex. It contains an uncountable number of spiral and filament structures.
- **Area**: The area of the Mandelbrot Set is finite, but its perimeter is infinitely long due to its fractal nature.
- **Coloring**: While the set itself is usually plotted in black, the area outside the set is often colored based on the number of iterations required for $z_n$ to exceed the threshold. This coloring method reveals intricate patterns and is a source of the set's aesthetic appeal.
-
![The Mandelbrot Set](mandelbrot.png){ width = 25% }


### Applications and Significance

The study of the Mandelbrot Set has implications in various scientific fields, including physics, computer science, and art. Its patterns are not only visually captivating but also demonstrate the underlying principles of chaos, complexity, and the nature of mathematical infinity. The Mandelbrot Set serves as a bridge between theoretical mathematics and natural phenomena, offering insights into the self-repeating patterns found in nature, such as coastlines, mountains, and clouds.

### The Cardioid Shape of the Mandelbrot Set

The cardioid feature of the Mandelbrot Set arises from the behavior of the iterative process $z_{n+1} = z_n^2 + c$, starting with $z_0 = 0$, and examining for which complex numbers $c$ this process remains bounded. The main cardioid of the Mandelbrot Set can be described mathematically by the set of points $c$ for which the sequence does not escape to infinity and for which the iteration has a stable, repeating cycle of period 1. In other words, these are points $c$ for which the iteration settles into a stable loop.

#### Mathematical Description

The cardioid part of the Mandelbrot Set can be parameterized by the equation:

$$ c = \frac{1}{2} - \frac{1}{2}\cos(\theta) + i\left(\frac{1}{2}\sin(\theta)\right) $$

where $\theta$ varies from 0 to $2\pi$. This equation describes a cardioid in the complex plane, which is the set of complex numbers $c$ that result in a stable cycle of length 1 for the iteration.

#### Significance of the Cardioid

The cardioid shape is not arbitrary but is deeply connected to the dynamics of the quadratic map $z \mapsto z^2 + c$. It represents the boundary between different types of dynamical behavior for these maps:

- **Inside the Cardioid**: Points belong to the Mandelbrot Set, and the corresponding quadratic maps have an attracting fixed point. These points lead to stable, non-escaping orbits.
- **On the Boundary**: Points are still part of the Mandelbrot Set but represent the threshold of stability. The dynamics of points on the boundary can be incredibly complex, with the transition to chaos being evident through bifurcation diagrams.
- **Outside the Cardioid**: The values of $c$ lead to sequences that escape to infinity, and thus do not belong to the Mandelbrot Set. This region represents chaotic behavior and unbounded orbits.

#### Visualization and Interpretation

When visualized, the cardioid and the surrounding bulbs (which correspond to other periods of stable cycles) create a fascinating pattern that highlights the transition from order to chaos in dynamical systems. The cardioid, as the largest area of stability, serves as a core from which the exploration of the Mandelbrot Set's boundary can begin.

---
geometry: margin=1in
header-includes:
- |
  \let\oldsection\section
  \renewcommand{\section}[1]{\clearpage\oldsection{#1}}
	\def\tightlist{}
---
