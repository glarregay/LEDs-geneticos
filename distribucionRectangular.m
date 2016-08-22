function pos = distribucionRectangular(n, m, dimx, dimy, altura)

    pos = zeros(n*m, 3);
    pos(:,3) = altura*ones(n*m,1);
    
    % dimx y dimy son vectores de 2x1, que marcan los límites en las
    % coordenadas x e y respectivamente
    
    dx = (dimx(2) - dimx(1))/n;
    dy = (dimy(2) - dimy(1))/m;
    k = 1;
    
    for i = 1:n
        for j = 1:m
            cx = dimx(1) + dx/2 + (i-1)*dx;
            cy = dimy(1) + dy/2 + (j-1)*dy;
            pos(k, 1:2) = [cx cy];
            k = k+1;
        end
    end
            
