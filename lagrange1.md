# Lagrange Error Bounds

## Good Sine Bad Sine

We know that $P_5(x)$ for $\sin x$ is just an approximation. But how good is it? Or how bad is it? Let's look at the Maclaurin $P_5(x)$ and $P_7(x)$ for $\sin(x)$

* $P_5(x) = x - \dfrac{x^3}{3!} + \dfrac{x^5}{5!}$
* $P_7(x) = x - \dfrac{x^3}{3!} + \dfrac{x^5}{5!} - \dfrac{x^7}{7!}$

If $P_5$ is good, then $P_7$ is presumably "better". How much better? Well the error in $P_5$ can be written as

$h(x) = | \sin(x) - P_5(x)|$

and, since $P_7$ approximates $\sin$ then we can approximate this with

$h(x) \approx | P_7(x) - P_5(x)|$

so

$h(x) \approx \dfrac{x^7}{7!}$

The "error" in $P_5(x)$ looks like it's about $\dfrac{x^7}{7!}$. Now all this is hand-wavey imprecise math, but it doesn't look too bad and gives us a place to start at least. Let's check this theory in Desmos

**Activity** Plot $\sin(x), P_5(x), h(x)$ and $\dfrac{x^7}{7!}$ in Desmos and compare

## I have the Power (of e)

That was pretty cool. Let's try $e^x$ and its 4th order approximation.

$P_4(x) = 1 + x + \dfrac{x^2}{2!} + \dfrac{x^3}{3!} + \dfrac{x^4}{4!}$

so $h(x) = e^x - P_4(x)$ can be approximated by $P_5(x) - P_4(x)$. We know what $P_5$ is for $e^x$ so this error term is simply

$h(x) \approx \dfrac{x^5}{5!}$

Try plotting these in Desmos just like you did $\sin$. How does the error approximation look compared to the true error? (You should see that they match, but
unlike before, the error approximation is LESS than the real error. This is not great. We want our approximation to be bigger than the error so it's always a
"worst case" upper bound. )

Try instead this version of $h(x)$

$h(x) = c \cdot \dfrac{x^5}{5!}$

and try different values of $c$. How close can you get to the real error without going under? (You can use sliders in Desmos to make this fun)

**Conclusion** You should see from experimenting that $c=1,2,3$ works pretty well. But if you
zoom out enough, eventually the error gets larger than your $h(x)$. In fact no
constant $c$ here will always work. But, for now, let's settle on $c=e \approx 2.71818$ as "good enough" for values of $x$ "close to 0".

## Putting it all Together (like Legos)

From the last two examples, we might infer that the error in a polynomial approximation $P_k$ is upper bounded by a constant times $|P_{k+1}-P_{k}|$.
That's a pretty good inference and it actually turns out to be basically true.
It's called the Lagrange Error Bound and we'll study it today.

## The Lagrange Error Bound (for Maclaurin)

If a continuous function $f$ is approximated by a Maclaurin polynomial $P_k(x)$ on
the interval $(a,b)$, then the absolute error $| f(x) - P_k(x)|$ for $a<x<b$ is bounded above by

<center>$|f(x) - P_k(x) | < M \dfrac{|x|^{k+1}}{(k+1)!}$</center>

where $M = \max_x |f^{(k+1)}(x)|$ in the interval $(a,b)$.

## Examples

The following all use the Lagrange error bound for Maclaurin series (Taylor centered at 0).

1. Bound the error when using $P_4(x)$ to approximate $e^x$ when $-2 < x < 2$. Use a graphing tool to graph $|P_4(x) - e^x|$ over the interval and discuss how accurate the error bound is. (Your answer will be a function of $x$)
2. Bound the error when using $P_5(x)$ to approximate $\sin x$ when $-3\pi < x < 3\pi$. Use a graphing tool to graph $|P_5(x) - \sin x|$ over the interval and discuss how accurate the error bound is. (Your answer will be a function of $x$)
3. Bound the error when using $P_3(x)$ to approximate $\dfrac{1}{1-x}$ when $0.01 <x<0.99$ Use a graphing tool to graph $|P_3(x) - \dfrac{1}{1-x}|$ over the interval and discuss how accurate the error bound is. (Your answer will be a function of x)
4. Use Wolfram Alpha (or another favorite symbolic algebra program if you have one) to find the maximum value of $\tan x$ on the interval $[-1,1]$. Also use it to find $\tan''(x)$ and the max of $\tan''(x)$ on the interval $[-1,1]$. (Hint try the syntax "max f(x) for -1<x<1")


5. The Maclaurin series for $\tan x$ begins $P_5(x) = x + \dfrac{x^3}{3} + \dfrac{2}{15}x^5$ . Find a bounding function for the error in $P_5(x)$ over the interval $-1<x<1$ and graphically compare this to the error as you did above. In order to find the value of $M$ you will need to know the maximum of $\tan^{(6)}(x)=272 \sec^6(x) \tan(x) + 416 \sec^4(x) \tan^3(x) + 32 \sec^2(x) \tan^5(x)$. Using a computer is advised.
6. You are creating a scientific calculator and are programming it to compute $\sin x$ accurate to 16 digits using series. You only need to calculate values in the first quadrant because of the symmetry of the $\sin$ function. Using Lagrange bounds determine which degree $k$ approximation $P_k(x)$ you need to guarantee the accuracy of your calculator. Begin by writing an equation for $k$. You can then solve the equation using a table or a computer or, worst, trial-and-error.