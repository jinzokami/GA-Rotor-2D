# GA-Rotor-2D
A quick and dirty single file implementation of 2d rotors from linear algebra.
inspred by this article: http://marctenbosch.com/quaternions/
also includes a small demo written using the LOVE framework (https://love2d.org/)

rotors allow rotation along an arbitrary plane using techniques from geometric algebra.

How to use: 
create 2 unit length vectors where the angle between them is half the angle of desired rotation
multiply these vectors to obtain a rotor, which defines the angle of rotation and the plane of rotation
then use the vector's rotate(rotor) function to rotate the vector.

How it works (under construction):
geometric algebra has an operator called the geometric product.
for vectors the geometric product is:
for vectors a, b
a * b = a . b + a ^ b
where . is the inner(dot or scalar) product and ^ is the outer(wedge) product
in this case the inner and outer product are defined to be:

a . b = a.x * b.x + a.y * b.y

a ^ b = a.x * b.y - a.y * b.x

In this case(2-space) both the inner and outer product evaluate to scalars. this is not true for 3-space and above.
The outer product is actually called a psuedoscalar in this case and cannot actually be added to the result of the inner product,
they are different "objects", one is a standard scalar, but the other is something special called a "bivector".
Bivectors are representations of planes like vectors are representations of lines, since there is only one plane in 2-space, all bivectors are just multiples of the xy plane.
to create a bivector you must use the wedge operator ^.

