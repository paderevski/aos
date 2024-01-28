# Intro to Taylor and Maclaurin Polynomials

## Maclaurin Polynomials

You have found polynomials already that approximate $\sin(x)$ and $\cos(x)$ near $x=0$ by finding
polynomials that have a given order of contact with the function at the point $x=0$. We
will now generalize this concept.

**Example**:

  * Given a function $f(x)$ which is infinitely differentiable, find a 4th-degree
polynomial $P(x)$ which has a 4th order POC with $f(x)$ at $x=0$. (Hint: set up the
equations $f^{(n)}(0)=P^{(n)}(0)$ where $P(x) = a_0 + a_1 x+a_2x^2+a_3x^3+a_4x^4$
and solve for the coefficients $a_x$.)
  * See if you can find a pattern in the $a_n$ and write
	a general formula for the $n$th coefficient $a_n$.
* Using sigma notation write an expression for $P(x)$. An example of sigma notation in this instance is $P(x) = \sum_{n=1}^4 \dfrac{x^n}{2^n}$. Use your answer to the previous bullet.
* The expression you have written is the 4th-order (or 4th degree) Maclaurin polynomial approximation for $f(x)$. Memorize this formula
* Finally, replace the $4$ to get a general expression for the $k$th-degree Maclaurin polynomial approximation for $f(x)$.

**Practice**
Find Maclaurin polynomial approximations as indicated

1. $f(x)=e^x$, $k=4$
2. $f(x)=\sin(x)$, $k=5$
2. $f(x)=\cos(x)$, $k=6$
3. $f(x)=\dfrac{1}{1-x}$, $k=4$
4. $f(x) = \ln(1+x)$, $k=5$
5. $f(x) = x^n$, $k=n$ (note $n$ is a fixed constant here)

We will sometimes use the notation $P_k(x)$ to indicate the $k$-th order
approximation to a function $f(x)$.

**Algebra** If we have approximated $f(x)$ with $P_k(x)$, then can we also approximate $f(2x)$ with $P_k(2x)$? What about
$f(x+1)$ or $f(x^2)$ or $\dfrac{x^3 f(x)}{x-1}$? What do you think? Of course we can! Surely if $f(x) = P_k(x)$ then by the equality property of real numbers we can transform both sides of the equation the same way. Here the equality is only approximate, so the result is still approximate. What can happen is our approximation could get *worse*, but this is a
topic we will consider in later discussions.

**Practice**
Find Maclaurin polynomial approximations as indicated

1. $f(x)=2e^{-x^2}$, $k=4$
2. $f(x)=\dfrac{\sin(x)}{x}$, $k=5$
3. $f(x)=\dfrac{1-\cos(x)}{x^2}$, $k=6$
4. $f(x)=\dfrac{1}{1+x^2}$, $k=4$
5. $f(x) = x \ln(1+x)$, $k=5$
6. $f(x) = (1+x)^n$, $k=n$ (note $n$ is a fixed constant here)

**Calculus** Using algebra, the previous practice problems show just how much information we can get out of one Maclaurin polynomial. The sky's the limit (almost) when it comes to algebraic transformations. But what about Calculus? Let's find out.

1. Write the 6th degree Maclaurin polynomial for $\sin(x)$ and take its derivative. What do you notice
2. Take the derivatives of the polynomials for $\cos(x)$ and $e^x$ as well.
3. Write down and then integrate the polynomial for $\dfrac{1}{1+x}$

That's pretty cool. What about limits? Use L'Hopital to find the following limits. Then find the same limits by using appropriate Maclaurin polynomials above.

1. $\lim_{x \to 0} \dfrac{\sin x}{x}$
2. $\lim_{x \to 0} \dfrac{1-\cos x}{x^2}$

## Taylor Polynomials

Everything we did above we centered at $x=0$. If we plotted $f(x)$ and $P_k(x)$ we would find they match pretty well near $(0, f(0))$ but that the match gets worse and worse as you move away from the origin. If you want a match at some other point instead, say $x=c$, then you can construct a Taylor Polynomial.

This is exactly the same concept as Maclaurin polynomials, just the formula is transformed to account for a different center. Here you want a $k$-th order POC for $f(c) = P(c)$ and $P(c)$ is written in the form $P_k(c) = a_0 + a_1(x-c) + a_2(x-c)^2 + a_3(x-c)^3 + \cdots + a_k(x-c)^k$.

**Reasoning** Can you write the Taylor Polynomial formula by using the Maclaurin polynomial formula and the format above
to center it at $(c, f(c))$? What has to change and what stays the same in the formula?

**Practice**
Write the Taylor Polynomials as indicated

1. $f(x)=e^x$, $k=4, c=2$
2. $f(x)=\sin(x)$, $k=5, c=\frac{\pi}{2}$
3. $f(x) = \sqrt{x}$, $k=5, c=25$

**Calculation**
Using your answers in the previous section, approximate the following using a calculator or computer. Also calculate the absolute error in the value you get compared to the true answer.

1. $e^{2.3}, e^4$
2. $\sin(\dfrac{\pi}{3})$
3. $\sqrt{26}, \sqrt{10}$

As you see, the goodness of these approximations varies a great deal. Next class we will learn how to analyze this error and see how many terms we need to get the error within a certain bound.
