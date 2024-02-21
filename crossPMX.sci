// crossover function for tspGenetic 
// generates based on 2 individuals new ones 
// using pmx (partialy modified crossover)
// 
// INPUT:
//    P1 ... 1. parent  
//    P2 ... 2. parent 
// OUTPUT:
//    offspring ... matrix with 2 genrated children
function [offspring] = crossPMX(P1, P2)

 offspring = zeros(2, rz);
 
        if crossover == 1 && rand() <= crossover then
            inPoint1 = grand(1,1,"uin",1, rz-3); // 1. point of sepparation
            inPoint2 = grand(1,1,"uin",inPoint1, rz-1); // 2. point of sepparation
            
            offspring(1,inPoint1:inPoint2) = P2(inPoint1:inPoint2) ;
            offspring(2,inPoint1:inPoint2) = P1(inPoint1:inPoint2) ;

endfunction
