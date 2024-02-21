// selection function for tspGenetic 
// following the porpotional roullete principle
// 
// INPUT:
//    i     ... current individual 
// OUTPUT:
//    P1 ... parent 1
//    P2 ... parent 2

// porpotional selection,
// the combination candidates are selected according to the roulette principle
// using the fitness as weight "fitness-porpotional-selection"
function [P1 , P2] = parentRoulSelec(FitnessPop, cmltvFit)
       rouletteTot = 0; 
       porpotion = zeros(popGroesse, 1);
       for i =1:popGroesse /
            porpotion(i) = rouletteTot + FitnessPop(i)/cmltvFit;
            rouletteTot = porpotion(i);
       end
       
endfunction
