// solves tsp with greedy algorithm
// INPUT:
//    start ... start index (optional = 1)
//
// OUTPUT:
//    tour ... nearly optimal greedy tour 
function tour = tspGreedy(start)

    global dist;

    if  argn(2) == 0 then
        start = 1;
    end
    
    n = size(dist,'r');
    tour = start;
    rest = 1:n;
    rest(start) = [];
    for k = 2:n
        tspDraw(tour,%F);
        [d,j] = min(dist(tour(k-1),rest));
        tour(1,k) = rest(j);
        rest(j) = [];
    end    
    tspDraw(tour);
    
endfunction
