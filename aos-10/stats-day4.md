# Statistics Day 4: The Normal Distribution

In 9th grade you worked with normal distributions.  The (approximate) normal distribution arises
frequently in natural processes and also has some amazing mathematical properties
related to the "Central Limit Theorem" which we will learn about in a later lesson.
The normal distribution has the following probability function:

<center>

$f(x; \mu, \sigma) = \dfrac{1}{\sigma\sqrt{2\pi}} e^{-\frac12 \left(\frac{x-\mu}{\sigma}\right)^2}$

</center>

## SAT Scores background

Scores on the SAT test have been crafted to be normally distributed. Read more about it here https://blog.prepscholar.com/sat-standard-deviation. In the following problems you will use the published statistics for the SAT combined scores. You can
compute properties of normal distributions (and many others) using desmos (http://www.desmos.com).  Check out the `normalpdf` function in the docs, or watch this (decent) video (https://www.youtube.com/watch?v=gNxCvzcerCA) for a quick overview.

## SAT Scores and normal distributions
For each scenario below, sketch a separate distribution curve, labeling the key values and shading any score region described. Then give the percentages.

1. What percent of students will score above 1200?

2. What percent of students will score below 900?

3. What percent of students will score between 800 and 1300?

4. On Seinfeld, George tells Jerry that he got a 1409 on the SAT. If this is true, what percentage of students scored higher than George? (note the average and standard deviation do change over time, so just assume for simplicity that the published statistics above applied during this classic 90's sitcom).

5. A score of 1500 is how many standard deviations above the average?

6. What score is 3 standard deviations below the average?

7. What percent of scores lie within 1 standard deviation of the mean?
8. What percent of scores lie within 2 standard deviations of the mean?

## SAT Scores and inverse normal distributions

In the following you may need to do some trial and error with Desmos to find the best answer.

9. What score is needed to be in the top 10% of all test takers?

1. What score is needed to be in the 1% of all test takers?


2. Find a range of scores that contain 35% of the distribution.

3. Are the mean and median of the normal distribution the same? Demonstrate your answer by using calculations in Desmos.

4. The first decile of a distribution is the bottom 10% of scores. The second decile is the scores between 10% and 20% etc.Which decile of a normal distribution corresponds to the smallest range of scores?

5. Statisticians often look at quartiles of the distribution, and the notation (not universal, but widely used) is that $q_{25}$ is  the point below which 25% of the data falls. Similarly $q_{75}$ is the point above which 25% of the data falls. And $q_{50}$ is the median. These may also be called "the 25th percentile" etc. Compute the $q_{25}, q_{50}, q_{75}$ values for the SAT test above. Explain how you can find $q_{75}$ from knowing the other two values, if the distribution is normal.