---
title: Parametric Equations Exploration
author: AOS Senior BC Calculus
geometry: margin=1.0in
documentclass: extarticle
fontsize: 11pt
colorlinks: true
---

# Intro to Parametrics

A system of parametric equations links dependent variables such as
$x(t)$ and $y(t)$ to a single parameter, $t$. Parametric equations
can be used to specify curves in the plane that are more intricate than simple functions $y=f(x)$. A parametric curve is the set of points $(x(t), y(t))$ generated as $t$ ranges over an interval such as $a \leq t \leq b$. Similarly, curves in space can be defined as the set of points $(x(t),y(t),z(t))$. Surfaces can be defined as $(x(u,v), y(u,v), z(u,v))$ for parameters $u,v$. All of these can easily be extended to higher dimensions simply by adding more parameters or more dependent variables.

In this lesson you will explore some plane curves defined by parametric equations.

## Line Dancing

Parametric curves are easily plotted in Desmos. Take the system $x = 2t+1, y = 2t - 1$ for $-2 \leq t \leq 2$. You can plot this in Desmos simply by typing $(2t+1, 2t-1)$ and entering the domain for $t$. Sketch the graph below. On your sketch add arrows on the curve to indicate the direction in which is drawn as $t$ ranges from $-2$ to $2$.\
\
\
\
\
\
\
\
\
\
\


This system is simple. In fact it can be rewritten as $y=x-2$ for $x \in [-3,5]$. Why write it parametrically? One good reason is the parametric system adds more information, which can be understood better if you think of the curve as the path of a particle. Two particle can take the same path, but at different speeds and at different times. Use Desmos to verify each of the following systems produce the same curve as the one above

* $(4t+1, 4t-1)$, $t \in [-1,1]$
* $(4-t, 2-t)$, $t \in [-3,5]$
* $(1 + 4\sin t, -1+4\sin t)$, $t \in [-5\pi, 5\pi]$

These identical curves are, in fact, vastly different trajectories. Considered as particle motion, they specify particles undergoing very different motion paths. To clearly see this, you can plot individual points for each curve in desmos using "T" instead of "t" and creating a slider. Plot the following points and move the $T$ slider to see how the trajectories differ.

* $(2T+1, 2T-1)$
* $(4T+1, 4T-1)$
* $(4-T, 2-T)$
* $(1 + 4\sin T, -1 + 4 \sin T)$

Briefly but specifically describe the differences in the trajectories:\
\
\
\
\
\
\

Now come up with 2 more parametric systems that trace the same curve.\
\
\
\
\
\

## Round and Round

You should be able to predict the curve traced by $x = r \cos t, y = r \sin t$ for $0 \leq t < 2\pi$. Plot it in Desmos to check.

How would you move the center of this curve to another point? Write equations below and draw the curve you get for an off-center circle.\
\
\
\
\
\

Now, how would you scale the $x$ and $y$ values in differing amounts to create an ellipse? Write equations below and and sketch the resulting curve you get from Desmos.\
\
\
\
\
\

Did your answers above include the values for $t$? They should, because $t$ matters a lot. How would you plot just the left half of an ellipse? Write your equations, with $t$, here\
\
\
\
\
\
\

What if you wanted to trace the same ellipse as the one above, but over a $t$ range of just $[0,1]$? What if you wanted to trace it in reverse (so the point moves clockwise)? What if you want the point to start at 12-oclock instead of 3-oclock? Write all 3 different systems of equations here.\
\
\
\
\
\
\

## $t$ for two, and none for $t$

So far everything we've plotted could be plotted without $t$. By eliminating $t$ you end up with just an equation in $x$ and $y$ which can sometimes be easier to understand, but which also loses all information about trajectory. You're left with just the curve. It's like looking at the skeleton left behind in a fossil record -- no life, just an outline.

The first system $(2t+1, 2t-1)$ is equivalent to the plane curve $y = x - 2$. You can verify this by substituting in the equations $y(t) = x(t) - 2$ or $2t - 1 = (2t+1) - 2$. Similarly, all of the systems in "Line Dancing" satisfy $y = x - 2$. In each case the domain is $-3 \leq x \leq 5$ and $-5 \leq y \leq 3$

In "Round and Round" the elimination is trickier. But if you take $(r \cos t, r \sin t)$ and square both functions: $x^2(t) = r^2 \cos ^2 t, y^2(t) =  r^2 \sin ^2 t$ you can then add them together: $x^2(t) + y^2(t) = r^2 \sin^2(t) + r^2 \cos^2(t)$ which by the Pythagorean identity reduces to simply $x^2 + y^2 = r^2$, the well known conic equation for a circle. Here $-r \leq x \leq r$ and $-r \leq y \leq r$.

Eliminate $t$ from the following systems. Assume that $t$ ranges over $[-3,3]$ and give the resulting ranges of $x$ and $y$. Check your answers in Desmos by plotting.

* $(t, t^3 - t - 4)$
* $(t^2 - 4, 6 - 2t^2)$
* $(t + 1, \sqrt{t-2})$
* $(3 - 2 \sin(2t), 4 + 3 \cos(2t))$
* $(\sec t, \tan t)$

## I'm so dizzy, my head is spinning[^1]

Parametric equations can yield curves much more complex than we can get from simple functions of $x$ or $y$. For example, plot this in Desmos

$\left(4.5\cos\left(t\right)+\frac{1}{2}\cos\left(8t\right),4.5\sin\left(t\right)+\frac{1}{2}\sin\left(8t\right)\right)$, $0\leq t \leq 2\pi$

This is the curve traced by a point on a small circle rolling around the perimeter of a larger circle. It's an example of a *roulette*, which is basically a curve generated by rolling one shape around another shape. This is an *epicycloid* or *epicycle*. Many variations of this type of curve exist, including *hypoycloids*, *cyclocycloids* and *spirographs*. Take some time now to look these up on Wikipedia. Experiment with some of the given equations. Generate some that you like and share them with the class! Take 2-3 screenshots, include the equations, paste them in a Word doc (or similar) and upload a .pdf to this link: http://bit.ly/spinnyspin

Epicycles play an important role in the history of astronomy. Early Greek astronomers, in possession of many centuries of observational data regarding the planets in the solar system, tried to infer the planetary orbits. Not expecting the Earth could be anything but the *center* of the known universe, they did not fathom a system of elliptical orbits around a sun. Therefore, the best model they could deduce which explained their observations is a vastly complex series of epicyclic orbits which people in our age can't help but think is preposterous. Read more about it here: https://en.wikipedia.org/wiki/Deferent_and_epicycle.

![Epicyclic planetary orbits](Cassini_apparent.jpg){width=3in}

[^1]: From the song "Dizzy" by Tommy Roe (1968). Listening while completing this section is recommended.