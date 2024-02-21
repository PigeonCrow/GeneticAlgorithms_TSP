// fitness function for tspGenetic 
// calculates a fitness for an individual(solution/path)
// based on travel points and distance matrix (GLOBAL VARs)
// with the individual as parameter

// INPUT:
//    i         ...  
// OUTPUT:
//    fit       ... individual fitness value
//    abstand   ... individual distance

function [fit , distance] = fitness(i)

    //calc individual distance, hamilton cycle 
    distance = Dist(Population(i,rz), Population(i,1));
    for k=1:rz-1
        distance = distance + Dist(Population(i, k), Population(i,k+1));
    end        
    // calc fitness based on distance 
    fit  = 1/distance; // the higher the better
endfunction
