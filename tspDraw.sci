// plots paths 
// INPUT:
//    tour ... 1 x n permutation of 1:n
//    closed ... flag for closed tour (optional = %T)
function tspDraw(tour,closed)

    global name pos;

    if  argn(2) == 1 then
        closed = %T;
    end

    drawlater()
    clf();
    plot(pos(:,1),pos(:,2),'.k','markersize',10)
    plot(pos(tour,1),pos(tour,2),'-r')
    if closed then
        plot(pos([tour($) tour(1)],1),pos([tour($) tour(1)],2),'-r')
    end
    gca().font_size = 2;
    xstring(pos(:,1),pos(:,2),name)
    mtlb_axis('equal')
    x0 = min(pos(:,1)); x1 = max(pos(:,1));
    y0 = min(pos(:,2)); y1 = max(pos(:,2));
    xl = x1 - x0; yl = y1 - y0;
    mtlb_axis([x0-0.05*xl x1+0.2*xl y0-0.2*yl y1+0.2*yl]);
    mtlb_axis('off');
    title(['length = ' string(tspLength(tour))],'fontsize',8)    
    drawnow()

endfunction
