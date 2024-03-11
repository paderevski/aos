# Day 2 Packet
## BC Integration

1.
$$\int_{1}^{e} x+\frac{1}{x} \; dx=\left[\frac{x^{2}}{2}+\ln x\right]_{1}^{e}=\frac{e^{2}-1}{2}+\ln \left|\frac{e}{1}\right|=\frac{e^{2}-1}{2}+1 \quad B$$

2.
$$\int_{1}^{\infty} x e^{-x^{2}} \; dx=\frac{-1}{2} \int_{1}^{\infty}-2 x e^{-x^{2}} \; dx=\frac{-1}{2}\left[e^{-x^{2}}\right]_{1}^{\infty}=\frac{-1}{2}\left[0-e^{-1}\right] B$$
3. $$ \begin{aligned}
\int x^{2} \cos x^{3} \; dx \\
& =\frac{1}{3} \int 3 x^{2} \cos x^{3} \; dx \\
& =\frac{1}{3} \int \cos u \; du \\
& =\frac{1}{3} \sin u+C \\
& = B
\end{aligned}
$$

4. $$\begin{aligned}
\int_{-1}^{9} 3 f(x)+2 \; dx & =3 \int_{-1}^{9} f(x)+\int_{-1}^{9} 2 \; dx \\
& =3[-3.5+6]+2(10) \\
& =27.5 \\
& = C
\end{aligned}
$$

5. $$\begin{aligned}
y(10) & =y(0)+\int_{0}^{10} y^{\prime}(t) d t \\
& =12+\int_{0}^{10} e^{t / 5} d t \\
& =12+\left[5 e^{t / 5}\right]_{0}^{10} \\
& =12+5\left(e^{2}-1\right) \\
& = C
\end{aligned}
$$

6.  $$\begin{aligned}
\int_{a}^{b} f(x) \; dx & \cong \sum_{k=1}^{n} f(a+k \Delta x) \Delta x \text { with } \Delta x=\frac{b-a}{n}=\frac{4}{n} \\
& =\sum e^{(-3+4 k / n)}(4 / n) \\
& = D
\end{aligned}
$$


7.  $$\begin{aligned}
\int_{1}^{3} f(x+5) \; dx & =7 . \quad \text { Let } u=x+5 \\
& =\int_{6}^{8} f(u) \; du=7 \\
\text{so} \int_{6}^{8} f(x)+2 \; dx & =7+2(2)=11 \quad D
\end{aligned}
$$

8. The integral of a rate of X  is change in X from $t=a$ to $t=b$ ... B
9. $$ \begin{aligned}
& \int_{-1}^{4} x\left(x^{2}-3\right)^{5} \; dx \\
& u=x^{2}-3 \\
& \; du=2 x \; dx \\
& x \; dx=\frac{\; du}{2} \\
& =\int_{-2}^{13} u^{5} \; du / 2 \\
& = C
\end{aligned}
$$

10.  $$\begin{array}{l|l}
u & d v \\
\hline
+x & e^{-2 x} \\
-1 & -\frac{1}{2} e^{-2 x} \\
+0 & \frac{1}{4} e^{-2 x}
\end{array}
$$

$$
\begin{aligned}
k \int_{0}^{\infty} x e^{-2 x} \; dx= \\
& k\left(-\frac{1}{2} x e^{-2 x}-\frac{1}{4} e^{-2 x}\right)\\
& = \left[\frac{-k e^{-2 x}}{4}(2 x+1)\right]_{0}^{\infty} \\
& =\frac{k}{4} \\
& =1 \text { if } k=4 \\
& = C
\end{aligned}
$$

11.  $$\begin{aligned}
\int_{1}^{e} \frac{\ln x}{x^{3}} \; dx & =u v-\int v \; du \quad \begin{array}{l}
u=\ln x, d v=x^{-3} \\
\; du=\frac{1}{x} \quad v=-\frac{1}{2} x^{-2}
\end{array} \\
\\
\\1
& =\frac{-\ln x}{2 x^{2}}-\int \frac{-1}{2 x^{3}} \; dx \\
& =\left[\frac{-\ln x}{2 x^{2}}-\frac{1}{4 x^{2}}\right]_{1}^{e} \\
& =\left(\frac{-\ln e}{2 e^{2}}-\frac{1}{4 e^{2}}\right)-\left(\frac{-1}{4}\right) \\
& =\frac{e^{2}-3}{4 e^{2}} = \text { A }
\end{aligned}
$$

12.  $$\begin{gathered}
\int f(x) \sin x \; dx=f(x)(-\cos x)-\int 4 x^{3}(-\cos x) \; dx \\
\int u \; dv =u v-\int \; du \cdot v \\
\; du=4 x^{3} \\
u=x^{4}
\end{gathered}
$$

$$
E
$$

13. $$\int_{-1}^{1} \frac{1}{x^{2}} \; dx=\int_{-1}^{0} \frac{1}{x^{2}} \; dx+\int_{0}^{1} \frac{1}{x^{2}} \; dx$$
but
 $$\int_{-1}^{0} \frac{1}{x^{2}} \; dx=\left[-\frac{1}{x}\right]_{-1}^{0}$$
$$
\begin{aligned}
& =\lim _{t \rightarrow 0}\left[\frac{-1}{x}\right]_{-1}^{t} \\
& =\infty \\
& D
\end{aligned}
$$

14.  $$\begin{aligned}
\int_{0}^{1} f^{\prime}(x) g(x) \; dx=5 & =\left.g(x) f(x)\right|_{0} ^{1}-\int_{0}^{1} f(x) g^{\prime}(x) \; dx \\
& =(g(1) f(1)-g(0) f(0))-\int_{0}^{1} f(x) g^{\prime}(x) \; dx \\
\int_{0}^{1} f(x) g^{\prime}(x) \; dx & =(3)(4)-(-4)(2)-5 \\
& =12+8-5=15 \\
& E
\end{aligned}
$$

15.  The first step (not show) is polynomial long division because the fraction is "top heavy" ($x^3>x$)
$$
\begin{aligned}
\int_{1}^{3} \frac{3 x^{3}+15 x^{2}+x+9}{x+5} & =\int_{1}^{3} 3 x^{2}+1+\frac{4}{x+5} \; dx \\
& =\left[x^{3}+x+4 \ln |x+5|\right]_{1}^{3} \\
& =26+2+4 \ln \left|\frac{8}{6}\right| \\
& =A
\end{aligned}
$$

16.  $$\begin{aligned}
\int \frac{7 x \; dx}{(2 x-3)(x+2)} & =\int \frac{A}{2 x-3}+\frac{B}{x+2} \\
& A(x+2)+B(2 x-3)=7 x \\
& \text { Let } x=-2 \\
& -7 B=-14 \text { so } B=2 \\
& x=\frac{3}{2} \\
3.5 A & =10.5 \text { so } A=3 \\
\int \frac{7 x}{(2 x-3)(x+2)}= & \frac{3}{2}|2 x-3|+2 \ln |x+2|\\
& =\quad A
\end{aligned}
$$

17. $u$-substitution. if $u=\sin x$, 
$$
\begin{aligned}
\int_{0}^{\pi / 2} \frac{\cos x}{1+\sin ^{2} x} \; dx &= \int_{x=0}^{x=\pi / 2} \frac{\; du}{1+u^{2}} \\
& =\int_{0}^{1} \frac{\; du}{1+u^{2}} \\
& =[\arctan u]_{0}^{1} \\
& =\frac{\pi}{4}-0\\
& B
\end{aligned}
$$

1.   $$
\begin{aligned}
\int_{0}^{4} f(x) \; dx & =\int_{0}^{2} f(x) \; dx+\int_{2}^{4} f(x) \; dx \\
& =\left(\frac{5+1}{2}\right)(2)+2(-3)=0 \\
& = B
\end{aligned}
$$


19.  $$\begin{aligned}
\int \frac{1}{1+e^{2 x}}\\
& =\int \frac{e^{-2 x}}{e^{-2 x}+1} \\
& u=e^{-2 x}+1 \\
& \; du=-2 e^{-2 x} \\
\int \frac{e^{-2 x}}{e^{-2 x}+1} \\
&=\frac{-1}{2} \int \frac{\; du}{u}=-\frac{1}{2} \ln |u|=-\frac{1}{2} \ln \left|1+e^{-2 x}\right| \\
&=-\frac{1}{2} \ln \left|e^{-2 x}\left(e^{2 x}+1\right)\right| \\
&=\frac{-1}{2} \ln \left|e^{-2 x}\right|+\frac{-1}{2} \ln \left|e^{2 x}+1\right| \\
&=-\frac{1}{2}(-2 x)+\frac{-1}{2} \ln \left(1+e^{2 x}\right)+C \\
& = D
\end{aligned}
$$

20.  First complete the square because the denominator has only imaginary roots $b^2-4ac<0$.
  $$\int \frac{\; dx}{x^{2}-10 x+34}=\int \frac{\; dx}{(x-5)^{2}+9}$$
Let $u=(x-5), a=3$
$$
\int \frac{\; dx}{(x-5)^{2}+9}=\int \frac{\; du}{u^{2}+a^{2}}=\frac{1}{3} \arctan \left(\frac{x-5}{3}\right) = C
$$

21.  $$\begin{aligned}
& \frac{5 x+8}{x^{2}+3 x+2}=\frac{2}{x+2}+\frac{3}{x+1} \text { so } \\
& \int \frac{5 x+8}{x^{2}+3 x+2}=[2 \ln |x+2|+3 \ln |x+1|]_{0}^{1} \\
& =2 \ln \left|\frac{3}{2}\right|+3 \ln |2| \\
& =\ln \frac{9}{4}+\ln 8 \\
& =\ln \frac{9}{4} \cdot 8 \\
& =\ln 18 \\
& = C
\end{aligned}
$$

22.   $$\quad f(2)=2.4+\int_{-1}^{2} \sqrt{9-x^{2}} \; dx=10.863 = D$$


---
geometry: margin=1in
header-includes:
- |
  \let\oldsection\section
  \renewcommand{\section}[1]{\clearpage\oldsection{#1}}
	\def\tightlist{}
---
