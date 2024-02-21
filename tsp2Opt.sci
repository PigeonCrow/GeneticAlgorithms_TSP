// solves tsp with 2-Opt-algorithm 
// INPUT:
//    start ... start tour (optional = 1:n)
//
// OUTPUT:
//   tour ... nearly optimal 2-opt tour
function tour= tsp2Opt(start)

    global dist;
    n = size(dist,'r');
    if  argn(2) < 1 then
        start = 1:n;
    end

    tour = start;
    while 1
       l = tspLength(tour);
       tour_2opt = tour;
       l_2opt = l;
        for i = 1:n-1
            for j = i+1:n
                // swap edge i −1, i and j , j+1 in tour
                tour_swap = tour([1:i-1 j:-1:i j+1:n]);
                l_swap = tspLength(tour_swap);
                if l_swap < l_2opt
                    tour_2opt = tour_swap;
                    l_2opt = l_swap;
                end
            end
        end
        if l_2opt == l 
            break;
        else
            tour = tour_2opt;
            tspDraw(tour_2opt);
        end
    end
    
endfunction
