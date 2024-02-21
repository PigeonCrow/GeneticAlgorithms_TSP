// solves tsp with brute-force algorithm
// OUTPUT:
//    tour ... optimal tour 
function tour = tspBruteForce()
    global dist;

    n = size(dist,'r');
    P = [ones(prod(2:n-1),1) perms(2:n)]';
    l = %inf;
 
    for tour_i = P
        tspDraw(tour_i);
        l_i = tspLength(tour_i);
        if l_i < l
            tour = tour_i;
            l = l_i;
        end
    end    
    
endfunction
