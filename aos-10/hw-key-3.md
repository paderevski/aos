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


```python
numpy.mean(l0), numpy.var(l0), numpy.std(l0)
```




    (17.2, 6.026666666666667, 2.4549270186029295)




```python
numpy.mean(l1), numpy.median(l1), numpy.std(l1)
```




    (76.5, 77.5, 6.2915286960589585)




```python
numpy.mean(l2), numpy.median(l2), numpy.std(l2)
```




    (72.33333333333333, 77.5, 13.437096247164249)




```python
numpy.mean(l3), numpy.median(l3), numpy.std(l3)
```




    (74.33333333333333, 79.5, 14.255603186895398)




```python
(numpy.max(l1)-numpy.min(l1)) / numpy.std(l1)
```




    2.8609898912604943




```python
(numpy.max(l2)-numpy.min(l2)) / numpy.std(l2)
```




    2.976833630141003




```python
(numpy.max(l3)-numpy.min(l3)) / numpy.std(l3)
```




    2.9462099533332204


