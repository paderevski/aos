### Dot Product (Scalar Product)

- **Definition**: The dot product between two vectors $\vec{a}$ and $\vec{b}$ is a scalar quantity that is the result of multiplying the magnitudes of the two vectors by the cosine of the angle ($\theta$) between them. It is denoted as $\vec{a} \cdot \vec{b}$.
- **Formula**: $\vec{a} \cdot \vec{b} = ||\vec{a}|| ||\vec{b}|| \cos(\theta)$ where $|\vec{a}|$ and $|\vec{b}|$ are the magnitudes of vectors $\vec{a}$ and $\vec{b}$, respectively.
- **Component-wise Calculation**: For vectors in 2D  Cartesian coordinates, $\vec{a} = (a_x, a_y)$ and $\vec{b} = (b_x, b_y)$, the dot product is $\vec{a} \cdot \vec{b} = a_xb_x + a_yb_y$. In 3D Cartesian coordinates, $\vec{a} = (a_x, a_y, a_z)$ and $\vec{b} = (b_x, b_y, b_z)$, the dot product is $\vec{a} \cdot \vec{b} = a_xb_x + a_yb_y + a_zb_z$. In any dimension, the dot product is simply the sum of the component-wise products of the 2 vectors.
- **Properties**:
  - Commutative: $\vec{a} \cdot \vec{b} = \vec{b} \cdot \vec{a}$
  - Distributive (over $+$): $\vec{a} \cdot (\vec{b} + \vec{c}) = \vec{a} \cdot \vec{b} + \vec{a} \cdot \vec{c}$
  - Scalar Result: The result is a scalar (not a vector).
  - $\vec{a} \cdot \vec{b} \cdot \vec{c}$ is not defined since the dot product is a scalar.
- **Applications**: Dot product is used to find the angle between two vectors, project one vector onto another, and in various physics calculations like work. One handy application is that $\vec{a}$ and $\vec{b}$ are perpendicular if and only if their dot product is 0. Another is that $||\vec{a}|| = \vec{a} \cdot \vec{a}$. In word, the dot product of a vector with itself is its squared magnitude.

### Cross Product (Vector Product)

- **Definition**: The cross product between two 3D vectors $\vec{a}$ and $\vec{b}$ is a vector that is perpendicular to the plane containing $\vec{a}$ and $\vec{b}$. It is denoted as $\vec{a} \times \vec{b}$. It is only defined in three dimensions.
- **Formula**: $\vec{a} \times \vec{b} = ||\vec{a}|| ||\vec{b}|| \sin(\theta) \vec{n}$, where $\theta$ is the angle between $\vec{a}$ and $\vec{b}$, and $\vec{n}$ is a unit vector perpendicular to the plane containing $\vec{a}$ and $\vec{b}$.
- **Component-wise Calculation**: For vectors in Cartesian coordinates, $\vec{a} = (a_x, a_y, a_z)$ and $\vec{b} = (b_x, b_y, b_z)$, the cross product is $\vec{a} \times \vec{b} = (a_yb_z - a_zb_y, a_zb_x - a_xb_z, a_xb_y - a_yb_x)$.
- **Properties**:
  - Commutative: ? (TBD)
  - Distributive: $\vec{a} \times (\vec{b} + \vec{c}) = \vec{a} \times \vec{b} + \vec{a} \times \vec{c}$
  - Vector Result: The result is a vector.
- **Applications**: The main application is to find a vector perpendicular to 2 given vectors. Cross product can also be used to find the area of a parallelogram formed by two vectors, and in physics to compute torque, and the relationship between electric and magnetic fields.

### Practice Problems Involving Dot and Cross Product

1. Given vectors $\vec{a} = (3, -4, 1)$ and $\vec{b} = (2, 5, -3)$, find the dot product $\vec{a} \cdot \vec{b}$.

2. Given vectors $\vec{a} = (1, 0, 1)$ and $\vec{b} = (0, 1, 1)$, find the angle between $\vec{a}$ and $\vec{b}$.

3. Given vectors $\vec{a} = (2, 3, -1)$ and $\vec{b} = (-4, 2, 2)$, determine if $\vec{a}$ and $\vec{b}$ are perpendicular.

4(*). Given vector $\vec{a} = (4, -1)$, find a vector $\vec{b}$ that is in the xy-plane and makes a $60^\circ$ angle with $\vec{a}$.

5. Given vectors $\vec{a} = (1, 2, 3)$ and $\vec{b} = (4, 5, 6)$, find the cross product $\vec{a} \times \vec{b}$.

6. Given vectors $\vec{a} = (1, -2, 1)$ and $\vec{b} = (-2, 4, -2)$, determine if $\vec{a}$ and $\vec{b}$ are parallel by using the cross product.

7. Given vectors $\vec{a} = (3, -3, 1)$ and $\vec{b} = (2, -1, 1)$, find the area of the parallelogram spanned by $\vec{a}$ and $\vec{b}$.

8. Given vectors $\vec{a} = (1, 2, 3)$ and $\vec{b} = (-1, 0, 1)$, find the area of the triangle formed by $\vec{a}$, $\vec{b}$, and the origin.
9. Use vectors to find the area of the triangle with vertices at $(3,5), (-2,1)$ and (6,-4)$
10. Pick two vectors $\vec{a}$ and $\vec{b}$ and describe the relationship between $\vec{a} \times \vec{b}$ and $\vec{b} \times \vec{a}$.
11. What is $c_1\vec{a} \cdot c_2 \vec{b}$?
12. What is $c_1\vec{a} \times c_2 \vec{b}$?
13. What is $c_1\vec{a} \cdot c_1 \vec{a}$?
14. The cross product can be defined as a matrix determinant. Look up the formula and write it down.
15. In-depth problem: Write $\vec{x}$ as a Linear Combination of $\vec{a}$, $\vec{b}$, $\vec{c}$. Given the three 3D vectors $\vec{a}$, $\vec{b}$, and $\vec{c}$ defined as follows:
    - $\vec{a} = (2, -1, 3)$
    - $\vec{b} = (0, 1, -1)$
    - $\vec{c} = (-1, 0, 2)$
And given vector $\vec{x} = (3, 2, -1)$,

**Task**: Write $\vec{x}$ as a linear combination of vectors $\vec{a}$, $\vec{b}$, and $\vec{c}$. In other words, find scalars $k$, $l$, and $m$ such that:
$$
\vec{x} = k\vec{a} + l\vec{b} + m\vec{c}
$$

**Hint**: Use matrices (and your calculator is fine).
16. Explain geometrically *when* a problem like 15 can't be solved.
17. Explain algebraically when a problem like 15 can't be solved.
---

### Solutions

#### 1. Evaluate the Dot Product
$$
\vec{a} \cdot \vec{b} = (3)(2) + (-4)(5) + (1)(-3) = 6 - 20 - 3 = -17
$$

#### 2. Find the Angle Between Vectors
The angle $\theta$ between $\vec{a}$ and $\vec{b}$ is given by:
$$
\cos(\theta) = \frac{\vec{a} \cdot \vec{b}}{|\vec{a}||\vec{b}|}
$$
We'll calculate this value to find $\theta$.

#### 3. Determine if Vectors are Perpendicular
Vectors are perpendicular if their dot product is 0. We'll evaluate $\vec{a} \cdot \vec{b}$.

#### 4. Find a Vector That Makes a Certain Angle with Another Vector
To find such a vector, we need to solve for a vector $\vec{b}$ given the angle and the magnitude condition.

#### 5. Evaluate the Cross Product
$$
\vec{a} \times \vec{b} = \begin{vmatrix}
\hat{i} & \hat{j} & \hat{k} \\
1 & 2 & 3 \\
4 & 5 & 6 \\
\end{vmatrix}
$$
We'll calculate this determinant to find the cross product.

#### 6. Determine if Vectors are Parallel
Vectors are parallel if one is a scalar multiple of the other. We'll check this condition for $\vec{a}$ and $\vec{b}$.

#### 7. Find the Area of a Parallelogram
The area of a parallelogram spanned by $\vec{a}$ and $\vec{b}$ is given by $|\vec{a} \times \vec{b}|$. We'll calculate this value.

#### 8. Find the Area of a Triangle
The area of a triangle formed by $\vec{a}$, $\vec{b}$,

 and the origin is $\frac{1}{2}|\vec{a} \times \vec{b}|$. We'll calculate this value.
