// Crossover function for tspGenetic 
// generates based on 2 individuals new ones  
// using conjunctive normal form (cnf) 
// 
// INPUT:
//    P1 ... 1. parent 
//    P2 ... 2. parent 
// OUTPUT:
//    offspring ... matrix with 2 generated children 
function [offspring] = crossDiskret(P1, P2)

    offspring = zeros(2, rz);
        
        if crossover == 0 && rand() <= crossrate then
            // generate a rand binay selector for cnf
            cnfsel = grand(1,rz,"uin",0,1); 
            offspring(1,:) =  P2 .*cnfsel; 
            offspring(2,:) =  P1 .*cnfsel;
        end

endfunction
