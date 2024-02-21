// solves tsp with the simulated anealing approach
// INPUT:
//    start  ... start tour (optional = 1:n)
//    Beta   ... cooling rate (optional = 0.99)
//    T_high ... upper temperature limit (optional = 100)
//    T_low  ... lower temperature limit (optional = 1)
//
// OUTPUT:
//    tour ... nearly optimal simulated annealing tour 
function tour = tspSimulatedAnnealing(start,Beta,T_high,T_low)

    global dist;
    n = size(dist,'r');

    if  argn(2) < 1 then
        start = 1:n;
    end
    if  argn(2) < 2 then
        Beta = 0.99;
    end
    if  argn(2) < 3 then
        T_high = 100;
    end
    if  argn(2) < 4 then
        T_low = 1;
    end

    T = T_high;
    tour = start;
    tspDraw(tour);
    l = tspLength(tour);
    tour0 = tour;
    l0 = l;
    while T > T_low
        ij = floor(n*rand(1,2))+1;
        i = min(ij);
        j = max(ij);
        tour1 = tour0([1:i-1 j:-1:i j+1:n]);
        l1 = tspLength(tour1);
        if l1 < l
            tour = tour1;
            l = l1;
        end
        if rand() <= exp(-(l1-l0)/T)
            tour0 = tour1;
            l0 = l1;
            tspDraw(tour0);
        end
        T = T*Beta;
    end
    tspDraw(tour);

endfunction

