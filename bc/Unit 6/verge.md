# On the Verge

## Background
Infinite series have fascinated mathematicians and non-mathematicians for
centuries. Today we're going to use Desmos (or a similar tool) to
numerically explore some infinite series and find out what mysteries lie beneath.

An infinite series, you will recall, is a sum of the form $a_1+a_2+a_3+ \cdots$,
where the terms proceed to infinity and a formula is given for each term $a_n$. For example the infinite geometric series $\displaystyle \sum_{n=0}^\infty \dfrac{1}{2^n} = 1 + \frac12 + \frac14 + \frac18 + \frac{1}{16} + \cdots$ is a familiar one to
most students.

In terms of limits, an infinite sequence can be written as $\displaystyle \sum_{n=0}^\infty \dfrac{1}{2^n} = \lim_{N \to \infty} \sum_{n=0}^N \dfrac{1}{2^n}$.
 It is shown in algebra courses that this particular sum *converges* to a limit, $L$,
 namely $L=2$.
Converging for an infinite series is like a horizontal asymptote for a continuous function. As $x \to \infty$, $f(x) \to L$ means that $f$ approaches but never reaches $L$. Yet it gets arbitrarily close. The limit of an infinite series is the same -- a value the sum approaches but never reaches or surpasses.

Not all infinite series converge. Some diverge. The series above converges to $L=2$. On the other hand, the series $\displaystyle \sum_{n=0}^\infty 2^n = 1+2+4+8+16 \cdots$ pretty obviously diverges.

## Activity
Let's explore some series. Start with the familiar  $\displaystyle \sum_{n=0}^\infty \dfrac{1}{2^n}$ and ask Desmos to compute the partial sums
$\displaystyle \sum_{n=0}^{10} \dfrac{1}{2^n}$, $\displaystyle \sum_{n=0}^{20} \dfrac{1}{2^n}$, $\displaystyle \sum_{n=0}^{30} \dfrac{1}{2^n}$, $\displaystyle \sum_{n=0}^{40} \dfrac{1}{2^n}$. (You can enter this in Desmos by typing "sum" then tab through to enter the lower and upper bounds and finally the summand. Once you enter 10, you can just backspace to get 20,30,40 and observe how the values change.) At 40 terms you should see a sum about $0.999999999999$ and past this it just rounds to 1, within the precision abilities of your web browser's Javscript engine.

For each of the series below, find the number of terms required to make the sum *first* stabilize (at least 6-7 digits of stability) and record what that sum is. Or conclude that the sum diverges. (You may be tempted to hastily enter an
upper sum bound of 10000000000000000. Not only will this totally freeze up your computer, it is also not the task. You are to find the limit **and** the smallest upper bound that proves it. You should also give up around 10,000,000 or so to be safe)

*  $\displaystyle \sum_{n=0}^\infty \frac{1}{3^n}$
*  $\displaystyle \sum_{n=0}^\infty \frac{1}{5^n}$
*  $\displaystyle \sum_{n=0}^\infty \frac{1}{(-3)^n}$
*  $\displaystyle \sum_{n=0}^\infty \frac{1}{0.5^n}$
* $\displaystyle \sum_{n=1}^\infty (\frac{1}{n}-\frac{1}{n+1})$ (don't omit the parenthesis)

Some series have cool values. Enter the following into Desmos with the variable names so you can calculate with them

*  $\displaystyle t_1 = \sum_{n=1}^\infty \frac{6}{n^2}$ and find $\sqrt{t_1}$
*  $\displaystyle t_2 = \sum_{n=1}^\infty \frac{90}{n^4}$ and find $\sqrt{\sqrt{t_2}}$
*  $\displaystyle t_3 = \sum_{n=0}^\infty \frac{1}{n!}$ and find $\ln(t_3)$
*  $\displaystyle t_4 = \sum_{n=0}^\infty \frac{(-1)^n\cdot4}{2n+1}$
*  $\displaystyle t_5 = \sum_{n=1}^\infty \frac{(-1)^{n+1}}{n}$ and find $e^{t_5}$

The next one is a bit different. Notice the $N$ that you need to change in two places

*  $\displaystyle \left(\sum_{n=1}^N \frac{1}{n}\right) - \ln{N}$

And finally what does this series converge to?

*  $\displaystyle \sum_{n=1}^{\infty} \frac{1}{n}$
