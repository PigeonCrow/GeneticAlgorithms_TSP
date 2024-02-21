clear;

exec ('tspLength.sci',-1);
exec ('tspDraw.sci',-1);
exec ('tspBruteForce.sci',-1);
exec ('tspGreedy.sci',-1);
exec ('tsp2Opt.sci',-1);
exec ('tspSimulatedAnnealing.sci',-1);
exec ('tspExamples.sci',-1);
exec ('tspGenetic.sci',-1);

global name dist pos;

for example = 7
    
  f = figure(0);
  clf(f);
  tspExamples(example);
  
  //  i = 2:2:21
  i = 1:2:21
  // name = name(i,:);
  // dist = dist(i,i);
  // pos = pos(i,:);
  n = size(dist,'r');
   
  // GA-Parameter: 
  // ...Populations size | Generation number | Recombination rate | Mutation rate
  tour = tspGenetic(30, 100, 0.5, 0.9); // reached 14980 !!
  
   
  // tour = tspBruteForce();     //--> check | difficulty dealing with simpler graphs 
  // tour = tspGreedy();         //--> check | length: 18755
  // tour = tsp2Opt();           //--> check | 14980

  rand('seed',0);
  // tour = tspSimulatedAnnealing(1:n,100,1,0.9999); //--> check | also issues with smaler/simpler graphs 
  tspDraw(tour);

  pause
  //xs2pdf(f,'mosim_16_ws_tsp_kl.pdf');

end
  
pause

tour = [1 12 5 22 20 4 7 11 21 3 10 8 15 17 16 14 2 6 9 19 13 18]

att48 = [
1
8
38
31
44
18
7
28
6
37
19
27
17
43
30
36
46
33
20
47
21
32
39
48
5
42
24
10
45
35
4
26
2
29
34
41
16
22
3
23
14
25
13
11
12
15
40
9
1
]';
tspDraw(att48)
