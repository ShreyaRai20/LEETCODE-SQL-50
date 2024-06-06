SELECT  x, y , z, if(x+y>z AND z+y>x AND x+z>y, 'Yes', 'No') triangle
FROM Triangle;
