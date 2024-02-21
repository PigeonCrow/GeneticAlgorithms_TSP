// Crossover function for tspGenetic 
// generates based of 2 individuals new ones  
// using both cnf and partialy modified crossover
// 
// INPUT:
//    P1 ... 1. parent
//    P2 ... 2. parent
// OUTPUT:
//    offspring ... matrix with 2 generated children
function offspring = crossover(P1, P2)
    offspring = zeros(2, rz);
    offspring(1,:) = P1;
    offspring(2,:) = P2;
    if  rand() <= crossrate then    
        O1 = zeros(1, rz);
        O2 = zeros(1, rz);

        I = grand(1,1,"uin",1, rz-3); 
        J = grand(1,1,"uin",I+1, rz); 

        O1(I:J) = P1(I:J);
        O2(I:J) = P2(I:J);

        for i=1:rz
            m = find(O1==0);
            n = find(O2==0);
            if ~members(P2(i),O1) then
                O1(m(1)) = P2(i);
            end
            if ~members(P1(i),O2) then
                O2(n(1)) = P1(i);
            end
        end
        offspring(1,:) = O1;
        offspring(2,:) = O2;
    end
endfunction
