clear;

exec ('tspPrim.sci',-1);
exec ('tspExamples.sci',-1);

global pos dist name;

dist = [   0    15   20 %inf %inf %inf;
             15     0    12   24 %inf %inf;
             20   12      0 %inf   30   13;
           %inf   24 %inf      0   28 %inf;
           %inf %inf   30    28     0   11;
           %inf %inf   13 %inf    11     0];
           
tspExamples(4);

[edges,l] = tspPrim(dist)
 
