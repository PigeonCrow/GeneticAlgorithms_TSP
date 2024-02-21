// core module
/*
Work type:      study project
Topic:          "Approach In Solving The Traveling Salesman Problem Using Genetic Algorithms"
Author:         T.D.S.
Faculty:        Computer Engineering
Semester:       WS2017/2018
*/

close
clear all
clc

exec('fitness.sci', -1);            // fitness function
exec('parentRoulSelec.sci', -1)     // selection function
exec('crossover.sci', -1)           // crossover function
exec('mutieren.sci', -1)            // mutation function

// exec ('Elitism')
// exec('functionTest.sci',-1)

function tour = tspGenetic(popSize, generations, crossrate, m)

    /*--- initial parameters can be recorded automatically -------*/
    // matrix (N x 2)
    // contains 2D city coordinates x | Longitude , y | Latitude
    //                  Esslingen        | Stuttgart            | Berlin              | Hamburg             | Frankfurt
    //destinations = [9.3201122 48.7433425; 9.18293221 48.7758459; 13.404954 52.5200066; 9.9936818 53.5510846; 8.6821267 50.1109221];
    destinations = pos;

    if argn(2)<1 then
        popSize = 20;    
    end
    if argn(2)<2 then
        generations = 100; 
    end
    if argn(2)<3 then
        crossrate = 0.5;
    end
    if argn(2)<4 then
        m = 0.8;            // mutation rate 
    end
    
    mutation = 1;       // 1...with mutation | 0...without mutation
    elite = 0;          // 1...with elitism  | 0...without elitism
    rz = size(destinations, 1);
    minimum = abs(1/0);     // "Inf" all the values compared to it are smaller
    maximum = 0;            
    gen = 0;                // Generation counter
    popSize = 2*ceil(popSize/2); // guarantee next possible even number

    /*
    Defining cost matrix.
    In this szenario cost is based on distance 
    -->  distance matrix 
    */
    // create a quadratic matrix based on the number of destinations
    q = meshgrid(1:rz);
    // create matrix with euclidean dstance 
    Dist  = matrix(sqrt(sum((destinations(q,:)-destinations(q',:)).^2, "c")), rz,rz);

    // generate population
    for i = 1:popSize
        Population(i,:) = grand(1, "prm", (1:rz)); 
    end                                            

    for g = 1:generationen

        fittest=zeros(2, 1);  // survival selec
        cmltvFit = 0;         // pop cumulative fitness 
        for i = 1:popSize     
            [fit, distance] = fitness(i); // calc fitness and distance 
            FitnessPop(i) = fit;
            DistPop(i) = distance;

            // selection of the fittest
            if fit > fittest(1) then
                fittest(1) = fit; 
                fittest(2) = i;   
            end
            // calc cumulative fitness in population
            cmltvFit = cmltvFit + fit;
        end

        // preselection
        [minDist, index] = min(DistPop);
        [fittest, idx] = max(FitnessPop);
        DistHistory(g) = minDist;
        FitnessHistory(g) = fittest;

        if fittest > maximum then
            maximum = fittest;
            BestPath = Population(idx, :);
            path = BestPath([1 : rz 1]); 
            tour = path;
            best_gen = g;
            tspDraw(path);
        end

        NextPop = zeros(popSize, rz); 
        for i = 1:popSize/2
            parent = parentRoulSelec(FitnessPop, cmltvFit); // recombination
            offspring = crossover(Population(parent(1),:), Population(parent(2),:)); // crossover
            if mutation == 1 then
                offspring = mutieren(offspring(1,:), offspring(2,:)); // mutation
            end 

            // create new population
            NextPop(i*2-1,:) = offspring(1,:);
            NextPop(i*2,:) = offspring(2,:);
        end
        Population = NextPop;
    end

    /*---------------Elitism-------------------------------------*/
    // TODO: should prolly be in an external module
    /*
    changes worst individual with best one.
    promisses finding an optimum quicker 
    but can lead to dominace problems
    */

    if elite == 1 then
                minim(1) = abs(1/0);    // worst fitness
                maxim(2) = 0;           // worst Index
        test(1)  = 0;
        test(2)  = 0;
        // find the worst
        for a = 1:popSize
            [f d] = fitness(nextGen(a,:));
                    if f < minim(1) then
                        minim(1) = f ;
                        maxim(2) = a ;
                    end
        end
        // elitist substitution
        NextPop (minim(2),:) = Population(maxim(2),:);
    end
endfunction

///*------------output------------------------------------------------*/
//disp(BestPath);
//disp('shortest distance');
//disp(minDist);
//disp('highest fittness');
//disp(1/minDist);
//disp(best_gen);
///*------------Plot---------------------------------------------------*/
//
////figure('Name','Ergebniss');
//subplot(222);
//title('Bestes Ergebniss Verlauf');
//plot( DistHistory,'b','LineWidth',3);
////figure('Name','Dist');
//subplot(223);
//title('Distsverlauf');
//plot( DistPop,'r','LineWidth',3);
////figure('Name','Fitness');
//subplot(224);
//title('Fitnessverlauf');
//plot( FitnessPop,'g','LineWidth',3);
