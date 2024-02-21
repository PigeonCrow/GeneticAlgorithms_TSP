// mutation function for tspGenetic 
// mutates 2 children 
// mutate by exchange
// 
// INPUT:
//    K1 ... 1x2 vector with generated child1 | Offspring(1,:)
//    K2 ... 1x2 vector with generated child2 | Offspring(2,:)
// OUTPUT:
//    Km ... 2x2 vector with mutated child 
// Both children mutated using 
// "reciprocate" mutation, according to Michalewiz 
// exchange one or two individual cities within children
function Km = mutation(K1, K2)

    mutrt1 = 1;
    mutrt2 = 1;
    
    //1. change
    mutg = grand(1,1,"uin",1,rz); // "mutagen"...change a rand index
    if rand()<= m then
        // store value at index(mutg) before switching 
        tmp1 = K1(mutg);
        tmp2 = K2(mutg);
        // store repair index 
        [x, ridx1] = members(tmp2, K1);
        [x, ridx2] = members(tmp1, K2);
        // first switch
        mtemp = K1(mutg);
        K1(mutg) = K2(mutg);
        K2(mutg) = mtemp;
        // second switch
        K1(ridx1) = tmp1;
        K2(ridx2) = tmp2;
    end

//    //2. change
//    mutg = grand(1,1,"uin",1,rz); 
//    if rand()<= m then
//        temp = K1(mutg);
//        K1(mutg) = K2(mutg);
//        K2(mutg) = temp;
//    end
    
    Km(1,:) = K1;
    Km(2,:) = K2;
    
endfunction
