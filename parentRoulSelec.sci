function P = parentRoulSelec(FitnessPop, cmltvFit)

    // selection function for tspGenetic 
    // parents selected following the "porpotional roulette" procedure 
    // 
    // INPUT:
    //    FitnessPop ... matrix with fitness of each indivudal in current population
    //    cmltvFit   ... commulative fitness, sum of population fitness
    // OUTPUT:
    //    P1 ... index of 1. parent 
    //    P2 ... index of 2. parent 

    // porpotional selection,
    // the combination candidates are selected based on the "roullet principle" 
    // using their fitness as weight "fitness-porpotional selection"
    rouletteTot = 0; 
    porpotion = zeros(popSize, 1);
    for i = 1:popSize // values according to fitness
        porpotion(i) = rouletteTot + FitnessPop(i)/cmltvFit;
        rouletteTot = porpotion(i);
    end

    // selection process  
        // first parent
        cho1 = rand();
        for w = 1:popSize
            // choosing 
            if cho1 <= porpotion(w) then
                P(1) = w; // parent index
                break;
            end
        end

        // guarantee difference
        equal = 1;
        while equal
            // second parent
            cho2 = rand();
            for w = 1:popSize
                if cho2 <= porpotion(w) then
                    P(2) = w;
                    if P(2) == P(1) then
                        equal i= 1; // check for difference
                    else
                        equal = 0;
                    end
                    break;
                end
            end
        end
 endfunction
