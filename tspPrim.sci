// solves tsp with the Prim algorithm 
// INPUT:
//    dist ... n x n distances matrix
//
// OUTPUT:
//    edges ... edges of minimal spanning tree
function [edges,l] = tspPrim(dist)

    n = size(dist,'r');
    for i = 1:n
        dist(i,i) = %inf;
    end
    edges = [];
    l = 0;
    U = 1;
    V_ohne_U = 2:n; 
    while length(V_ohne_U) > 0
        l_uv_min = %inf;
        for v = V_ohne_U
            for u = U
                l_uv = dist(u,v);
                if l_uv < l_uv_min
                    u_min = u;
                    v_min = v;
                    l_uv_min = l_uv;
                end
            end
        end
        edges = [edges; u_min v_min];
        l = l + l_uv_min;
        U = [U v_min];
        // remove v_min from V_ohne_U
        V_ohne_U(find(V_ohne_U == v_min)) = [];
    end
endfunction

