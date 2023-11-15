## HW3 Key


```python
import numpy
```


```python
l0 = [15,19,18,15,17,19,19,17,21,15,19,20,11,16,17]
```


```python
l1 = [85,67,77,82,70,78]
```


```python
l2=[85,67,77,82,78,45]
```


```python
l3=[85,77,82,70,87,45]
```

Number 1 and 2


```python
numpy.mean(l0), numpy.var(l0), numpy.std(l0)
```




    (17.2, 6.026666666666667, 2.4549270186029295)



Number 3 L1


```python
numpy.mean(l1), numpy.median(l1), numpy.std(l1)
```




    (76.5, 77.5, 6.2915286960589585)



The mean and median are good measures of center.

Number 3 L2


```python
numpy.mean(l2), numpy.median(l2), numpy.std(l2)
```




    (72.33333333333333, 77.5, 13.437096247164249)



The median is a better measure of center due to the outliers and large stdev.

Number 3 L3


```python
numpy.mean(l3), numpy.median(l3), numpy.std(l3)
```




    (74.33333333333333, 79.5, 14.255603186895398)



The median is a better measure of center due to the outliers and large stdev.

Number 4


```python
(numpy.max(l1)-numpy.mean(l1)) / numpy.std(l1)
```




    1.3510230042063447




```python
(numpy.min(l1)-numpy.mean(l1)) / numpy.std(l1)
```




    -1.5099668870541498




```python
(numpy.max(l2)-numpy.mean(l2)) / numpy.std(l2)
```




    0.9426639828779847




```python
(numpy.min(l2)-numpy.mean(l2)) / numpy.std(l2)
```




    -2.0341696472630186




```python
(numpy.max(l3)-numpy.mean(l3)) / numpy.std(l3)
```




    0.8885395097354161




```python
(numpy.min(l3)-numpy.mean(l3)) / numpy.std(l3)
```




    -2.0576704435978046


